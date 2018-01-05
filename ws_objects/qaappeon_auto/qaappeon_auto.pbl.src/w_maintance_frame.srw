$PBExportHeader$w_maintance_frame.srw
forward
global type w_maintance_frame from window
end type
type mdi_1 from mdiclient within w_maintance_frame
end type
end forward

global type w_maintance_frame from window
integer width = 3378
integer height = 1484
boolean titlebar = true
string title = "AutoTest Frame"
string menuname = "m_maintance_frame"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdi!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_maintance_frame w_maintance_frame

on w_maintance_frame.create
if this.MenuName = "m_maintance_frame" then this.MenuID = create m_maintance_frame
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_maintance_frame.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event closequery;gb_exit = true
window lw
lw = this.getactivesheet( )

do while isvalid(lw)
	close(lw)
	lw = this.getactivesheet( )
loop

halt close
end event

type mdi_1 from mdiclient within w_maintance_frame
long BackColor=268435456
end type

