unit frmCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Mask, IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdServerIOHandler, xmldom, XMLIntf,
  msxmldom, XMLDoc, IdMessage, IdMessageClient, IdSMTP;

type
  TCadastroFrm = class(TForm)
    pgPrincipal: TPageControl;
    tsCadastro: TTabSheet;
    pnCorpo: TPanel;
    pnRodape: TPanel;
    tsConfig: TTabSheet;
    Label1: TLabel;
    edt_Nome: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edt_Logradouro: TEdit;
    Label9: TLabel;
    edt_Numero: TEdit;
    Label10: TLabel;
    edt_Complemento: TEdit;
    Label11: TLabel;
    edt_Bairro: TEdit;
    Label12: TLabel;
    edt_Cidade: TEdit;
    Label13: TLabel;
    edt_Estado: TEdit;
    Label14: TLabel;
    edt_Pais: TEdit;
    mskedt_Cep: TMaskEdit;
    mskedt_Cpf: TMaskEdit;
    mskedt_Identidade: TMaskEdit;
    mskedt_Telefone: TMaskEdit;
    edt_Email: TEdit;
    btnEnviar: TButton;
    Button1: TButton;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket;
    Label15: TLabel;
    Label16: TLabel;
    procedure btnEnviarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ConsultaCEP(Cep: String);
    procedure mskedt_CepExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadastroFrm: TCadastroFrm;

implementation

uses MaskUtils;

{$R *.dfm}

{procedure TCadastroFrm.Button1Click(Sender: TObject);
var
  vJsonObj: TlkJsonObject;
  vJsonStr: String;
begin
  Memo1.Text := HTTP.Get('https://viacep.com.br/ws/30882010/json');
  vJsonObj := TlkJSONstreamed.loadfromfile('source.txt') as TlkJsonObject;
  vJsonStr := TlkJSON.GenerateText(vJsonObj);
  vJsonObj.Free;

end; }

procedure TCadastroFrm.btnEnviarClick(Sender: TObject);
var
  XMLDocument: TXMLDocument;
  NodeTabela, NodeDadosPessoais, NodeEndereco: IXMLNode;

  Function GetTemporaryDir: String;
  var
    pNetpath: ARRAY[ 0..MAX_path - 1 ] of Char;
    nlength: Cardinal;
  begin
    nlength := MAX_path;
    FillChar( pNetpath, SizeOF( pNetpath ), #0 );
    GetTemppath( nlength, pNetpath );
    Result := StrPas( pNetpath );
  end;

begin
  XMLDocument := TXMLDocument.Create(Self);
  try
    XMLDocument.Active := True;
    NodeTabela := XMLDocument.AddChild('Cadastro');
//    NodeTabela.ChildValues['id'] := 1;
    NodeDadosPessoais := NodeTabela.AddChild('dadosPessoais');
    NodeDadosPessoais.ChildValues['nome'] := edt_Nome.Text;
    NodeDadosPessoais.ChildValues['identidade'] := mskedt_Identidade.Text;
    NodeDadosPessoais.ChildValues['cpf'] := mskedt_Cpf.Text;
    NodeDadosPessoais.ChildValues['telefone'] := mskedt_Telefone.Text;
    NodeDadosPessoais.ChildValues['email'] := edt_Email.Text;


    NodeEndereco := NodeTabela.AddChild('endereco');
    NodeEndereco.ChildValues['cep'] := mskedt_Cep.Text;
    NodeEndereco.ChildValues['logradouro'] := edt_Logradouro.Text;
    NodeEndereco.ChildValues['numero'] := edt_Numero.Text;
    NodeEndereco.ChildValues['complemento'] := edt_Complemento.Text;
    NodeEndereco.ChildValues['bairro'] := edt_Bairro.Text;
    NodeEndereco.ChildValues['cidade'] := edt_Cidade.Text;
    NodeEndereco.ChildValues['estado'] := edt_Estado.Text;
    NodeEndereco.ChildValues['pais'] := edt_Pais.Text;

    XMLDocument.SaveToFile(GetTemporaryDir+'\ArquivoCadastro.xml');
  finally
    XMLDocument.Free;
  end;
end;

procedure TCadastroFrm.Button1Click(Sender: TObject);
var
  corpoEmail : TStrings;
begin
  corpoEmail := TStringList.Create;
  corpoEmail.Add('corpo email');

  idMessage1.Body.Assign(corpoEmail);
  idMessage1.From.Text := 'marcipn@gmail.com';
  idMessage1.From.Name := 'Marcos';
  idMessage1.Recipients.EMailAddresses := 'destinario@servcidor';
  idMessage1.Subject := 'Assunto';
  idMessage1.Priority := mpNormal;

  idSMTP1.AuthenticationType := atLogin;
  idSMTP1.Username := 'marcipn@gmail.com';
  idSMTP1.Password := '*******';
  idSMTP1.Host := 'smtp.gmail.com';
  idSMTP1.Port := 465;
  idSMTP1.Connect;
  try
    if idSMTP1.Connected then
    begin
      idSMTP1.Send(IdMessage1);
      ShowMessage('Email enviado com sucesso.');
    end;
  finally
    idSMTP1.Disconnect;
  end;
end;

procedure TCadastroFrm.ConsultaCEP(Cep: String);
var
  tempXML :IXMLNode;
  I :Integer;
  XMLDocument: TXMLDocument;
  erroConsulta : boolean;
begin
  edt_Logradouro.Clear;
  edt_Bairro.Clear;
  edt_Cidade.Clear;
  edt_Estado.Clear;
  edt_Pais.Clear;

  XMLDocument := TXMLDocument.Create(Self);
  XMLDocument.FileName := 'https://viacep.com.br/ws/'+Trim(Cep)+ '/xml/';
  XMLDocument.Active := true;
  tempXML := XMLDocument.DocumentElement;
  erroConsulta := False;
  try
    if tempXML.ChildNodes.FindNode('erro').text = 'true' then
      erroConsulta := True
    else
      erroConsulta := False;
  except
    erroConsulta := False;
  end;

  if not erroConsulta then
  begin

    edt_Logradouro.Text := tempXML.ChildNodes.FindNode('logradouro').Text;
    edt_Bairro.Text := tempXML.ChildNodes.FindNode('bairro').Text;
    edt_Cidade.Text := tempXML.ChildNodes.FindNode('localidade').Text;
    edt_Estado.Text := tempXML.ChildNodes.FindNode('uf').Text;
    edt_Pais.Text := 'Brasil';

    edt_Numero.SetFocus;
  end;
end;

procedure TCadastroFrm.mskedt_CepExit(Sender: TObject);
begin
  ConsultaCEP(mskedt_Cep.Text);
end;

end.
