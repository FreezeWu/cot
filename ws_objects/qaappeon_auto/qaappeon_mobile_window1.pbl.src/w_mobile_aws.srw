$PBExportHeader$w_mobile_aws.srw
forward
global type w_mobile_aws from w_testcase_base
end type
type sle_1 from singlelineedit within w_mobile_aws
end type
end forward

global type w_mobile_aws from w_testcase_base
string title = "Aws Auto"
sle_1 sle_1
end type
global w_mobile_aws w_mobile_aws

type variables
eon_mobile_awsex ieon_aws
string is_appname,is_url,is_version

end variables

forward prototypes
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
end prototypes

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);//执行各测试点，需要重载该函数 ai_item返回的是datawindow的行号
string  ls_testcase,ls_rtn,ls_hinttext
long li_testcaseid,ll_rtn,ll_color

if ai_item = 0 then return

ls_testcase = dw_1.getitemstring(ai_item,"testcasename")
li_testcaseid = dw_1.getitemnumber( ai_item,"id")
ls_hinttext = 'test'
ll_color = 255
If ab_execute Then 
	wf_output("-----Test Point:" + ls_testcase + "-----", True)
End If

choose case lower(ls_testcase)
	case "aws_p001_clearlog"  
		if ab_execute then
			ll_rtn = ieon_aws.of_clearlog( )
			wf_OutPut('添加日志前ieon_aws.of_clearlog()= ' + string(ll_rtn), False)
			//添加日志后调用
			 ieon_aws.of_log(1, "Test1")
			 ieon_aws.of_log(2, "Test2")
			 ieon_aws.of_log(3, "Test3")
			 ieon_aws.of_log(4, "Test4")
			 ll_rtn = ieon_aws.of_clearlog( )
			wf_OutPut('添加日志后ieon_aws.of_clearlog()= ' + string(ll_rtn), False)
		else
			wf_scriptview("ll_rtn = ieon_aws.of_clearlog( ) ")
			wf_scriptview("wf_OutPut('添加日志前ieon_aws.of_clearlog()= ' + string(ll_rtn), False) ")
			wf_scriptview("//添加日志后调用 ")
			wf_scriptview("ieon_aws.of_log(1, ~"Test1~") ")
			wf_scriptview("ieon_aws.of_log(2, ~"Test2~") ")
			wf_scriptview("ieon_aws.of_log(3, ~"Test3~") ")
			wf_scriptview("ieon_aws.of_log(4, ~"Test4~") ")
			wf_scriptview("ll_rtn = ieon_aws.of_clearlog( ) ")
			wf_scriptview("wf_OutPut('添加日志后ieon_aws.of_clearlog()= ' + string(ll_rtn), False) ")
		end if
	case "aws_p002_log1"
		if ab_execute then
			ll_rtn = ieon_aws.of_log(1, "重大问题")
			wf_OutPut("ieon_aws.of_log(1, ~"重大问题~")" + string(ll_rtn), False)
			ll_rtn = ieon_aws.of_log(2, "Error level question")
			wf_OutPut("ieon_aws.of_log(2, ~"Error level question~")" + string(ll_rtn), False)
			ll_rtn = ieon_aws.of_log(3, "Warning级别错误")
			wf_OutPut("ieon_aws.of_log(3, ~"Warning级别错误~")" + string(ll_rtn), False)
		else
			wf_scriptview('ll_rtn = ieon_aws.of_log(1, "重大问题")   ')
			wf_scriptview('wf_OutPut("ieon_aws.of_log(1, ~"重大问题~")" + string(ll_rtn), False)   ')
			wf_scriptview('ll_rtn = ieon_aws.of_log(2, "Error level question")   ')
			wf_scriptview('wf_OutPut("ieon_aws.of_log(2, ~"Error level question~")" + string(ll_rtn), False)   ')
			wf_scriptview('ll_rtn = ieon_aws.of_log(3, "Warning级别错误")   ')
			wf_scriptview('wf_OutPut("ieon_aws.of_log(3, ~"Warning级别错误~")" + string(ll_rtn), False)   ')
		end if
	case "aws_p003_log2"
		if ab_execute then
			ll_rtn = ieon_aws.of_log(4, "Info通知类问题")
			wf_OutPut("ieon_aws.of_log(4, ~"Info通知类问题~")" + string(ll_rtn), False)
			ll_rtn = ieon_aws.of_log(5, "调试级别日志")
			wf_OutPut("ieon_aws.of_log(5, ~"调试级别日志~")" + string(ll_rtn), False)
			ll_rtn = ieon_aws.of_log(6, "无对应级别日志")
			wf_OutPut("ieon_aws.of_log(6, ~"无对应级别日志~")" + string(ll_rtn), False)
			ll_rtn = ieon_aws.of_log(0, "错误级别日志1")
			wf_OutPut("ieon_aws.of_log(0, ~"错误级别日志1~")" + string(ll_rtn), False)
			ll_rtn = ieon_aws.of_log(-1, "错误级别日志2")
			wf_OutPut("ieon_aws.of_log(-1, ~"错误级别日志2~")" + string(ll_rtn), False)
		else
			wf_scriptview('ll_rtn = ieon_aws.of_log(4, "Info通知类问题")   ')
			wf_scriptview('wf_OutPut("ieon_aws.of_log(4, ~"Info通知类问题~")" + string(ll_rtn), False)   ')
			wf_scriptview('ll_rtn = ieon_aws.of_log(5, "调试级别日志")   ')
			wf_scriptview('wf_OutPut("ieon_aws.of_log(5, ~"调试级别日志~")" + string(ll_rtn), False)   ')
			wf_scriptview('ll_rtn = ieon_aws.of_log(6, "无对应级别日志")   ')
			wf_scriptview('wf_OutPut("ieon_aws.of_log(6, ~"无对应级别日志~")" + string(ll_rtn), False)   ')
			wf_scriptview('ll_rtn = ieon_aws.of_log(0, "错误级别日志1")   ')
			wf_scriptview('wf_OutPut("ieon_aws.of_log(0, ~"错误级别日志1~")" + string(ll_rtn), False)   ')
			wf_scriptview('ll_rtn = ieon_aws.of_log(-1, "错误级别日志2")   ')
			wf_scriptview('wf_OutPut("ieon_aws.of_log(-1, ~"错误级别日志2~")" + string(ll_rtn), False)   ')		
		end if
		case "aws_p004_getassistivetouchmode"
			if ab_execute then
				ll_rtn = ieon_aws.of_getassistivetouchmode()
				wf_OutPut('ieon_aws.of_getassistivetouchmode() =' + string(ll_rtn), False)
			else
				wf_scriptview("ll_rtn = ieon_aws.of_getassistivetouchmode() ")
				wf_scriptview("wf_OutPut('ieon_aws.of_getassistivetouchmode() =' + string(ll_rtn), False) ")
			end if				
		case "aws_p005_setassistivetouchmode"
			if ab_execute then
				ieon_aws.of_setassistivetouchmode(0)
				ll_rtn = ieon_aws.of_getassistivetouchmode()
				wf_OutPut('ieon_aws.of_setassistivetouchmode(0) =' + string(ll_rtn), False)
				ieon_aws.of_setassistivetouchmode(1)
				ll_rtn = ieon_aws.of_getassistivetouchmode()
				wf_OutPut(' ieon_aws.of_setassistivetouchmode(1) =' + string(ll_rtn), False)
				ieon_aws.of_setassistivetouchmode(2)
				ll_rtn = ieon_aws.of_getassistivetouchmode()
				wf_OutPut(' ieon_aws.of_setassistivetouchmode(2) = ' + string(ll_rtn), False)
				ieon_aws.of_setassistivetouchmode(0)
				ll_rtn = ieon_aws.of_getassistivetouchmode()
				wf_OutPut(' 设置未原始值=' + string(ll_rtn), False)
				wf_OutPut('该函数可设置参数0,1,2  返回-1则是错误的', False)				
			else
				wf_scriptview("ieon_aws.of_setassistivetouchmode(0) ")
				wf_scriptview("ll_rtn = ieon_aws.of_getassistivetouchmode() ")
				wf_scriptview("wf_OutPut('ieon_aws.of_setassistivetouchmode(0) =' + string(ll_rtn), False) ")
				wf_scriptview("ieon_aws.of_setassistivetouchmode(1) ")
				wf_scriptview("ll_rtn = ieon_aws.of_getassistivetouchmode() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_setassistivetouchmode(1) =' + string(ll_rtn), False) ")
				wf_scriptview("ieon_aws.of_setassistivetouchmode(2) ")
				wf_scriptview("ll_rtn = ieon_aws.of_getassistivetouchmode() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_setassistivetouchmode(2) = ' + string(ll_rtn), False) ")
				wf_scriptview("ieon_aws.of_setassistivetouchmode(3) ")
				wf_scriptview("ll_rtn = ieon_aws.of_getassistivetouchmode() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_setassistivetouchmode(3)=' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('该函数可设置参数0,1,2  返回-1则是错误的', False)		 ")
			end if
		case "aws_p006_getassistivetouchbtnvisible"
			if ab_execute then
				ll_rtn = ieon_aws.of_getassistivetouchbtnvisible()
				wf_OutPut(' ieon_aws.of_getassistivetouchbtnvisible() = ' + string(ll_rtn), False)
				wf_OutPut('值：1可视，0不可视，-1发生错误！', False)
			else
				wf_scriptview("ll_rtn = ieon_aws.of_getassistivetouchbtnvisible() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_getassistivetouchbtnvisible() = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('值：1可视，0不可视，-1发生错误！', False) ")
			end if
		case "aws_p007_setassistivetouchbtnvisible"
			if ab_execute then
				ieon_aws.of_setassistivetouchbtnvisible(0)
				ll_rtn = ieon_aws.of_getassistivetouchbtnvisible()
				wf_OutPut(' ieon_aws.of_getassistivetouchbtnvisible(0) = ' + string(ll_rtn), False)	
				ieon_aws.of_setassistivetouchbtnvisible(1)
				ll_rtn = ieon_aws.of_getassistivetouchbtnvisible()
				wf_OutPut(' ieon_aws.of_getassistivetouchbtnvisible(1) = ' + string(ll_rtn), False)	
				ieon_aws.of_setassistivetouchbtnvisible(0)
				ll_rtn = ieon_aws.of_getassistivetouchbtnvisible()
				wf_OutPut(' 再设置为原值，不显示 ' + string(ll_rtn), False)	
			else
				wf_scriptview("ieon_aws.of_setassistivetouchbtnvisible(0) ")
				wf_scriptview("ll_rtn = ieon_aws.of_getassistivetouchbtnvisible() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_getassistivetouchbtnvisible(0) = ' + string(ll_rtn), False)	 ")
				wf_scriptview("ieon_aws.of_setassistivetouchbtnvisible(1) ")
				wf_scriptview("ll_rtn = ieon_aws.of_getassistivetouchbtnvisible() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_getassistivetouchbtnvisible(1) = ' + string(ll_rtn), False)	 ")
				wf_scriptview("ieon_aws.of_setassistivetouchbtnvisible(0) ")
				wf_scriptview("ll_rtn = ieon_aws.of_getassistivetouchbtnvisible() ")
				wf_scriptview("wf_OutPut(' 再设置为原值，不显示 ' + string(ll_rtn), False)		 ")		
			end if
		case "aws_p008_getapporientation"
			if ab_execute then
				ll_rtn =ieon_aws.of_getapporientation()
				wf_OutPut('ieon_aws.of_getapporientation() = ' + string(ll_rtn), False)		
			else
				wf_scriptview("ll_rtn = ieon_aws.of_getapporientation() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_getapporientation() = ' + string(ll_rtn), False)		 ")
			end if
		case "aws_p009_setapporientation"
			if ab_execute then 
					ieon_aws.of_setapporientation(1)
					ieon_aws.of_setapprotationlock(1)				
					ll_rtn =ieon_aws.of_getapporientation()
					wf_OutPut(' 设置应用为纵向并锁定ieon_aws.of_setapporientation(1) = ' + string(ll_rtn), False)	
					ieon_aws.of_setapprotationlock(0)			
					ll_rtn = ieon_aws.of_setapporientation(2)
					ieon_aws.of_setapprotationlock(1)				
					ll_rtn =ieon_aws.of_getapporientation()
					wf_OutPut(' 设置应用为横向并锁定ieon_aws.of_setapporientation(2) = ' + string(ll_rtn), False)		
					ieon_aws.of_setapprotationlock(0)		
					wf_OutPut('of_setapporientation函数 1为纵向，2为横向 ' , False)	
			else
					wf_scriptview("ieon_aws.of_setapporientation(1) ")
					wf_scriptview("ieon_aws.of_setapprotationlock(1)				 ")
					wf_scriptview("ll_rtn =ieon_aws.of_getapporientation() ")
					wf_scriptview("wf_OutPut(' 设置应用为纵向并锁定ieon_aws.of_setapporientation(1) = ' + string(ll_rtn), False)	 ")
					wf_scriptview("ieon_aws.of_setapprotationlock(0)			 ")
					wf_scriptview("ll_rtn = ieon_aws.of_setapporientation(2) ")
					wf_scriptview("ieon_aws.of_setapprotationlock(1)				 ")
					wf_scriptview("ll_rtn =ieon_aws.of_getapporientation() ")
					wf_scriptview("wf_OutPut(' 设置应用为横向并锁定ieon_aws.of_setapporientation(2) = ' + string(ll_rtn), False)		 ")
					wf_scriptview("ieon_aws.of_setapprotationlock(0)	 ")
					wf_scriptview("wf_OutPut('of_setapporientation函数 1为纵向,2为横向 ' )	 ")
			end if
		case "aws_p010_getapprotationlock"
			if ab_execute then 
				ll_rtn = ieon_aws.of_getapprotationlock()
				wf_OutPut(' ieon_aws.of_getapprotationlock() = ' + string(ll_rtn), False)
				wf_OutPut('获取当前应用方向是否锁定 ' , False)
			else
				wf_scriptview("ll_rtn = ieon_aws.of_getapprotationlock() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_getapprotationlock() = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('获取当前应用方向是否锁定 ' , False) ")
			end if
		case "aws_p011_setapprotationlock"
			if ab_execute then 
					ieon_aws.of_setapporientation(1)
					ieon_aws.of_setapprotationlock(1)				
					ll_rtn =ieon_aws.of_getapprotationlock()
					wf_OutPut(' 设置应用的方向并锁定ieon_aws.of_getapprotationlock(1) = ' + string(ll_rtn), False)	
					ieon_aws.of_setapprotationlock(0)	
					ll_rtn =ieon_aws.of_getapprotationlock()
					wf_OutPut(' 设置应用的方向并锁定ieon_aws.of_getapprotationlock(1) = ' + string(ll_rtn), False)	
					ieon_aws.of_setapporientation(2)
					wf_OutPut('of_setapprotationlock 1为锁定应用屏幕方向,0为解锁 ' , False)		
			else
					wf_scriptview("ieon_aws.of_setapporientation(1) ")
					wf_scriptview("ieon_aws.of_setapprotationlock(1)				 ")
					wf_scriptview("ll_rtn =ieon_aws.of_getapprotationlock() ")
					wf_scriptview("wf_OutPut(' 设置应用的方向并锁定ieon_aws.of_getapprotationlock(1) = ' + string(ll_rtn), False)	 ")
					wf_scriptview("ieon_aws.of_setapprotationlock(0)	 ")
					wf_scriptview("ll_rtn =ieon_aws.of_getapprotationlock() ")
					wf_scriptview("wf_OutPut(' 设置应用的方向并锁定ieon_aws.of_getapprotationlock(1) = ' + string(ll_rtn), False)	 ")
					wf_scriptview("ieon_aws.of_setapporientation(2) ")
					wf_scriptview("wf_OutPut('of_setapprotationlock 1为锁定应用屏幕方向,0为解锁 ' , False)	 ")
			end if
		case "aws_p012_gettitlebarvisible"
			if ab_execute then 
				ll_rtn = ieon_aws.of_gettitlebarvisible()
				wf_OutPut(' ieon_aws.of_gettitlebarvisible() = ' + string(ll_rtn), False)
			else
				wf_scriptview("ll_rtn = ieon_aws.of_gettitlebarvisible() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_gettitlebarvisible() = ' + string(ll_rtn), False) ")
			end if
		case "aws_p013_settitlebarvisible"
			if ab_execute then 
				ieon_aws.of_settitlebarvisible(0)
				ll_rtn = ieon_aws.of_gettitlebarvisible()
				wf_OutPut(' ieon_aws.of_settitlebarvisible(0) = ' + string(ll_rtn), False)	
				ieon_aws.of_settitlebarvisible(1)
				ll_rtn = ieon_aws.of_gettitlebarvisible()
				wf_OutPut(' ieon_aws.of_settitlebarvisible(1) = ' + string(ll_rtn), False)	
				ieon_aws.of_settitlebarvisible(2)
				ll_rtn = ieon_aws.of_gettitlebarvisible()
				wf_OutPut(' ieon_aws.of_settitlebarvisible(2) = ' + string(ll_rtn), False)	
				ieon_aws.of_settitlebarvisible(1) 
				wf_OutPut('设置title为显示状态', False)
			else
				wf_scriptview("ieon_aws.of_settitlebarvisible(0) ")
				wf_scriptview("ll_rtn = ieon_aws.of_gettitlebarvisible() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_settitlebarvisible(0) = ' + string(ll_rtn), False)	 ")
				wf_scriptview("ieon_aws.of_settitlebarvisible(1) ")
				wf_scriptview("ll_rtn = ieon_aws.of_gettitlebarvisible() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_settitlebarvisible(1) = ' + string(ll_rtn), False)	 ")
				wf_scriptview("ieon_aws.of_settitlebarvisible(2) ")
				wf_scriptview("ll_rtn = ieon_aws.of_gettitlebarvisible() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_settitlebarvisible(2) = ' + string(ll_rtn), False)	 ")
				wf_scriptview("ieon_aws.of_settitlebarvisible(1) ")
				wf_scriptview("wf_OutPut('设置title为显示状态', False) ")
			end if
		case "aws_p014_getappinfo"
			if ab_execute then 
				ll_rtn = ieon_aws.of_getappinfo(is_appname,is_url)
				wf_OutPut(' ieon_aws.of_getappinfo() = ' + string(ll_rtn), False)	
				wf_OutPut(' Appname = ' + is_appname+"~r~n", False)	
				wf_OutPut(' URL = ' + is_url, False)	
				wf_OutPut('获取当前应用名，URL', False)
			else
				wf_scriptview("ll_rtn = ieon_aws.of_getappinfo(is_appname,is_url) ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_getappinfo() = ' + string(ll_rtn), False)	 ")
				wf_scriptview("wf_OutPut(' Appname = ' + is_appname, False)	 ")
				wf_scriptview("wf_OutPut(' URL = ' + is_url, False)		 ")
				wf_scriptview("wf_OutPut('获取当前应用名，URL', False) ")
			end if
		case "aws_p015_getversion"
			if ab_execute then 
				ll_rtn = ieon_aws.of_getversion(is_version)
				wf_OutPut(' ieon_aws.of_getversion() = ' + string(ll_rtn), False)	
				wf_OutPut('aws_version = ' + is_version, False)	
			else
				wf_scriptview("ll_rtn = ieon_aws.of_getversion(is_version) ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_getversion() = ' + string(ll_rtn), False)	 ")
				wf_scriptview("wf_OutPut('aws_version = ' + is_version, False)	 ")
			end if
		case "aws_p016_setwindowlisticonvisible"
			if ab_execute then 
				ieon_aws.of_setwindowlisticonvisible(0)
				ll_rtn = ieon_aws.of_getwindowlisticonvisible()
				wf_OutPut(' ieon_aws.of_setwindowlisticonvisible(0) = ' + string(ll_rtn), False)	
				ieon_aws.of_setwindowlisticonvisible(1)
				ll_rtn = ieon_aws.of_getwindowlisticonvisible()
				wf_OutPut(' ieon_aws.of_setwindowlisticonvisible(1) = ' + string(ll_rtn), False)	
				wf_OutPut('0为不可视，1为可视', False)
			else
				wf_scriptview("ieon_aws.of_setwindowlisticonvisible(0) ")
				wf_scriptview("ll_rtn = ieon_aws.of_getwindowlisticonvisible() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_setwindowlisticonvisible(0) = ' + string(ll_rtn), False)	 ")
				wf_scriptview("ieon_aws.of_setwindowlisticonvisible(1) ")
				wf_scriptview("ll_rtn = ieon_aws.of_getwindowlisticonvisible() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_setwindowlisticonvisible(1) = ' + string(ll_rtn), False)	 ")
				wf_scriptview("wf_OutPut('0为不可视，1为可视', False) ")
			end if
		case "aws_p017_getwindowlisticonvisible"
			if ab_execute then 
				ll_rtn = ieon_aws.of_getwindowlisticonvisible()
				wf_OutPut(' ieon_aws.of_getwindowlisticonvisible() = ' + string(ll_rtn), False)
			else
				wf_scriptview("ll_rtn = ieon_aws.of_getwindowlisticonvisible() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_getwindowlisticonvisible() = ' + string(ll_rtn), False) ")
			end if
		case "aws_p018_setcloseappiconvisible"
			if ab_execute then 
				ieon_aws.of_setcloseappiconvisible(0,'Close','Are you sure to close the application ?')
				ll_rtn = ieon_aws.of_getcloseappiconvisible()
				wf_OutPut(' ieon_aws.of_setcloseappiconvisible(0,"Close","Are you sure to close the application ?") = ' + string(ll_rtn), False)	
				ieon_aws.of_setcloseappiconvisible(1,'中国VSAmeric,&*^','Test Test Test')
				ll_rtn = ieon_aws.of_getcloseappiconvisible()
				wf_OutPut(' ieon_aws.of_setcloseappiconvisible(1,"中国VSAmeric,&*^","Test Test Test") = ' + string(ll_rtn), False)	
				wf_OutPut('关闭应用程序图标是否可见  0为不可视，1为可视', False)
			else	
				wf_scriptview("ll_rtn = ieon_aws.of_setcloseappiconvisible(2,'Appeon','I want to Test whether it can be closed or not') ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_setcloseappiconvisible(2,~"Appeon~",~"I want to Test whether it can be closed or not~")= ' + string(ll_rtn), False)	 ")
				wf_scriptview("ll_rtn = ieon_aws.of_setcloseappiconvisible(0,'Close','Are you sure to close the application ?') ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_setcloseappiconvisible(0,~"Close~",~"Are you sure to close the application ?~") = ' + string(ll_rtn), False)	 ")
				wf_scriptview("ll_rtn = ieon_aws.of_setcloseappiconvisible(1,'中国VSAmeric,&*^','Test Test Test') ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_setcloseappiconvisible(1,~"中国VSAmeric,&*^~",~"Test Test Test~") = ' + string(ll_rtn), False)	 ")
				wf_scriptview("wf_OutPut('关闭应用程序图标是否可见 0为不可视，1为可视', False) ")

			end if
		case "aws_p019_getcloseappiconvisible"
			if ab_execute then 
				ll_rtn = ieon_aws.of_getcloseappiconvisible()
				wf_OutPut(' ieon_aws.of_getcloseappiconvisible() = ' + string(ll_rtn), False)
			else
				wf_scriptview("ll_rtn = ieon_aws.of_getcloseappiconvisible() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_getcloseappiconvisible() = ' + string(ll_rtn), False) ")
			end if
		case "aws_p020_setdwmousemovemode"
			if ab_execute then 
				ieon_aws.of_setdwmousemovemode(0)
				ll_rtn = ieon_aws.of_getdwmousemovemode()
				wf_OutPut(' ieon_aws.of_setdwmousemovemode(0) = ' + string(ll_rtn), False)	
				ieon_aws.of_setdwmousemovemode(1)
				ll_rtn = ieon_aws.of_getdwmousemovemode()
				wf_OutPut(' ieon_aws.of_setdwmousemovemode(1) = ' + string(ll_rtn), False)	
				wf_OutPut('设置是否支持DataWindow的pbm_dwnmousemove事件ID 0不支持，1支持', False)
			else
				wf_scriptview("ieon_aws.of_setdwmousemovemode(0) ")
				wf_scriptview("ll_rtn = ieon_aws.of_getdwmousemovemode() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_setdwmousemovemode(0) = ' + string(ll_rtn), False)	 ")
				wf_scriptview("ieon_aws.of_setdwmousemovemode(1) ")
				wf_scriptview("ll_rtn = ieon_aws.of_getdwmousemovemode() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_setdwmousemovemode(1) = ' + string(ll_rtn), False)	 ")
				wf_scriptview("wf_OutPut('设置是否支持DataWindow的pbm_dwnmousemove事件ID 0不支持，1支持', False) ")
			end if
		case "aws_p021_getdwmousemovemode"
			if ab_execute then 
				ll_rtn = ieon_aws.of_getdwmousemovemode()
				wf_OutPut(' ieon_aws.of_getdwmousemovemode() = ' + string(ll_rtn), False)
			else
				wf_scriptview("ll_rtn = ieon_aws.of_getdwmousemovemode() ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_getdwmousemovemode() = ' + string(ll_rtn), False) ")
			end if
		case "aws_p022_sethinttext"
			if ab_execute then
				ll_rtn = ieon_aws.of_sethinttext(sle_1,ls_hinttext)
				wf_OutPut(' ieon_aws.of_sethinttext() = ' + string(ll_rtn), False)
			else
				wf_scriptview("ll_rtn = ieon_aws.of_sethinttext(sle_1,ls_hinttext) ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_sethinttext() = ' + string(ll_rtn), False) ")
			end if			
		case "aws_p023_sethinttextcolor"
			if ab_execute then
				ll_rtn = ieon_aws.of_sethinttextcolor(sle_1,ll_color)
				wf_OutPut(' ieon_aws.of_sethinttextcolor() = ' + string(ll_rtn), False)
			else
				wf_scriptview("ll_rtn = ieon_aws.of_sethinttextcolor(sle_1,ll_color) ")
				wf_scriptview("wf_OutPut(' ieon_aws.of_sethinttextcolor() = ' + string(ll_rtn), False) ")
			end if
	case else
		messagebox("Error",ls_testcase+"has no coding")
end choose

//保存执行的数据
if ab_execute then
	wf_saveresult(li_testcaseid)
end if
end subroutine

on w_mobile_aws.create
int iCurrent
call super::create
this.sle_1=create sle_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
end on

on w_mobile_aws.destroy
call super::destroy
destroy(this.sle_1)
end on

event open;call super::open;ieon_aws = create eon_mobile_awsex
end event

type cb_4 from w_testcase_base`cb_4 within w_mobile_aws
end type

type cb_3 from w_testcase_base`cb_3 within w_mobile_aws
end type

type cb_2 from w_testcase_base`cb_2 within w_mobile_aws
end type

type cb_1 from w_testcase_base`cb_1 within w_mobile_aws
end type

type mle_output from w_testcase_base`mle_output within w_mobile_aws
end type

type mle_2 from w_testcase_base`mle_2 within w_mobile_aws
end type

type mle_1 from w_testcase_base`mle_1 within w_mobile_aws
end type

type dw_1 from w_testcase_base`dw_1 within w_mobile_aws
end type

type gb_1 from w_testcase_base`gb_1 within w_mobile_aws
end type

type gb_2 from w_testcase_base`gb_2 within w_mobile_aws
end type

type gb_3 from w_testcase_base`gb_3 within w_mobile_aws
end type

type gb_4 from w_testcase_base`gb_4 within w_mobile_aws
end type

type gb_5 from w_testcase_base`gb_5 within w_mobile_aws
end type

type sle_1 from singlelineedit within w_mobile_aws
integer x = 343
integer y = 1728
integer width = 457
integer height = 132
integer taborder = 50
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

