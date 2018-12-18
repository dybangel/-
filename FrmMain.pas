unit FrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Spin, ComCtrls, Buttons, SPComm, MPlayer,
  ExtCtrls,UnitVideoPlay,Registry,IniFiles,shellapi,TlHelp32,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

type
  TForm1 = class(TForm)
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
    edt_8: TEdit;
    edt_7: TEdit;
    edt_6: TEdit;
    edt_2: TEdit;
    edt_9: TEdit;
    edt_4: TEdit;
    edt_11: TEdit;
    edt_1: TEdit;
    edt_12: TEdit;
    edt_13: TEdit;
    edt_5: TEdit;
    edt_10: TEdit;
    edt_3: TEdit;
    edt_14: TEdit;
    edt_15: TEdit;
    lbl15: TLabel;
    btn_1: TSpeedButton;
    btn_2: TSpeedButton;
    btn_3: TSpeedButton;
    btn_4: TSpeedButton;
    btn_5: TSpeedButton;
    btn_6: TSpeedButton;
    btn_7: TSpeedButton;
    btn_8: TSpeedButton;
    btn_9: TSpeedButton;
    btn_10: TSpeedButton;
    btn_11: TSpeedButton;
    btn_12: TSpeedButton;
    btn_13: TSpeedButton;
    btn_14: TSpeedButton;
    btn_15: TSpeedButton;
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
    btn34: TButton;
    skndt1: TSkinData;
    btn35: TButton;
    btntest: TButton;
    btn_start_listen: TButton;
    IdTCPClient1: TIdTCPClient;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure btn33Click(Sender: TObject);
    procedure Comm1ReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn34Click(Sender: TObject);
    procedure btn35Click(Sender: TObject);
    procedure skndt1FormSkin(Sender: TObject; aName: String;
  

      var DoSkin: Boolean);
    procedure Comm1ModemStateChange(Sender: TObject; ModemEvent: Cardinal);
    procedure btntestClick(Sender: TObject);
    procedure btn_start_listenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure opendir(dirname:string);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure mp1Notify(Sender: TObject);
    function EndProcess(ExeFileName:string):integer;
    procedure Comm1ReceiveError(Sender: TObject; EventMask: Cardinal);
    procedure FormActivate(Sender: TObject);
//           function MyFun(p: Pointer): Integer; stdcall;
  private
    { Private declarations }
  public
    { Public declarations }
      procedure GetComPorts();
      procedure opencom();
      procedure init();
      procedure listen();
      procedure MyInterval();
  //    function test():Integer;
  end;

var
  Form1: TForm1;
   tvp:TfrmVideoPlay;
   linkstate:Integer;
   Gclick_switch_now:string;
   Gclick_switch_time:string;
   Gvideo_path_now:String;
   Gvideo_path_now_state:string;
   Grunstate:String;
   Gtwoclickstate:string;
   Gvideo_array:array of array of string;
   Gswitchcount:Integer;//开关数量
   Gcomport:string;
   Gbaudrate:string;
   fullname:string;
   Socket:TIdTCPClient;
   Gserverip:string;
   Gserverport:Integer;
   Gclick_time,Glast_click_time:LongInt;
   Gswitch_1_code,Gswitch_2_code,Gswitch_3_code,Gswitch_4_code,Gswitch_5_code,Gswitch_6_code,Gswitch_7_code,Gswitch_8_code,
   Gswitch_9_code,Gswitch_10_code,Gswitch_11_code,Gswitch_12_code,Gswitch_13_code,Gswitch_14_code,Gswitch_15_code:string;
implementation

{$R *.dfm}
procedure TForm1.listen();
begin
         try
                tvp:=TFrmVideoPlay.Create(nil);
                tvp.Show;
                  with tvp do
                begin
                Top := 0 ;
                Left := 0 ;
                BorderStyle := bsNone ;
                WindowState := wsmaximized;
                ClientWidth := Screen.Width ;
                ClientHeight := Screen.Height;
                Refresh;
                SetForegroundWindow(Handle) ;
                SetActiveWindow(Application.Handle) ;
               // VideoWindow1.Height:=0;

                //FilterGraph1.RenderFile('srt/background.jpg');

                //FilterGraph1.Play;
                  end;

         finally
         end;
         Grunstate:='listen';
end;
procedure TForm1.init();
var
  dir:string;
  i:Integer;
ZkyFileIni:TIniFile;
ZkyIntIni:Integer; //用来存放ini上ZkyInt的值
ZkyStrIni:string;//用来存放ini上ZkyStr的值
ZkyIniAdd:string;//用来存放ini文件地址


 Rec:TSearchRec;
 Path : string;
 js:Integer;//计数器
   RequestStr,BackStr:string;
begin
  Screen.Cursor:=crNone;
//socket
//Gserverip:='192.168.0.2';
//Gserverport:=221;
//Socket:=TIdTCPClient.Create(nil);
//Socket.Host:=Gserverip;
//Socket.Port:=Gserverport;

//Socket.Connect(5000);
//Socket.WriteLn('assdf');


  //设置运行状态为setup
  Grunstate:='setup';
  Gbaudrate:='115200';
  Glast_click_time:=0;//上一次点击开关的时间
  PageControl1.Pages[1].TabVisible:=False;
//   PageControl1.Pages[2].TabVisible:=False;
  //  mp1.Notify:=True;
//读取配置文件

   ZkyIniAdd:=GetCurrentDir+'\config.ini';//存放ini的地址到ZkyIniAdd上
    ZkyFileIni:=TIniFile.Create(PChar(ZkyIniAdd))  ;
if Not FileExists(ZkyIniAdd) then

      begin

        ZkyFileIni.WriteString('ZkyJD_2','Zkykong','123');
        ZkyFileIni.WriteString('version','version','1.0');
        ZkyFileIni.WriteString('config','runstate','setup');
        ZkyFileIni.WriteString('config','twoclickstate','gotostart');
        ZkyFileIni.WriteString('config','switchcount','15');
        ZkyFileIni.WriteString('config','comport','COM7');
         ZkyFileIni.WriteString('config','switch_1_code','3546959');
         ZkyFileIni.WriteString('config','switch_2_code','7467311');
         ZkyFileIni.WriteString('config','switch_3_code','8885295');
         ZkyFileIni.WriteString('config','switch_4_code','1285967');
         ZkyFileIni.WriteString('config','switch_5_code','13076559');
         ZkyFileIni.WriteString('config','switch_6_code','13744719');
         ZkyFileIni.WriteString('config','switch_7_code','8645935');
         ZkyFileIni.WriteString('config','switch_8_code','11954479');
         ZkyFileIni.WriteString('config','switch_9_code','7472719');
         ZkyFileIni.WriteString('config','switch_10_code','4382799');
         ZkyFileIni.WriteString('config','switch_11_code','1349903');
         ZkyFileIni.WriteString('config','switch_12_code','15013647');
         ZkyFileIni.WriteString('config','switch_13_code','141871');
         ZkyFileIni.WriteString('config','switch_14_code','3180847');
         ZkyFileIni.WriteString('config','switch_15_code','9639535');
      end;
          ZkyFileIni:=TIniFile.Create(PChar(ZkyIniAdd))  ;
        Grunstate:=ZkyFileIni.ReadString('config','runstate','runstate');
        Gtwoclickstate:=ZkyFileIni.ReadString('config','twoclickstate','runstate');
        Gswitchcount:=  ZkyFileIni.ReadInteger('config','switchcount',15);
        Gcomport:=  ZkyFileIni.ReadString('config','comport','');
        Gswitch_1_code:= ZkyFileIni.ReadString('config','switch_1_code','');
        Gswitch_2_code:= ZkyFileIni.ReadString('config','switch_2_code','');
        Gswitch_3_code:= ZkyFileIni.ReadString('config','switch_3_code','');
        Gswitch_4_code:= ZkyFileIni.ReadString('config','switch_4_code','');
        Gswitch_5_code:= ZkyFileIni.ReadString('config','switch_5_code','');
        Gswitch_6_code:= ZkyFileIni.ReadString('config','switch_6_code','');
        Gswitch_7_code:= ZkyFileIni.ReadString('config','switch_7_code','');
        Gswitch_8_code:= ZkyFileIni.ReadString('config','switch_8_code','');
        Gswitch_9_code:= ZkyFileIni.ReadString('config','switch_9_code','');
        Gswitch_10_code:= ZkyFileIni.ReadString('config','switch_10_code','');
        Gswitch_11_code:= ZkyFileIni.ReadString('config','switch_11_code','');
        Gswitch_12_code:= ZkyFileIni.ReadString('config','switch_12_code','');
        Gswitch_13_code:= ZkyFileIni.ReadString('config','switch_13_code','');
        Gswitch_14_code:= ZkyFileIni.ReadString('config','switch_14_code','');
        Gswitch_15_code:= ZkyFileIni.ReadString('config','switch_15_code','');
      //  ShowMessage(Grunstate);
      ZkyFileIni.free();
//     ShowMessage(ExtractFilePath(Application.ExeName));

//初始化开关code
setlength(Gvideo_array,Gswitchcount,2);
Gvideo_array[0,0]:=Gswitch_1_code;
Gvideo_array[1,0]:=Gswitch_2_code;
Gvideo_array[2,0]:=Gswitch_3_code;
Gvideo_array[3,0]:=Gswitch_4_code;
Gvideo_array[4,0]:=Gswitch_5_code;
Gvideo_array[5,0]:=Gswitch_6_code;
Gvideo_array[6,0]:=Gswitch_7_code;
Gvideo_array[7,0]:=Gswitch_8_code;
Gvideo_array[8,0]:=Gswitch_9_code;
Gvideo_array[9,0]:=Gswitch_10_code;
Gvideo_array[10,0]:=Gswitch_11_code;
Gvideo_array[11,0]:=Gswitch_12_code;
Gvideo_array[12,0]:=Gswitch_13_code;
Gvideo_array[13,0]:=Gswitch_14_code;
Gvideo_array[14,0]:=Gswitch_15_code;
//建立文件夹
  for i:=Gswitchcount downto 1 do
  begin
     dir := ExtractFilePath(Application.ExeName)+IntToStr(i);

    if not DirectoryExists(dir) then
    CreateDir(dir)
  end;
//遍历文件夹
//js:=0;
Path := IncludeTrailingPathDelimiter(GetCurrentDir) ;
  for i:=Gswitchcount downto 1 do
  begin
  if FindFirst (Path +inttostr(i)+'\'+ '*.*', faAnyFile - faDirectory, Rec) = 0 then
  try
  //  js:=0;
  repeat
      //Gvideo_array[i-1,js]:=   Path +inttostr(i)+'\'+ Rec.Name;
        Gvideo_array[i-1,1]:= Path +inttostr(i)+'\'+ Rec.Name;
     //socket文件准备的
       // Gvideo_array[i-1,1]:= Rec.Name;
      // js:=js+1;
  until FindNext(Rec) <> 0;

  finally
  FindClose(Rec) ;
    // ShowMessage(Gvideo_array[i-1,1]) ;
  end;
  end;
  //填写开关对应视频路径文本框
  edt_1.Text:=GetCurrentDir+'\1\';
  edt_2.Text:=GetCurrentDir+'\2\';
  edt_3.Text:=GetCurrentDir+'\3\';
  edt_4.Text:=GetCurrentDir+'\4\';
  edt_5.Text:=GetCurrentDir+'\5\';
  edt_6.Text:=GetCurrentDir+'\6\';
  edt_7.Text:=GetCurrentDir+'\7\';
  edt_8.Text:=GetCurrentDir+'\8\';
  edt_9.Text:=GetCurrentDir+'\9\';
  edt_10.Text:=GetCurrentDir+'\10\';
  edt_11.Text:=GetCurrentDir+'\11\';
  edt_12.Text:=GetCurrentDir+'\12\';
  edt_13.Text:=GetCurrentDir+'\13\';
  edt_14.Text:=GetCurrentDir+'\14\';
  edt_15.Text:=GetCurrentDir+'\15\';



end;
procedure TForm1.GetComPorts();
var
  reg: TRegistry;
  ts: TStrings;
  i: integer;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.OpenKey('hardware\devicemap\serialcomm', False);
  ts := TStringList.Create;
  reg.GetValueNames(ts);
  // self.mmo1.Lines.AddStrings(ts);
  Self.cbb_com.Items.Clear;
  for i := 0 to ts.Count - 1 do
  begin
    cbb_com.Items.Add(reg.ReadString(ts.Strings[i]));
  end;
  ts.Free;
  reg.CloseKey;
  reg.Free;
end      ;

procedure TForm1.MyInterval();
var
  i:Integer;
  begin
    //ShowMessage('fff');
    for i:=10000 downto 0 do
    begin
       btn_start_listen.Caption:='启动('+inttostr(i)+')';
       Sleep(1000);
      // Application.ProcessMessages;
    end;
  //  Form1.listen();
   // Result:=0;
  end;
function MyFun(p: Pointer): Integer; stdcall;
var
  i: Integer;
begin
 // while True do
//  begin
     try
       if linkstate=0 then
       begin
        //  tvp.VideoWindow1.Align:=alClient;
            //        tvp.FilterGraph1.Active := true  ;
              if not tvp.FilterGraph1.Active then
              tvp.FilterGraph1.Active := true;

                 tvp.FilterGraph1.ClearGraph;
               tvp.FilterGraph1.RenderFile(fullname);
              tvp.FilterGraph1.Play;
//         Form1.Comm1.StopComm;
//            Form1.Comm1.CommName:=Gcomport;//COM(cbb_com.ItemIndex);
//             Form1.Comm1.BaudRate:=StrToInt(Gbaudrate);
//             Form1.Comm1.ByteSize:=_8;
//             Form1.Comm1.DsrSensitivity:=False;
//             Form1.Comm1.StopBits:=_1;
//            Form1.Comm1.StartComm;

      // linkstate:=1;
       end;

       except
      //   finally
           end;
           //每隔10分钟重新连接一次，防止中断
   Sleep(600000);

 // end;
  Result := 0;
end;


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

  Comm1.CommName:=cbb_com.Text   ;//COM(cbb_com.ItemIndex);
  Comm1.BaudRate:=BaudRate(cbb_btl.ItemIndex);
  Comm1.ByteSize:=ByteSize(cbb_sjw.ItemIndex);
  Comm1.DsrSensitivity:=chk1.Checked;
  Comm1.StopBits:=StopBits(cbb_tzw.ItemIndex);
  Comm1.StartComm;

end;

procedure TForm1.opencom();
begin
Comm1.StartComm;
end;

procedure TForm1.Comm1ReceiveData(Sender: TObject; Buffer: Pointer;
  BufferLength: Word);
  var
    x:PChar;
  recstr:string;
   arr:array of array of string;

  ID:THandle;
  //关机相关
         st : SYSTEMTIME;
        hToken : THANDLE;
        tkp : TOKEN_PRIVILEGES;
        rr : Dword;
begin
  Gclick_time:=DateTimeToTimeStamp(NOW).time;
    if(Gclick_time-Glast_click_time)<1000then
    begin
      //ShowMessage('你按的太快了');

    // Exit;
    end
    else
    begin
     // tvp.VideoWindow1.Visible:=True;
       x:=Buffer;
      recstr:=StringReplace(x,#$D#$A,'',[]);
       fullname:='';
         Glast_click_time:=Gclick_time;

     if(Grunstate='listen')then
     begin

       if(recstr=Gvideo_array[0,0])then
        begin

          fullname:=Gvideo_array[0,1];
        end
          else if(recstr=Gvideo_array[1,0])then
        begin
          fullname:=Gvideo_array[1,1];
        end
          else if(recstr=Gvideo_array[2,0])then
        begin
          fullname:=Gvideo_array[2,1];
        end
          else if(recstr=Gvideo_array[3,0])then
        begin
          fullname:=Gvideo_array[3,1];
         //  fullname:='';
         //  tvp.FilterGraph1.Stop;
          // tvp.FilterGraph1.ClearGraph;
          //tvp.VideoWindow1.Height:=0;
         // tvp.img1.Align:=alClient;
         // tvp.VideoWindow1.Visible:=False;
        end
          else if(recstr=Gvideo_array[4,0])then
        begin
          fullname:=Gvideo_array[4,1];

        end
          else if(recstr=Gvideo_array[5,0])then
        begin

          fullname:=Gvideo_array[5,1];


        end
          else if(recstr=Gvideo_array[6,0])then
        begin
          fullname:=Gvideo_array[6,1];
        end
          else if(recstr=Gvideo_array[7,0])then
        begin
          fullname:=Gvideo_array[7,1];
        end
          else if(recstr=Gvideo_array[8,0])then
        begin
          fullname:=Gvideo_array[8,1];
        end
          else if(recstr=Gvideo_array[9,0])then
        begin
          fullname:=Gvideo_array[9,1];
        end
          else if(recstr=Gvideo_array[10,0])then
        begin
          fullname:=Gvideo_array[10,1];
        end
          else if(recstr=Gvideo_array[11,0])then
        begin
          fullname:=Gvideo_array[11,1];
        end
          else if(recstr=Gvideo_array[12,0])then
        begin
          fullname:=Gvideo_array[12,1];
        end
          else if(recstr=Gvideo_array[13,0])then
        begin
          fullname:=Gvideo_array[13,1];
        end
         else  if(recstr=Gvideo_array[14,0])then
        begin
          fullname:=Gvideo_array[14,1];
        end
        else if(recstr='10211396')then
        begin
          //关机
          fullname:='';
        
                OpenProcessToken(GetCurrentProcess(),TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,hToken);
        LookupPrivilegeValue(nil,'SeShutdownPrivilege',tkp.Privileges[0].Luid);
        // 设定权限为1
        tkp.PrivilegeCount := 1;
        tkp.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
        // 得到权限
        AdjustTokenPrivileges(hToken, FALSE, tkp, 0,nil,rr);
        // 关闭计算机
           ExitWindowsEx(EWX_SHUTDOWN,0);
        //ExitWindows(0, 0)
        end
        else if(recstr='13875924')then
        begin
          //回到屏保
          fullname:='';
          EndProcess('vlc.exe');
        end;
            if fullname<>'' then
            begin
            //  WinExec()
            EndProcess('vlc.exe');
            //EndProcess('singleplay.exe');
            //EndProcess('PotPlayerMini.exe');
            //  ShellExecute(handle, 'open','singleplay',PChar(fullname),nil, SW_SHOWNORMAL);
              //ShellExecute(handle, 'open','D:\Program Files\PotPlayer\PotPlayerMini.exe',PChar(fullname),nil, SW_SHOWNORMAL);
              //CreateThread(nil, 0, @MyFun, nil, 0, ID);
              ShellExecute(handle, 'open','vlc.exe',PChar(fullname),nil, SW_SHOWNORMAL);

           //
              //tvp.VideoWindow1.Align:=alClient;
//
              //if not tvp.FilterGraph1.Active then tvp.FilterGraph1.Active := true;
               // tvp.FilterGraph1.ClearGraph;
               //tvp.FilterGraph1.RenderFile(fullname);
              //tvp.FilterGraph1.Play;
             // Comm1.StartComm;
               //  socket.WriteLn(fullname);

//               if not socket.Connected then
//                  begin
//                        try
//                           // socket.Connect(5000);
//                          //  RequestStr:='tttttttttttt';
//                         // socket.WriteLn('123');
//                      //Sleep(500);
//                      //      socket.WriteLn(fullname);
//                          //  BackStr:=socket.ReadLn('',5000);
//                        //   Socket.Disconnect;
//                        except
//                            //ShowMessage('连接失败,请检查连接设置!');
//                       // finally
//
//
//                        end;
//                  end
//                  else
//                  begin
//                    //socket.WriteLn('123');
//                  end;
            end;

      end
             //  tvp.play(fullname);




     else if (Grunstate='setup')then
     begin
       mmo1.Lines.Add('Received:'+x+' time:'+inttostr(DateTimeToTimeStamp(NOW).time));
       //switchfind
       btn_1.Caption:='';btn_2.Caption:='';btn_3.Caption:='';btn_4.Caption:='';
       btn_5.Caption:='';btn_6.Caption:='';btn_7.Caption:='';btn_8.Caption:='';
       btn_9.Caption:='';btn_10.Caption:='';btn_11.Caption:='';btn_12.Caption:='';
       btn_13.Caption:='';btn_14.Caption:=''; btn_15.Caption:='';
         if(recstr=Gvideo_array[0,0])then
        begin
          btn_1.Caption:='@'
        end;
          if(recstr=Gvideo_array[1,0])then
        begin
          btn_2.Caption:='@'
        end;
          if(recstr=Gvideo_array[2,0])then
        begin
          btn_3.Caption:='@'
        end;
          if(recstr=Gvideo_array[3,0])then
        begin
          btn_4.Caption:='@'
        end;
          if(recstr=Gvideo_array[4,0])then
        begin
          btn_5.Caption:='@'
        end;
          if(recstr=Gvideo_array[5,0])then
        begin
          btn_6.Caption:='@'
        end;
          if(recstr=Gvideo_array[6,0])then
        begin
          btn_7.Caption:='@'
        end;
          if(recstr=Gvideo_array[7,0])then
        begin
          btn_8.Caption:='@'
        end;
          if(recstr=Gvideo_array[8,0])then
        begin
          btn_9.Caption:='@'
        end;
          if(recstr=Gvideo_array[9,0])then
        begin
          btn_10.Caption:='@'
        end;
          if(recstr=Gvideo_array[10,0])then
        begin
          btn_11.Caption:='@'
        end;
          if(recstr=Gvideo_array[11,0])then
        begin
          btn_12.Caption:='@'
        end;
          if(recstr=Gvideo_array[12,0])then
        begin
          btn_13.Caption:='@'
        end;
          if(recstr=Gvideo_array[13,0])then
        begin
          btn_14.Caption:='@'
        end;
          if(recstr=Gvideo_array[14,0])then
        begin
          btn_15.Caption:='@'
        end;
     end;
    end;








end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Comm1.StopComm;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  x:Tstopbits;
   ID: THandle;
   ID2:THandle;
   //关机相关
      st : SYSTEMTIME;
        hToken : THANDLE;
        tkp : TOKEN_PRIVILEGES;
        rr : Dword;
begin

linkstate:=0;
  mmo1.Text:='';
  cbb_com.ItemIndex:=6;
  cbb_btl.ItemIndex:=4;
  cbb_sjw.ItemIndex:=3;
  cbb_tzw.ItemIndex:=0;
//  CheckBox1.Checked:=False;
GetComPorts();
init();
//link com
 Form1.Comm1.StopComm;
            Form1.Comm1.CommName:=Gcomport;//COM(cbb_com.ItemIndex);
             Form1.Comm1.BaudRate:=StrToInt(Gbaudrate);
             Form1.Comm1.ByteSize:=_8;
             Form1.Comm1.DsrSensitivity:=False;
             Form1.Comm1.StopBits:=_1;
            Form1.Comm1.StartComm;



end;

procedure TForm1.btn34Click(Sender: TObject);
    //  var
    //    tvp:TfrmVideoPlay;
begin
       try
                tvp:=TFrmVideoPlay.Create(nil);
                tvp.Show;
                  with tvp do
                begin
                Top := 0 ;
                Left := 0 ;
                BorderStyle := bsNone ;
                WindowState := wsmaximized;
                ClientWidth := Screen.Width ;
                ClientHeight := Screen.Height;
                Refresh;
                SetForegroundWindow(Handle) ;
                SetActiveWindow(Application.Handle) ;

                  end;

         finally
         end;

end;

procedure TForm1.btn35Click(Sender: TObject);
var

  ID: THandle;
begin
CreateThread(nil, 0, @MyFun, nil, 0, ID);
//tvp.play('1.avi');
//tvp.btn1Click(nil);
//with form1 do
//begin
//  BorderStyle := bsSizeable ;
//WindowState := wsNormal;
//ClientWidth := 640;
//ClientHeight := 480;
//Refresh;
//SetActiveWindow(Application.Handle) ;
//
//
//  end;
//   skndt1.Active:=True;
//   Form1.Refresh;
//   skndt1.UpdateSkincontrol(form1);

end;

procedure TForm1.skndt1FormSkin(Sender: TObject; aName: String;
  var DoSkin: Boolean);
begin
if aName='配置' then doskin:=false;
end;

procedure TForm1.Comm1ModemStateChange(Sender: TObject;
  ModemEvent: Cardinal);
begin
//ShowMessage('a');
end;

procedure TForm1.btntestClick(Sender: TObject);
begin
  Form1.btn_start_listen.Caption:='启动('+')';
//init();
end;

procedure TForm1.btn_start_listenClick(Sender: TObject);
begin
listen();
end;

procedure TForm1.FormShow(Sender: TObject);
begin
//MyInterval();
//mp1.Notify:=true;

end;

procedure TForm1.btn2Click(Sender: TObject);
begin
opendir('1');
end;

procedure TForm1.opendir(dirname:string);
begin
  ShellExecute(Handle, 'open', 'Explorer.exe', PChar(GetCurrentDir+'\'+dirname), nil, SW_NORMAL);
end;
procedure TForm1.btn1Click(Sender: TObject);
begin
opendir('2');
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
opendir('3');
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
opendir('4');
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
opendir('5');
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
opendir('6');
end;

procedure TForm1.btn7Click(Sender: TObject);
begin
opendir('7');
end;

procedure TForm1.btn8Click(Sender: TObject);
begin
opendir('8');
end;

procedure TForm1.btn9Click(Sender: TObject);
begin
opendir('9');
end;

procedure TForm1.btn10Click(Sender: TObject);
begin
opendir('10');
end;

procedure TForm1.btn11Click(Sender: TObject);
begin
opendir('11');
end;

procedure TForm1.btn13Click(Sender: TObject);
begin
opendir('13');
end;

procedure TForm1.btn12Click(Sender: TObject);
begin
opendir('12');
end;

procedure TForm1.btn14Click(Sender: TObject);
begin
opendir('14');
end;

procedure TForm1.btn15Click(Sender: TObject);
begin
opendir('15');
end;

procedure TForm1.mp1Notify(Sender: TObject);
begin
  ShowMessage('fff');
 if (mp1.Mode=mpstopped )  then

    begin

    mp1.Rewind;

    mp1.Play;

    end;
end;
    
///Delphi结束指定进程函数
function TForm1.EndProcess(ExeFileName:string):integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOLean;
  FSnapshotHandle: THandle;
  FProcessEntry32:TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

while Integer(ContinueLoop) <> 0 do
begin
  if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
  UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
  UpperCase(ExeFileName))) then
  Result := Integer(
  TerminateProcess(OpenProcess(PROCESS_TERMINATE,
  BOOL(0),FProcessEntry32.th32ProcessID),0));
  ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
end;
  CloseHandle(FSnapshotHandle);
end;


procedure TForm1.Comm1ReceiveError(Sender: TObject; EventMask: Cardinal);
begin
ShowMessage('comerror');
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
listen();
end;

end.
//8885295
//13744719
//5575503
//1285967
//4382799
//1349903
//13076559
//11954479
//4330543
//7472719
//3546959
//13037167
//7467311
//15013647
//3180847
//7528527
//4472591
//8645935

