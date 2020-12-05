unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCarpet = class(TForm)
    Panel: TPanel;
    Image: TImage;
    Scale: TLabel;
    Play: TButton;
    Down: TButton;
    Up: TButton;
    Left: TButton;
    Right: TButton;
    Minus: TButton;
    Plus: TButton;
    Navigation: TLabel;
    Data: TLabel;
    NEdit: TEdit;
    ZEdit: TEdit;
    Button1: TButton;
    procedure PlayClick(Sender: TObject);
    procedure NEditClick(Sender: TObject);
    procedure ZEditClick(Sender: TObject);
    procedure MinusClick(Sender: TObject);
    procedure PlusClick(Sender: TObject);
    procedure RightClick(Sender: TObject);
    procedure LeftClick(Sender: TObject);
    procedure UpClick(Sender: TObject);
    procedure DownClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Carpet: TCarpet;
  x, y: Integer;
  N, Zx, Zy: Integer;
  Power: Bool;
  count_plus, count_minus: Integer;
  count_left, count_right: Integer;
  count_up, count_down: Integer;

implementation

{$R *.dfm}

procedure SerpinskyCarpet(x1, y1, x2, y2, n: Integer);
var
  x1n, y1n, x2n, y2n: Integer;
begin
if  (n > 0)  then
begin
  x1n := round(2 * x1 / 3 + x2 / 3);
  x2n := round(x1 / 3 + 2 * x2 / 3);
  y1n := round(2 * y1 / 3 + y2 / 3);
  y2n := round(y1 / 3 + 2 * y2 / 3);

  Carpet.Image.Canvas.Pen.Color := clBlack;
  Carpet.Image.Canvas.Brush.Color := clMoneyGreen;

  Carpet.Image.Canvas.MoveTo(x1n, y1n);
  Carpet.Image.Canvas.LineTo(x2n, y1n);
  Carpet.Image.Canvas.LineTo(x2n, y2n);
  Carpet.Image.Canvas.LineTo(x1n, y2n);
  Carpet.Image.Canvas.LineTo(x1n, y1n);

  Carpet.Image.Canvas.FloodFill(round((x1n+x2n)/2),round((y1n+y2n)/2),clBlack,fsBorder);

  SerpinskyCarpet(x1, y1, x1n, y1n, n-1);
  SerpinskyCarpet(x1n, y1, x2n, y1n, n-1);
  SerpinskyCarpet(x2n, y1, x2, y1n, n-1);

  SerpinskyCarpet(x1, y1n, x1n, y2n, n-1);
  SerpinskyCarpet(x2n, y1n, x2, y2n, n-1);

  SerpinskyCarpet(x1, y2n, x1n, y2, n-1);
  SerpinskyCarpet(x1n, y2n, x2n, y2, n-1);
  SerpinskyCarpet(x2n, y2n, x2, y2, n-1);
end;
end;

procedure TCarpet.NEditClick(Sender: TObject);
begin
  NEdit.Text := '';
  Power := false;
end;

procedure TCarpet.PlayClick(Sender: TObject);
var
  tmp: Integer;
begin
  if (((not TryStrToInt(ZEdit.Text,tmp) or not TryStrToInt(NEdit.Text,tmp)))or(StrToInt(ZEdit.Text) > 507))  then
      ShowMessage('Данные некорректны')
  else
  begin
    Power := true;
    N := StrToInt(NEdit.Text);
    Zx := StrToInt(ZEdit.Text);
    Zy := StrToInt(ZEdit.Text);
    x := Carpet.Image.Width - Zx;
    y := Carpet.Image.Height - Zy;
    count_minus := 0;
    count_plus := 0;
    count_left := 0;
    count_right := 0;
    count_up := 0;
    count_down := 0;
    Carpet.Image.Canvas.Brush.Color := clWhite;
    Carpet.Image.Canvas.Pen.Color := clBlack;
    Carpet.Image.Canvas.Rectangle(0,0,516,516);
    Carpet.Canvas.FloodFill(2,2,clBlack,fsBorder);

    Carpet.Image.Canvas.MoveTo(x, y);
    Carpet.Image.Canvas.LineTo(Zx, y);
    Carpet.Image.Canvas.LineTo(Zx, Zy);
    Carpet.Image.Canvas.LineTo(x, Zy);
    Carpet.Image.Canvas.LineTo(x, y);

    SerpinskyCarpet(x, y, Zx, Zy, N);
  end;
end;

procedure TCarpet.PlusClick(Sender: TObject);
begin
  if Power and (count_plus < 10) then
  begin
      count_plus := count_plus + 5;
      Image.Canvas.Pen.Color := clBlack;
      Image.Canvas.Brush.Color := clWhite;
      Image.Canvas.Rectangle(0,0,516,516);
      Image.Canvas.Pen.Color := clBlack;
      Image.Canvas.Pen.Width := 1;
      x := x - 4*ABS(count_minus - count_plus);
      y := y - 4*ABS(count_minus - count_plus);
      Zx := Zx + 4*ABS(count_minus - count_plus);
      Zy := Zy + 4*ABS(count_minus - count_plus);

      Carpet.Image.Canvas.MoveTo(x, y);
      Carpet.Image.Canvas.LineTo(Zx, y);
      Carpet.Image.Canvas.LineTo(Zx, Zy);
      Carpet.Image.Canvas.LineTo(x, Zy);
      Carpet.Image.Canvas.LineTo(x, y);

      count_minus := count_minus - 5;
      SerpinskyCarpet(x, y, Zx, Zy, N);
  end
  else if not power then ShowMessage('Сначала нажмите "PLAY" ');
end;

procedure TCarpet.RightClick(Sender: TObject);
begin
 if Power and (count_right < 20) then
  begin
      count_right := count_right + 5;
      Image.Canvas.Pen.Color := clBlack;
      Image.Canvas.Brush.Color := clWhite;
      Image.Canvas.Rectangle(0,0,516,516);
      Image.Canvas.Pen.Color := clBlack;
      Image.Canvas.Pen.Width := 1;
      x := x + ABS(count_right - count_left);
      Zx := Zx + ABS(count_right - count_left);

      Carpet.Image.Canvas.MoveTo(x, y);
      Carpet.Image.Canvas.LineTo(Zx, y);
      Carpet.Image.Canvas.LineTo(Zx, Zy);
      Carpet.Image.Canvas.LineTo(x, Zy);
      Carpet.Image.Canvas.LineTo(x, y);

      count_left := count_left - 5;
      SerpinskyCarpet(x, y, Zx, Zy, N);
  end
  else if not power then ShowMessage('Сначала нажмите "PLAY" ');
end;

procedure TCarpet.UpClick(Sender: TObject);
begin
 if Power and (count_up < 20) then
  begin
      count_up := count_up + 5;
      Image.Canvas.Pen.Color := clBlack;
      Image.Canvas.Brush.Color := clWhite;
      Image.Canvas.Rectangle(0,0,516,516);
      Image.Canvas.Pen.Color := clBlack;
      Image.Canvas.Pen.Width := 1;
      y := y - ABS(count_up - count_down);
      Zy := Zy - ABS(count_up - count_down);

      Carpet.Image.Canvas.MoveTo(x, y);
      Carpet.Image.Canvas.LineTo(Zx, y);
      Carpet.Image.Canvas.LineTo(Zx, Zy);
      Carpet.Image.Canvas.LineTo(x, Zy);
      Carpet.Image.Canvas.LineTo(x, y);

      count_down := count_down - 5;
      SerpinskyCarpet(x, y, Zx, Zy, N);
  end
  else if not Power then ShowMessage('Сначала нажмите "PLAY" ');
end;

procedure TCarpet.Button1Click(Sender: TObject);
begin
if Power then
  Image.Picture.SaveTofile('C:\Users\Alexey\Pictures\Fraktals\serpinsky_carpet.jpg')
  else
  ShowMessage('Сначала нажмите "PLAY" ');
end;

procedure TCarpet.DownClick(Sender: TObject);
begin
  if Power and (count_down < 20) then
  begin
      count_down := count_down + 5;
      Image.Canvas.Pen.Color := clBlack;
      Image.Canvas.Brush.Color := clWhite;
      Image.Canvas.Rectangle(0,0,516,516);
      Image.Canvas.Pen.Color := clBlack;
      Image.Canvas.Pen.Width := 1;
      y := y + ABS(count_up - count_down);
      Zy := Zy + ABS(count_up - count_down);

      Carpet.Image.Canvas.MoveTo(x, y);
      Carpet.Image.Canvas.LineTo(Zx, y);
      Carpet.Image.Canvas.LineTo(Zx, Zy);
      Carpet.Image.Canvas.LineTo(x, Zy);
      Carpet.Image.Canvas.LineTo(x, y);

      count_up := count_up - 5;
      SerpinskyCarpet(x, y, Zx, Zy, N);
  end
  else if not Power then ShowMessage('Сначала нажмите "PLAY" ');
end;

procedure TCarpet.LeftClick(Sender: TObject);
begin
  if Power and (count_left < 20) then
  begin
      count_left := count_left + 5;
      Image.Canvas.Pen.Color := clBlack;
      Image.Canvas.Brush.Color := clWhite;
      Image.Canvas.Rectangle(0,0,516,516);
      Image.Canvas.Pen.Color := clBlack;
      Image.Canvas.Pen.Width := 1;
      x := x - ABS(count_right - count_left);
      Zx := Zx - ABS(count_right - count_left);

      Carpet.Image.Canvas.MoveTo(x, y);
      Carpet.Image.Canvas.LineTo(Zx, y);
      Carpet.Image.Canvas.LineTo(Zx, Zy);
      Carpet.Image.Canvas.LineTo(x, Zy);
      Carpet.Image.Canvas.LineTo(x, y);

      count_right := count_right - 5;
      SerpinskyCarpet(x, y, Zx, Zy, N);
  end
  else if not Power then ShowMessage('Сначала нажмите "PLAY" ');
end;

procedure TCarpet.MinusClick(Sender: TObject);
begin
  if Power and (count_minus < 10) then
  begin
      count_minus := count_minus + 5;
      Image.Canvas.Pen.Color := clBlack;
      Image.Canvas.Brush.Color := clWhite;
      Image.Canvas.Rectangle(0,0,516,516);
      Image.Canvas.Pen.Color := clBlack;
      Image.Canvas.Pen.Width := 1;
      x := x + 4*ABS(count_minus - count_plus);
      y := y + 4*ABS(count_minus - count_plus);
      Zx := Zx - 4*ABS(count_minus - count_plus);
      Zy := Zy - 4*ABS(count_minus - count_plus);
      Carpet.Image.Canvas.MoveTo(x, y);
      Carpet.Image.Canvas.LineTo(Zx, y);
      Carpet.Image.Canvas.LineTo(Zx, Zy);
      Carpet.Image.Canvas.LineTo(x, Zy);
      Carpet.Image.Canvas.LineTo(x, y);
      count_plus := count_plus - 5;
      SerpinskyCarpet(x, y, Zx, Zy, N);
  end
  else if not power then ShowMessage('Сначала нажмите "PLAY" ');
end;

procedure TCarpet.ZEditClick(Sender: TObject);
begin
  ZEdit.Text := '';
  Power := false;
end;

end.
