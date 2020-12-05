program Project2;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Carpet};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCarpet, Carpet);
  Application.Run;
end.
