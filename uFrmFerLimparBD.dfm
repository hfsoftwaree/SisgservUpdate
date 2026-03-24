object frmFerLimparBD: TfrmFerLimparBD
  Left = 657
  Top = 193
  Width = 641
  Height = 483
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Limpeza do Banco de Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 444
    Align = alClient
    TabOrder = 0
    object Gauge1: TGauge
      Left = 1
      Top = 296
      Width = 616
      Height = 30
      ForeColor = 7661568
      Progress = 0
      Visible = False
    end
    object Label3: TLabel
      Left = 8
      Top = 386
      Width = 103
      Height = 13
      Caption = 'Banco de Dados.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 112
      Top = 386
      Width = 39
      Height = 13
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 16
      Top = 352
      Width = 32
      Height = 13
      Caption = 'Label5'
      Visible = False
    end
    object Panel2: TPanel
      Left = 216
      Top = 336
      Width = 401
      Height = 41
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 21
      object BitBtn1: TBitBtn
        Left = 8
        Top = 2
        Width = 193
        Height = 37
        Cursor = crHandPoint
        Caption = '&Executar Limpeza'
        TabOrder = 0
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 200
        Top = 2
        Width = 193
        Height = 37
        Cursor = crHandPoint
        Caption = '&Retornar'
        TabOrder = 1
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333333333333333333333333333333333333FF333333333333
          3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
          E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
          E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
          E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
          000033333373FF77777733333330003333333333333777333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 282
      Width = 617
      Height = 3
      BevelInner = bvLowered
      TabOrder = 22
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 104
      Width = 145
      Height = 17
      Caption = 'Servidor'
      TabOrder = 2
    end
    object CheckBox2: TCheckBox
      Left = 224
      Top = 104
      Width = 97
      Height = 17
      Caption = 'Player'
      TabOrder = 8
    end
    object CheckBox3: TCheckBox
      Left = 224
      Top = 128
      Width = 97
      Height = 17
      Caption = 'Categoria'
      TabOrder = 9
    end
    object CheckBox4: TCheckBox
      Left = 224
      Top = 152
      Width = 201
      Height = 17
      Caption = 'Sub-Categoria'
      TabOrder = 10
    end
    object CheckBox5: TCheckBox
      Left = 224
      Top = 176
      Width = 169
      Height = 17
      Caption = 'Lan'#231'amento de Doa'#231#227'o'
      TabOrder = 11
      OnClick = CheckBox5Click
    end
    object CheckBox6: TCheckBox
      Left = 224
      Top = 200
      Width = 161
      Height = 17
      Caption = 'Compartilhamento de item'
      TabOrder = 12
      OnClick = CheckBox6Click
    end
    object CheckBox7: TCheckBox
      Left = 224
      Top = 224
      Width = 200
      Height = 17
      Caption = 'Contas a pagar'
      TabOrder = 13
    end
    object CheckBox8: TCheckBox
      Left = 16
      Top = 128
      Width = 169
      Height = 17
      Caption = 'Tipo de lan'#231'amento'
      TabOrder = 3
    end
    object CheckBox9: TCheckBox
      Left = 16
      Top = 152
      Width = 97
      Height = 17
      Caption = 'Mod'
      TabOrder = 4
    end
    object CheckBox10: TCheckBox
      Left = 16
      Top = 176
      Width = 193
      Height = 17
      Caption = 'Tipo de item/Item'
      TabOrder = 5
    end
    object CheckBox11: TCheckBox
      Left = 16
      Top = 258
      Width = 97
      Height = 17
      Caption = 'Marcar todos'
      TabOrder = 20
      OnClick = CheckBox11Click
    end
    object Panel4: TPanel
      Left = 0
      Top = 89
      Width = 617
      Height = 3
      BevelInner = bvLowered
      TabOrder = 23
    end
    object CheckBox12: TCheckBox
      Left = 16
      Top = 200
      Width = 97
      Height = 17
      Caption = 'Banco'
      TabOrder = 6
    end
    object CheckBox13: TCheckBox
      Left = 16
      Top = 224
      Width = 177
      Height = 17
      Caption = 'Tipo de Fornecedor/Fornecedor'
      TabOrder = 7
    end
    object Panel5: TPanel
      Left = 0
      Top = 249
      Width = 617
      Height = 3
      BevelInner = bvLowered
      TabOrder = 24
    end
    object CheckBox14: TCheckBox
      Left = 448
      Top = 104
      Width = 145
      Height = 17
      Caption = 'Contas a receber'
      TabOrder = 14
    end
    object CheckBox15: TCheckBox
      Left = 448
      Top = 128
      Width = 97
      Height = 17
      Caption = 'Sa'#237'da Status'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      Visible = False
    end
    object CheckBox16: TCheckBox
      Left = 448
      Top = 152
      Width = 97
      Height = 17
      Caption = 'Sa'#237'da Status1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      Visible = False
    end
    object CheckBox17: TCheckBox
      Left = 448
      Top = 176
      Width = 97
      Height = 17
      Caption = 'Setores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      Visible = False
    end
    object CheckBox18: TCheckBox
      Left = 448
      Top = 200
      Width = 97
      Height = 17
      Caption = 'Status Entrega'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
      Visible = False
    end
    object CheckBox19: TCheckBox
      Left = 448
      Top = 224
      Width = 97
      Height = 17
      Caption = 'Tipo Contato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 19
      Visible = False
    end
    object GroupBox1: TGroupBox
      Left = 264
      Top = 1
      Width = 360
      Height = 81
      Align = alCustom
      Caption = 'Selecione o per'#237'odo desejado para limpeza'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 8
        Top = 24
        Width = 68
        Height = 13
        Caption = 'Per'#237'odo Inicial'
      end
      object Label2: TLabel
        Left = 192
        Top = 24
        Width = 63
        Height = 13
        Caption = 'Per'#237'odo Final'
      end
      object DataInicial1: TEvDateEdit
        Left = 8
        Top = 44
        Width = 161
        Height = 26
        Color = clInfoBk
        Ctl3D = True
        DateText = '00/00/0000'
        DateValue = -693594.000000000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        Glyph.Data = {
          7E050000424D7E0500000000000036000000280000001A0000000D0000000100
          2000000000004805000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00AA927A00A48C74009B836B00947C64008D755D00856D55007E66
          4E00765E46006F573F00674F370060483000FF00FF00FF00FF00A2A2A2009C9C
          9C00949494008E8E8E00878787008080800079797900717171006B6B6B006262
          62005B5B5B00FF00FF00FF00FF00B1998100D0B8A000B0887000E0B8A000B090
          7000E0B8A000B0887000D0B8A000B0887000D0A89000674F3700FF00FF00FF00
          FF00A8A8A800C2C2C2009B9B9B00C4C4C4009E9E9E00C4C4C4009B9B9B00C2C2
          C2009B9B9B00B6B6B60062626200FF00FF00FF00FF00B79F8700FFFFFF00D0A8
          9000FFFFFF00D0A08000FFF8F000D0A08000FFE8E000D0A08000FFE0D0006F57
          3F00FF00FF00FF00FF00ADADAD00FFFFFF00B6B6B600FFFFFF00AEAEAE00F8F8
          F800AEAEAE00EDEDED00AEAEAE00E5E5E5006B6B6B00FF00FF00FF00FF00BDA5
          8D00D0B09000B0887000D0A08000B0887000D0A080001040E0001038E0000030
          B000D0A08000765E4600FF00FF00FF00FF00B2B2B200BABABA009B9B9B00AEAE
          AE009B9B9B00AEAEAE00828282007E7E7E006A6A6A00AEAEAE0071717100FF00
          FF00FF00FF00C3AB9300FFFFFF00D0A08000FFFFFF00D0A08000FFFFFF006080
          FF00FFFFFF001038E000FFE8E0007E664E00FF00FF00FF00FF00B7B7B700FFFF
          FF00AEAEAE00FFFFFF00AEAEAE00FFFFFF00B4B4B400FFFFFF007E7E7E00EDED
          ED0079797900FF00FF00FF00FF00CAB29A00D0B09000B0887000D0A08000B088
          7000D0A080008098FF006080FF001040E000D0A08000856D5500FF00FF00FF00
          FF00BDBDBD00BABABA009B9B9B00AEAEAE009B9B9B00AEAEAE00C3C3C300B4B4
          B40082828200AEAEAE0080808000FF00FF00FF00FF00D0B8A000FFFFFF00D0A0
          8000FFFFFF00D0A08000FFFFFF00D0A08000FFFFFF00D0A08000FFF8F0008D75
          5D00FF00FF00FF00FF00C2C2C200FFFFFF00AEAEAE00FFFFFF00AEAEAE00FFFF
          FF00AEAEAE00FFFFFF00AEAEAE00F8F8F80087878700FF00FF00FF00FF00ECA1
          8700E89C8000E3947600DF8F7000DC8A6900D9866300D5805A00D0795100CB72
          4800C66B3F00C2653600FF00FF00FF00FF00B3B3B300AEAEAE00A7A7A700A3A3
          A3009E9E9E009A9A9A00939393008D8D8D00868686007F7F7F0079797900FF00
          FF00FF00FF00EFA58D00FFE8E000FFE8E000FFE8E000FFE8E000FFE8E000F0A0
          8000F0A08000F0A08000F0A07000C66B3F00FF00FF00FF00FF00B6B6B600EDED
          ED00EDEDED00EDEDED00EDEDED00EDEDED00B1B1B100B1B1B100B1B1B100ADAD
          AD007F7F7F00FF00FF00FF00FF00F0A89000EFA58D00ECA18700E89C8000E394
          7600DF8F7000DC8A6900D9866300D5805A00D0795100CB724800FF00FF00FF00
          FF00B9B9B900B6B6B600B3B3B300AEAEAE00A7A7A700A3A3A3009E9E9E009A9A
          9A00939393008D8D8D0086868600FF00FF00FF00FF00D0B8A000494F4900FFFF
          FF00494F4900FFFFFF00494F4900FFFFFF00494F4900FFFFFF00494F4900D0B8
          A000FF00FF00FF00FF00C2C2C20064646400FFFFFF0064646400FFFFFF006464
          6400FFFFFF0064646400FFFFFF0064646400C2C2C200FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00}
        ParentCtl3D = False
        ParentFont = False
        ShowButton = True
        TabOrder = 0
        OnChange = DataInicial1Change
      end
      object DataFinal1: TEvDateEdit
        Left = 192
        Top = 44
        Width = 153
        Height = 26
        Color = clInfoBk
        Ctl3D = True
        DateText = '00/00/0000'
        DateValue = -693594.000000000000000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Courier New'
        Font.Style = []
        Glyph.Data = {
          7E050000424D7E0500000000000036000000280000001A0000000D0000000100
          2000000000004805000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00AA927A00A48C74009B836B00947C64008D755D00856D55007E66
          4E00765E46006F573F00674F370060483000FF00FF00FF00FF00A2A2A2009C9C
          9C00949494008E8E8E00878787008080800079797900717171006B6B6B006262
          62005B5B5B00FF00FF00FF00FF00B1998100D0B8A000B0887000E0B8A000B090
          7000E0B8A000B0887000D0B8A000B0887000D0A89000674F3700FF00FF00FF00
          FF00A8A8A800C2C2C2009B9B9B00C4C4C4009E9E9E00C4C4C4009B9B9B00C2C2
          C2009B9B9B00B6B6B60062626200FF00FF00FF00FF00B79F8700FFFFFF00D0A8
          9000FFFFFF00D0A08000FFF8F000D0A08000FFE8E000D0A08000FFE0D0006F57
          3F00FF00FF00FF00FF00ADADAD00FFFFFF00B6B6B600FFFFFF00AEAEAE00F8F8
          F800AEAEAE00EDEDED00AEAEAE00E5E5E5006B6B6B00FF00FF00FF00FF00BDA5
          8D00D0B09000B0887000D0A08000B0887000D0A080001040E0001038E0000030
          B000D0A08000765E4600FF00FF00FF00FF00B2B2B200BABABA009B9B9B00AEAE
          AE009B9B9B00AEAEAE00828282007E7E7E006A6A6A00AEAEAE0071717100FF00
          FF00FF00FF00C3AB9300FFFFFF00D0A08000FFFFFF00D0A08000FFFFFF006080
          FF00FFFFFF001038E000FFE8E0007E664E00FF00FF00FF00FF00B7B7B700FFFF
          FF00AEAEAE00FFFFFF00AEAEAE00FFFFFF00B4B4B400FFFFFF007E7E7E00EDED
          ED0079797900FF00FF00FF00FF00CAB29A00D0B09000B0887000D0A08000B088
          7000D0A080008098FF006080FF001040E000D0A08000856D5500FF00FF00FF00
          FF00BDBDBD00BABABA009B9B9B00AEAEAE009B9B9B00AEAEAE00C3C3C300B4B4
          B40082828200AEAEAE0080808000FF00FF00FF00FF00D0B8A000FFFFFF00D0A0
          8000FFFFFF00D0A08000FFFFFF00D0A08000FFFFFF00D0A08000FFF8F0008D75
          5D00FF00FF00FF00FF00C2C2C200FFFFFF00AEAEAE00FFFFFF00AEAEAE00FFFF
          FF00AEAEAE00FFFFFF00AEAEAE00F8F8F80087878700FF00FF00FF00FF00ECA1
          8700E89C8000E3947600DF8F7000DC8A6900D9866300D5805A00D0795100CB72
          4800C66B3F00C2653600FF00FF00FF00FF00B3B3B300AEAEAE00A7A7A700A3A3
          A3009E9E9E009A9A9A00939393008D8D8D00868686007F7F7F0079797900FF00
          FF00FF00FF00EFA58D00FFE8E000FFE8E000FFE8E000FFE8E000FFE8E000F0A0
          8000F0A08000F0A08000F0A07000C66B3F00FF00FF00FF00FF00B6B6B600EDED
          ED00EDEDED00EDEDED00EDEDED00EDEDED00B1B1B100B1B1B100B1B1B100ADAD
          AD007F7F7F00FF00FF00FF00FF00F0A89000EFA58D00ECA18700E89C8000E394
          7600DF8F7000DC8A6900D9866300D5805A00D0795100CB724800FF00FF00FF00
          FF00B9B9B900B6B6B600B3B3B300AEAEAE00A7A7A700A3A3A3009E9E9E009A9A
          9A00939393008D8D8D0086868600FF00FF00FF00FF00D0B8A000494F4900FFFF
          FF00494F4900FFFFFF00494F4900FFFFFF00494F4900FFFFFF00494F4900D0B8
          A000FF00FF00FF00FF00C2C2C20064646400FFFFFF0064646400FFFFFF006464
          6400FFFFFF0064646400FFFFFF0064646400C2C2C200FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00}
        ParentCtl3D = False
        ParentFont = False
        ShowButton = True
        TabOrder = 1
        OnChange = DataFinal1Change
      end
      object DataFinal: TEdit
        Left = 488
        Top = 12
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 2
        Visible = False
      end
      object DataInicial: TEdit
        Left = 360
        Top = 12
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 3
        Visible = False
      end
    end
    object tipo: TRadioGroup
      Left = 1
      Top = 1
      Width = 256
      Height = 80
      Align = alCustom
      Caption = 'Selecione o tipo de limpeza'
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Total'
        'Parcial')
      ParentFont = False
      TabOrder = 0
      OnClick = tipoClick
    end
    object Memo1: TMemo
      Left = 1
      Top = 408
      Width = 623
      Height = 35
      TabStop = False
      Align = alBottom
      Color = 10813348
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '')
      ParentFont = False
      ReadOnly = True
      TabOrder = 25
    end
  end
  object DataSource1: TDataSource
    DataSet = TSTATUSENTREGA
    Left = 377
    Top = 105
  end
  object TSTATUSENTREGA: TIBTable
    Database = DM.IBDatabase1
    Transaction = DM.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'STATUSENTREGA'
    Left = 409
    Top = 105
  end
end
