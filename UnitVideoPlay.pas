unit UnitVideoPlay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MPlayer, DSPack, jpeg,DirectShow9;

type
  TFrmVideoPlay = class(TForm)
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    FilterGraph1: TFilterGraph;
    img1: TImage;
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
    procedure VideoWindow1Click(Sender: TObject);
    procedure FilterGraph1GraphComplete(sender: TObject; Result: HRESULT;
      Renderer: IBaseFilter);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure play(fullname:string);
  end;

var
  FrmVideoPlay: TFrmVideoPlay;
  Gplaystate:string;//stop run
implementation

{$R *.dfm}
procedure TFrmVideoPlay.play(fullname:string) ;
begin
  try
//    mp1.FileName:=fullname;
//     mp1.Display := pnl1;
//       mp1.Wait := False;
//        mp1.Open;
//       mp1.DisplayRect := pnl1.ClientRect;
//       mp1.Play;
    except
      end;
end;
procedure TFrmVideoPlay.btn1Click(Sender: TObject);
begin
ShowMessage('Im frmvideoplay!');
end;

procedure TFrmVideoPlay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//Self.Free;
Gplaystate:='run';
end;

procedure TFrmVideoPlay.btn2Click(Sender: TObject);
begin
Close;
end;

procedure TFrmVideoPlay.VideoWindow1Click(Sender: TObject);
begin
  if (Gplaystate='run') then
  begin
    FilterGraph1.Pause;
    Gplaystate:='stop';
  end
  else if (Gplaystate='stop') then
  begin
  FilterGraph1.Play;
  Gplaystate:='play';
  end;


end;

procedure TFrmVideoPlay.FilterGraph1GraphComplete(sender: TObject;
  Result: HRESULT; Renderer: IBaseFilter);
begin
  //fullname:='';
           FilterGraph1.Stop;
          // tvp.FilterGraph1.ClearGraph;
          //tvp.VideoWindow1.Height:=0;
       //   img1.Align:=alClient;
     //     VideoWindow1.Visible:=False;
end;

procedure TFrmVideoPlay.FormKeyPress(Sender: TObject; var Key: Char);
begin
//ShowMessage('aaabb');
end;

procedure TFrmVideoPlay.FormCreate(Sender: TObject);
begin
img1.Picture.LoadFromFile('pic/pic.jpg');
img1.AutoSize:=True;
end;

procedure TFrmVideoPlay.FormActivate(Sender: TObject);
begin
img1.Align:=alClient;
end;

procedure TFrmVideoPlay.FormPaint(Sender: TObject);
begin
img1.Align:=alClient;
end;

procedure TFrmVideoPlay.FormResize(Sender: TObject);
begin
img1.Align:=alClient;
end;

end.
