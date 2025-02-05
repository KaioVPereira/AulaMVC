object Frm_CadCliente: TFrm_CadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 441
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 15
  object Pnl_Rodape: TPanel
    Left = 0
    Top = 404
    Width = 789
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 403
    ExplicitWidth = 785
    object Btn_Fechar: TButton
      Left = 698
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = Btn_FecharClick
    end
  end
  object pgControl: TPageControl
    Left = 0
    Top = 0
    Width = 789
    Height = 404
    ActivePage = tbPes
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 785
    ExplicitHeight = 403
    object tbPes: TTabSheet
      Caption = 'tbPes'
      object pnl_Filtro: TPanel
        Left = 0
        Top = 0
        Width = 781
        Height = 57
        Align = alTop
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 777
        object lbedt_Busca: TLabeledEdit
          Left = 16
          Top = 24
          Width = 417
          Height = 23
          EditLabel.Width = 98
          EditLabel.Height = 15
          EditLabel.Caption = 'Digite para buscar:'
          TabOrder = 0
          Text = ''
        end
        object btn_Buscar: TButton
          Left = 532
          Top = 24
          Width = 75
          Height = 25
          Caption = 'Buscar'
          TabOrder = 1
          OnClick = btn_BuscarClick
        end
      end
      object pnl_BtnsPesquisar: TPanel
        Left = 0
        Top = 336
        Width = 781
        Height = 38
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        ExplicitTop = 335
        ExplicitWidth = 777
        object btn_Novo: TButton
          Left = 532
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btn_NovoClick
        end
        object btn_Detalhar: TButton
          Left = 613
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Detalhar'
          TabOrder = 1
          OnClick = btn_DetalharClick
        end
        object btn_Excluir: TButton
          Left = 694
          Top = 11
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btn_ExcluirClick
        end
      end
      object DBGrid1: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 60
        Width = 775
        Height = 273
        Align = alClient
        DataSource = dsPesquisar
        DrawingStyle = gdsGradient
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
      end
    end
    object tbDados: TTabSheet
      Caption = 'tbDados'
      ImageIndex = 1
      object lbTipo: TLabel
        Left = 11
        Top = 101
        Width = 23
        Height = 15
        Caption = 'Tipo'
      end
      object edt_Codigo: TLabeledEdit
        Left = 11
        Top = 24
        Width = 121
        Height = 23
        EditLabel.Width = 39
        EditLabel.Height = 15
        EditLabel.Caption = 'C'#243'digo'
        Enabled = False
        TabOrder = 0
        Text = ''
      end
      object edtName: TLabeledEdit
        Left = 11
        Top = 72
        Width = 542
        Height = 23
        EditLabel.Width = 33
        EditLabel.Height = 15
        EditLabel.Caption = 'Nome'
        TabOrder = 1
        Text = ''
      end
      object cbTipo: TComboBox
        Left = 11
        Top = 120
        Width = 186
        Height = 23
        TabOrder = 2
        Text = 'F'
        Items.Strings = (
          'F'
          'J')
      end
      object edtDocumento: TLabeledEdit
        Left = 203
        Top = 120
        Width = 146
        Height = 23
        EditLabel.Width = 63
        EditLabel.Height = 15
        EditLabel.Caption = 'Documento'
        TabOrder = 3
        Text = ''
      end
      object edtTelefone: TLabeledEdit
        Left = 355
        Top = 120
        Width = 121
        Height = 23
        EditLabel.Width = 44
        EditLabel.Height = 15
        EditLabel.Caption = 'Telefone'
        TabOrder = 4
        Text = ''
      end
      object pnlBtnsCad: TPanel
        Left = 0
        Top = 333
        Width = 781
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 5
        object btnListar: TButton
          Left = 451
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Listar'
          TabOrder = 3
          OnClick = btnListarClick
        end
        object btnAlterar: TButton
          Left = 532
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 0
          OnClick = btnAlterarClick
        end
        object btnGravar: TButton
          Left = 613
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 1
          OnClick = btnGravarClick
        end
        object btnCancelar: TButton
          Left = 694
          Top = 14
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 2
          OnClick = btnCancelarClick
        end
      end
    end
  end
  object dsPesquisar: TDataSource
    DataSet = dmCliente.qryPesquisar
    Left = 692
    Top = 18
  end
end
