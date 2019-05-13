program PrjCadastro;

uses
  Forms,
  frmCadastro in 'frmCadastro.pas' {CadastroFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TCadastroFrm, CadastroFrm);
  Application.Run;
end.
