$PBExportHeader$w_mobile_device.srw
forward
global type w_mobile_device from w_testcase_base
end type
end forward

global type w_mobile_device from w_testcase_base
string title = "Device Auto"
end type
global w_mobile_device w_mobile_device

type variables
eon_mobile_deviceex ieon_device
end variables

forward prototypes
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
end prototypes

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);//执行各测试点，需要重载该函数 ai_item返回的是datawindow的行号
string  ls_testcase,ls_data,ls_rtn
long li_testcaseid,ll_rtn
int ll_height,ll_width

if ai_item = 0 then return
ls_testcase = dw_1.getitemstring(ai_item,"testcasename")
li_testcaseid = dw_1.getitemnumber( ai_item,"id")
If ab_execute Then 
	wf_output("-----Test Point:" + ls_testcase + "-----", True)
End If

choose case lower(ls_testcase)
	case "device_p001_getdeviceid"  
		if ab_execute then
			ll_rtn = ieon_device.of_getdeviceid(ls_data)
			wf_OutPut('ieon_device.of_getdeviceid(ls_data) = ' + string(ll_rtn), False)
			wf_OutPut('deviceid = ' + ls_data, False)
			wf_OutPut('提醒：不同设备的deviceid不同，只要能正常获取就算测试通过', False)
		else
			wf_scriptview("ll_rtn = ieon_device.of_getdeviceid(ls_data) ")
			wf_scriptview("wf_OutPut('ieon_device.of_getdeviceid(ls_data) = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('deviceid = ' + ls_data, False) ")
			wf_scriptview("wf_OutPut('提醒：不同设备的deviceid不同，只要能正常获取就算测试通过', False) ")
		end if
	case "device_p002_getdevicetype"
		if ab_execute then
			ll_rtn = ieon_device.of_getdevicetype( ls_data)
			wf_OutPut('ieon_device.of_getdevicetype(ls_data) = ' + string(ll_rtn), False)
			wf_OutPut('devicetype = ' + ls_data, False)
			wf_OutPut('不同设备的设备类型不同，只要正常获取即可', False)
		else
			wf_scriptview("ll_rtn = ieon_device.of_getdevicetype( ls_data) ")
			wf_scriptview("wf_OutPut('ieon_device.of_getdevicetype(ls_data) = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('devicetype = ' + ls_data, False) ")
			wf_scriptview("wf_OutPut('不同设备的设备类型不同，只要正常获取即可', False) ")
		end if
	case "device_p003_getdpi"
		if ab_execute then
			ll_rtn = ieon_device.of_getdpi()
			wf_OutPut('ieon_device.of_getdpi() = ' + string(ll_rtn), False)
			wf_OutPut('不同设备的打印分辨率不同，只要正常获取即可', False)
		else
			wf_scriptview("ll_rtn = ieon_device.of_getdpi() ")
			wf_scriptview("wf_OutPut('ieon_device.of_getdpi() = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('不同设备的打印分辨率不同，只要正常获取即可', False) ")
		end if
	case "device_p004_getppi"
		if ab_execute then
			ll_rtn = ieon_device.of_getppi()
			wf_OutPut('ieon_device.of_getppi() = ' + string(ll_rtn), False)
			wf_OutPut('不同设备的图像分辨率不同，只要正常获取即可', False)
		else
			wf_scriptview("ll_rtn = ieon_device.of_getppi() ")
			wf_scriptview("wf_OutPut('ieon_device.of_getppi() = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('不同设备的图像分辨率不同，只要正常获取即可', False) ")
		end if
	case "device_p005_gettotalmemory"
		if ab_execute then
			ll_rtn = ieon_device.of_gettotalmemory()
			wf_OutPut('ieon_device.of_gettotalmemory() = ' + string(ll_rtn), False)
			wf_OutPut('不同设备的设备内存大小不同，只要正常获取即可', False)
		else
			wf_scriptview("ll_rtn = ieon_device.of_gettotalmemory() ")
			wf_scriptview("wf_OutPut('ieon_device.of_gettotalmemory() = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('不同设备的设备内存大小不同，只要正常获取即可', False) ")
		end if
	case "device_p006_getfreememory"
		if ab_execute then
			ll_rtn = ieon_device.of_getfreememory()
			wf_OutPut('ieon_device.of_getfreememory() = ' + string(ll_rtn), False)
			wf_OutPut('设备内存消耗不同，只要正常获取并能释放就可以了', False)
		else
			wf_scriptview("ll_rtn = ieon_device.of_getfreememory( ) ")
			wf_scriptview("wf_OutPut('ieon_device.of_getfreememory() = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('设备内存消耗不同，只要正常获取并能释放就可以了', False) ")
		end if
	case "device_p007_getresolution"
		if ab_execute then
			ll_rtn = ieon_device.of_getresolution(ll_height,ll_width)
			wf_OutPut('ieon_device.of_getresolution(ll_height,ll_width) = ' + string(ll_rtn), False)
			wf_OutPut('ll_height = ' + string(ll_height), False)
			wf_OutPut('ll_width = ' + string(ll_width), False)
			wf_OutPut('正常获取即可', False)
		else
			wf_scriptview("ll_rtn = ieon_device.of_getresolution(ll_height,ll_width) ")
			wf_scriptview("wf_OutPut('ieon_device.of_getresolution(ll_height,ll_width) = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('ll_height = ' + string(ll_height), False) ")
			wf_scriptview("wf_OutPut('ll_width = ' + string(ll_width), False) ")
			wf_scriptview("wf_OutPut('正常获取即可', False) ")
		end if
	case "device_p008_getname"
		if ab_execute then
			ll_rtn = ieon_device.of_getname(ls_data)
			wf_OutPut('ieon_device.of_getname(ls_data) = ' + string(ll_rtn), False)
			wf_OutPut('name = ' + ls_data, False)
			wf_OutPut('不同设备的设备名称不同，只要正常获取即可', False)
		else
			wf_scriptview("ll_rtn = ieon_device.of_getname(ls_data) ")
			wf_scriptview("wf_OutPut('ieon_device.of_getname(ls_data) = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('name = ' + ls_data, False) ")
			wf_scriptview("wf_OutPut('不同设备的设备名称不同，只要正常获取即可', False) ")
		end if
	case "device_p009_getplatform"
		if ab_execute then
			ll_rtn = ieon_device.of_getplatform(ls_data)
			wf_OutPut('ieon_device.of_getplatform(ls_data) = ' + string(ll_rtn), False)
			wf_OutPut('platform = ' + ls_data, False)
			wf_OutPut('使用平台可能获取结果不同，只要正常获取即可', False)
		else
			wf_scriptview("ll_rtn = ieon_device.of_getplatform(ls_data) ")
			wf_scriptview("wf_OutPut('ieon_device.of_getplatform(ls_data) = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('platform = ' + ls_data, False) ")
			wf_scriptview("wf_OutPut('使用平台可能获取结果不同，只要正常获取即可', False) ")
		end if
	case "device_p010_getorientation"
		if ab_execute then
			ll_rtn = ieon_device.of_getorientation( )
			wf_OutPut('ieon_device.of_getorientation() = ' + string(ll_rtn), False)
			wf_OutPut('获取方向', False)
		else
			wf_scriptview("ll_rtn = ieon_device.of_getorientation( ) ")
			wf_scriptview("wf_OutPut('ieon_device.of_getorientation() = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('获取方向', False) ")
		end if
	case "device_p011_getosversion"
		if ab_execute then
			ll_rtn = ieon_device.of_getosversion(ls_data)
			wf_OutPut('ieon_device.of_getosversion(ls_data) = ' + string(ll_rtn), False)
			wf_OutPut('osversion = ' + ls_data, False)
			wf_OutPut('不同设备的系统版本不同，只要正常获取即可', False)
		else
			wf_scriptview("ll_rtn = ieon_device.of_getosversion(ls_data) ")
			wf_scriptview("wf_OutPut('ieon_device.of_getosversion(ls_data) = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('osversion = ' + ls_data, False) ")
			wf_scriptview("wf_OutPut('不同设备的系统版本不同，只要正常获取即可', False) ")
		end if
	case "device_p012_getstatusbarvisible"
		if ab_execute then
			ll_rtn = ieon_device.of_getstatusbarvisible()
			wf_OutPut('ieon_device.of_getstatusbarvisible() = ' + string(ll_rtn), False)
			wf_OutPut('获取状态栏是否可见', False)
		else
			wf_scriptview("ll_rtn = ieon_device.of_getstatusbarvisible( ) ")
			wf_scriptview("wf_OutPut('ieon_device.of_getstatusbarvisible() = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('获取状态栏是否可见', False) ")
		end if
	case "device_p013_setstatusbarvisible"
		if ab_execute then
			ieon_device.of_setstatusbarvisible(1)
			ll_rtn = ieon_device.of_getstatusbarvisible()
			wf_OutPut('ieon_device.of_setstatusbarvisible(1) = ' + string(ll_rtn), False)
			ieon_device.of_setstatusbarvisible(0)
			ll_rtn = ieon_device.of_getstatusbarvisible()
			wf_OutPut('ieon_device.of_setstatusbarvisible(0) = ' + string(ll_rtn), False)
			ieon_device.of_setstatusbarvisible(2)
			ll_rtn = ieon_device.of_getstatusbarvisible()
			wf_OutPut('ieon_device.of_setstatusbarvisible(2) = ' + string(ll_rtn), False)
			wf_OutPut('只支持ios设置状态栏是否可见,参数0,1,2为异常值测试', False)
			ll_rtn = ieon_device.of_setstatusbarvisible(0)
		else
			wf_scriptview("ieon_device.of_setstatusbarvisible(1) ")
			wf_scriptview("ll_rtn = ieon_device.of_getstatusbarvisible() ")
			wf_scriptview("wf_OutPut('ieon_device.of_setstatusbarvisible(1) = ' + string(ll_rtn), False) ")
			wf_scriptview("ieon_device.of_setstatusbarvisible(0) ")
			wf_scriptview("ll_rtn = ieon_device.of_getstatusbarvisible() ")
			wf_scriptview("wf_OutPut('ieon_device.of_setstatusbarvisible(0) = ' + string(ll_rtn), False) ")
			wf_scriptview("ieon_device.of_setstatusbarvisible(2) ")
			wf_scriptview("ll_rtn = ieon_device.of_getstatusbarvisible() ")
			wf_scriptview("wf_OutPut('ieon_device.of_setstatusbarvisible(2) = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('只支持ios设置状态栏是否可见,参数0,1,2为异常值测试', False) ")
			wf_scriptview("ll_rtn = ieon_device.of_setstatusbarvisible(0) ")
		end if
	case else
		messagebox("Error",ls_testcase+"has no coding")
end choose

//保存执行的数据
if ab_execute then
	wf_saveresult(li_testcaseid)
end if
end subroutine

on w_mobile_device.create
call super::create
end on

on w_mobile_device.destroy
call super::destroy
end on

event open;call super::open;ieon_device = create eon_mobile_deviceex
end event

type cb_4 from w_testcase_base`cb_4 within w_mobile_device
end type

type cb_3 from w_testcase_base`cb_3 within w_mobile_device
end type

type cb_2 from w_testcase_base`cb_2 within w_mobile_device
end type

type cb_1 from w_testcase_base`cb_1 within w_mobile_device
end type

type mle_output from w_testcase_base`mle_output within w_mobile_device
end type

type mle_2 from w_testcase_base`mle_2 within w_mobile_device
end type

type mle_1 from w_testcase_base`mle_1 within w_mobile_device
end type

type dw_1 from w_testcase_base`dw_1 within w_mobile_device
end type

type gb_1 from w_testcase_base`gb_1 within w_mobile_device
end type

type gb_2 from w_testcase_base`gb_2 within w_mobile_device
end type

type gb_3 from w_testcase_base`gb_3 within w_mobile_device
end type

type gb_4 from w_testcase_base`gb_4 within w_mobile_device
end type

type gb_5 from w_testcase_base`gb_5 within w_mobile_device
end type

