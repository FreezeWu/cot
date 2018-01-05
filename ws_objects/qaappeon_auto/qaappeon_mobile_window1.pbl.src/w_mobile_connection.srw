$PBExportHeader$w_mobile_connection.srw
forward
global type w_mobile_connection from w_testcase_base
end type
end forward

global type w_mobile_connection from w_testcase_base
end type
global w_mobile_connection w_mobile_connection

type variables
eon_mobile_connectionex  ieon_connect
end variables
forward prototypes
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
end prototypes

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);//执行各测试点，需要重载该函数 ai_item返回的是datawindow的行号
string  ls_testcase,ls_rtn,ls_file
long li_testcaseid,ll_rtn
blob lb_data

if ai_item = 0 then return

ls_testcase = dw_1.getitemstring(ai_item,"testcasename")
li_testcaseid = dw_1.getitemnumber( ai_item,"id")
If ab_execute Then 
	wf_output("-----Test Point:" + ls_testcase + "-----", True)
End If

choose case ls_testcase
		case "connection_p001_getconnectioninfo"
			if ab_execute then
				//Gets the device's network connection information.
				//0 - No connection.
				//1 - Cell network: 2G/3G/4G.
				//2 - Wi-Fi network
				//-1 - It is called in PowerBuilder or Appeon Web, or there is an error.
				ll_rtn = ieon_connect.of_getconnectioninfo()
				wf_OutPut('The return of of_getconnectioninfo = ' + string(ll_rtn), False)
			else
				wf_scriptview("//Gets the device's network connection information. ")
				wf_scriptview("//0 - No connection. ")
				wf_scriptview("//1 - Cell network: 2G/3G/4G. ")
				wf_scriptview("//2 - Wi-Fi network ")
				wf_scriptview("//-1 - It is called in PowerBuilder or Appeon Web, or there is an error. ")
				wf_scriptview("ll_rtn = ieon_connect.of_getconnectioninfo() ")
				wf_scriptview("wf_OutPut('The return of of_getconnectioninfo = ' + string(ll_rtn), False) ")
			end if
		case else
			messagebox("Error",ls_testcase+"has no coding")
end choose

//保存执行的数据
if ab_execute then
	wf_saveresult(li_testcaseid)
end if
end subroutine

on w_mobile_connection.create
call super::create
end on

on w_mobile_connection.destroy
call super::destroy
end on

event open;call super::open;ieon_connect = create eon_mobile_connectionex
end event

type cb_4 from w_testcase_base`cb_4 within w_mobile_connection
end type

type cb_3 from w_testcase_base`cb_3 within w_mobile_connection
end type

type cb_2 from w_testcase_base`cb_2 within w_mobile_connection
end type

type cb_1 from w_testcase_base`cb_1 within w_mobile_connection
end type

type mle_output from w_testcase_base`mle_output within w_mobile_connection
end type

type mle_2 from w_testcase_base`mle_2 within w_mobile_connection
end type

type mle_1 from w_testcase_base`mle_1 within w_mobile_connection
end type

type dw_1 from w_testcase_base`dw_1 within w_mobile_connection
end type

type gb_1 from w_testcase_base`gb_1 within w_mobile_connection
end type

type gb_2 from w_testcase_base`gb_2 within w_mobile_connection
end type

type gb_3 from w_testcase_base`gb_3 within w_mobile_connection
end type

type gb_4 from w_testcase_base`gb_4 within w_mobile_connection
end type

type gb_5 from w_testcase_base`gb_5 within w_mobile_connection
end type

