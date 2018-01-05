$PBExportHeader$w_maintance_testcase.srw
forward
global type w_maintance_testcase from w_base
end type
type cb_6 from commandbutton within w_maintance_testcase
end type
type cb_5 from commandbutton within w_maintance_testcase
end type
type cb_4 from commandbutton within w_maintance_testcase
end type
type cb_3 from commandbutton within w_maintance_testcase
end type
type cb_2 from commandbutton within w_maintance_testcase
end type
type cb_1 from commandbutton within w_maintance_testcase
end type
type dw_2 from datawindow within w_maintance_testcase
end type
type dw_1 from datawindow within w_maintance_testcase
end type
type gb_1 from groupbox within w_maintance_testcase
end type
type gb_2 from groupbox within w_maintance_testcase
end type
end forward

global type w_maintance_testcase from w_base
integer width = 3547
integer height = 2144
string title = "测试点维护"
windowstate windowstate = maximized!
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_maintance_testcase w_maintance_testcase

forward prototypes
public subroutine wf_setflag ()
end prototypes

public subroutine wf_setflag ();//设置控件的resize属性
ieon_resize.of_setflag(gb_1,"0022")
ieon_resize.of_setflag(dw_1,"0022")

ieon_resize.of_setflag(cb_1,"2000")
ieon_resize.of_setflag(cb_2,"2000")
ieon_resize.of_setflag(cb_3,"2000")


ieon_resize.of_setflag(gb_2,"0220")
ieon_resize.of_setflag(dw_2,"0220")

ieon_resize.of_setflag(cb_4,"2200")
ieon_resize.of_setflag(cb_5,"2200")
ieon_resize.of_setflag(cb_6,"2200")


end subroutine

on w_maintance_testcase.create
int iCurrent
call super::create
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_6
this.Control[iCurrent+2]=this.cb_5
this.Control[iCurrent+3]=this.cb_4
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.dw_2
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.gb_2
end on

on w_maintance_testcase.destroy
call super::destroy
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;//检索数据
long ll_row
dw_1.settransobject( sqlca)
dw_2.settransobject(sqlca)
ll_row = dw_1.retrieve( )

if ll_row > 0 then
	dw_1.event rowfocuschanged(1)
end if
end event

event closequery;call super::closequery;if dw_2.modifiedcount( ) + dw_2.deletedcount( ) > 0 then
	if messagebox("Information","测试点有修改没有保存，确认要退出吗？",question!,yesno!,2) = 2 then
		return 1
	end if
end if
end event

type cb_6 from commandbutton within w_maintance_testcase
integer x = 2958
integer y = 1584
integer width = 457
integer height = 128
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;//更新testcase数据
dw_2.accepttext( )

if dw_2.update( ) = 1 then
	commit;
	messagebox("Succeed","保存测试点成功")
else
	messagebox("Faild","保存测试点失败:"+sqlca.sqlerrtext)
	rollback;
end if

cb_4.enabled = true
end event

type cb_5 from commandbutton within w_maintance_testcase
integer x = 2958
integer y = 1800
integer width = 457
integer height = 128
integer taborder = 50
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

type cb_4 from commandbutton within w_maintance_testcase
integer x = 2958
integer y = 1348
integer width = 457
integer height = 128
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Insert"
end type

event clicked;//增加测试点
long ll_row,ll_id,ll_wid,ll_winrow
ll_winrow = dw_1.getrow()
this.enabled = false
if ll_winrow = 0 then return
//查询数据库中当前的testcaseid的最大值
select max(id) into :ll_id from t_testcase;
//如果没有任何测试点，则测试点id从100开始
if isnull(ll_id) or ll_id = 0 then
	ll_id = 100
end if
ll_id = ll_id + 1

ll_row = dw_2.insertrow(0)
dw_2.scrolltorow( ll_row)
dw_2.setitem(ll_row,'id',ll_id)
//关联windowid
ll_wid = dw_1.getitemnumber(ll_winrow,'id')
dw_2.setitem(ll_row,"windowid",ll_wid)
dw_2.setitem(ll_row,"updatetime",datetime(today(),now()))


end event

type cb_3 from commandbutton within w_maintance_testcase
integer x = 2958
integer y = 856
integer width = 457
integer height = 128
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Invalid"
end type

event clicked;//作废一个测试点
long ll_row
string ls_wname
ll_row = dw_1.getrow( )
if ll_row = 0 then return

ls_wname = dw_1.getitemstring(ll_row,"windowname")

if messagebox("information","确定作废"+ls_wname+"吗？",question!,yesno!,1) = 1 then
	dw_1.setitem(ll_row,'isvalid','0')
	if dw_1.update( ) = 1 then
		commit;
		messagebox("Succeed",ls_wname+"作废成功")
	else
		messagebox("Faild",ls_wname+"作废失败："+sqlca.sqlerrtext)
		rollback;
	end if
end if
end event

type cb_2 from commandbutton within w_maintance_testcase
integer x = 2958
integer y = 580
integer width = 457
integer height = 128
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Modify"
end type

event clicked;long ll_row,ll_id
//修改已维护的数据
ll_row = dw_1.getrow( )
if ll_row = 0 then
	return
else
	ll_id = dw_1.getitemnumber( ll_row,"id")
end if

openwithparm(w_maintance_window,ll_id)

//重绘datawindow
setredraw(false)
dw_1.retrieve( )
dw_1.selectrow( 0, false)
dw_1.selectrow( ll_row,true)
dw_1.scrolltorow( ll_row)
dw_1.event rowfocuschanged(ll_row)
setredraw(true)
end event

type cb_1 from commandbutton within w_maintance_testcase
integer x = 2958
integer y = 300
integer width = 457
integer height = 128
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Insert"
end type

event clicked;
//插入新的测试点
long ll_id,ll_row
datawindowchild  lddw_tmp
ll_row = dw_1.rowcount( )
if ll_row = 0 then
	ll_id = 100
else
	ll_id = dw_1.getitemnumber( ll_row,"id")
end if

ll_id = ll_id + 1
openwithparm(w_maintance_window,ll_id)

//重绘datawindow
setredraw(false)
dw_1.retrieve( )
ll_row = dw_1.rowcount( )
if ll_row = 0 then return
dw_1.selectrow( 0, false)
dw_1.selectrow( ll_row,true)
dw_1.scrolltorow( ll_row)
dw_1.event rowfocuschanged(ll_row)
setredraw(true)

//重新检索dw_2中的子datawindow
dw_2.getchild( "windowid", lddw_tmp)
lddw_tmp.settransobject( sqlca)
lddw_tmp.retrieve( )
end event

type dw_2 from datawindow within w_maintance_testcase
integer x = 14
integer y = 1244
integer width = 2843
integer height = 780
integer taborder = 30
string title = "none"
string dataobject = "d_testcase_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_maintance_testcase
integer x = 14
integer y = 88
integer width = 2843
integer height = 1044
integer taborder = 20
string title = "none"
string dataobject = "d_window_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long ll_id

ll_id = this.getitemnumber( currentrow,"id")
dw_2.retrieve( ll_id)
end event

event clicked;if row = 0 then return
dw_1.selectrow( 0, false)
dw_1.selectrow(row,true)
end event

type gb_1 from groupbox within w_maintance_testcase
integer width = 3493
integer height = 1160
integer taborder = 10
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Window List"
end type

type gb_2 from groupbox within w_maintance_testcase
integer y = 1156
integer width = 3497
integer height = 880
integer taborder = 20
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Testcase List"
end type

