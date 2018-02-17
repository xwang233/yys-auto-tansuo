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
MacroID=e6ecfe7c-a3e5-41d4-8e18-89050a3267e1
Description=yys自动探索
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

[Attachment]
UEsDBBQAAgAIAPAZTkyHrxnXvwAAAA4BAAALABEAeXlzX2J4Mi5ibXBVVA0AB7ypg1prUYJaa1GCWnPy5WNkAAMzINYAYnYg5gRiRgYJsPgNBkwgqbMZhPQ2SupvhJASRpsQ4kCkuwmE9DeKGyKJa20U19ggpr4egoDiIqrrRFXXS2ptkjTcoma5V9N6v6HLUaC4ufdpK7+zTuFX3aJv+yc9DEx9Epb2Cijum/EUiPwzn/tkvfLKeuWc98Y59yVQ3DjjgVH6fZ3E2+qxt1Sib0kH35IOArlbzOOUuOdp6YCzUoEXpAIvSQVclPY/CxSX9j+NjvxOAsUBUEsBAhcLFAACAAgA8BlOTIevGde/AAAADgEAAAsACQAAAAAAAAAgAICBAAAAAHl5c19ieDIuYm1wVVQFAAe8qYNaUEsFBgAAAAABAAEAQgAAAPkAAAAAAA==


[Script]
Function WTFC(colx, coly, coll, x1, x2, y1, y2, zzz)
    j=0
    While j = 0
    	Call REJXS()
        IfColor colx,coly,coll,zzz Then
            j=1
        End If
        Delay 100+Rnd*100
    Wend
    x = Int((x2 - x1) * Rnd + (x1+stx-50))
    y = Int((y2-y1) * Rnd + (y1+ sty-50))
    Call Plugin.Bkgnd.LeftClick(Hwnd,x-stx-xs,y-sty-ys)
End Function
Function CRND(x1, x2, y1, y2)
    x = Int((x2 - x1) * Rnd + (x1+stx-50))
    y = Int((y2 - y1) * Rnd + y1 + sty-50)
    Call Plugin.Bkgnd.LeftClick(Hwnd,x-stx-xs,y-sty-ys)
End Function
Function REJXS()
	IfColor 814,538,"5C6EDD",0 Then
		Call CRND(814 - 3, 814 + 3, 538 - 3, 538 + 3)
		TracePrint "成功拒绝一次悬赏！"
		Delay 1000
	End If 
End Function

stx = 50
sty = 50

xs = 8
ys = 30


Hwnd = Plugin.Window.MousePoint()

Randomize



Rem tsstt

Call Plugin.Window.Move(Hwnd, stx, sty)

Call REJXS()
//FindPic stx, sty, stx + 1130, sty + 640, "Attachment:\yys_bx.bmp", 0.9, xbx1, ybx1
FindPic stx, sty, stx + 1130, sty + 640, "Attachment:\yys_bx2.bmp", 0.9, xbx2, ybx2
//FindColor stx, sty, stx + 1136, sty + 640, "05044D", xbx3, ybx3
/*
If xbx1 > 0 and ybx1 > 0 Then 
	TracePrint "找到宝箱@1"
	Call CRND(xbx1 - 2, xbx1 + 2, ybx1 - 2, ybx1 + 2)
	Delay 5000
	For 3
		Call REJXS()
		Call CRND(727, 898, 226, 410)
		Delay 333
	Next	
End If
*/
If xbx2 > 0 and ybx2 > 0 Then 
	TracePrint "找到宝箱@2"
	Call CRND(xbx2 - 2, xbx2 + 2, ybx2 - 2, ybx2 + 2)
	Delay 5000
	For 3
		Call REJXS()
		Call CRND(727, 898, 226, 410)
		Delay 333
	Next	
End If
/*
If xbx3 > 0 and ybx3 > 0 Then 
	TracePrint "找到宝箱@3"
	Call CRND(xbx3 - 2, xbx3 + 2, ybx3 - 2, ybx3 + 2)
	Delay 5000
	For 3
		Call REJXS()
		Call CRND(727, 898, 226, 410)
		Delay 333
	Next	
End If
*/



Call WTFC(635, 682, "D3DEEA", 1004, 1140, 592, 651, 0)	// 点击24章

Call WTFC(926, 574, "5EB2F3", 854, 928, 553, 581, 0) // 点击探索

rwsteps = 0

jinss = 0
While jinss = 0
	Call REJXS()
	IfColor 1053, 593, "2965FE", 0 Then
     // 已进入探索章节
      jinss = 1
End If
Delay 100
Wend

Rem tansuo1

//点怪
Call REJXS()

bosf = 0
//FindColor stx, sty, stx + 1136, sty + 640, "1A256E", x1, y1
FindColor stx, sty, stx + 1136, sty + 640, "A47E43", x3, y3
FindColor stx, sty, stx + 1136, sty + 640, "2A2AC5", x4, y4
/*
If x1 > 0 And y1 > 0 And bosf = 0 Then 
 TracePrint "found boss @1"
 Call CRND(x1 - 2, x1 + 2, y1 - 2, y1 + 2)
 bosf = 1
 Goto stbattle
End If
*/
If x3 > 0 And y3 > 0 And bosf = 0 Then 
 TracePrint "found boss @3"
 Call CRND(x3 - 2, x3 + 2, y3 - 2, y3 + 2)
 bosf = 3
 Goto stbattle
End If
If x4 > 0 And y4 > 0 And bosf = 0 Then 
 TracePrint "found boss @4"
 Call CRND(x4 - 2, x4 + 2, y4 - 2, y4 + 2)
 bosf = 4
 Goto stbattle
End If

Call REJXS()
FindColor stx, sty, stx + 1136, sty + 640, "8983DF", x1, y1
FindColor stx, sty, stx + 1136, sty + 640, "C3B8F5", x2, y2
FindColor stx, sty, stx + 1136, sty + 640, "8A85D2", x3, y3
FindColor stx, sty, stx + 1136, sty + 640, "ABA2ED", x4, y4
bsp = 0

If x1 > 0 And y1 > 0 And bsp = 0 Then 
 TracePrint "found @1"
 bsp = 1
 call CRND(x1-2,x1+2,y1-2,y1+2)
End If
If x2 > 0 And y2 > 0 And bsp = 0 Then 
 TracePrint "found @2"
 bsp = 2
 call CRND(x2-2,x2+2,y2-2,y2+2)
End If
If x3 > 0 And y3 > 0 And bsp = 0 Then 
 TracePrint "found @3"
 bsp = 3
 call CRND(x3-2,x3+2,y3-2,y3+2)
End If
If x4 > 0 And y4 > 0 And bsp = 0 Then 
 TracePrint "found @4"
 bsp = 4
 call CRND(x4-2,x4+2,y4-2,y4+2)
End If

Call REJXS()
IfColor 1094,694,"385F8A",0 Then
	//极其巧合的结算瞎点导致直接进入新战斗！
	Goto stbattle
End If
 
Call REJXS()
If bsp = 0 Then 
	TracePrint "Not Found!"
	If Rnd > 0.5 Then 
		TracePrint "Randomly moving Right!"
		Call CRND(740, 1140, 452, 545)
	Else 
	 	TracePrint "Randomly moving Left!"
	 	Call CRND(156, 529, 443, 548)
	End If
	Delay 1000
	If rwsteps<=20 Then
	 rwsteps = rwsteps + 1
	 Goto tansuo1
	Else 
	 // 超过20次随机行走仍未找到目标，退出重开
	 TracePrint "超过20次随机行走仍未找到目标，重开"
	 Goto bbbes
	End If
End If


Rem stbattle
Delay 1000

Call REJXS()
IfColor 1053, 593, "2965FE", 0 Then
     // 进入战斗失败 
     Goto tansuo1
End If

While qjjs = 0
	Call REJXS()
	IfColor 1094,694,"385F8A",0 Then
		qjjs = 1
		// 已进入战斗
	End If
 	Delay 100
Wend

Delay 1000

Call REJXS()
FindColor 201, 214, 369, 501, "03E7FA", x1, y1
FindColor 594, 389, 821, 623, "03EBFF", x2, y2


If ((x1 > 0 And y1 > 0) Or (x2 > 0 and y2 > 0)) Then 
	//存在满级狗粮！ 
	Beep 
	TracePrint x1
	TracePrint y1
	TracePrint x2
	TracePrint y2
	MessageBox "存在满级狗粮！更换后点击确定！"
	Delay 1000
End If

Call WTFC(1094, 694, "385F8A", 1049, 1122, 545, 617, 0)
TracePrint "已经点击准备"

//判断战斗是否已经开始
zcc = 0
While zcc = 0
	Call REJXS()
    IfColor 102,667,"E0F3F8",0 Then
        zcc = 1
    End If
    //找到了 “自动”
    Delay 333 + Rnd* 100
Wend
TracePrint "战斗开始"
Delay 1000

//判断战斗是否已经结束
zce = 0
While zce = 0
	Call REJXS()
    IfColor 102,667,"E0F3F8",1 Then
        zce = 1
    End If
    //没有了 “自动”
    Delay 333 + Rnd* 100
Wend
TracePrint "战斗结束"
Delay 1000

//战斗已经结束，使劲点击结算,返回探索界面
jss = 0
While jss = 0
    Call CRND(856, 944, 187, 604)
    IfColor 1053, 593, "2965FE", 0 Then
        jss = 1	
    End If
    Delay 333 + Rnd* 100
Wend
TracePrint "结束一轮，已返回主界面"
Delay 500
rwsteps = 0

If bosf = 0 Then
Goto tansuo1
End If

Delay 5000

//点小纸人宝藏
qds = 0
While qds = 0
Call REJXS()
FindColor stx, sty, stx + 1136, sty + 640, "D4F4FF", x, y
If x > 0 and y > 0 Then 
 TracePrint "找到小纸人"
 Call CRND(x - 2, x + 2, y - 2, y + 2)
 Delay 500
 Call CRND(953, 1127, 230, 532)
 Delay 500
Else 
 qds = 1
End If
  Delay 100
Wend

TracePrint "没找到小纸人或找完了"

Delay 5000
Goto tsstt

Rem bbbes
Call WTFC(98, 142, "FBF5F0", 86, 111, 136, 163, 0)
Delay 1000
Call WTFC(704, 450, "5EB2F3", 680, 793, 439, 455, 0)
Delay 5000
Goto tsstt