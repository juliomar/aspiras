object ModelData: TModelData
  OldCreateOrder = False
  Height = 181
  Width = 326
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://apiadvisor.climatempo.com.br/api/v1/weather/locale/5980/c'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 44
    Top = 36
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 128
    Top = 36
  end
  object RESTResponse1: TRESTResponse
    Left = 204
    Top = 36
  end
end
