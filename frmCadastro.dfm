object CadastroFrm: TCadastroFrm
  Left = 281
  Top = 126
  Width = 660
  Height = 473
  Caption = 'Cadastro - Info Sistemas - Teste'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pgPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 644
    Height = 435
    ActivePage = tsCadastro
    Align = alClient
    TabOrder = 0
    TabStop = False
    object tsCadastro: TTabSheet
      Caption = 'Cadastro'
      object pnCorpo: TPanel
        Left = 0
        Top = 0
        Width = 636
        Height = 334
        Align = alClient
        BevelOuter = bvNone
        Color = clActiveCaption
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 48
          Width = 28
          Height = 13
          Caption = 'Nome'
        end
        object Label2: TLabel
          Left = 16
          Top = 8
          Width = 100
          Height = 13
          Caption = 'Dados Cadastrais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 24
          Top = 88
          Width = 50
          Height = 13
          Caption = 'Identidade'
        end
        object Label4: TLabel
          Left = 128
          Top = 88
          Width = 20
          Height = 13
          Caption = 'CPF'
        end
        object Label5: TLabel
          Left = 24
          Top = 128
          Width = 42
          Height = 13
          Caption = 'Telefone'
        end
        object Label6: TLabel
          Left = 128
          Top = 128
          Width = 25
          Height = 13
          Caption = 'Email'
        end
        object Label7: TLabel
          Left = 24
          Top = 192
          Width = 21
          Height = 13
          Caption = 'CEP'
        end
        object Label8: TLabel
          Left = 24
          Top = 240
          Width = 54
          Height = 13
          Caption = 'Logradouro'
        end
        object Label9: TLabel
          Left = 432
          Top = 240
          Width = 37
          Height = 13
          Caption = 'Numero'
        end
        object Label10: TLabel
          Left = 504
          Top = 240
          Width = 64
          Height = 13
          Caption = 'Complemento'
        end
        object Label11: TLabel
          Left = 24
          Top = 280
          Width = 27
          Height = 13
          Caption = 'Bairro'
        end
        object Label12: TLabel
          Left = 224
          Top = 280
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label13: TLabel
          Left = 424
          Top = 280
          Width = 33
          Height = 13
          Caption = 'Estado'
        end
        object Label14: TLabel
          Left = 472
          Top = 280
          Width = 22
          Height = 13
          Caption = 'Pa'#237's'
        end
        object Label15: TLabel
          Left = 16
          Top = 32
          Width = 75
          Height = 13
          Caption = 'Dados pessoais'
        end
        object Label16: TLabel
          Left = 16
          Top = 176
          Width = 46
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object edt_Nome: TEdit
          Left = 24
          Top = 64
          Width = 601
          Height = 21
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
        end
        object edt_Logradouro: TEdit
          Left = 24
          Top = 256
          Width = 401
          Height = 21
          BorderStyle = bsNone
          TabOrder = 6
        end
        object edt_Numero: TEdit
          Left = 432
          Top = 256
          Width = 65
          Height = 21
          BorderStyle = bsNone
          TabOrder = 7
        end
        object edt_Complemento: TEdit
          Left = 504
          Top = 256
          Width = 121
          Height = 21
          BorderStyle = bsNone
          TabOrder = 8
        end
        object edt_Bairro: TEdit
          Left = 24
          Top = 296
          Width = 193
          Height = 21
          BorderStyle = bsNone
          TabOrder = 9
        end
        object edt_Cidade: TEdit
          Left = 224
          Top = 296
          Width = 193
          Height = 21
          BorderStyle = bsNone
          TabOrder = 10
        end
        object edt_Estado: TEdit
          Left = 424
          Top = 296
          Width = 41
          Height = 21
          BorderStyle = bsNone
          TabOrder = 11
        end
        object edt_Pais: TEdit
          Left = 472
          Top = 296
          Width = 153
          Height = 21
          BorderStyle = bsNone
          TabOrder = 12
        end
        object mskedt_Cep: TMaskEdit
          Left = 24
          Top = 208
          Width = 81
          Height = 21
          BorderStyle = bsNone
          EditMask = '00000\-000;0;'
          MaxLength = 9
          TabOrder = 5
          OnExit = mskedt_CepExit
        end
        object mskedt_Cpf: TMaskEdit
          Left = 128
          Top = 104
          Width = 89
          Height = 21
          BorderStyle = bsNone
          EditMask = '000\.000\.000\-00;0;'
          MaxLength = 14
          TabOrder = 2
        end
        object mskedt_Identidade: TMaskEdit
          Left = 24
          Top = 104
          Width = 97
          Height = 21
          BorderStyle = bsNone
          EditMask = '00\.000\.000;0;'
          MaxLength = 10
          TabOrder = 1
        end
        object mskedt_Telefone: TMaskEdit
          Left = 24
          Top = 144
          Width = 97
          Height = 21
          BorderStyle = bsNone
          EditMask = '\(00\)000000009;1;_'
          MaxLength = 13
          TabOrder = 3
          Text = '(  )         '
        end
        object edt_Email: TEdit
          Left = 128
          Top = 143
          Width = 257
          Height = 21
          BorderStyle = bsNone
          TabOrder = 4
        end
      end
      object pnRodape: TPanel
        Left = 0
        Top = 334
        Width = 636
        Height = 73
        Align = alBottom
        BevelOuter = bvNone
        Color = clActiveCaption
        TabOrder = 1
        object btnEnviar: TButton
          Left = 256
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Enviar'
          TabOrder = 0
          OnClick = btnEnviarClick
        end
        object Button1: TButton
          Left = 0
          Top = 48
          Width = 33
          Height = 25
          Caption = 'Button1'
          TabOrder = 1
          Visible = False
          OnClick = Button1Click
        end
      end
    end
    object tsConfig: TTabSheet
      Caption = 'Configura'#231#227'o'
      ImageIndex = 1
    end
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 428
    Top = 209
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocket1
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 476
    Top = 209
  end
  object IdSSLIOHandlerSocket1: TIdSSLIOHandlerSocket
    SSLOptions.Method = sslvTLSv1
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 524
    Top = 209
  end
end
