unit UCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    txt_Num1: TEdit;
    txt_Num2: TEdit;
    bt_Calcular: TButton;
    bt_Clear: TButton;
    bt_Dividir: TBitBtn;
    bt_Multiplicar: TBitBtn;
    bt_Subtrair: TBitBtn;
    bt_Soma: TBitBtn;
    lbl_Resultado: TLabel;
    procedure bt_CalcularClick(Sender: TObject);
    procedure bt_SomaClick(Sender: TObject);
    procedure bt_SubtrairClick(Sender: TObject);
    procedure bt_MultiplicarClick(Sender: TObject);
    procedure bt_DividirClick(Sender: TObject);
    procedure bt_ClearClick(Sender: TObject);
    procedure txt_Num1Change(Sender: TObject);
  private
    function Soma(num1, num2: double) : double;
    function Sub(num1, num2: double) : double;
    function Mult(num1, num2: double) : double;
    function Divisao(num1, num2: double) : double;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  num1, num2: double;
  operadores: array[0..3] of Boolean;
  count: integer;
implementation

{$R *.dfm}

// Procedures

procedure TForm1.txt_Num1Change(Sender: TObject);
begin
  if (txt_Num1.Text = '') and (txt_Num2.Text = '') then begin
      txt_Num2.Enabled := false;
  end
end;

procedure TForm1.bt_SomaClick(Sender: TObject);
begin
     operadores[0] := true;
     count := 0;

  if (txt_Num1.Text <> '') and (operadores[0] = true) then begin
      txt_Num2.Enabled := true;
  end
  else if (txt_Num2.Text <> '') then begin
      txt_Num2.Enabled := true;
  end
  else
      txt_Num2.Enabled := false;
end;

procedure TForm1.bt_SubtrairClick(Sender: TObject);
begin
  operadores[1] := true;
  count := 1;

  if (txt_Num1.Text <> '') and (operadores[1] = true) then begin
      txt_Num2.Enabled := true;
  end
  else if (txt_Num2.Text <> '') then begin
      txt_Num2.Enabled := true;
  end
  else
      txt_Num2.Enabled := false;
end;

procedure TForm1.bt_MultiplicarClick(Sender: TObject);
begin
  operadores[2] := true;
  count := 2;

  if (txt_Num1.Text <> '') and (operadores[2] = true) then begin
      txt_Num2.Enabled := true;
  end
  else if (txt_Num2.Text <> '') then begin
      txt_Num2.Enabled := true;
  end
  else
      txt_Num2.Enabled := false;
end;

procedure TForm1.bt_ClearClick(Sender: TObject);
begin
  operadores[0] := false;
  operadores[1] := false;
  operadores[2] := false;
  operadores[3] := false;
  txt_Num2.Enabled := false;
  txt_Num1.Text := '';
  txt_Num2.Text := '';
  lbl_Resultado.Caption := '';
end;

procedure TForm1.bt_DividirClick(Sender: TObject);
begin
  operadores[3] := true;
  count := 3;

  if (txt_Num1.Text <> '') and (operadores[3] = true) then begin
      txt_Num2.Enabled := true;
  end
  else if (txt_Num2.Text <> '') then begin
      txt_Num2.Enabled := true;
  end
  else
      txt_Num2.Enabled := false;
end;

procedure TForm1.bt_CalcularClick(Sender: TObject);
begin
  num1 := StrToFloat(txt_Num1.Text);
  num2 := StrToFloat(txt_Num2.Text);

  case count of
     0: lbl_Resultado.Caption := FloatToStr(Soma(num1, num2));
     1: lbl_Resultado.Caption := FloatToStr(Sub(num1, num2));
     2: lbl_Resultado.Caption := FloatToStr(Mult(num1, num2));
     3: lbl_Resultado.Caption := FloatToStr(Divisao(num1, num2));
  end;

end;

//Funções

function TForm1.Soma(num1, num2: double) : double;
begin
  result := num1 + num2;
end;

function TForm1.Sub(num1, num2: double) : double;
begin
  result := num1 - num2;
end;

function TForm1.Mult(num1, num2: double) : double;
begin
  result := num1 * num2;
end;

function TForm1.Divisao(num1, num2: double) : double;
begin
  result := num1 / num2;
end;

end.
