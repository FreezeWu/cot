$PBExportHeader$w_maintance_window.srw
forward
global type w_maintance_window from window
end type
type st_1 from statictext within w_maintance_window
end type
type cb_2 from commandbutton within w_maintance_window
end type
type cb_1 from commandbutton within w_maintance_window
end type
type cbx_3 from checkbox within w_maintance_window
end type
type cbx_2 from checkbox within w_maintance_window
end type
type cbx_1 from checkbox within w_maintance_window
end type
type dw_1 from datawindow within w_maintance_window
end type
type gb_1 from groupbox within w_maintance_window
end type
end forward

global type w_maintance_window from window
integer width = 1714
integer height = 1160
boolean titlebar = true
string title = "Maintence window"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_2 cb_2
cb_1 cb_1
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
dw_1 dw_1
gb_1 gb_1
end type
global w_maintance_window w_maintance_window

on w_maintance_window.create
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.cb_2,&
this.cb_1,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.dw_1,&
this.gb_1}
end on

on w_maintance_window.destroy
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;long ll_id,ll_row,ll_newrow
string ls_flag
dw_1.settransobject(sqlca)
//获取传入的windowid
ll_id = message.doubleparm
//根据windowid检索数据，如果检索的函数为0，认为新增
ll_row = dw_1.retrieve(ll_id)
if ll_row <= 0 then
	ll_newrow = dw_1.insertrow(0)
	dw_1.setitem(ll_newrow,"id",ll_id)
	dw_1.setitem(ll_newrow,"isvalid",'1')
else
	ls_flag = dw_1.getitemstring(1,'platform')
	if mid(ls_flag,1,1) = '1' then
		cbx_1.checked = true
	else
		cbx_1.checked = false
	end if
	if mid(ls_flag,2,1) = '1' then
		cbx_3.checked = true
	else
		cbx_3.checked = false
	end if
	if mid(ls_flag,3,1) = '1' then
		cbx_2.checked = true
	else
		cbx_2.checked = false
	end if
end if

//设置提醒信息
st_1.text = "维护案例时，请注意勾选运行平台"



end event

event closequery;//询问是否不小心点击了关闭，是否保存修改数据
if dw_1.modifiedcount( ) + dw_1.deletedcount( ) > 0 then
	if messagebox("Information","datawindow的数据已修改但未保存，是否确定关闭",question!,yesno!,2) = 1 then
		
	else
		return 1
	end if
end if
end event

type st_1 from statictext within w_maintance_window
integer x = 27
integer y = 652
integer width = 1664
integer height = 160
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_maintance_window
integer x = 937
integer y = 896
integer width = 457
integer height = 132
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_maintance_window
integer x = 247
integer y = 896
integer width = 457
integer height = 132
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;string ls_pb,ls_web,ls_mobile
//拼接支持的运行平台
if cbx_1.checked then
	ls_pb = '1'
else
	ls_pb = '0'
end if
if cbx_2.checked then
	ls_mobile = '1'
else
	ls_mobile = '0'
end if
if cbx_3.checked then
	ls_web = '1'
else
	ls_web = '0'
end if
dw_1.setitem(1,"platform",ls_pb+ls_web+ls_mobile)
//开始更新数据
dw_1.accepttext( )
if dw_1.update( ) = 1 then
	commit;
	messagebox("Succeed","保存数据成功")
else
	messagebox("Failed","保存数据失败："+sqlca.sqlerrtext)
	rollback;
end if
end event

type cbx_3 from checkbox within w_maintance_window
integer x = 613
integer y = 516
integer width = 347
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Web"
boolean checked = true
end type

type cbx_2 from checkbox within w_maintance_window
integer x = 1024
integer y = 516
integer width = 347
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mobile"
boolean checked = true
end type

type cbx_1 from checkbox within w_maintance_window
integer x = 201
integer y = 516
integer width = 347
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "PB"
boolean checked = true
end type

type dw_1 from datawindow within w_maintance_window
integer x = 14
integer y = 60
integer width = 1664
integer height = 440
integer taborder = 20
string title = "none"
string dataobject = "d_window_free"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_maintance_window
integer width = 1701
integer height = 852
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

