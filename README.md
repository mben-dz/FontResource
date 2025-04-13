# Embed Custom Fonts in Delphi Android with Skia4Delphi

This repository demonstrates how to embed custom fonts in Delphi Android applications using the [Skia4Delphi](https://skia4delphi.org/) library.

With this approach, you can include `.ttf` or `.otf` font files directly into your Android package and use them throughout your app with clean, consistent rendering—no reliance on system fonts.  

![Delphi How to Embed Fonts in Android](https://github.com/user-attachments/assets/b62f1d93-aba4-44ff-837b-896d1a6fe5f6)


## 📹 Watch the Video Tutorial

Learn how it works step-by-step by watching the full tutorial on YouTube:

👉 [Delphi - How to Embed Fonts in Android (Skia4Delphi)](https://www.youtube.com/watch?v=BttRr7yHGAY)

## 🔧 How to Use

1. Install **Skia4Delphi** in your Delphi environment.
2. Add your custom font files to the project as resources.
3. Use `TSkDefaultProviders` to register and load your fonts:

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

procedure RegisterFontFromRCDATA(const aFontResName: string);
var
  LStream: TResourceStream;
begin
  LStream := TResourceStream.Create(HInstance, aFontResName, RT_RCDATA);
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

📄 Blog & References:  

👉 [skia4delph Right To Left Read Me !](https://github.com/skia4delphi/skia4delphi?tab=readme-ov-file#right-to-left)

This implementation is based first on the guide by EngineerTips:
🔗 [Delphi – Skia4Delphi – Embed Font](https://engineertips.wordpress.com/2022/09/23/delphi-skia4delphi-embed-font/)  

<details>
  
<summary> 🔗 Right-to-Left: From Skia4Delphi ReadMe 🌟</summary>

Using Skia's render, your application will now support Right-To-Left text rendering. But for that you will need to make 3 changes to your project:

For RAD Studio prior to 11.3, open the source of your Delphi Application Project (.dpr), include the line Application.BiDiMode := TBiDiMode.bdRightToLeft;, like below:  
```pascal
program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  System.Classes,
  FMX.Skia,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.BiDiMode := TBiDiMode.bdRightToLeft;
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
```
Set the property BiDiMode of your forms to bdRightToLeft;
Keyboard input controls like TEdit and TMemo, need to be fixed by Embarcadero, meanwhile, as a workaround, set the ControlType property of these controls to Platform.
Custom fonts
Using Skia's renderer, it is possible to use custom font in any FMX control, on any platform in a very simple way. Just register them in the app initialization:
```pascal
program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  GlobalUseSkia := True;
  TSkDefaultProviders.RegisterTypeface('Poppins.ttf');
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
```
On RAD Studio 12 Athens or newer it is recommended to use IFMXFontManagerService:
```pascal
program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Platform,
  FMX.FontManager,
  FMX.Skia,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  GlobalUseSkia := True;
  var LFontManager: IFMXFontManagerService;
  if TPlatformServices.Current.SupportsPlatformService(IFMXFontManagerService, LFontManager) then
    LFontManager.AddCustomFontFromFile('Poppins.ttf');
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
```
</details>  

Enjoy it ..
