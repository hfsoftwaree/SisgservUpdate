object frmLctoCompartilhamentoItem: TfrmLctoCompartilhamentoItem
  Tag = 9
  Left = 1131
  Top = 348
  Width = 675
  Height = 532
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
    Width = 659
    Height = 493
    Align = alClient
    AutoSize = True
    TabOrder = 0
    object Bevel1: TBevel
      Left = 8
      Top = 416
      Width = 641
      Height = 9
      Shape = bsBottomLine
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 641
      Height = 49
      Caption = '(Digite um dos dados abaixo e tecle "ENTER")'
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
        Width = 625
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
      Width = 641
      Height = 337
      Hint = 
        'Selecione o fornecedor desejado e tecle "ENTER" ou clique em "SE' +
        'LECIONAR".'
      DataSource = DS1
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      OnKeyPress = DBGrid1KeyPress
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODITEM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITEM'
          Title.Alignment = taCenter
          Title.Caption = 'Nome popular'
          Width = 282
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITEMNOMECLASSE'
          Title.Alignment = taCenter
          Title.Caption = 'Nome de classe'
          Width = 274
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 8
      Top = 56
      Width = 641
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
      Top = 432
      Width = 641
      Height = 55
      BevelInner = bvRaised
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 3
      object BitBtn2: TBitBtn
        Left = 515
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
        Left = 394
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
        Width = 384
        Height = 45
        Cursor = crHandPoint
        DataSource = DS1
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = (
          'Primeiro registro'
          'Registro anterior'
          'Pr'#243'ximo registro'
          #218'ltimo registro'
          '')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = table
    Left = 88
    Top = 448
  end
  object table: TIBTable
    Database = DM.IBDatabase1
    Transaction = DM.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DONATE'
    Left = 120
    Top = 448
    object tableCODLCTO: TIntegerField
      FieldName = 'CODLCTO'
    end
    object tableCODSERV: TFloatField
      FieldName = 'CODSERV'
    end
    object tableSERVIDOR: TIBStringField
      FieldName = 'SERVIDOR'
      Size = 50
    end
    object tableCODTIPOITEM: TFloatField
      FieldName = 'CODTIPOITEM'
    end
    object tableTIPOITEM: TIBStringField
      FieldName = 'TIPOITEM'
      Size = 50
    end
    object tableCODITEM: TFloatField
      FieldName = 'CODITEM'
    end
    object tableITEM: TIBStringField
      FieldName = 'ITEM'
      Size = 50
    end
    object tableVALPAGO: TFloatField
      FieldName = 'VALPAGO'
    end
    object tableDTACOMPRA: TDateTimeField
      FieldName = 'DTACOMPRA'
    end
    object tableDTASEGURO: TDateTimeField
      FieldName = 'DTASEGURO'
    end
    object tableDTASEGUROREN: TDateTimeField
      FieldName = 'DTASEGUROREN'
    end
    object tableCODSEGUROVENC: TFloatField
      FieldName = 'CODSEGUROVENC'
    end
    object tableSEGUROVENCIDO: TIBStringField
      FieldName = 'SEGUROVENCIDO'
      Size = 11
    end
    object tableQTDEITEM: TFloatField
      FieldName = 'QTDEITEM'
    end
    object tableNOMECOMPDISCOR: TIBStringField
      FieldName = 'NOMECOMPDISCOR'
      Size = 50
    end
    object tableNOMECOMPJOGO: TIBStringField
      FieldName = 'NOMECOMPJOGO'
      Size = 50
    end
    object tableREGISTRADOPARA: TIBStringField
      FieldName = 'REGISTRADOPARA'
      Size = 250
    end
    object tablePAIS: TIBStringField
      FieldName = 'PAIS'
      Size = 50
    end
    object tableTERRITORIO: TIBStringField
      FieldName = 'TERRITORIO'
      Size = 50
    end
    object tableLOCALBASE: TIBStringField
      FieldName = 'LOCALBASE'
      Size = 50
    end
    object tableINTEGRANTES: TIBStringField
      FieldName = 'INTEGRANTES'
      Size = 250
    end
    object tableTRANSFITEM: TIBStringField
      FieldName = 'TRANSFITEM'
      Size = 11
    end
    object tableTRANSFITEMPARA: TIBStringField
      FieldName = 'TRANSFITEMPARA'
      Size = 250
    end
    object tableNOMEPAGADOR: TIBStringField
      FieldName = 'NOMEPAGADOR'
      Size = 50
    end
    object tableBANCORECEBEDOR: TIBStringField
      FieldName = 'BANCORECEBEDOR'
      Size = 50
    end
    object tableTICKET: TFloatField
      FieldName = 'TICKET'
    end
    object tableTICKETLINK: TIBStringField
      FieldName = 'TICKETLINK'
      Size = 300
    end
    object tableOBS1: TIBStringField
      FieldName = 'OBS1'
      Size = 1000
    end
    object tableOBS2: TIBStringField
      FieldName = 'OBS2'
      Size = 1000
    end
    object tableRES1: TIBStringField
      FieldName = 'RES1'
      Size = 50
    end
    object tableRES2: TIBStringField
      FieldName = 'RES2'
      Size = 1000
    end
    object tableRES3: TIBStringField
      FieldName = 'RES3'
      Size = 50
    end
    object tableRES4: TIBStringField
      FieldName = 'RES4'
      Size = 50
    end
    object tableRES5: TIBStringField
      FieldName = 'RES5'
      Size = 50
    end
    object tableRES6: TIBStringField
      FieldName = 'RES6'
      Size = 50
    end
    object tableRES7: TIBStringField
      FieldName = 'RES7'
      Size = 50
    end
    object tableDATACADASTRO: TDateTimeField
      FieldName = 'DATACADASTRO'
    end
    object tableEXIGESEGCOD: TIBStringField
      FieldName = 'EXIGESEGCOD'
      Size = 11
    end
    object tableEXIGSEGNOME: TIBStringField
      FieldName = 'EXIGSEGNOME'
      Size = 11
    end
    object tableSEGVENCPADRAOCOD: TIBStringField
      FieldName = 'SEGVENCPADRAOCOD'
      Size = 11
    end
    object tableSEGVENCPADRAONOME: TIBStringField
      FieldName = 'SEGVENCPADRAONOME'
      Size = 11
    end
    object tableNOMECOMPDISCORCOD: TIBStringField
      FieldName = 'NOMECOMPDISCORCOD'
      Size = 11
    end
    object tableREGISTRADOPARACOD: TIBStringField
      FieldName = 'REGISTRADOPARACOD'
      Size = 11
    end
    object tableBANCORECEBEDORAPEL: TIBStringField
      FieldName = 'BANCORECEBEDORAPEL'
      Size = 50
    end
    object tableBANCORECEBEDORCOD: TIBStringField
      FieldName = 'BANCORECEBEDORCOD'
      Size = 11
    end
    object tableDELITEMVENCCOD: TIBStringField
      FieldName = 'DELITEMVENCCOD'
      Size = 11
    end
    object tableDELITEMVENCDATA: TIBStringField
      FieldName = 'DELITEMVENCDATA'
      Size = 11
    end
    object tableTIPOLCTOCOD: TIBStringField
      FieldName = 'TIPOLCTOCOD'
      Size = 11
    end
    object tableTIPOLCTONOME: TIBStringField
      FieldName = 'TIPOLCTONOME'
      Size = 50
    end
    object tableITEMMODELO: TIBStringField
      FieldName = 'ITEMMODELO'
      Size = 50
    end
    object tableSEGUROTIPOCOD: TIBStringField
      FieldName = 'SEGUROTIPOCOD'
      Size = 11
    end
    object tableSEGUROTIPONOME: TIBStringField
      FieldName = 'SEGUROTIPONOME'
      Size = 50
    end
    object tableSTATUSCOD: TIBStringField
      FieldName = 'STATUSCOD'
      Size = 11
    end
    object tableSTATUSNOME: TIBStringField
      FieldName = 'STATUSNOME'
      Size = 50
    end
    object tableSTATUSOBS: TIBStringField
      FieldName = 'STATUSOBS'
      Size = 500
    end
    object tableITEMID: TIBStringField
      FieldName = 'ITEMID'
      Size = 50
    end
    object tableITEMNOMECLASSE: TIBStringField
      FieldName = 'ITEMNOMECLASSE'
      Size = 50
    end
    object tableVALDESCONTO: TFloatField
      FieldName = 'VALDESCONTO'
    end
    object tableVALTOTAL: TFloatField
      FieldName = 'VALTOTAL'
    end
    object tableITEMREFERENCIA: TIBStringField
      FieldName = 'ITEMREFERENCIA'
      Size = 11
    end
  end
  object DS1: TDataSource
    DataSet = Q1
    Left = 440
    Top = 40
  end
  object Q1: TIBQuery
    Database = DM.IBDatabase1
    Transaction = DM.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 472
    Top = 40
  end
end
