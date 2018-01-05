$PBExportHeader$w_testcase_base.srw
forward
global type w_testcase_base from w_base
end type
type cb_4 from commandbutton within w_testcase_base
end type
type cb_3 from commandbutton within w_testcase_base
end type
type cb_2 from commandbutton within w_testcase_base
end type
type cb_1 from commandbutton within w_testcase_base
end type
type mle_output from multilineedit within w_testcase_base
end type
type mle_2 from multilineedit within w_testcase_base
end type
type mle_1 from multilineedit within w_testcase_base
end type
type dw_1 from datawindow within w_testcase_base
end type
type gb_1 from groupbox within w_testcase_base
end type
type gb_2 from groupbox within w_testcase_base
end type
type gb_3 from groupbox within w_testcase_base
end type
type gb_4 from groupbox within w_testcase_base
end type
type gb_5 from groupbox within w_testcase_base
end type
end forward

global type w_testcase_base from w_base
integer height = 2460
string title = "Testcase Frame"
windowstate windowstate = maximized!
event ue_preopen ( )
event ue_scriptexe ( )
event ue_runall ( )
event ue_postopen ( )
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
mle_output mle_output
mle_2 mle_2
mle_1 mle_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
end type
global w_testcase_base w_testcase_base

type variables
Boolean  ib_auto
integer  ii_windowid,ii_testcaseid
end variables

forward prototypes
public subroutine wf_setflag ()
public subroutine wf_init_testcase ()
public subroutine wf_saveresult (integer ai_testcaseid)
public subroutine wf_scriptview (string as_script)
public subroutine wf_output (string as_msg, boolean ab_clear)
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
public function integer wf_description (integer ai_row)
end prototypes

event ue_preopen();//初始化处理，读取配置文件是否自动化执行
string ls_auto,ls_windowname
ls_auto = profilestring("qaappeon.ini","qaauto","autoexe","")
//读取testcase窗体对应的测试点
ls_windowname = this.classname( )
select id into :ii_windowid from t_window where windowname=:ls_windowname;
if  isnull(ii_windowid) or ii_windowid = 0 then
	messagebox("Failed","没有找到"+ls_windowname+"对应的数据库信息")
	close(this)
else
	
end if
if lower(ls_auto) = 'true' then
	ib_auto = true
else
	ib_auto = false
end if


end event

event ue_runall();integer i
string ls_desc

for i = 1 to dw_1.rowcount( )
     mle_1.text = ''
	 mle_2.text = ""
	dw_1.event rowfocuschanged(i)
	// wf_ScriptExe(i, false)
	 wf_ScriptExe(i, true)	
next




end event

event ue_postopen();if ib_auto then
	cb_1.triggerevent( clicked!)  //自动执行测试点
end if
end event

public subroutine wf_setflag ();//Resize 框架中的控件
//向下延伸
ieon_resize.of_setflag(gb_1,"0002")
ieon_resize.of_setflag(dw_1,"0002")
//向右延伸
ieon_resize.of_setflag(gb_2,"0020")
ieon_resize.of_setflag(mle_1,"0020")
//向右向下延伸
ieon_resize.of_setflag(gb_3,"0022")
ieon_resize.of_setflag(mle_2,"0022")
//向下移动
ieon_resize.of_setflag(gb_5,"0200")
ieon_resize.of_setflag(cb_1,"0200")
ieon_resize.of_setflag(cb_2,"0200")
ieon_resize.of_setflag(cb_3,"0200")
ieon_resize.of_setflag(cb_4,"0200")
//向下移动，并向右延伸
ieon_resize.of_setflag(gb_4,"0220")
ieon_resize.of_setflag(mle_output,"0220")


end subroutine

public subroutine wf_init_testcase ();//获取window相关的测试点信息

dw_1.settransobject( sqlca)
dw_1.retrieve(ii_windowid)



end subroutine

public subroutine wf_saveresult (integer ai_testcaseid);//执行完一个测试点后，保存执行结果
string ls_realvalue
datetime ldt_tmp
ldt_tmp = datetime(today(),now())
ls_realvalue = mle_output.text

update t_testcase set realvalue = :ls_realvalue,updatetime=:ldt_tmp where id = :ai_testcaseid;
if sqlca.sqlcode <> 0 then
	messagebox("Failed","Save real result failed:"+sqlca.sqlerrtext)
	rollback;
else
	commit;
end if
end subroutine

public subroutine wf_scriptview (string as_script);//You must Define this Function for view and Execute Script

//////////////////////////////////////////////////////////////////////
//Function: wf_scriptview  View a line Script
//Argument: String  as_mess a line Script
//Output:   none
//Designer:
//Date:
/////////////////////////////////////////////////////////////////////

mle_2.Text += as_script + "~r~n"

Return
end subroutine

public subroutine wf_output (string as_msg, boolean ab_clear);//Function : Wf_OutPut
//Argument : String   as_mess;   The Message you will output 
//				 Boolean  ab_clear;  Clear Flag
//Output   : None
//Designer : 
//Date     :
////////////////////////////////////////////////////////////////

If ab_clear Then
	mle_output.Text = ""
End IF	

mle_output.Text += as_msg+"~r~n"
end subroutine

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);//执行各测试点，需要重载该函数 ai_item返回的是datawindow的行号
string  ls_testcase
long li_testcaseid

if ai_item = 0 then return
ls_testcase = dw_1.getitemstring(ai_item,"testcasename")
li_testcaseid = dw_1.getitemnumber( ai_item,"id")
If ab_execute Then 
	wf_output("-----Test Point:" + ls_testcase + "-----", True)
End If

choose case lower(ls_testcase)
	case "example1"  //for example
		if ab_execute then
			date ld_now
			ld_now = today()
			wf_OutPut('today() = ' + string(ld_now,'yyyy-mm-dd'), False)
		else
			wf_scriptview("date ld_now                                        ")
			wf_scriptview("ld_now = today()                                   ")
			wf_scriptview("wf_OutPut('today() = ' + string(ld_now,'yyyy-mm-dd'), False)      ")
		end if
	case else
		messagebox("Error",ls_testcase+"has no coding")
end choose

//保存执行的数据
if ab_execute then
	wf_saveresult(li_testcaseid)
end if
end subroutine

public function integer wf_description (integer ai_row);//将测试点的预览信息，展示到预览框中
string ls_desc
if ai_row <= 0 then return -1

ls_desc = dw_1.getitemstring(ai_row,"description")
mle_1.text = ls_desc

return 1
end function

on w_testcase_base.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_output=create mle_output
this.mle_2=create mle_2
this.mle_1=create mle_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.mle_output
this.Control[iCurrent+6]=this.mle_2
this.Control[iCurrent+7]=this.mle_1
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.gb_2
this.Control[iCurrent+11]=this.gb_3
this.Control[iCurrent+12]=this.gb_4
this.Control[iCurrent+13]=this.gb_5
end on

on w_testcase_base.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_output)
destroy(this.mle_2)
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;
//获取windowid以及是否自动化执行
this.event ue_preopen()

//获取测试点
wf_init_testcase()

this.postevent( "ue_postopen")
end event

type cb_4 from commandbutton within w_testcase_base
integer x = 818
integer y = 2128
integer width = 457
integer height = 128
integer taborder = 80
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;Close(parent)
end event

type cb_3 from commandbutton within w_testcase_base
integer x = 818
integer y = 1880
integer width = 457
integer height = 128
integer taborder = 80
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Clear"
end type

event clicked;mle_1.text = ''
mle_2.text = ''
mle_output.text = ''
end event

type cb_2 from commandbutton within w_testcase_base
integer x = 59
integer y = 2128
integer width = 457
integer height = 128
integer taborder = 80
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Execute"
end type

event clicked;long ll_row
ll_row = dw_1.getrow()
if ll_row = 0 then return
mle_1.text = ""
mle_2.text = ''
wf_description(ll_row)
wf_Scriptexe(ll_row,False)
wf_Scriptexe(ll_row,True)
end event

type cb_1 from commandbutton within w_testcase_base
integer x = 59
integer y = 1880
integer width = 457
integer height = 128
integer taborder = 70
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "AutoExe"
end type

event clicked;parent.event ue_runall( )

if ib_auto then
	//运行结束后自动关闭窗体
	close(parent)
end if
end event

type mle_output from multilineedit within w_testcase_base
integer x = 1417
integer y = 1812
integer width = 1897
integer height = 508
integer taborder = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type mle_2 from multilineedit within w_testcase_base
integer x = 1426
integer y = 656
integer width = 1870
integer height = 1040
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type mle_1 from multilineedit within w_testcase_base
integer x = 1426
integer y = 84
integer width = 1870
integer height = 436
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_testcase_base
integer x = 18
integer y = 80
integer width = 1339
integer height = 1628
integer taborder = 20
string title = "none"
string dataobject = "d_testcase_windowlist"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//行变化时，预览脚本信息
IF currentrow > 0 THEN
	mle_2.text = ''
	mle_output.text = ''
	wf_description(currentrow)
	wf_Scriptexe(currentrow,False)
END IF


end event

event doubleclicked;//双击执行测试点
IF row > 0 THEN
	wf_description(row)
	wf_Scriptexe(row,True)
END IF
end event

event clicked;this.selectrow(0,false)
this.selectrow(row,true)
end event

type gb_1 from groupbox within w_testcase_base
integer y = 4
integer width = 1385
integer height = 1724
integer taborder = 10
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "TestCase List"
end type

type gb_2 from groupbox within w_testcase_base
integer x = 1390
integer y = 8
integer width = 1943
integer height = 544
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Description"
end type

type gb_3 from groupbox within w_testcase_base
integer x = 1390
integer y = 572
integer width = 1943
integer height = 1152
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ScriptView"
end type

type gb_4 from groupbox within w_testcase_base
integer x = 1390
integer y = 1728
integer width = 1943
integer height = 612
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "OutPut"
end type

type gb_5 from groupbox within w_testcase_base
integer y = 1728
integer width = 1381
integer height = 620
integer taborder = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operate"
end type

