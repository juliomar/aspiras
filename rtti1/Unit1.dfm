object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 247
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 212
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 267
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 216
    Top = 88
    Width = 55
    Height = 13
    Caption = 'Estado Civil'
  end
  object CampoCorUniforme: TShape
    Left = 501
    Top = 171
    Width = 77
    Height = 29
  end
  object Label4: TLabel
    Left = 368
    Top = 141
    Width = 96
    Height = 13
    Caption = 'Data de Nascimento'
  end
  object Label5: TLabel
    Left = 500
    Top = 152
    Width = 78
    Height = 13
    Caption = 'Cor do Uniforme'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 18
    Width = 169
    Height = 221
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Width = 120
        Visible = True
      end>
  end
  object CampoCodigo: TEdit
    Left = 212
    Top = 35
    Width = 49
    Height = 21
    TabOrder = 1
    Text = 'CampoCodigo'
  end
  object CampoNome: TEdit
    Left = 272
    Top = 35
    Width = 281
    Height = 21
    TabOrder = 2
    Text = 'CampoNome'
  end
  object CampoEstadoCivil: TComboBox
    Left = 216
    Top = 107
    Width = 113
    Height = 21
    TabOrder = 3
    Text = 'CampoEstadoCivil'
    Items.Strings = (
      'Solteiro(a)'
      'Casado(a)'
      'Divorciado(a)')
  end
  object CampoSexo: TRadioGroup
    Left = 368
    Top = 80
    Width = 193
    Height = 45
    Caption = 'Sexo'
    Columns = 2
    Items.Strings = (
      'Masculino'
      'Feminino')
    TabOrder = 4
  end
  object CampoSenioridade: TTrackBar
    Left = 216
    Top = 152
    Width = 125
    Height = 45
    TabOrder = 5
  end
  object CampoDataNascimento: TDateTimePicker
    Left = 368
    Top = 160
    Width = 96
    Height = 21
    Date = 44169.000000000000000000
    Time = 0.576621620370133300
    TabOrder = 6
  end
  object CampoPlanoSaude: TCheckBox
    Left = 216
    Top = 216
    Width = 97
    Height = 17
    Caption = 'Plano de Sa'#250'de'
    TabOrder = 7
  end
  object FDMemTable1: TFDMemTable
    Active = True
    AfterScroll = FDMemTable1AfterScroll
    FieldDefs = <
      item
        Name = 'nome'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 56
    Top = 148
    object FDMemTable1nome: TStringField
      FieldName = 'nome'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FDMemTable1
    Left = 132
    Top = 120
  end
end
