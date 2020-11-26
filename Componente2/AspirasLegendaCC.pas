unit AspirasLegendaCC;

interface

uses
  system.Classes,
  Vcl.Controls;

type
  TAspirasLegendaCC = class(TCustomControl)
  private
    procedure CMFocusChanged(var Message : TCMFocusChanged);message CM_FOCUSCHANGED;
  public
    procedure Paint;override;
    procedure Click;override;
  end;

implementation

uses
  Vcl.Graphics;

{ TAspirasLegendaCC }

procedure TAspirasLegendaCC.Click;
begin
  inherited;
  SetFocus;
end;

procedure TAspirasLegendaCC.CMFocusChanged(var Message: TCMFocusChanged);
begin
  inherited;
  Invalidate;
end;

procedure TAspirasLegendaCC.Paint;
begin
  inherited;
  if Focused then
    Canvas.Brush.Color  := clRed
  else
    Canvas.Brush.Color  := clSkyBlue;

  Canvas.Brush.Style := bsSolid;
  Canvas.Pen.Color := clYellow;
  Canvas.Pen.Width := 1;
  Canvas.Rectangle(ClientRect);
end;

end.
