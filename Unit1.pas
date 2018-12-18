unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Spin, ComCtrls, Buttons, SPComm, MPlayer,
  ExtCtrls;

type
  TForm1 = class(TForm)
    skndt1: TSkinData;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btn10: TButton;
    btn11: TButton;
    btn12: TButton;
    btn13: TButton;
    btn14: TButton;
    btn15: TButton;
    lbl13: TLabel;
    lbl14: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt6: TEdit;
    edt7: TEdit;
    edt8: TEdit;
    edt9: TEdit;
    edt10: TEdit;
    edt11: TEdit;
    edt12: TEdit;
    edt13: TEdit;
    edt14: TEdit;
    edt15: TEdit;
    lbl15: TLabel;
    btn16: TSpeedButton;
    btn17: TSpeedButton;
    btn18: TSpeedButton;
    btn19: TSpeedButton;
    btn20: TSpeedButton;
    btn21: TSpeedButton;
    btn22: TSpeedButton;
    btn23: TSpeedButton;
    btn24: TSpeedButton;
    btn25: TSpeedButton;
    btn26: TSpeedButton;
    btn27: TSpeedButton;
    btn28: TSpeedButton;
    btn29: TSpeedButton;
    btn30: TSpeedButton;
    grp2: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    grp3: TGroupBox;
    rb3: TRadioButton;
    rb4: TRadioButton;
    grp4: TGroupBox;
    lbl16: TLabel;
    edt16: TEdit;
    btn31: TButton;
    btn32: TButton;
    ts3: TTabSheet;
    tmr1: TTimer;
    mp1: TMediaPlayer;
    mmo1: TMemo;
    lbl18: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    Comm1: TComm;
    cbb_tzw: TComboBox;
    cbb_sjw: TComboBox;
    cbb_btl: TComboBox;
    cbb_com: TComboBox;
    chk1: TCheckBox;
    btn33: TButton;
    pnl1: TPanel;
    procedure btn33Click(Sender: TObject);
    procedure Comm1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function COM(x:Integer):String;
begin
  case x of
    0:Result:='COM1';
    1:Result:='COM2';
    2:Result:='COM3';
    3:Result:='COM4';
    4:Result:='COM5';
    5:Result:='COM6';
    6:Result:='COM7';
    7:Result:='COM8';
    8:Result:='COM9';
    9:Result:='COM10';
    10:Result:='COM11';
    11:Result:='COM12';
    12:Result:='COM13';
    13:Result:='COM14';
    14:Result:='COM15';
    else
       Result:='Error';
  end;
end;

function BaudRate(x:Integer):Integer;
begin
  case x of
    0:Result:=600;
    1:Result:=1200;
    2:Result:=2400;
    3:Result:=4800;
    4:Result:=9600;
    5:Result:=14400;
    6:Result:=19200;
    7:Result:=28800;
    8:Result:=38400;
    9:Result:=57600;
    10:Result:=115200;
    11:Result:=128000;
    12:Result:=256000;
    else
       Result:=0;
  end;
end;

function ByteSize(x:Integer):TbyteSize;
begin
  case x of
    0:Result:=_5;
    1:Result:=_6;
    2:Result:=_7;
    3:Result:=_8;
  end;
end;

function StopBits(x:Integer):TStopBits;
begin
  case x of
    0:Result:=_1;
    1:Result:=_1_5;
    2:Result:=_2;
  end;
end;
procedure TForm1.btn33Click(Sender: TObject);
begin
  Comm1.CommName:=COM(cbb_com.ItemIndex);
  Comm1.BaudRate:=BaudRate(cbb_btl.ItemIndex);
  Comm1.ByteSize:=ByteSize(cbb_sjw.ItemIndex);
  Comm1.DsrSensitivity:=chk1.Checked;
  Comm1.StopBits:=StopBits(cbb_tzw.ItemIndex);
  Comm1.StartComm;
end;

procedure TForm1.Comm1ReceiveData(Sender: TObject; Buffer: Pointer;
  BufferLength: Word);
  var
    x:PChar;
  recstr:string;
   arr:array of array of string;
begin
   x:=Buffer;
  mmo1.Lines.Add('Received:'+x);
  recstr:=x;
  recstr:=StringReplace(recstr,#$D#$A,'',[]);
  mp1.FileName:='';

   setlength(arr,2,2);
    arr[0,0]:='141871';
    arr[0,1]:='1.avi';

    arr[1,0]:='9639535';
    arr[1,1]:='2.avi';


    if(recstr=arr[0,0])then
    begin
       mp1.FileName := arr[0,1];
    end;
     if(recstr=arr[1,0])then
    begin
       mp1.FileName := arr[1,1];
    end;
    if mp1.FileName<>'' then
    begin
     mp1.Display := pnl1;
       mp1.Wait := False;
        mp1.Open;
       mp1.DisplayRect := pnl1.ClientRect;
       mp1.Play;
    end;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Comm1.StopComm;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  x:Tstopbits;
begin
//    Memo1.Text:='5';
  mmo1.Text:='';
  cbb_com.ItemIndex:=6;
  cbb_btl.ItemIndex:=4;
  cbb_sjw.ItemIndex:=3;
  cbb_tzw.ItemIndex:=0;
//  CheckBox1.Checked:=False;
end;

end.
