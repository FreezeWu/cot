$PBExportHeader$w_mobile_webview.srw
forward
global type w_mobile_webview from w_testcase_base
end type
type dw_2 from datawindow within w_mobile_webview
end type
type uo_1 from eon_mobile_webviewex within w_mobile_webview
end type
end forward

global type w_mobile_webview from w_testcase_base
dw_2 dw_2
uo_1 uo_1
end type
global w_mobile_webview w_mobile_webview

type variables
eon_mobile_awsex  ieon_aws

string is_file[],is_filepath,is_url,is_filename,is_filetype,is_htmlstring,is_jsstring,is_appurl
string is_htmlfile
boolean ib_filetitle
end variables

forward prototypes
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
end prototypes

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);//执行各测试点，需要重载该函数 ai_item返回的是datawindow的行号
string  ls_testcase,ls_rtn,ls_file,ls_data
long li_testcaseid,ll_rtn,ll_filenum
blob lb_data
integer li_rtn

if ai_item = 0 then return

ls_testcase = dw_1.getitemstring(ai_item,"testcasename")
li_testcaseid = dw_1.getitemnumber( ai_item,"id")
If ab_execute Then 
	wf_output("-----Test Point:" + ls_testcase + "-----", True)
End If

choose case ls_testcase
		case "webview_p001_startloading"
			if ab_execute then
				//Starts the loading of the page.
				//Returns:  integer. 
				//1 - Success.
				//-1 - It is called in PowerBuilder or Appeon Web, or there is an error.
				is_url = '192.0.3.99/AEM'
				ll_rtn = uo_1.of_startloading(is_url)
				wf_OutPut('The return of of_startloading(' +is_url+ ') = ' + string(ll_rtn), False)
				if ll_rtn = -1 then
					wf_OutPut('of_startloading failed error message:' +uo_1.is_errortext, False)
				end if
				is_url = 'www.baidu.com'
				ll_rtn = uo_1.of_startloading(is_url)
				wf_OutPut('The return of of_startloading(' +is_url+ ') = ' + string(ll_rtn), False)
				if ll_rtn = -1 then
					wf_OutPut('of_startloading failed error message:' +uo_1.is_errortext, False)
				end if
				is_url = 'www.appeon.com'
				ll_rtn = uo_1.of_startloading(is_url)
				wf_OutPut('The return of of_startloading(' +is_url+ ') = ' + string(ll_rtn), False)
				if ll_rtn = -1 then
					wf_OutPut('of_startloading failed error message:' +uo_1.is_errortext, False)
				end if
				uo_1.of_stoploading()
			else
				wf_scriptview("//Starts the loading of the page. ")
				wf_scriptview("//Returns:  integer. ")
				wf_scriptview("//1 - Success. ")
				wf_scriptview("//-1 - It is called in PowerBuilder or Appeon Web, or there is an error. ")
				wf_scriptview("is_url = '192.0.3.99/AEM' ")
				wf_scriptview("ll_rtn = uo_1.of_startloading(is_url) ")
				wf_scriptview("wf_OutPut('The return of of_startloading(' +is_url+ ') = ' + string(ll_rtn), False) ")
				wf_scriptview("if ll_rtn = -1 then ")
				wf_scriptview("	wf_OutPut('of_startloading failed error message:' +uo_1.is_errortext, False) ")
				wf_scriptview("end if ")
				wf_scriptview("is_url = 'www.baidu.com' ")
				wf_scriptview("ll_rtn = uo_1.of_startloading(is_url) ")
				wf_scriptview("wf_OutPut('The return of of_startloading(' +is_url+ ') = ' + string(ll_rtn), False) ")
				wf_scriptview("if ll_rtn = -1 then ")
				wf_scriptview("	wf_OutPut('of_startloading failed error message:' +uo_1.is_errortext, False) ")
				wf_scriptview("end if ")
				wf_scriptview("is_url = 'www.appeon.com' ")
				wf_scriptview("ll_rtn = uo_1.of_startloading(is_url) ")
				wf_scriptview("wf_OutPut('The return of of_startloading(' +is_url+ ') = ' + string(ll_rtn), False) ")
				wf_scriptview("if ll_rtn = -1 then ")
				wf_scriptview("	wf_OutPut('of_startloading failed error message:' +uo_1.is_errortext, False) ")
				wf_scriptview("end if ")
				wf_scriptview("uo_1.of_stoploading() ")
			end if
		case "webview_p002_reload"
			if ab_execute then
				//Reloads the current page.
				is_url = 'www.appeon.com'
				uo_1.of_startloading(is_url)
				ll_rtn = uo_1.of_reload()
				wf_OutPut('The return of of_reload() = ' +string(ll_rtn), False)
				uo_1.of_stoploading()
			else
				wf_scriptview("//Reloads the current page. ")
				wf_scriptview("is_url = 'www.appeon.com' ")
				wf_scriptview("uo_1.of_startloading(is_url) ")
				wf_scriptview("ll_rtn = uo_1.of_reload() ")
				wf_scriptview("wf_OutPut('The return of of_reload() = ' +string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_stoploading() ")
			end if
		case "webview_p003_stoploading"
			if ab_execute then
				//Stops the loading of the current page.
				is_url = 'www.baidu.com'
				uo_1.of_startloading(is_url)
				ll_rtn = uo_1.of_stoploading()
				wf_OutPut('The return of of_stoploading() = ' +string(ll_rtn), False)
			else
				wf_scriptview("//Stops the loading of the current page. ")
				wf_scriptview("is_url = 'www.baidu.com' ")
				wf_scriptview("uo_1.of_startloading(is_url) ")
				wf_scriptview("ll_rtn = uo_1.of_stoploading() ")
				wf_scriptview("wf_OutPut('The return of of_stoploading() = ' +string(ll_rtn), False) ")
			end if
		case "webview_p004_runjavascript"
			if ab_execute then
				//Runs the JavaScript code snippet.
				//1 - If the as_strret parameter returns a non-empty string.
				//-1 - If the as_strret parameter returns an empty string, or if it is called in PowerBuilder or Appeon Web
				is_url = 'www.appeon.com'
				ll_rtn = uo_1.of_startloading(is_url)
				wf_OutPut('The return of of_startloading('+is_url+') = ' +string(ll_rtn), False)
				sleep(5)		//wait to load the website
				is_jsstring = 'document.title'
				ll_rtn = uo_1.of_runjavascript(is_jsstring,ls_data)
				wf_OutPut('The return of of_runjavascript('+is_jsstring+') = ' +string(ll_rtn), False)
				wf_OutPut('The return value = ' +ls_data, False)
				is_jsstring = 'javascript:document.title'
				ll_rtn = uo_1.of_runjavascript(is_jsstring,ls_data)
				wf_OutPut('The return of of_runjavascript('+is_jsstring+') = ' +string(ll_rtn), False)
				wf_OutPut('The return value = ' +ls_data, False)
				uo_1.of_stoploading()
			else
				wf_scriptview("//Runs the JavaScript code snippet. ")
				wf_scriptview("//1 - If the as_strret parameter returns a non-empty string. ")
				wf_scriptview("//-1 - If the as_strret parameter returns an empty string, or if it is called in PowerBuilder or Appeon Web ")
				wf_scriptview("is_url = 'www.appeon.com' ")
				wf_scriptview("ll_rtn = uo_1.of_startloading(is_url) ")
				wf_scriptview("wf_OutPut('The return of of_startloading('+is_url+') = ' +string(ll_rtn), False) ")
				wf_scriptview("sleep(5)		//wait to load the website ")
				wf_scriptview("is_jsstring = 'document.title' ")
				wf_scriptview("ll_rtn = uo_1.of_runjavascript(is_jsstring,ls_data) ")
				wf_scriptview("wf_OutPut('The return of of_runjavascript('+is_jsstring+') = ' +string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('The return value = ' +ls_data, False) ")
				wf_scriptview("is_jsstring = 'javascript:document.title' ")
				wf_scriptview("ll_rtn = uo_1.of_runjavascript(is_jsstring,ls_data) ")
				wf_scriptview("wf_OutPut('The return of of_runjavascript('+is_jsstring+') = ' +string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('The return value = ' +ls_data, False) ")
				wf_scriptview("uo_1.of_stoploading() ")
			end if		
		case "webview_p005_loadhtmlstring"
			if ab_execute then
				//Loads the string of the HTML page. Only HTM or HTML file is supported.
				is_htmlfile = 'customer.html'
				ls_file = 'customer.html'
				li_rtn = dw_2.saveas(ls_file,HTMLTable!,false)
				wf_OutPut(' Save file to be ' +ls_file+ ' The save() return value: ' + string(li_rtn), False)
				if fileexists(appeongetcachedir() +'\plugin\'+is_htmlfile) then
					ll_filenum = fileopen(appeongetcachedir() +'\plugin\'+is_htmlfile,textmode!,read!,shared!)
					filereadex(ll_filenum,is_htmlstring)
					fileclose(ll_filenum)
					ll_rtn = uo_1.of_loadhtmlstring(is_htmlstring)
					wf_OutPut('The return of of_loadhtmlstring('+is_htmlfile+') = ' +string(ll_rtn), False)
					filedelete(appeongetcachedir() +'\plugin\'+is_htmlfile)
				else
					ll_rtn = uo_1.of_loadhtmlstring('')
					wf_OutPut(is_htmlfile+' not exists. The return of of_loadhtmlstring() = ' +string(ll_rtn), False)
				end if
				is_htmlfile = 'customer.xml'
				ls_file = 'customer.xml'
				li_rtn = dw_2.saveas(ls_file,XML!,false)
				wf_OutPut(' Save file to be ' +ls_file+ ' The save() return value: ' + string(li_rtn), False)
				if fileexists(appeongetcachedir() +'\plugin\'+is_htmlfile) then
					ll_filenum = fileopen(appeongetcachedir() +'\plugin\'+is_htmlfile,textmode!,read!,shared!)
					filereadex(ll_filenum,is_htmlstring)
					fileclose(ll_filenum)
					ll_rtn = uo_1.of_loadhtmlstring(is_htmlstring)
					wf_OutPut('The return of of_loadhtmlstring('+is_htmlfile+') = ' +string(ll_rtn), False)
					filedelete(appeongetcachedir() +'\plugin\'+is_htmlfile)
				else
					ll_rtn = uo_1.of_loadhtmlstring('')
					wf_OutPut(is_htmlfile+' not exists. The return of of_loadhtmlstring() = ' +string(ll_rtn), False)
				end if
			else
				wf_scriptview("//Loads the string of the HTML page. Only HTM or HTML file is supported. ")
				wf_scriptview("is_htmlfile = 'customer.html' ")
				wf_scriptview("ls_file = 'customer.html' ")
				wf_scriptview("li_rtn = dw_2.saveas(ls_file,HTMLTable!,false) ")
				wf_scriptview("wf_OutPut(' Save file to be ' +ls_file+ ' The save() return value: ' + string(li_rtn), False) ")
				wf_scriptview("if fileexists(appeongetcachedir() +'\plugin\'+is_htmlfile) then ")
				wf_scriptview("	ll_filenum = fileopen(appeongetcachedir() +'\plugin\'+is_htmlfile,textmode!,read!,shared!) ")
				wf_scriptview("	filereadex(ll_filenum,is_htmlstring) ")
				wf_scriptview("	fileclose(ll_filenum) ")
				wf_scriptview("	ll_rtn = uo_1.of_loadhtmlstring(is_htmlstring) ")
				wf_scriptview("	wf_OutPut('The return of of_loadhtmlstring('+is_htmlfile+') = ' +string(ll_rtn), False) ")
				wf_scriptview("	filedelete(appeongetcachedir() +'\plugin\'+is_htmlfile) ")
				wf_scriptview("else ")
				wf_scriptview("	ll_rtn = uo_1.of_loadhtmlstring('') ")
				wf_scriptview("	wf_OutPut(is_htmlfile+' not exists. The return of of_loadhtmlstring() = ' +string(ll_rtn), False) ")
				wf_scriptview("end if ")
				wf_scriptview("is_htmlfile = 'customer.xml' ")
				wf_scriptview("ls_file = 'customer.xml' ")
				wf_scriptview("li_rtn = dw_2.saveas(ls_file,XML!,false) ")
				wf_scriptview("wf_OutPut(' Save file to be ' +ls_file+ ' The save() return value: ' + string(li_rtn), False) ")
				wf_scriptview("if fileexists(appeongetcachedir() +'\plugin\'+is_htmlfile) then ")
				wf_scriptview("	ll_filenum = fileopen(appeongetcachedir() +'\plugin\'+is_htmlfile,textmode!,read!,shared!) ")
				wf_scriptview("	filereadex(ll_filenum,is_htmlstring) ")
				wf_scriptview("	fileclose(ll_filenum) ")
				wf_scriptview("	ll_rtn = uo_1.of_loadhtmlstring(is_htmlstring) ")
				wf_scriptview("	wf_OutPut('The return of of_loadhtmlstring('+is_htmlfile+') = ' +string(ll_rtn), False) ")
				wf_scriptview("	filedelete(appeongetcachedir() +'\plugin\'+is_htmlfile) ")
				wf_scriptview("else ")
				wf_scriptview("	ll_rtn = uo_1.of_loadhtmlstring('') ")
				wf_scriptview("	wf_OutPut(is_htmlfile+' not exists. The return of of_loadhtmlstring() = ' +string(ll_rtn), False) ")
				wf_scriptview("end if ")				
			end if
		case "webview_p006_loadlocalfile"
			if ab_execute then
				//Loads and displays the local file.
				is_filepath = 'customer.html'
				ls_file = appeongetcachedir() +'\plugin\'+is_filepath
				li_rtn = dw_2.saveas(is_filepath,HTMLTable!,false)
				if fileexists(ls_file) then
					ll_rtn = uo_1.of_loadlocalfile(ls_file)
					wf_OutPut('The return of of_loadlocalfile('+is_filepath+') = ' +string(ll_rtn), False)
					filedelete(ls_file)
				else
					ll_rtn = uo_1.of_loadlocalfile('')
					wf_OutPut(is_filepath+ 'not exists. The return of of_loadlocalfile() = ' +string(ll_rtn), False)
				end if
				is_filepath = 'customer.xml'
				ls_file = appeongetcachedir() +'\plugin\'+is_filepath
				li_rtn = dw_2.saveas(is_filepath,XML!,false)
				if fileexists(ls_file) then
					ll_rtn = uo_1.of_loadlocalfile(ls_file)
					wf_OutPut('The return of of_loadlocalfile('+is_filepath+') = ' +string(ll_rtn), False)
					filedelete(ls_file)
				else
					ll_rtn = uo_1.of_loadlocalfile('')
					wf_OutPut(is_filepath+ 'not exists. The return of of_loadlocalfile() = ' +string(ll_rtn), False)
				end if
				is_filepath = 'customer.txt'
				ls_file = appeongetcachedir() +'\plugin\'+is_filepath
				li_rtn = dw_2.saveas(is_filepath,Text!,false)
				if fileexists(ls_file) then
					ll_rtn = uo_1.of_loadlocalfile(ls_file)
					wf_OutPut('The return of of_loadlocalfile('+is_filepath+') = ' +string(ll_rtn), False)
					filedelete(ls_file)
				else
					ll_rtn = uo_1.of_loadlocalfile('')
					wf_OutPut(is_filepath+ 'not exists. The return of of_loadlocalfile() = ' +string(ll_rtn), False)
				end if
				is_filepath = 'customer.pdf'
				ls_file = appeongetcachedir() +'\plugin\'+is_filepath
				li_rtn = dw_2.saveas(is_filepath,PDF!,false)
				if fileexists(ls_file) then
					ll_rtn = uo_1.of_loadlocalfile(ls_file)
					wf_OutPut('The return of of_loadlocalfile('+is_filepath+') = ' +string(ll_rtn), False)
					filedelete(ls_file)
				else
					ll_rtn = uo_1.of_loadlocalfile('')
					wf_OutPut(is_filepath+ 'not exists. The return of of_loadlocalfile() = ' +string(ll_rtn), False)
				end if
				is_filepath = 'customer.xls'
				ls_file = appeongetcachedir() +'\plugin\'+is_filepath
				li_rtn = dw_2.saveas(is_filepath,excel!,false)
				if fileexists(ls_file) then
					ll_rtn = uo_1.of_loadlocalfile(ls_file)
					wf_OutPut('The return of of_loadlocalfile('+is_filepath+') = ' +string(ll_rtn), False)
					filedelete(ls_file)
				else
					ll_rtn = uo_1.of_loadlocalfile('')
					wf_OutPut(is_filepath+ 'not exists. The return of of_loadlocalfile() = ' +string(ll_rtn), False)
				end if
			else
				wf_scriptview("//Loads and displays the local file. ")
				wf_scriptview("is_filepath = 'customer.html' ")
				wf_scriptview("ls_file = appeongetcachedir() +'\plugin\'+is_filepath ")
				wf_scriptview("li_rtn = dw_2.saveas(is_filepath,HTMLTable!,false) ")
				wf_scriptview("if fileexists(ls_file) then ")
				wf_scriptview("	ll_rtn = uo_1.of_loadlocalfile(ls_file) ")
				wf_scriptview("	wf_OutPut('The return of of_loadlocalfile('+is_filepath+') = ' +string(ll_rtn), False) ")
				wf_scriptview("	filedelete(ls_file) ")
				wf_scriptview("else ")
				wf_scriptview("	ll_rtn = uo_1.of_loadlocalfile('') ")
				wf_scriptview("	wf_OutPut(is_filepath+ 'not exists. The return of of_loadlocalfile() = ' +string(ll_rtn), False) ")
				wf_scriptview("end if ")
				wf_scriptview("is_filepath = 'customer.xml' ")
				wf_scriptview("ls_file = appeongetcachedir() +'\plugin\'+is_filepath ")
				wf_scriptview("li_rtn = dw_2.saveas(is_filepath,XML!,false) ")
				wf_scriptview("if fileexists(ls_file) then ")
				wf_scriptview("	ll_rtn = uo_1.of_loadlocalfile(ls_file) ")
				wf_scriptview("	wf_OutPut('The return of of_loadlocalfile('+is_filepath+') = ' +string(ll_rtn), False) ")
				wf_scriptview("	filedelete(ls_file) ")
				wf_scriptview("else ")
				wf_scriptview("	ll_rtn = uo_1.of_loadlocalfile('') ")
				wf_scriptview("	wf_OutPut(is_filepath+ 'not exists. The return of of_loadlocalfile() = ' +string(ll_rtn), False) ")
				wf_scriptview("end if ")
				wf_scriptview("is_filepath = 'customer.txt' ")
				wf_scriptview("ls_file = appeongetcachedir() +'\plugin\'+is_filepath ")
				wf_scriptview("li_rtn = dw_2.saveas(is_filepath,Text!,false) ")
				wf_scriptview("if fileexists(ls_file) then ")
				wf_scriptview("	ll_rtn = uo_1.of_loadlocalfile(ls_file) ")
				wf_scriptview("	wf_OutPut('The return of of_loadlocalfile('+is_filepath+') = ' +string(ll_rtn), False) ")
				wf_scriptview("	filedelete(ls_file) ")
				wf_scriptview("else ")
				wf_scriptview("	ll_rtn = uo_1.of_loadlocalfile('') ")
				wf_scriptview("	wf_OutPut(is_filepath+ 'not exists. The return of of_loadlocalfile() = ' +string(ll_rtn), False) ")
				wf_scriptview("end if ")
				wf_scriptview("is_filepath = 'customer.pdf' ")
				wf_scriptview("ls_file = appeongetcachedir() +'\plugin\'+is_filepath ")
				wf_scriptview("li_rtn = dw_2.saveas(is_filepath,PDF!,false) ")
				wf_scriptview("if fileexists(ls_file) then ")
				wf_scriptview("	ll_rtn = uo_1.of_loadlocalfile(ls_file) ")
				wf_scriptview("	wf_OutPut('The return of of_loadlocalfile('+is_filepath+') = ' +string(ll_rtn), False) ")
				wf_scriptview("	filedelete(ls_file) ")
				wf_scriptview("else ")
				wf_scriptview("	ll_rtn = uo_1.of_loadlocalfile('') ")
				wf_scriptview("	wf_OutPut(is_filepath+ 'not exists. The return of of_loadlocalfile() = ' +string(ll_rtn), False) ")
				wf_scriptview("end if ")
				wf_scriptview("is_filepath = 'customer.xls' ")
				wf_scriptview("ls_file = appeongetcachedir() +'\plugin\'+is_filepath ")
				wf_scriptview("li_rtn = dw_2.saveas(is_filepath,excel!,false) ")
				wf_scriptview("if fileexists(ls_file) then ")
				wf_scriptview("	ll_rtn = uo_1.of_loadlocalfile(ls_file) ")
				wf_scriptview("	wf_OutPut('The return of of_loadlocalfile('+is_filepath+') = ' +string(ll_rtn), False) ")
				wf_scriptview("	filedelete(ls_file) ")
				wf_scriptview("else ")
				wf_scriptview("	ll_rtn = uo_1.of_loadlocalfile('') ")
				wf_scriptview("	wf_OutPut(is_filepath+ 'not exists. The return of of_loadlocalfile() = ' +string(ll_rtn), False) ")
				wf_scriptview("end if ")
			end if		
		case else
			messagebox("Error",ls_testcase+"has no coding")
end choose

//保存执行的数据
if ab_execute then
	wf_saveresult(li_testcaseid)
end if
end subroutine

on w_mobile_webview.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.uo_1
end on

on w_mobile_webview.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.uo_1)
end on

event open;call super::open;ieon_aws = create eon_mobile_awsex
end event

type cb_4 from w_testcase_base`cb_4 within w_mobile_webview
end type

type cb_3 from w_testcase_base`cb_3 within w_mobile_webview
end type

type cb_2 from w_testcase_base`cb_2 within w_mobile_webview
end type

type cb_1 from w_testcase_base`cb_1 within w_mobile_webview
end type

type mle_output from w_testcase_base`mle_output within w_mobile_webview
end type

type mle_2 from w_testcase_base`mle_2 within w_mobile_webview
end type

type mle_1 from w_testcase_base`mle_1 within w_mobile_webview
end type

type dw_1 from w_testcase_base`dw_1 within w_mobile_webview
end type

type gb_1 from w_testcase_base`gb_1 within w_mobile_webview
end type

type gb_2 from w_testcase_base`gb_2 within w_mobile_webview
end type

type gb_3 from w_testcase_base`gb_3 within w_mobile_webview
end type

type gb_4 from w_testcase_base`gb_4 within w_mobile_webview
end type

type gb_5 from w_testcase_base`gb_5 within w_mobile_webview
end type

type dw_2 from datawindow within w_mobile_webview
boolean visible = false
integer x = 2167
integer y = 1012
integer width = 686
integer height = 400
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "d_customer"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;transaction sql2
sql2 = create transaction

// Profile appeonsample
SQL2.DBMS = "ODBC"
SQL2.AutoCommit = False
SQL2.DBParm = "ConnectString='DSN=AppeonSample;UID=;PWD=sql'"

connect using sql2;


this.settransobject(sql2)
this.retrieve( )
end event

type uo_1 from eon_mobile_webviewex within w_mobile_webview
integer x = 32
integer y = 1184
integer width = 933
integer height = 436
integer taborder = 50
boolean border = true
end type

on uo_1.destroy
call eon_mobile_webviewex::destroy
end on

event oe_loadstart;call super::oe_loadstart;string ls_output

ls_output = "oe_loadstart  triggered "
end event

event oe_loadend;call super::oe_loadend;string ls_output

ls_output = "oe_loadend  triggered "
end event

