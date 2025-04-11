program CustomFontAndroid;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  System.Classes, // TResourceStream
  System.Types,   // RT_RCDATA
  System.SysUtils, // EXceptions if needed
  Main.View in 'Main.View.pas' {MainView};

{$R *.res}

procedure RegisterFontFromRCDATA(const aFontResName: string);
var
  LFontStream: TResourceStream;
begin
  LFontStream := TResourceStream.Create(HInstance, aFontResName, RT_RCDATA);
  try
    TSkDefaultProviders.RegisterTypeface(LFontStream);
  finally
    FreeAndNil(LFontStream);
  end;
end;

var
  MainView: TMainView;
begin
  GlobalUseSkia := True;
  RegisterFontFromRCDATA('NotoSArabicSemiCond');
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

  Application.Initialize;
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.
