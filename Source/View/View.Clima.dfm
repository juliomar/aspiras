inherited frmViewClima: TfrmViewClima
  Caption = 'frmViewClima'
  ClientHeight = 505
  ClientWidth = 874
  ExplicitWidth = 890
  ExplicitHeight = 544
  PixelsPerInch = 96
  TextHeight = 13
  inherited GridPanel1: TGridPanel
    Width = 874
    Height = 505
    ColumnCollection = <
      item
        Value = 40.000000000000000000
      end
      item
        Value = 40.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 2
        Control = Button1
        Row = 0
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = Memo1
        Row = 0
      end
      item
        Column = 0
        ColumnSpan = 2
        Control = DBGrid1
        Row = 1
      end
      item
        Column = 2
        Control = Button2
        Row = 1
      end
      item
        Column = 0
        Control = Button3
        Row = 3
      end
      item
        Column = 1
        Control = Edit1
        Row = 3
      end
      item
        Column = 0
        Control = Edit2
        Row = 2
      end
      item
        Column = 1
        Control = Button4
        Row = 2
      end>
    RowCollection = <
      item
        Value = 35.791900018761160000
      end
      item
        Value = 36.378004413036880000
      end
      item
        Value = 11.163428901535280000
      end
      item
        Value = 16.666666666666670000
      end>
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 675
    ExplicitHeight = 338
    object Button1: TButton
      Left = 748
      Top = 78
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Execute'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 735
      ExplicitTop = 75
    end
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 698
      Height = 180
      Align = alClient
      Lines.Strings = (
        'Memo1')
      TabOrder = 1
      ExplicitLeft = 2
      ExplicitTop = 0
      ExplicitWidth = 673
      ExplicitHeight = 202
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 181
      Width = 698
      Height = 183
      Align = alClient
      DataSource = DataSource1
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Button2: TButton
      Left = 748
      Top = 260
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Grid'
      TabOrder = 3
      OnClick = Button2Click
      ExplicitLeft = 131
      ExplicitTop = 297
    end
    object Button3: TButton
      Left = 138
      Top = 449
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Via CEP'
      TabOrder = 4
      OnClick = Button3Click
      ExplicitLeft = 184
      ExplicitTop = 444
    end
    object Edit1: TEdit
      Left = 464
      Top = 451
      Width = 121
      Height = 21
      Anchors = []
      TabOrder = 5
      ExplicitLeft = 412
      ExplicitTop = 460
    end
    object Edit2: TEdit
      Left = 29
      Top = 381
      Width = 292
      Height = 21
      Anchors = []
      TabOrder = 6
      ExplicitLeft = 0
    end
    object Button4: TButton
      Left = 487
      Top = 379
      Width = 75
      Height = 25
      Anchors = []
      Caption = 'Button4'
      TabOrder = 7
      OnClick = Button4Click
      ExplicitLeft = 759
      ExplicitTop = 377
    end
  end
  object RESTClient1: TRESTClient
    BaseURL = 
      'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/B' +
      'R?token=6a7e406437357e2fb00ed63d79a23af8'
    Params = <>
    Left = 316
    Top = 16
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    Left = 388
    Top = 12
  end
  object RESTResponse1: TRESTResponse
    Left = 464
    Top = 12
  end
  object RESTClient2: TRESTClient
    BaseURL = 
      'http://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/B' +
      'R?token=6a7e406437357e2fb00ed63d79a23af8'
    Params = <>
    Left = 304
    Top = 64
  end
  object RESTRequest2: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient2
    Params = <>
    Response = RESTResponse2
    Left = 344
    Top = 68
  end
  object RESTResponse2: TRESTResponse
    Left = 392
    Top = 72
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse2
    TypesMode = Rich
    Left = 484
    Top = 60
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    Left = 612
    Top = 44
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 40
    Top = 168
  end
  object RESTClient3: TRESTClient
    BaseURL = 'http://viacep.com.br/ws/01001000/json'
    Params = <>
    Left = 160
    Top = 276
  end
  object RESTRequest3: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient3
    Params = <>
    Response = RESTResponse3
    Left = 296
    Top = 248
  end
  object RESTResponse3: TRESTResponse
    Left = 392
    Top = 268
  end
  object RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter
    Dataset = FDMemTable2
    FieldDefs = <>
    Response = RESTResponse3
    TypesMode = Rich
    Left = 504
    Top = 284
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    Left = 604
    Top = 284
  end
end
