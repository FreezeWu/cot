$PBExportHeader$w_mobile_notification.srw
forward
global type w_mobile_notification from w_testcase_base
end type
end forward

global type w_mobile_notification from w_testcase_base
end type
global w_mobile_notification w_mobile_notification

type variables
eon_mobile_notificationex  ieon_notification
string is_title,is_message
long il_handle
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
	wf_output("Begin:" + ls_testcase, True)
End If

choose case ls_testcase
		case "notification_p001_addmessage1"
			if ab_execute then
				//Sends a notification to the notification bar.
				//>0 - Return the current notification handle if sending notification successfully.
				//-1 - It is called in PowerBuilder or Appeon Web, or there is an error.
				is_title = '!2!%$^'
				is_message = ';;;'
				ll_rtn = ieon_notification.of_addmessage( is_title,is_message)
				wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False)
				is_message = '*TestMessage*'
				ll_rtn = ieon_notification.of_addmessage( is_title,is_message)
				wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False)
				is_message = '国内测试'
				ll_rtn = ieon_notification.of_addmessage( is_title,is_message)
				wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False)
				is_message = 'It is time to eat'
				ll_rtn = ieon_notification.of_addmessage( is_title,is_message)
				wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False)				
			else
				wf_scriptview("//Sends a notification to the notification bar. ")
				wf_scriptview("//>0 - Return the current notification handle if sending notification successfully. ")
				wf_scriptview("//-1 - It is called in PowerBuilder or Appeon Web, or there is an error. ")
				wf_scriptview("is_title = '!2!%$^' ")
				wf_scriptview("is_message = ';;;' ")
				wf_scriptview("ll_rtn = ieon_notification.of_addmessage( is_title,is_message) ")
				wf_scriptview("wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_message = '*TestMessage*' ")
				wf_scriptview("ll_rtn = ieon_notification.of_addmessage( is_title,is_message) ")
				wf_scriptview("wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_message = '国内测试' ")
				wf_scriptview("ll_rtn = ieon_notification.of_addmessage( is_title,is_message) ")
				wf_scriptview("wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_message = 'It is time to eat' ")
				wf_scriptview("ll_rtn = ieon_notification.of_addmessage( is_title,is_message) ")
			end if
		case "notification_p002_addmessage2"
			if ab_execute then
				is_title = '~'Test Title~''
				is_message = ';;;'
				ll_rtn = ieon_notification.of_addmessage( is_title,is_message)
				wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False)
				is_message = '*TestMessage*'
				ll_rtn = ieon_notification.of_addmessage( is_title,is_message)
				wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False)
				is_message = '国内测试'
				ll_rtn = ieon_notification.of_addmessage( is_title,is_message)
				wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False)
				is_message = 'It is time to eat'
				ll_rtn = ieon_notification.of_addmessage( is_title,is_message)
				wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False)
			else
				wf_scriptview("is_title = '~'Test Title~'' ")
				wf_scriptview("is_message = ';;;' ")
				wf_scriptview("ll_rtn = ieon_notification.of_addmessage( is_title,is_message) ")
				wf_scriptview("wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_message = '*TestMessage*' ")
				wf_scriptview("ll_rtn = ieon_notification.of_addmessage( is_title,is_message) ")
				wf_scriptview("wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_message = '国内测试' ")
				wf_scriptview("ll_rtn = ieon_notification.of_addmessage( is_title,is_message) ")
				wf_scriptview("wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_message = 'It is time to eat' ")
				wf_scriptview("ll_rtn = ieon_notification.of_addmessage( is_title,is_message) ")
			end if
		case "notification_p003_addmessage3"
			if ab_execute then
				is_title = '中国Appeon'
				is_message = ';;;'
				ll_rtn = ieon_notification.of_addmessage( is_title,is_message)
				wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False)
				is_message = '*TestMessage*'
				ll_rtn = ieon_notification.of_addmessage( is_title,is_message)
				wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False)
				is_message = '国内测试'
				ll_rtn = ieon_notification.of_addmessage( is_title,is_message)
				wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False)
				is_message = 'It is time to eat'
				ll_rtn = ieon_notification.of_addmessage( is_title,is_message)
				wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False)
			else
				wf_scriptview("is_title = '中国Appeon' ")
				wf_scriptview("is_message = ';;;' ")
				wf_scriptview("ll_rtn = ieon_notification.of_addmessage( is_title,is_message) ")
				wf_scriptview("wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_message = '*TestMessage*' ")
				wf_scriptview("ll_rtn = ieon_notification.of_addmessage( is_title,is_message) ")
				wf_scriptview("wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_message = '国内测试' ")
				wf_scriptview("ll_rtn = ieon_notification.of_addmessage( is_title,is_message) ")
				wf_scriptview("wf_OutPut('The return of of_addmessage(' + is_title + ',' + is_message +') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_message = 'It is time to eat' ")
				wf_scriptview("ll_rtn = ieon_notification.of_addmessage( is_title,is_message) ")
			end if
		case "notification_p004_removemessage"
			if ab_execute then
				//Removes a notification from the notification bar.
				//1 - Success.
				//-1 - It is called in PowerBuilder or Appeon Web, or there is an error.
				il_handle = -1
				ll_rtn = ieon_notification.of_removemessage( il_handle)
				wf_OutPut('The return of of_removemessage(' + string(il_handle) + ') = ' + string(ll_rtn), False)
				il_handle = 0
				ll_rtn = ieon_notification.of_removemessage( il_handle)
				wf_OutPut('The return of of_removemessage(' + string(il_handle) + ') = ' + string(ll_rtn), False)
				il_handle = 1
				ll_rtn = ieon_notification.of_removemessage( il_handle)
				wf_OutPut('The return of of_removemessage(' + string(il_handle) + ') = ' + string(ll_rtn), False)
				il_handle = 2
				ll_rtn = ieon_notification.of_removemessage( il_handle)
				wf_OutPut('The return of of_removemessage(' + string(il_handle) + ') = ' + string(ll_rtn), False)
				il_handle = 3
				ll_rtn = ieon_notification.of_removemessage( il_handle)
				wf_OutPut('The return of of_removemessage(' + string(il_handle) + ') = ' + string(ll_rtn), False)
				il_handle = 4
				ll_rtn = ieon_notification.of_removemessage( il_handle)
				wf_OutPut('The return of of_removemessage(' + string(il_handle) + ') = ' + string(ll_rtn), False)
			else
				wf_scriptview("//Removes a notification from the notification bar. ")
				wf_scriptview("//1 - Success. ")
				wf_scriptview("//-1 - It is called in PowerBuilder or Appeon Web, or there is an error. ")
				wf_scriptview("il_handle = -1 ")
				wf_scriptview("ll_rtn = ieon_notification.of_removemessage( il_handle) ")
				wf_scriptview("wf_OutPut('The return of of_removemessage(' + string(il_handle) + ') = ' + string(ll_rtn), False) ")
				wf_scriptview("il_handle = 0 ")
				wf_scriptview("ll_rtn = ieon_notification.of_removemessage( il_handle) ")
				wf_scriptview("wf_OutPut('The return of of_removemessage(' + string(il_handle) + ') = ' + string(ll_rtn), False) ")
				wf_scriptview("il_handle = 1 ")
				wf_scriptview("ll_rtn = ieon_notification.of_removemessage( il_handle) ")
				wf_scriptview("wf_OutPut('The return of of_removemessage(' + string(il_handle) + ') = ' + string(ll_rtn), False) ")
				wf_scriptview("il_handle = 2 ")
				wf_scriptview("ll_rtn = ieon_notification.of_removemessage( il_handle) ")
				wf_scriptview("wf_OutPut('The return of of_removemessage(' + string(il_handle) + ') = ' + string(ll_rtn), False) ")
				wf_scriptview("il_handle = 3 ")
				wf_scriptview("ll_rtn = ieon_notification.of_removemessage( il_handle) ")
				wf_scriptview("wf_OutPut('The return of of_removemessage(' + string(il_handle) + ') = ' + string(ll_rtn), False) ")
				wf_scriptview("il_handle = 4 ")
				wf_scriptview("ll_rtn = ieon_notification.of_removemessage( il_handle) ")
				wf_scriptview("wf_OutPut('The return of of_removemessage(' + string(il_handle) + ') = ' + string(ll_rtn), False) ")
			end if
		case else
			messagebox("Error",ls_testcase+"has no coding")
end choose

//保存执行的数据
if ab_execute then
	wf_saveresult(li_testcaseid)
end if
end subroutine

on w_mobile_notification.create
call super::create
end on

on w_mobile_notification.destroy
call super::destroy
end on

event open;call super::open;ieon_notification = create eon_mobile_notificationex
end event

type cb_4 from w_testcase_base`cb_4 within w_mobile_notification
end type

type cb_3 from w_testcase_base`cb_3 within w_mobile_notification
end type

type cb_2 from w_testcase_base`cb_2 within w_mobile_notification
end type

type cb_1 from w_testcase_base`cb_1 within w_mobile_notification
end type

type mle_output from w_testcase_base`mle_output within w_mobile_notification
end type

type mle_2 from w_testcase_base`mle_2 within w_mobile_notification
end type

type mle_1 from w_testcase_base`mle_1 within w_mobile_notification
end type

type dw_1 from w_testcase_base`dw_1 within w_mobile_notification
end type

type gb_1 from w_testcase_base`gb_1 within w_mobile_notification
end type

type gb_2 from w_testcase_base`gb_2 within w_mobile_notification
end type

type gb_3 from w_testcase_base`gb_3 within w_mobile_notification
end type

type gb_4 from w_testcase_base`gb_4 within w_mobile_notification
end type

type gb_5 from w_testcase_base`gb_5 within w_mobile_notification
end type

