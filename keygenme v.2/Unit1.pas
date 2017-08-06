unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  nombre,mayuscula,letras,serial :string;
  i,key,num :integer;

begin
  letras := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  nombre := Edit1.Text;

  //concatenamos el nombre con otra cadena
  nombre := nombre + 'perucrackers';


  // pasando a mayusculas
  mayuscula := AnsiUpperCase(nombre);

  // clave de cifrado
  key := length(mayuscula);

  // bucle del algoritmo
  for i:=1 to length(mayuscula) do
    begin
    num := pos(mayuscula[i],letras) + key;
    serial := serial + letras[num]
    end;

  
  Edit2.Text := mayuscula;






end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Application.MessageBox('Si te gusto el Crackme. visita www.crackmes.apuromafo.net o www.perucrackers.net', 'Hasta la Proxima ', MB_OK);
Application.Terminate;

end;

end.
