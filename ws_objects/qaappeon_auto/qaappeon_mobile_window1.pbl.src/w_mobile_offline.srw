$PBExportHeader$w_mobile_offline.srw
forward
global type w_mobile_offline from w_testcase_base
end type
end forward

global type w_mobile_offline from w_testcase_base
end type
global w_mobile_offline w_mobile_offline

type variables
eon_offlineex  ieon_offline
boolean ibn_dialog
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
		case "offline_p001_checkappeonserver"
			if ab_execute then
				//Detects if Appeon Server exists.
				//1 - Appeon Server exists.
				//-1 - It is called in PowerBuilder or Appeon Web, or there is an error.
				ll_rtn = ieon_offline.of_checkappeonserver()
				wf_OutPut('The return of of_checkappeonserver() = ' + string(ll_rtn), False)
			else
				wf_scriptview("//Detects if Appeon Server exists. ")
				wf_scriptview("//1 - Appeon Server exists. ")
				wf_scriptview("//-1 - It is called in PowerBuilder or Appeon Web, or there is an error. ")
				wf_scriptview("ll_rtn = ieon_offline.of_checkappeonserver() ")
				wf_scriptview("wf_OutPut('The return of of_checkappeonserver() = ' + string(ll_rtn), False) ")
			end if
		case "offline_p002_checkupdate"
			if ab_execute then
				//Detects if there is any update for the current application.
				//0 - There is no update
				//1 - There is an update only for the application.
				//2 - There is an update only for the database file.
				//3 - There are updates for both the database file and the application.
				//-1 - Failure in the update check or it is called in PowerBuilder.
				//-2 - It is called in Appeon Web and this operation is not supported.
				ll_rtn = ieon_offline.of_checkupdate()
				wf_OutPut('The return of of_checkupdate() = ' + string(ll_rtn), False)
			else
				wf_scriptview("//Detects if there is any update for the current application. ")
				wf_scriptview("//0 - There is no update ")
				wf_scriptview("//1 - There is an update only for the application. ")
				wf_scriptview("//2 - There is an update only for the database file. ")
				wf_scriptview("//3 - There are updates for both the database file and the application. ")
				wf_scriptview("//-1 - Failure in the update check or it is called in PowerBuilder. ")
				wf_scriptview("//-2 - It is called in Appeon Web and this operation is not supported. ")
				wf_scriptview("ll_rtn = ieon_offline.of_checkupdate() ")
				wf_scriptview("wf_OutPut('The return of of_checkupdate() = ' + string(ll_rtn), False) ")
			end if
		case "offline_p003_applyupdate1"
			if ab_execute then
				//Updates the current application from the server.
				//1 - Success.
				//0 - Latest app and no need to update.
				//-1 - Failure or it is called in PowerBuilder.
				//--2 - It is called in Appeon Web and this operation is not supported.
				ibn_dialog = false
				ll_rtn = ieon_offline.of_applyupdate(ibn_dialog)
				wf_OutPut('The return of of_applyupdate(False) = ' + string(ll_rtn), False)
			else
				wf_scriptview("//Updates the current application from the server. ")
				wf_scriptview("//1 - Success. ")
				wf_scriptview("//0 - Latest app and no need to update. ")
				wf_scriptview("//-1 - Failure or it is called in PowerBuilder. ")
				wf_scriptview("//--2 - It is called in Appeon Web and this operation is not supported. ")
				wf_scriptview("ibn_dialog = false ")
				wf_scriptview("ll_rtn = ieon_offline.of_applyupdate(ibn_dialog) ")
			end if
		case "offline_p004_applyupdate2"
			if ab_execute then
				//Updates the current application from the server.
				//1 - Success.
				//0 - Latest app and no need to update.
				//-1 - Failure or it is called in PowerBuilder.
				//--2 - It is called in Appeon Web and this operation is not supported.
				ll_rtn = ieon_offline.of_applyupdate()
				wf_OutPut('The return of of_applyupdate() = ' + string(ll_rtn), False)
			else
				wf_scriptview("//Updates the current application from the server. ")
				wf_scriptview("//1 - Success. ")
				wf_scriptview("//0 - Latest app and no need to update. ")
				wf_scriptview("//-1 - Failure or it is called in PowerBuilder. ")
				wf_scriptview("//--2 - It is called in Appeon Web and this operation is not supported. ")
				wf_scriptview("ll_rtn = ieon_offline.of_applyupdate() ")
				wf_scriptview("wf_OutPut('The return of of_applyupdate() = ' + string(ll_rtn), False) ")
			end if
		case "offline_p005_applydbupdate"
			if ab_execute then
				//Updates the local database files of the current application.
				//1 - Success.
				//0 - The DB structure of the current application is the same as that in the server, and no need to update.
				//-1 - Failure or it is called in PowerBuilder.
				//-2 - It is called in Appeon Web and this operation is not supported.
				ll_rtn = ieon_offline.of_applydbupdate()
				wf_OutPut('The return of of_applydbupdate() = ' + string(ll_rtn), False)
			else
				wf_scriptview("//Updates the local database files of the current application. ")
				wf_scriptview("//1 - Success. ")
				wf_scriptview("//0 - The DB structure of the current application is the same as that in the server, and no need to update. ")
				wf_scriptview("//-1 - Failure or it is called in PowerBuilder. ")
				wf_scriptview("//-2 - It is called in Appeon Web and this operation is not supported. ")
				wf_scriptview("ll_rtn = ieon_offline.of_applydbupdate() ")
				wf_scriptview("wf_OutPut('The return of of_applydbupdate() = ' + string(ll_rtn), False) ")
			end if
		case else
			messagebox("Error",ls_testcase+"has no coding")
end choose

//保存执行的数据
if ab_execute then
	wf_saveresult(li_testcaseid)
end if
end subroutine

event open;call super::open;ieon_offline = create eon_offlineex
end event

on w_mobile_offline.create
call super::create
end on

on w_mobile_offline.destroy
call super::destroy
end on

type cb_4 from w_testcase_base`cb_4 within w_mobile_offline
end type

type cb_3 from w_testcase_base`cb_3 within w_mobile_offline
end type

type cb_2 from w_testcase_base`cb_2 within w_mobile_offline
end type

type cb_1 from w_testcase_base`cb_1 within w_mobile_offline
end type

type mle_output from w_testcase_base`mle_output within w_mobile_offline
end type

type mle_2 from w_testcase_base`mle_2 within w_mobile_offline
end type

type mle_1 from w_testcase_base`mle_1 within w_mobile_offline
end type

type dw_1 from w_testcase_base`dw_1 within w_mobile_offline
end type

type gb_1 from w_testcase_base`gb_1 within w_mobile_offline
end type

type gb_2 from w_testcase_base`gb_2 within w_mobile_offline
end type

type gb_3 from w_testcase_base`gb_3 within w_mobile_offline
end type

type gb_4 from w_testcase_base`gb_4 within w_mobile_offline
end type

type gb_5 from w_testcase_base`gb_5 within w_mobile_offline
end type

