$PBExportHeader$w_maintance_result.srw
forward
global type w_maintance_result from w_base
end type
type cb_6 from commandbutton within w_maintance_result
end type
type cb_5 from commandbutton within w_maintance_result
end type
type cb_4 from commandbutton within w_maintance_result
end type
type cb_3 from commandbutton within w_maintance_result
end type
type cb_2 from commandbutton within w_maintance_result
end type
type cb_1 from commandbutton within w_maintance_result
end type
type dw_1 from datawindow within w_maintance_result
end type
type gb_1 from groupbox within w_maintance_result
end type
end forward

global type w_maintance_result from w_base
integer width = 4731
integer height = 2080
string title = "ViewResult"
windowstate windowstate = maximized!
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_1 gb_1
end type
global w_maintance_result w_maintance_result

type variables
integer ii_windowid[]
end variables

forward prototypes
public subroutine wf_setflag ()
end prototypes

public subroutine wf_setflag ();//resize控件
ieon_resize.of_setflag(gb_1,"0022")
ieon_resize.of_setflag(dw_1,"0022")

ieon_resize.of_setflag(cb_1,"1200")
ieon_resize.of_setflag(cb_2,"1200")
ieon_resize.of_setflag(cb_3,"1200")
ieon_resize.of_setflag(cb_4,"1200")
ieon_resize.of_setflag(cb_5,"1200")
ieon_resize.of_setflag(cb_6,"1200")

end subroutine

on w_maintance_result.create
int iCurrent
call super::create
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_6
this.Control[iCurrent+2]=this.cb_5
this.Control[iCurrent+3]=this.cb_4
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.dw_1
this.Control[iCurrent+8]=this.gb_1
end on

on w_maintance_result.destroy
call super::destroy
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;//接收传回的windowid
str_parm_windowid lstr_winid
lstr_winid = message.powerobjectparm
ii_windowid = lstr_winid.i_windowid
//ii_windowid[1] = 101  测试数据

//未放置Retrieve报错，即没有执行任何测试点时，初始化窗体id为100,不存在的窗体
if upperbound(ii_windowid) = 0 then
	ii_windowid[1] = 100
end if

//根据windowid检索数据
dw_1.settransobject( sqlca)
dw_1.retrieve( ii_windowid)

end event

type cb_6 from commandbutton within w_maintance_result
integer x = 3680
integer y = 1740
integer width = 457
integer height = 128
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;close(parent)
end event

type cb_5 from commandbutton within w_maintance_result
integer x = 3035
integer y = 1740
integer width = 457
integer height = 128
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Compare"
end type

event clicked;//使用compare工具比较期望值
string ls_run,ls_beyond,ls_key[],ls_exp,ls_real
string ls_expfile,ls_realfile
long ll_exp,ll_real
long ll_rtn,ll_row
ls_run = "C:\Program Files\Beyond~~1"
ls_expfile = "exp.tmp"
ls_realfile = "real.tmp"

filedelete(ls_expfile)
filedelete(ls_realfile)
//取出当前行的实际值和期望值
ll_row = dw_1.getrow( )
if ll_row = 0 then return
ls_exp = dw_1.getitemstring(ll_row,'expvalue')
ls_real = dw_1.getitemstring(ll_row,'realvalue')
//将期望值和实际值写入文件
ll_exp = fileopen(ls_expfile,streammode!,write!,shared!,replace!,encodingutf8!)
filewrite(ll_exp,ls_exp)
fileclose(ll_exp)
ll_real = fileopen(ls_realfile,streammode!,write!,shared!,replace!,encodingutf8!)
filewrite(ll_real,ls_real)
fileclose(ll_real)

//使用becompare比较结果值
ll_rtn = Registryget("HKEY_LOCAL_MACHINE\SOFTWARE\Classes\BeyondCompare.Snapshot\shell\open\command","",regstring!,ls_beyond)
if pos(ls_beyond,"%1") > 0 then
	ls_beyond = mid(ls_beyond,1,pos(ls_beyond,"%1") - 2)
end if
run(ls_beyond +' "'+ls_realfile+'" "'+ls_expfile+'"')
end event

type cb_4 from commandbutton within w_maintance_result
integer x = 2327
integer y = 1740
integer width = 457
integer height = 128
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "SaveAs"
end type

event clicked;//先简单写一下

dw_1.saveas( )
end event

type cb_3 from commandbutton within w_maintance_result
integer x = 1687
integer y = 1740
integer width = 457
integer height = 128
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "UpdateExp"
end type

event clicked;//更新单个测试点的期望值
string ls_realvalue,ls_testcasename
long ll_row

ll_row = dw_1.getrow( )
if ll_row = 0 then return

ls_testcasename = dw_1.getitemstring(ll_row,'testcasename')
if messagebox("Information","确认要更新"+ls_testcasename+"的期望值吗？",question!,yesno!,2) = 1 then
	ls_realvalue = dw_1.getitemstring(ll_row,'realvalue')
	dw_1.setitem(ll_row,'expvalue',ls_realvalue)
	dw_1.setitem(ll_row,'updatetime',datetime(today(),now()))
	if dw_1.update( ) = 1 then
		commit;
		messagebox("Success","Update expvalue succeed")
	else
		messagebox("Success","更新期望值失败:"+sqlca.sqlerrtext)
		rollback;
	end if
end if
end event

type cb_2 from commandbutton within w_maintance_result
integer x = 1015
integer y = 1740
integer width = 457
integer height = 128
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ShowAll"
end type

event clicked;string ls_filter
//过滤全部的测试点数据
ls_filter = ""

dw_1.setfilter(ls_filter)
dw_1.filter( )
end event

type cb_1 from commandbutton within w_maintance_result
integer x = 375
integer y = 1740
integer width = 457
integer height = 128
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ShowError"
end type

event clicked;string ls_filter
//过滤失败的测试点
ls_filter = "expvalue <> realvalue or isnull(expvalue)"

dw_1.setfilter(ls_filter)
dw_1.filter( )
end event

type dw_1 from datawindow within w_maintance_result
integer x = 27
integer y = 92
integer width = 4645
integer height = 1552
integer taborder = 20
string title = "none"
string dataobject = "d_testcase_result"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row = 0 then return

this.selectrow( 0, false)
this.selectrow(row,true)
end event

type gb_1 from groupbox within w_maintance_result
integer width = 4690
integer height = 1956
integer taborder = 10
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ViewResult"
end type

