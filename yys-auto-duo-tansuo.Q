[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=511fbfea-5189-466a-8bc5-f5afd957aa00
Description=yys˫��̽��
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]


[Script]
// ��Ҫ�����������޸�
xs = 8
ys = 30


Function colconv(a)
	colconv = LCase(Mid(a, 5, 2) & Mid(a, 3, 2) & Mid(a, 1, 2))
End Function

Function WTFC1(colx, coly, coll, x1, x2, y1, y2, zzz, tsx, stx, sty, adv)
	If tsx = 1 Then 
		set ts = ts1
	End If
	If tsx = 2 Then 
		set ts = ts2
	End If	
	coll = colconv(coll)
    j = 0
    flgj = 0
    While j = 0
    	//Call REJXS()
    	//coltest = GetPixelColor(colx, coly)
    	coltest = ts.GetColor(colx - stx, coly - sty)
    	If (coltest = coll and zzz = 0) or (coltest <> coll and zzz = 1) Then 
    		flgj = 1
    	End If    	
        If flgj = 1 Then
  			Call CRND(x1, x2, y1, y2, tsx, stx, sty)
  			Delay 333 + Rnd * 333
  			If adv = 0 Then 
  				j = 1
  			End If
  			 /*
  			IfColor colx, coly, coll, 1 - zzz Then
  				j = 1
  			End If
  			*/
  			coltb = ts.GetColor(colx - stx, coly - sty)
  			If (zzz = 0 and coltb <> coll) or (zzz = 1 and coltb = coll) Then 
  				j = 1
  			End If  			
        End If
    Wend
End Function

Function CRND(x1, x2, y1, y2, tsx, stx, sty)
	If tsx = 1 Then 
		set ts = ts1
	End If
	If tsx = 2 Then 
		set ts = ts2
	End If	
    x = Int((x2 - x1) * Rnd + x1)
    y = Int((y2 - y1) * Rnd + y1)
    //Call Plugin.Bkgnd.LeftClick(hwnd,x-stx-xs,y-sty-ys)
    Call ts.moveto(x - stx, y - sty)
  	Delay 10 + Rnd * 10
  	Call ts.leftclick()
 	Delay 10 + Rnd * 10
End Function

/*
Function REJXS()
	IfColor 814,538,"5C6EDD",0 Then
		Call CRND(814 - 3, 814 + 3, 538 - 3, 538 + 3)
		TracePrint "�ɹ��ܾ�һ�����ͣ�"
		Delay 1000
	End If 
End Function
*/

PutAttachment ".\pluginx", "*.*"
Call Plugin.Regdll.Reg(".\pluginx\TSPlug.dll")

need_ver = "4.019"

Set ts1 = createobject("ts.tssoft")
ver1 = ts1.Ver()
If ver1 <> need_ver Then 
	TracePrint "ts1 register failed"
	EndScript
End If

Set ts2 = createobject("ts.tssoft")
ver2 = ts2.Ver()
If ver2 <> need_ver Then 
	TracePrint "ts2 register failed"
	EndScript
End If

autoclick = 1
findexptest = 1


stx1 = -1355
sty1 = 343

stx2 = -1146 
sty2 = 433


// ���ڲ���ԭ�� �ڿ�ʼ�ű�ʱ ����YYS���ڲ��ܴ��ڵ�ǰ�����

// �ô���Ϊ��ţ����У�����
//hwnd1 = Clng(Split(Plugin.Window.SearchEx(0, "����ʦ-������Ϸ", 1), "|")(0))
hwnd1 = ts1.FindWindow("","����ʦ-������Ϸ")
TracePrint hwnd1
ts1_ret = ts1.BindWindow(hwnd1, "dx2", "windows", "windows", 0)
If ts1_ret <> 1 Then 
	TracePrint "window 1 binding failed"
	EndScript
End If
//Call Plugin.Window.Move(hwnd1, stx1 - xs, sty1 - ys)
//Call ts1.MoveWindow(hwnd1, stx1-xs, sty1-ys)

Delay 100

// �ô���ΪС�ţ�˾��������
//hwnd2 = Clng(Split(Plugin.Window.SearchEx(0, "[#] ����ʦ-������Ϸ [#]", 1), "|")(0))
hwnd2 = ts2.FindWindow("", "[#] ����ʦ-������Ϸ [#]")
TracePrint hwnd2
If hwnd2 = hwnd1 Then 
	TracePrint "hwnd 2 = hwnd 1, rebinding!"
	EndScript
End If
ts2_ret = ts2.BindWindow(hwnd2, "dx2", "windows", "windows", 0)
If ts2_ret <> 1 Then 
	TracePrint "window 2 binding failed"
	EndScript	
End If
TracePrint "the 2 windows binding are succeed"
//Call Plugin.Window.Move(hwnd2, stx2 - xs, sty2 - ys)
//Call ts2.MoveWindow(hwnd2, stx2-xs, sty2-ys)
Call Plugin.Window.Active(hwnd2)
Delay 2000

//TracePrint colconv(ts2.GetColor(971, 513))

Randomize

Rem tssbt
rwexit = 0

// ���С���½�̽���еġ���ӡ�
Call WTFC1(- 610 , 909, "5EB2F3", - 612 , - 540 , 911, 929, 0, 2, stx2, sty2, 1)
TracePrint "С�ŵ�����"
Delay 1000
Goto tst2


Rem tsstt
TracePrint "������TSSTT"
//�Ƿ�������Ѽ�������ս��
Delay 1000 
If rwexit= 0 Then
	Call WTFC1(- 532 , 818, "5EB2F3", - 532 , - 427 , 818, 836, 0, 2, stx2, sty2, 1)
	TracePrint "��� - ������Ѽ���ս��"
	Delay 1000
Else 
	Goto tssbt
End If

Rem tst2

// ��Ž�������, ����̹�
Call WTFC1(- 1234 , 574, "59AB4F", - 1234  - 2, - 1234  + 2, 574 - 2, 574 + 2, 0, 1, stx1, sty1, 1)
TracePrint "��ŵ���̹���������"
Delay 1000

// ��ʱ��С�ž��ѽ���̽���½�
Delay 3000
rwtimes = 0

// ̽������
tsx = 0
While tsx = 0	

	If colconv(ts1.GetColor(-1319-stx1, 405-sty1)) = "fbf5f0" and colconv(ts1.GetColor(- 1300  - stx1, 749 - sty1)) <> "ebf8f6" Then 
		TracePrint "������˳�̽���½� ��̽������ 1"
		rwexit = 0
		Goto tuichutansuo
	End If	
	If colconv(ts2.GetColor(-1319-stx1, 405-sty1)) = "fbf5f0" and colconv(ts2.GetColor(- 1300  - stx1, 749 - sty1)) <> "ebf8f6" Then 
		TracePrint "С�����˳�̽���½� ��̽������ 2"
		rwexit = 0
		Goto tuichutansuo
	End If		
	If colconv(ts1.GetColor(- 746  - stx1, 362 - sty1)) = "4cb3fe" Then
		TracePrint "������˳�̽���½� ��̽������ 3"
		rwexit = 0
		Goto tuichutansuo
	End If
	If colconv(ts2.GetColor(- 746  - stx1, 362 - sty1)) = "4cb3fe" Then
		TracePrint "С�����˳�̽���½� ��̽������ 4"
		rwexit = 0
		Goto tuichutansuo
	End If

	// �Զ����
	If autoclick = 1 Then
		If colconv(ts2.GetColor(36, 62)) <> "fbf5f0" or colconv(ts1.GetColor(36, 62)) <> "fbf5f0" Then
			rwtimes = 0
			Goto myinthebattle
		End If
		clickstatus = 0
		While clickstatus = 0
			If findexptest = 1 Then
				ts2_ret = ts2.FindColor(0, 0, 1136, 640, "296477", 1.0, 0, x3pre, y3pre)
				If x3pre>0 and y3pre > 0 Then
					Goto x3prejmp1
				End IF
				ts2_ret = ts2.FindColor(0, 0, 1136, 640, "612b0f", 1.0, 0, x3pre, y3pre)
				If x3pre>0 and y3pre > 0 Then
					Goto x3prejmp1
				End IF
				ts2_ret = ts2.FindColor(0, 0, 1136, 640, "2d7d8c", 1.0, 0, x3pre, y3pre)
				If x3pre>0 and y3pre > 0 Then
					Goto x3prejmp1
				End IF
				ts2_ret = ts2.FindColor(0, 0, 1136, 640, "2e1307", 1.0, 0, x3pre, y3pre)
				If x3pre>0 and y3pre > 0 Then
					Goto x3prejmp1
				End IF
			End If

			x3pre = 0
			y3pre = 0
Rem x3prejmp1 
			If x3pre <> 0 or y3pre <> 0 Then
				x3xl = x3pre - 150
				x3xr = x3pre + 150
				x3yl = y3pre - 200 
				x3yr = y3pre - 50
			Else 
				x3xl = 0
				x3xr = 1136
				x3yl = 0
				x3yr = 640
			End If
			
			ts2_ret = ts2.FindColor(x3xl, x3yl, x3xr, x3yr, "437ea4", 1.0, 0, x3, y3)
			If (x3 > 0 and y3 > 0) Then 
				Call CRND(x3-5, x3+5, y3-5, y3+5, 2, 0, 0)
				Goto x3prejmp2
			End If
			ts2_ret = ts2.FindColor(x3xl, x3yl, x3xr, x3yr, "c52a2a", 1.0, 0, x3, y3)
			If (x3 > 0 and y3 > 0) Then 
				Call CRND(x3-5, x3+5, y3-5, y3+5, 2, 0, 0)
				Goto x3prejmp2
			End If
			
			ts2_ret = ts2.FindColor(x3xl, x3yl, x3xr, x3yr, "df8389", 1.0, 0, x3, y3)
			If (x3 > 0 and y3 > 0) Then 
				Call CRND(x3-5, x3+5, y3-5, y3+5, 2, 0, 0)
				Goto x3prejmp2
			End If
			ts2_ret = ts2.FindColor(x3xl, x3yl, x3xr, x3yr, "f5b8c3", 1.0, 0, x3, y3)
			If (x3 > 0 and y3 > 0) Then 
				Call CRND(x3-5, x3+5, y3-5, y3+5, 2, 0, 0)
				Goto x3prejmp2
			End If
			ts2_ret = ts2.FindColor(x3xl, x3yl, x3xr, x3yr, "d2858a", 1.0, 0, x3, y3)
			If (x3 > 0 and y3 > 0) Then 
				Call CRND(x3-5, x3+5, y3-5, y3+5, 2, 0, 0)
				Goto x3prejmp2
			End If
			ts2_ret = ts2.FindColor(x3xl, x3yl, x3xr, x3yr, "eda2ab", 1.0, 0, x3, y3)
			If (x3 > 0 and y3 > 0) Then 
				Call CRND(x3-5, x3+5, y3-5, y3+5, 2, 0, 0)
				Goto x3prejmp2
			End If
			
			// û�ҵ����� ����һ���������
			If (x3 < 0 or y3 < 0) Then
				// ����20�� RW ��δ�ҵ�����˳�
				If rwtimes > 20 Then
					TracePrint "RW Exit"
					rwexit = 1
					Goto tuichutansuo
				End If
				If Rnd > 0.6 Then
					Call CRND(142, 240, 368, 458, 2, 0, 0)
					Delay 1000 + 1000*Rnd
				Else 
					Call CRND(968, 1059, 368, 458, 2, 0, 0)
					Delay 1000 + 1000*Rnd
				End If
				rwtimes = rwtimes + 1
			End If

			Delay 333 + 333 * Rnd
			
Rem x3prejmp2 
			If colconv(ts2.GetColor(36, 62)) <> "fbf5f0" or colconv(ts1.GetColor(36, 62)) <> "fbf5f0" Then
				TracePrint "clicked @" & x3 & ", " & y3
				clickstatus = 1
				Delay 500 + Rnd * 333
				Goto myinthebattle
			End If
			
			Delay 333 + 333 * Rnd
		Wend 
	End If
	Goto myinthebattle
	
	// �ֶ����
	If colconv(ts1.GetColor(- 1300  - stx1, 749 - sty1)) <> "ebf8f6" Then 
		// С���˳�̽���½�
		If colconv(ts1.GetColor(-1319-stx1, 405-sty1)) = "fbf5f0" Then 
			TracePrint "С�����˳�̽���½�"
			Goto tuichutansuo
		End If		
		
		// �ֶ���ֲ�����ս��
		
Rem myinthebattle
		If colconv(ts1.GetColor(- 1285  - stx1, 927 - sty1)) = "daecf1" Then
			TracePrint "��ս����"
			zdj = 0
			While zdj = 0
				If colconv(ts1.GetColor(- 1285  - stx1, 927 - sty1)) <> "daecf1" Then
					TracePrint "ս������"
					zdj = 1	
				End If
			 	Delay 333
			Wend
			jiesuana = 0
			jiesuanb = 0
			While jiesuana = 0 or jiesuanb = 0
				If jiesuana = 0 Then
					//Call CRND(- 412 , - 295 , 610, 874, 1, stx1, sty1)
					// "random walk"-like JIE-SUAN
					If Rnd > 0.5 Then
						Call CRND(142, 240, 368, 458, 1, 0, 0)
					Else 
						Call CRND(968, 1059, 368, 458, 1, 0, 0)
					End If
				End If
				If jiesuanb = 0 Then
					//Call CRND(- 209 , - 76 , 792, 1000, 2, stx2, sty2)
					// "random walk"-like JIE-SUAN
					If Rnd > 0.6 Then
						Call CRND(142, 240, 368, 458, 2, 0, 0)
					Else 
						Call CRND(968, 1059, 368, 458, 2, 0, 0)
					End If
				End If
				//IfColor - 1319 , 405, "FBF5F0", 0 Then
				If colconv(ts1.GetColor(-1319-stx1, 405-sty1)) = "fbf5f0" Then
					TracePrint "����ѻص�̽���½�"
					jiesuana = 1
				End If
				//IfColor - 1111 , 490, "FBF5F0", 0 Then
				If colconv(ts2.GetColor(-1111-stx2, 490-sty2)) = "fbf5f0" Then
					TracePrint "С���ѻص�̽���½�"
					jiesuanb = 1
				End If
				Delay 1333 + Rnd * 333
			Wend			
		End If		
		
	End If
	Delay 333
Wend

Rem tuichutansuo
Delay 5000

dahaotuichu = 0
While dahaotuichu = 0
	If colconv(ts1.GetColor(- 746  - stx1, 362 - sty1)) = "4cb3fe" Then
		dahaotuichu = 1
		TracePrint "������˳�̽��"
	End If

	If dahaotuichu = 0 Then
		// ��ſ�ʼ�˳�̽���½�
		Call WTFC1(- 1321 , 401, "FBF5F0", - 1326 , - 1309 , 398, 420, 0, 1, stx1, sty1, 1)
		Delay 1000
		Call WTFC1(- 1321 , 401, "676563", - 715 , - 627 , 703, 716, 0, 1, stx1, sty1, 1)
		Delay 3000
	End If
	
	Delay 333 + 333 * Rnd
Wend

xiaohaotuichu = 0
While xiaohaotuichu = 0 
	If colconv(ts2.GetColor(- 746  - stx1, 362 - sty1)) = "4cb3fe" Then
		xiaohaotuichu = 1
		TracePrint "С�����˳�̽��"
	End If
	If colconv(ts2.GetColor(- 532  - stx2, 818 - sty2)) = "5eb2f3" Then
		xiaohaotuichu = 1
		TracePrint "С�����˳�̽��"
	End If
	
	If xiaohaotuichu = 0 Then
	// ���С�Ż���̽���У�Ҳ�˳�̽��
	//If colconv(ts2.GetColor(971, 513)) = "1b2682" Then
		Call WTFC1(- 1321 , 401, "FBF5F0", - 1326 , - 1309 , 398, 420, 0, 2, stx1, sty1, 1)
		Delay 1000
		Call WTFC1(- 1321 , 401, "676563", - 715 , - 627 , 703, 716, 0, 2, stx1, sty1, 1)
		Delay 3000
	End If
	
	Delay 333 + 333 * Rnd
Wend

Goto tsstt



Sub OnScriptExit()
	ts1_ret = ts1.UnBindWindow()
	ts2_ret = ts2.UnBindWindow()
End Sub
