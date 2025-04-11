unit Main.View;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs, FMX.Objects, FMX.Layouts;

type
  TMainView = class(TForm)
    LytRoot: TLayout;
    LytTitleBar: TLayout;
    LytTitle: TLayout;
    LytStatus: TLayout;
    LytClient: TLayout;
    LytTest: TLayout;
    Txt1: TText;
  private

  public

  end;

implementation

{$R *.fmx}

end.
