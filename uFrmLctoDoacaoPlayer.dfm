object frmLctoDoacaoPlayer: TfrmLctoDoacaoPlayer
  Tag = 9
  Left = 1363
  Top = 520
  Width = 561
  Height = 490
  AutoSize = True
  BorderIcons = []
  Caption = 'Pesquisa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 545
    Height = 451
    Align = alClient
    AutoSize = True
    TabOrder = 0
    object Bevel1: TBevel
      Left = 8
      Top = 344
      Width = 529
      Height = 9
      Shape = bsBottomLine
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 529
      Height = 49
      Caption = '(Digite o c'#243'digo ou ID discord para localizar e tecle "ENTER")'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Edit1: TEdit
        Left = 8
        Top = 16
        Width = 505
        Height = 24
        BevelKind = bkTile
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = Edit1Change
        OnKeyDown = Edit1KeyDown
        OnKeyPress = Edit1KeyPress
      end
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 72
      Width = 529
      Height = 265
      Hint = 
        'Selecione o fornecedor desejado e tecle "ENTER" ou clique em "SE' +
        'LECIONAR".'
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'CODLCTO'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clRed
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDDISCORD'
          Title.Alignment = taCenter
          Title.Caption = 'ID discord'
          Width = 122
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEDISCORD'
          Title.Alignment = taCenter
          Title.Caption = 'Nome discord'
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEJOGO'
          Title.Alignment = taCenter
          Title.Caption = 'Nome jogo'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDSTEAM'
          Title.Alignment = taCenter
          Title.Caption = 'ID Steam'
          Width = 116
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 8
      Top = 56
      Width = 529
      Height = 17
      BevelInner = bvRaised
      BevelOuter = bvNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Panel3: TPanel
      Left = 8
      Top = 384
      Width = 531
      Height = 55
      BevelInner = bvRaised
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
      object BitBtn2: TBitBtn
        Left = 403
        Top = 2
        Width = 120
        Height = 45
        Cursor = crHandPoint
        Cancel = True
        Caption = '&Retornar'
        TabOrder = 0
        TabStop = False
        OnClick = BitBtn2Click
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C40E0000C40E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0077FF77FF700F
          77FFFF77FF77F0B0FF7777FF77FF70B307FF00000007F0B330007777770000B3
          307777770708800330777777000880F03077777702088003307700000A2080B3
          3077AAAAAAA200B3307700000AA080B3307777770A0880B330777777000880BB
          307777770708880BB077777777088880B0777777770000000077}
        Layout = blGlyphTop
      end
      object BitBtn1: TBitBtn
        Left = 282
        Top = 2
        Width = 120
        Height = 45
        Cursor = crHandPoint
        Caption = '&Selecionar'
        ModalResult = 6
        TabOrder = 1
        TabStop = False
        OnClick = BitBtn1Click
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        Layout = blGlyphTop
        NumGlyphs = 2
      end
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 2
        Width = 272
        Height = 45
        Cursor = crHandPoint
        DataSource = DataSource1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        DragCursor = crDefault
        Hints.Strings = (
          'Primeiro registro'
          'Registro anterior'
          'Pr'#243'ximo registro'
          #218'ltimo registro')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
    object cb: TCheckBox
      Left = 8
      Top = 360
      Width = 97
      Height = 17
      Cursor = crHandPoint
      Caption = 'Mostrar inativos'
      TabOrder = 4
      OnClick = cbClick
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 456
  end
  object Query1: TIBQuery
    Database = DM.IBDatabase1
    Transaction = DM.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      '')
    Left = 488
  end
end
