unit ViolenceDetectionAPIDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Effects, FMX.Edit, REST.Types,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    StyleBook1: TStyleBook;
    ToolBar1: TToolBar;
    Label1: TLabel;
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    EdtAPIAccKey: TEdit;
    EdtImageURL: TEdit;
    BtnCheckViaURL: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Memo1: TMemo;
    RESTRequest2: TRESTRequest;
    RESTClient2: TRESTClient;
    RESTResponse2: TRESTResponse;
    procedure BtnCheckViaURLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.JSON, System.IOUtils;

procedure TForm1.BtnCheckViaURLClick(Sender: TObject);
begin
  RESTClient1.ResetToDefaults;
  RESTClient1.Accept := 'application/json';
  RESTClient1.AcceptCharset := 'UTF-8, *;q=0.8';
  RESTClient1.BaseURL := Format('https://api.apilayer.com/violence_detection/url?apikey=%s&url=%s', [EdtAPIAccKey.Text, EdtImageURL.Text]);


  RESTResponse1.ContentType := 'application/json';
  RESTRequest1.Execute;

//  Memo1.Lines.Add(RESTClient1.BaseURL);
//  Memo1.Lines.Add(RESTResponse1.Content);

  var JSONValue := TJSONObject.ParseJSONValue(RESTResponse1.Content);
  try
    if JSONValue is TJSONObject then
    begin
      Memo1.Lines.Clear;
      Memo1.Lines.Append(JSONValue.GetValue<String>('description'));
      Memo1.Lines.Append(JSONValue.GetValue<String>('value'));
    end;
  finally
    JSONValue.Free;
  end;
end;

end.
