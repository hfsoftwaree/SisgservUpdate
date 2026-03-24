object frmConLog1: TfrmConLog1
  Left = 181
  Top = 122
  AutoSize = True
  BorderStyle = bsSingle
  Caption = 'Log [MCK]'
  ClientHeight = 661
  ClientWidth = 1014
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 304
    Width = 56
    Height = 13
    Caption = 'Armagedom'
    Visible = False
  end
  object Label2: TLabel
    Left = 552
    Top = 194
    Width = 15
    Height = 16
    Caption = 'IP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 32
    Top = 328
    Width = 72
    Height = 13
    Caption = 'ZHF Chernarus'
    Visible = False
  end
  object Label4: TLabel
    Left = 32
    Top = 352
    Width = 55
    Height = 13
    Caption = 'ZHF Banov'
    Visible = False
  end
  object CJVLinkLabel1: TCJVLinkLabel
    Left = 112
    Top = 600
    Width = 321
    Height = 13
    Cursor = crHandPoint
    Caption = 'https://steamcommunity.com/workshop/filedetails/?id=2049002856'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    URL = 'https://steamcommunity.com/workshop/filedetails/?id=2049002856'
  end
  object Label9: TLabel
    Left = 24
    Top = 600
    Width = 79
    Height = 13
    Caption = 'Necess'#225'rio mod:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 544
    Top = 24
    Width = 449
    Height = 52
    Caption = 
      'Importante:'#13#10'- Para acessar o arquivo de log do servidor '#233' neces' +
      's'#225'rio estar na rede local e o HOST definido nas configura'#231#245'es do' +
      ' Banco de Dados deve ser o nome do servidor e n'#227'o o IP'#13#10'- Caso e' +
      'steja fora da rede local, utilize VPN para se conectar ao servid' +
      'or.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object memo1: TMemo
    Left = 24
    Top = 240
    Width = 977
    Height = 353
    Color = 16776176
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 576
    Top = 192
    Width = 145
    Height = 21
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object tipo: TRadioGroup
    Left = 24
    Top = 192
    Width = 513
    Height = 41
    Cursor = crDrag
    Caption = 'Servidor'
    Columns = 3
    Items.Strings = (
      'Servidor 1'
      'Servidor 2'
      'Servidor 3')
    TabOrder = 1
    OnClick = tipoClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1014
    Height = 9
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 5
  end
  object Panel1: TPanel
    Left = 0
    Top = 623
    Width = 1014
    Height = 38
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 3
    object Label5: TLabel
      Left = 24
      Top = 13
      Width = 86
      Height = 13
      Caption = 'Ctrl + P - Pesquisa'
    end
    object BitBtn1: TBitBtn
      Left = 848
      Top = 4
      Width = 159
      Height = 30
      Cursor = crHandPoint
      Hint = 'Retornar ao menu principal'
      Cancel = True
      Caption = '&Retornar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 688
      Top = 4
      Width = 159
      Height = 30
      Cursor = crHandPoint
      Caption = 'Salva Diret'#243'rios'
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDD82222222222FDDDF222222222222DDDF22222F2222
        22DDDF227F2F22F222DDDF277FF22F2222DDDF277772222222DDDF2FFF7222FF
        22DDDF7777F22F2222DDDF777F7F2FF222DDDF77777F722222DDDF78777F7772
        22DDDF777777722228DDDDFFFFFFFFFFFDDDDDDDDDDDDDDDDDDD}
    end
    object BitBtn3: TBitBtn
      Left = 208
      Top = 4
      Width = 159
      Height = 30
      Cursor = crHandPoint
      Caption = 'Alterar nome Servidor 1'
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 368
      Top = 4
      Width = 159
      Height = 30
      Cursor = crHandPoint
      Caption = 'Alterar nome Servidor 2'
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object BitBtn5: TBitBtn
      Left = 528
      Top = 4
      Width = 159
      Height = 30
      Cursor = crHandPoint
      Caption = 'Alterar nome Servidor 3'
      TabOrder = 4
      OnClick = BitBtn5Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 16
    Width = 513
    Height = 169
    Caption = 'Diret'#243'rios'
    TabOrder = 0
    object Label7: TLabel
      Left = 8
      Top = 72
      Width = 178
      Height = 13
      Caption = 'Servidor 2 (Local dos arquivos de log)'
    end
    object Label8: TLabel
      Left = 8
      Top = 120
      Width = 178
      Height = 13
      Caption = 'Servidor 3 (Local dos arquivos de log)'
    end
    object Label6: TLabel
      Left = 8
      Top = 24
      Width = 178
      Height = 13
      Caption = 'Servidor 1 (Local dos arquivos de log)'
    end
    object DirectoryEdit1: TDirectoryEdit
      Left = 8
      Top = 40
      Width = 497
      Height = 21
      NumGlyphs = 1
      TabOrder = 0
    end
    object DirectoryEdit2: TDirectoryEdit
      Left = 8
      Top = 88
      Width = 497
      Height = 21
      NumGlyphs = 1
      TabOrder = 1
    end
    object DirectoryEdit3: TDirectoryEdit
      Left = 8
      Top = 136
      Width = 497
      Height = 21
      NumGlyphs = 1
      TabOrder = 2
    end
  end
  object OpenDialog1: TOpenDialog
    InitialDir = '\\Servidorhf\c\HF-Software\Dayz\Server\Servidores\servers'
    Left = 800
    Top = 192
  end
  object FindDialog1: TFindDialog
    OnFind = FindDialog1Find
    Left = 768
    Top = 192
  end
end
