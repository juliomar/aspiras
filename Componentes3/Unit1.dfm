object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 395
  ClientWidth = 611
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 196
    Top = 8
    Width = 255
    Height = 13
    Caption = 'Escolha o filtro, digite a palavra busca e aperte Enter'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 376
    Width = 611
    Height = 19
    Panels = <>
    SimplePanel = True
    SimpleText = 'Registros selecionados'
    ExplicitTop = 378
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 12
    Width = 177
    Height = 53
    Caption = 'RadioGroup1'
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 196
    Top = 27
    Width = 389
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 71
    Width = 595
    Height = 270
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 447
    Top = 345
    Width = 75
    Height = 25
    Caption = '&Ok'
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 528
    Top = 345
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    NumGlyphs = 2
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 132
    Top = 132
  end
end
