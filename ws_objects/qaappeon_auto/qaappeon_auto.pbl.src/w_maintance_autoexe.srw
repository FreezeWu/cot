$PBExportHeader$w_maintance_autoexe.srw
forward
global type w_maintance_autoexe from w_base
end type
type cb_7 from commandbutton within w_maintance_autoexe
end type
type cb_6 from commandbutton within w_maintance_autoexe
end type
type cb_5 from commandbutton within w_maintance_autoexe
end type
type cb_4 from commandbutton within w_maintance_autoexe
end type
type cb_3 from commandbutton within w_maintance_autoexe
end type
type cb_2 from commandbutton within w_maintance_autoexe
end type
type cb_1 from commandbutton within w_maintance_autoexe
end type
type sle_1 from singlelineedit within w_maintance_autoexe
end type
type st_1 from statictext within w_maintance_autoexe
end type
type dw_1 from datawindow within w_maintance_autoexe
end type
type gb_1 from groupbox within w_maintance_autoexe
end type
end forward

global type w_maintance_autoexe from w_base
integer width = 3365
integer height = 2080
string title = "Auto Execute"
windowstate windowstate = maximized!
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_1 sle_1
st_1 st_1
dw_1 dw_1
gb_1 gb_1
end type
global w_maintance_autoexe w_maintance_autoexe

type variables
integer ii_windowid[]   //记录本次执行的windowid  供viewResult查看
end variables

forward prototypes
public subroutine wf_retrieve ()
public subroutine wf_setflag ()
end prototypes

public subroutine wf_retrieve ();//根据平台检索数据检索数据
string ls_pb,ls_web,ls_moblie
string ls_plat
string ls_filter

ls_plat = appeongetclienttype()
choose case ls_plat
	case 'PB'
		ls_filter = "mid(platform,1,1)='1'"
	case 'WEB'
		ls_filter = "mid(platform,2,1)='1'"
	case 'MOBILE'
		ls_filter = "mid(platform,3,1)='1'"
end choose

dw_1.setfilter(ls_filter)
dw_1.filter()




end subroutine

public subroutine wf_setflag ();//resize窗体中的控件

ieon_resize.of_setflag(gb_1,"0022")
ieon_resize.of_setflag(dw_1,"0022")

ieon_resize.of_setflag(st_1,"2100")
ieon_resize.of_setflag(sle_1,"2100")
ieon_resize.of_setflag(cb_1,"2100")
ieon_resize.of_setflag(cb_2,"2100")
ieon_resize.of_setflag(cb_3,"2100")
ieon_resize.of_setflag(cb_4,"2100")
ieon_resize.of_setflag(cb_5,"2100")
ieon_resize.of_setflag(cb_6,"2100")
ieon_resize.of_setflag(cb_7,"2100")
end subroutine

on w_maintance_autoexe.create
int iCurrent
call super::create
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_1=create sle_1
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_7
this.Control[iCurrent+2]=this.cb_6
this.Control[iCurrent+3]=this.cb_5
this.Control[iCurrent+4]=this.cb_4
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.sle_1
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.dw_1
this.Control[iCurrent+11]=this.gb_1
end on

on w_maintance_autoexe.destroy
call super::destroy
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;call super::open;dw_1.settransobject( sqlca)
dw_1.retrieve( )

//根据平台过滤数据
wf_retrieve()
end event

type cb_7 from commandbutton within w_maintance_autoexe
integer x = 2633
integer y = 1508
integer width = 457
integer height = 128
integer taborder = 100
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

type cb_6 from commandbutton within w_maintance_autoexe
integer x = 2633
integer y = 1276
integer width = 457
integer height = 128
integer taborder = 90
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ViewResult"
end type

event clicked;//打开结果查看窗体
str_parm_windowid lstr_window
long ll_loop,ll_windowid,ll_upper
string ls_select
ll_upper = 0
//如果未执行任何测试点，加入功能查看选择的测试点
if upperbound(ii_windowid) = 0 then
	for ll_loop = 1 to dw_1.rowcount( )
		ls_select = dw_1.getitemstring(ll_loop,'sel')
		if ls_select = '1' then
			ll_upper = ll_upper + 1
			ll_windowid = dw_1.getitemnumber(ll_loop,"id")
			ii_windowid[ll_upper] =ll_windowid
		end if
	next
end if

lstr_window.i_windowid = ii_windowid

opensheetwithparm(w_maintance_result,lstr_window,w_maintance_frame,0,original!)


end event

type cb_5 from commandbutton within w_maintance_autoexe
boolean visible = false
integer x = 2583
integer y = 1548
integer width = 457
integer height = 128
integer taborder = 80
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "ManuExe"
end type

type cb_4 from commandbutton within w_maintance_autoexe
integer x = 2633
integer y = 1040
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

event clicked;//依次打开选择的窗体
long ll_loop,ll_bound
window lw_tmp
string ls_select,ls_window,ls_auto
integer li_windowid,li_tmp[]
//清空windowid
ii_windowid = li_tmp
ll_bound = 0
for ll_loop = 1 to dw_1.rowcount( )
	ls_select = dw_1.getitemstring(ll_loop,'sel')
	//只执行选择的测试点
	if ls_select = '1' then
		//记录执行过的窗体
		ll_bound = ll_bound + 1
		ls_window = dw_1.getitemstring(ll_loop,"windowname")
		li_windowid = dw_1.getitemnumber(ll_loop,"id")
		ii_windowid[ll_bound] = li_windowid 
		//打开需要执行的测试窗体
		opensheet(lw_tmp,ls_window,w_maintance_frame,0,original!)
		do while isvalid(lw_tmp)
			//等待窗体关闭
			yield()
			
//			//这种写法可以避免运行是崩溃但是下次运行，仍然没有数据
//			if gb_exit then
//				disconnect;
//				halt 
//			end if
		loop
	end if
next
ls_auto = profilestring("qaappeon.ini","qaauto","autoexe","")
if lower(ls_auto) = 'true' then
	cb_6.triggerevent( clicked!)
end if
end event

type cb_3 from commandbutton within w_maintance_autoexe
boolean visible = false
integer x = 2624
integer y = 1052
integer width = 457
integer height = 128
integer taborder = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "UnselectAll"
end type

event clicked;long ll_loop

for ll_loop = 1 to dw_1.rowcount()
	dw_1.setitem(ll_loop,'sel','0')
next
end event

type cb_2 from commandbutton within w_maintance_autoexe
integer x = 2624
integer y = 804
integer width = 457
integer height = 128
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "UnSelectAll"
end type

event clicked;long ll_loop
if this.text = "SelectAll" then
	for ll_loop = 1 to dw_1.rowcount()
		dw_1.setitem(ll_loop,'sel','1')
	next
	this.text = "UnSelectAll"
else
	this.text = "SelectAll"
	for ll_loop = 1 to dw_1.rowcount()
		dw_1.setitem(ll_loop,'sel','0')
	next
end if
end event

type cb_1 from commandbutton within w_maintance_autoexe
integer x = 2624
integer y = 552
integer width = 457
integer height = 128
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Find"
end type

event clicked;string ls_find
long ll_row
//根据windowname或windowid查找数据
ls_find = "(windowname like '%"+sle_1.text+"%') or "+"(id = "+string(long(sle_1.text))+")"


ll_row = dw_1.find(ls_find,1,dw_1.rowcount())

if ll_row > 0 then
	dw_1.selectrow(0,false)
	dw_1.selectrow(ll_row,true)
	dw_1.scrolltorow(ll_row)
end if
end event

type sle_1 from singlelineedit within w_maintance_autoexe
integer x = 2473
integer y = 312
integer width = 786
integer height = 132
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "101"
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_maintance_autoexe
integer x = 2459
integer y = 168
integer width = 777
integer height = 76
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
string text = "WindowID/WindowName"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_maintance_autoexe
integer x = 18
integer y = 108
integer width = 2386
integer height = 1820
integer taborder = 20
string title = "none"
string dataobject = "d_window_autoexe"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if row = 0 then return

this.selectrow(0,false)
this.selectrow(row,true)
end event

type gb_1 from groupbox within w_maintance_autoexe
integer width = 3310
integer height = 1956
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Auto Execute"
end type

