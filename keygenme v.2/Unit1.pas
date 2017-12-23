unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, registry;

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
  miregistro : TRegistry;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  nombre,mayuscula,letras,serial :string;
  i,key,num :integer;

begin
  letras := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  nombre := Edit1.Text;
  miregistro := TRegistry.Create;

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

    if (num >= length(letras)) then
      begin
        num := num - length(letras);
      end
    else if (num < 0) then
      begin
        num := num + length(letras)

      end;

    serial := serial + letras[num];
    

    end;
  // termina bucle del algoritmo


  if (Edit2.Text = serial) then
    begin
    Application.MessageBox('Genial eres un gran cracker jeje , no olvides de hacer un tuto ', 'Felicidades ', MB_OK);
    miregistro.RootKey := HKEY_CURRENT_USER;
    if miregistro.OpenKey('SOFTWARE\abeljm',true) then
      begin
      showmessage('creado');
      end
    else
      begin
      showmessage('no creado');
      end
    end
  else
    begin
    Application.MessageBox('Practica mas, ya lo lograras ', 'Error  ', MB_OK);
    end;

  Edit2.Text := serial;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Application.MessageBox('Si te gusto el Crackme. visita www.crackmes.apuromafo.net o www.perucrackers.net', 'Hasta la Proxima ', MB_OK);
Application.Terminate;

end;

end.
