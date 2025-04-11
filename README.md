# Embed Custom Fonts in Delphi Android with Skia4Delphi

This repository demonstrates how to embed custom fonts in Delphi Android applications using the [Skia4Delphi](https://skia4delphi.org/) library.

With this approach, you can include `.ttf` or `.otf` font files directly into your Android package and use them throughout your app with clean, consistent rendering—no reliance on system fonts.

## 📹 Watch the Video Tutorial

Learn how it works step-by-step by watching the full tutorial on YouTube:

👉 [Delphi - How to Embed Fonts in Android (Skia4Delphi)](https://www.youtube.com/watch?v=BttRr7yHGAY)

## 🔧 How to Use

1. Install **Skia4Delphi** in your Delphi environment.
2. Add your custom font files to the project as resources.
3. Use `TSkTypefaceManager` to register and load your fonts:

```pascal
program CustomFont;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  System.Classes,
  System.SysUtils, System.Types,
  Main.View in 'Main.View.pas' {MainView};

{$R *.res}

function RegisterFontFromRCDATA(const aFontResName: string): string;
var
  LStream: TResourceStream;
begin
  LStream := TResourceStream.Create(HInstance, aFontResName, RT_RCDATA);;
  try
    TSkDefaultProviders.RegisterTypeface(LStream);
  finally
    FreeAndNil(LStream);
  end;
end;

begin
  GlobalUseSkia := True;
  RegisterFontFromRCDATA('NotoSArabicSemiCond');
  Application.Initialize;
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.
```  
4.Apply the typeface using the Added GlobalUseSkia := True; to .dpr, which is responsible for replacing the FMX app’s renderer with the Skia render.

📄 Blog Reference  
This implementation is based on the guide by EngineerTips:
🔗 [Delphi – Skia4Delphi – Embed Font](https://engineertips.wordpress.com/2022/09/23/delphi-skia4delphi-embed-font/)  

Enjoy it ..
