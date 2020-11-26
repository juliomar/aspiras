unit AspirasLegenda;

interface

uses
  System.Classes,
  Vcl.Controls;

type
  TAspirasLegenda = class(TGraphicControl)
  private
  public
    procedure Paint; override;
  end;



implementation

uses
  vcl.Graphics;

  { TAspirasLegenda }



procedure TAspirasLegenda.Paint;
begin
  inherited;
  Canvas.Brush.Color := clSkyBlue;
  Canvas.Brush.Style := bsSolid;
  Canvas.Pen.Color   := clBlack;
  Canvas.Pen.Width   := 1;
  Canvas.Rectangle(ClientRect);
end;

end.
