program ViolenceDetectionDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  ViolenceDetectionAPIDemo in 'ViolenceDetectionAPIDemo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
