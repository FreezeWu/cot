$PBExportHeader$w_mobile_textchecker.srw
forward
global type w_mobile_textchecker from w_testcase_base
end type
end forward

global type w_mobile_textchecker from w_testcase_base
end type
global w_mobile_textchecker w_mobile_textchecker

type variables
eon_mobile_textcheckerex ieon_textchecker
eon_mobile_str_textcheckoption  ieon_str_textcheck


end variables

forward prototypes
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
end prototypes

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);//执行各测试点，需要重载该函数 ai_item返回的是datawindow的行号
string  ls_testcase,ls_rtn[],ls_rtn2
long li_testcaseid,ll_rtn,ll_i

if ai_item = 0 then return

ls_testcase = dw_1.getitemstring(ai_item,"testcasename")
li_testcaseid = dw_1.getitemnumber( ai_item,"id")
If ab_execute Then 
	wf_output("-----Test Point:" + ls_testcase + "-----", True)
End If

choose case lower(ls_testcase)
	case "textchecker_p001_setignoredwords"  
		string ls_temp[]
		if ab_execute then	 
			ls_temp = {'appeon','eonapp','eontest','Test3','Teg','Tegge1'}			
			for ll_i = 1 to UpperBound ( ls_temp )	
				ls_rtn[1] = ls_temp[ll_i]
				ll_rtn =  ieon_textchecker.of_setignoredwords(ls_rtn[])
				wf_OutPut('  ieon_textchecker.of_setignoredwords('+ls_rtn[1]+') = ' + string(ll_rtn), False)
			Next		
		else
				wf_scriptview("ll_rtn =  ieon_textchecker.of_setignoredwords(ls_rtn[]) ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_setignoredwords('+ls_rtn[1]+') = ' + string(ll_rtn), False) ")
		end if
	case "textchecker_p002_getignoredwords" 
		if ab_execute then	 
				ll_rtn =  ieon_textchecker.of_getignoredwords(ls_rtn[])
				wf_OutPut('  ieon_textchecker.of_getignoredwords(appeon) = ' + string(ll_rtn), False)
			end if
	case "textchecker_p003_haslearnedword" 
		if ab_execute then	 
				ll_rtn =  ieon_textchecker.of_haslearnedword('appeon')
				wf_OutPut('  ieon_textchecker.of_haslearnedword(appeon) = ' + string(ll_rtn), False)
				ll_rtn =  ieon_textchecker.of_haslearnedword('Tet')
				wf_OutPut('  ieon_textchecker.of_haslearnedword(Tet) = ' + string(ll_rtn), False)
				ll_rtn =  ieon_textchecker.of_haslearnedword('中')
				wf_OutPut('  ieon_textchecker.of_haslearnedword(中) = ' + string(ll_rtn), False)
		else
				wf_scriptview("ll_rtn =  ieon_textchecker.of_haslearnedword('appeon') ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_haslearnedword(appeon) = ' + string(ll_rtn), False) ")
				wf_scriptview("ll_rtn =  ieon_textchecker.of_haslearnedword('Tet') ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_haslearnedword(Tet) = ' + string(ll_rtn), False) ")
				wf_scriptview("ll_rtn =  ieon_textchecker.of_haslearnedword('中') ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_haslearnedword(中) = ' + string(ll_rtn), False) ")
		end if
	case "textchecker_p004_learnword" 
		if ab_execute then	 
				ieon_textchecker.of_learnword('Test to do')
				ll_rtn =  ieon_textchecker.of_haslearnedword('Test to do')
				wf_OutPut('  ieon_textchecker.of_learnword("Test to do") = ' + string(ll_rtn), False)
				ieon_textchecker.of_learnword('appeon')
				ll_rtn =  ieon_textchecker.of_haslearnedword('appeon')
				wf_OutPut('  ieon_textchecker.of_learnword("appeon") = ' + string(ll_rtn), False)
				ieon_textchecker.of_learnword('appeon123')
				ll_rtn =  ieon_textchecker.of_haslearnedword('appeon123')
				wf_OutPut('  ieon_textchecker.of_learnword("appeon123") = ' + string(ll_rtn), False)
				ieon_textchecker.of_learnword('123app')
				ll_rtn =  ieon_textchecker.of_haslearnedword('123app')
				wf_OutPut('  ieon_textchecker.of_learnword("123app") = ' + string(ll_rtn), False)
				ieon_textchecker.of_learnword('test123')
				ll_rtn =  ieon_textchecker.of_haslearnedword('test123')
				wf_OutPut('  ieon_textchecker.of_learnword("test123") = ' + string(ll_rtn), False)
		else
				wf_scriptview("ll_rtn =  ieon_textchecker.of_learnword('Test to do') ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_learnword(~"Test to do~") = ' + string(ll_rtn), False) ")
				wf_scriptview("ll_rtn =  ieon_textchecker.of_learnword('appeon') ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_learnword(~"appeon~") = ' + string(ll_rtn), False) ")
				wf_scriptview("ll_rtn =  ieon_textchecker.of_learnword('appeon123') ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_learnword(~"appeon123~") = ' + string(ll_rtn), False) ")
				wf_scriptview("ll_rtn =  ieon_textchecker.of_learnword('123app') ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_learnword(~"123app~") = ' + string(ll_rtn), False) ")
				wf_scriptview("ll_rtn =  ieon_textchecker.of_learnword('test123') ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_learnword(~"test123~") = ' + string(ll_rtn), False) ")
		end if
	case "textchecker_p005_unlearnword" 
		if ab_execute then	 
				ieon_textchecker.of_learnword('appeon')
				ll_rtn =  ieon_textchecker.of_haslearnedword('appeon')
				wf_OutPut(' ieon_textchecker.of_learnword("appeon") = ' + string(ll_rtn), False)
				ieon_textchecker.of_unlearnword('appeon')
				ll_rtn =  ieon_textchecker.of_haslearnedword('appeon')
				wf_OutPut('  ieon_textchecker.of_unlearnword("appeon") = ' + string(ll_rtn), False)
				ll_rtn =  ieon_textchecker.of_unlearnword('Tet')
				wf_OutPut('  ieon_textchecker.of_unlearnword("Tet") = ' + string(ll_rtn), False)
				ieon_textchecker.of_learnword('中国')
				ll_rtn =  ieon_textchecker.of_haslearnedword('中国')
				wf_OutPut(' ieon_textchecker.of_learnword("中国") = ' + string(ll_rtn), False)
				ieon_textchecker.of_unlearnword('中国')
				ll_rtn =  ieon_textchecker.of_haslearnedword('中国')
				wf_OutPut('  ieon_textchecker.of_unlearnword("中国") = ' + string(ll_rtn), False)
				ll_rtn =  ieon_textchecker.of_unlearnword('mt')
				wf_OutPut('  ieon_textchecker.of_unlearnword("mt") = ' + string(ll_rtn), False)
		else
				wf_scriptview("ieon_textchecker.of_learnword('appeon') ")
				wf_scriptview("ll_rtn =  ieon_textchecker.of_haslearnedword('appeon') ")
				wf_scriptview("wf_OutPut(' ieon_textchecker.of_learnword('appeon') = ' + string(ll_rtn), False) ")
				wf_scriptview("ieon_textchecker.of_unlearnword('appeon') ")
				wf_scriptview("ll_rtn =  ieon_textchecker.of_haslearnedword('appeon') ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_unlearnword('appeon') = ' + string(ll_rtn), False) ")
				wf_scriptview("ll_rtn =  ieon_textchecker.of_unlearnword('Tet') ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_unlearnword('Tet') = ' + string(ll_rtn), False) ")
				wf_scriptview("ieon_textchecker.of_learnword('中国') ")
				wf_scriptview("ll_rtn =  ieon_textchecker.of_haslearnedword('中国') ")
				wf_scriptview("wf_OutPut(' ieon_textchecker.of_learnword('中国') = ' + string(ll_rtn), False) ")
				wf_scriptview("ieon_textchecker.of_unlearnword('中国') ")
				wf_scriptview("ll_rtn =  ieon_textchecker.of_haslearnedword('中国') ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_unlearnword('中国') = ' + string(ll_rtn), False) ")
				wf_scriptview("ll_rtn =  ieon_textchecker.of_unlearnword('mt') ")
				wf_scriptview("wf_OutPut('  ieon_textchecker.of_unlearnword('mt') = ' + string(ll_rtn), False) ")
		end if
    case "textchecker_p006_getlanguages" 
		string ls_value,ls_language[]
		long ll_index
		if ab_execute then	 
			ll_rtn = ieon_textchecker.of_getlanguages( ls_language)
			ls_value = "of_getlanguages返回值 = "+string(ll_rtn)
			for ll_index = 1 to upperbound(ls_language)
				ls_value += ls_language[ll_index]+","
			next
			wf_OutPut('  ieon_textchecker.of_getlanguages(ls_language) = ' + string(ll_rtn), False)
			wf_OutPut('  ieon_textchecker.of_getlanguages(ls_language) = ' + string(ls_value), False)
			wf_OutPut(' 不同设备支持的语言可能不同，正常获取即可 ', False)
		else
			wf_scriptview('ll_rtn = ieon_textchecker.of_getlanguages( ls_language)~ ')
			wf_scriptview('ls_value = "The return of of_getignoredwords = "+string(ll_rtn) ')
			wf_scriptview('for ll_index = 1 to upperbound(ls_language) ')
			wf_scriptview('ls_value += ls_language[ll_index]+"," ')
			wf_scriptview("next ")
			wf_scriptview("wf_OutPut('  ieon_textchecker.of_getlanguages(ls_language) = ' + string(ll_rtn), False) ")
			wf_scriptview("wf_OutPut('  ieon_textchecker.of_getlanguages(ls_language) = ' + string(ls_value), False) ")
			wf_scriptview("wf_OutPut(' 不同设备支持的语言可能不同，正常获取即可 ', False) ")
		end if 
	case "textchecker_p007_completionsforpartialword" 
		if ab_execute then	 
			ieon_str_textcheck.s_source='Appeon is a Test chain'
			ieon_str_textcheck.l_start = 1
			ieon_str_textcheck.l_length =6
			ieon_str_textcheck.s_language = 'en_US'
			ll_rtn =  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp)
			wf_OutPut('  ieon_textchecker.of_completionsforpartialword('+') = ' + string(ll_rtn), False)
		else
			wf_scriptview("ieon_str_textcheck.s_source='Appeon is a Test chain' ")
			wf_scriptview("ieon_str_textcheck.l_start = 1 ")
			wf_scriptview("ieon_str_textcheck.l_length =6 ")
			wf_scriptview("ieon_str_textcheck.s_language = 'en_US' ")
			wf_scriptview("ll_rtn =  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp) ")
			wf_scriptview("wf_OutPut('  ieon_textchecker.of_completionsforpartialword('+') = ' + string(ll_rtn), False) ")
		end if
	case "textchecker_p007_completionsforpartialword02" 
		if ab_execute then	 
			ieon_str_textcheck.s_source='Appeon is a Test chain'
			ieon_str_textcheck.l_start = 0
			ieon_str_textcheck.l_length =20
			ieon_str_textcheck.s_language = 'en_US'
			ll_rtn =  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp)
			wf_OutPut('  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp) = ' + string(ll_rtn), False)
		else
			wf_scriptview("ieon_str_textcheck.s_source='Appeon is a Test chain' ")
			wf_scriptview("ieon_str_textcheck.l_start = 0 ")
			wf_scriptview("ieon_str_textcheck.l_length =20 ")
			wf_scriptview("ieon_str_textcheck.s_language = 'de_DE' ")
			wf_scriptview("ll_rtn =  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp) ")
			wf_scriptview("wf_OutPut('  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp) = ' + string(ll_rtn), False) ")
		end if
	case "textchecker_p007_completionsforpartialword03" 
		if ab_execute then	 
			ieon_str_textcheck.s_source='测试是否可以为Test全中文'
			ieon_str_textcheck.l_start = 6
			ieon_str_textcheck.l_length =100
			ieon_str_textcheck.s_language = 'en_US'
			ll_rtn =  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp)
			wf_OutPut('  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp) = ' + string(ll_rtn), False)
		else
			wf_scriptview("ieon_str_textcheck.s_source='测试是否可以为Test全中文' ")
			wf_scriptview("ieon_str_textcheck.l_start = 6 ")
			wf_scriptview("ieon_str_textcheck.l_length =100 ")
			wf_scriptview("ieon_str_textcheck.s_language = 'en_CA' ")
			wf_scriptview("ll_rtn =  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp) ")
			wf_scriptview("wf_OutPut('  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp) = ' + string(ll_rtn), False) ")
		end if
	case "textchecker_p007_completionsforpartialword04" 
		if ab_execute then	 
			ieon_str_textcheck.s_source='Just gave up ag'
			ieon_str_textcheck.l_start = 10
			ieon_str_textcheck.l_length =5
			ieon_str_textcheck.s_language = 'en_US'
			ll_rtn =  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp)
			wf_OutPut('  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp) = ' + string(ll_rtn), False)
		else
			wf_scriptview("ieon_str_textcheck.s_source='Just gave up ag' ")
			wf_scriptview("ieon_str_textcheck.l_start = 10 ")
			wf_scriptview("ieon_str_textcheck.l_length =5 ")
			wf_scriptview("ieon_str_textcheck.s_language = 'en_SG' ")
			wf_scriptview("ll_rtn =  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp) ")
			wf_scriptview("wf_OutPut('  ieon_textchecker.of_completionsforpartialword(ieon_str_textcheck,ls_temp) = ' + string(ll_rtn), False) ")
		end if
	case "textchecker_p008_getmisspelledword" 
		if ab_execute then	 
			long ll_start,ll_length,ll_j, ll_ii[],ll_jj[]
			ieon_str_textcheck.s_source = "测试是否可以为Test全中文,Appeon is a Test chain,Just gave up ag"
			ll_ii={0,3,10}
			ll_jj={5,20}
			for ll_I = 1 to Upperbound ( ll_ii )
				for ll_j = 1 to Upperbound ( ll_jj )
					ll_start= ll_ii[ll_I]
					ll_length= ll_jj[ll_j]
					ll_rtn =  ieon_textchecker.of_getmisspelledword(ieon_str_textcheck,ll_start,ll_length)
					wf_OutPut('  ieon_textchecker.of_getmisspelledword(start '+string(ll_start) +'  length '+string(ll_length)+') = ' + string(ll_rtn), False)
				Next
			Next
		else
			wf_scriptview("ieon_str_textcheck.s_source = '测试是否可以为Test全中文,Appeon is a Test chain,Just gave up ag' ")
			wf_scriptview("ll_ii={0,3,10} ")
			wf_scriptview("ll_jj={5,20} ")
			wf_scriptview("for ll_I = 1 to Upperbound ( ll_ii ) ")
			wf_scriptview("	for ll_j = 1 to Upperbound ( ll_jj ) ")
			wf_scriptview("		ll_start= ll_ii[ll_I] ")
			wf_scriptview("		ll_length= ll_jj[ll_j] ")
			wf_scriptview("		ll_rtn =  ieon_textchecker.of_getmisspelledword(ieon_str_textcheck,ll_start,ll_length) ")
			wf_scriptview("		wf_OutPut('  ieon_textchecker.of_getmisspelledword(start '+string(ll_start) +'  length '+string(ll_length)+') = ' + string(ll_rtn), False) ")
			wf_scriptview("	Next ")
			wf_scriptview("Next ")	
		end if
	case "textchecker_p009_guessesforword" 
		if ab_execute then	 
			ieon_str_textcheck.s_source='Just gave up ag'
			ieon_str_textcheck.l_start = 10
			ieon_str_textcheck.l_length =5
			ieon_str_textcheck.s_language = 'en_US'
			ll_rtn =  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_temp)
			wf_OutPut('  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_return) = ' + string(ll_rtn), False)
		else
			wf_scriptview("ll_rtn =  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_temp) ")
			wf_scriptview("wf_OutPut('  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_return) = ' + string(ll_rtn), False) ")
		end if
	case "textchecker_p009_guessesforword02" 
		if ab_execute then	 
			ieon_str_textcheck.s_source='Just gave up ag'
			ieon_str_textcheck.l_start = 10
			ieon_str_textcheck.l_length =5
			ieon_str_textcheck.s_language = 'en_US'
			ll_rtn =  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_temp)
			wf_OutPut('  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_return) = ' + string(ll_rtn), False)
		else
			wf_scriptview("ieon_str_textcheck.s_source='Just gave up ag' ")
			wf_scriptview("ieon_str_textcheck.l_start = 10 ")
			wf_scriptview("ieon_str_textcheck.l_length =5 ")
			wf_scriptview("ieon_str_textcheck.s_language = 'pt_BR' ")
			wf_scriptview("ll_rtn =  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_temp) ")
			wf_scriptview("wf_OutPut('  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_return) = ' + string(ll_rtn), False) ")
		end if
	case "textchecker_p009_guessesforword03" 
		if ab_execute then	 
			ieon_str_textcheck.s_source='测试是否可以为Test全中文'
			ieon_str_textcheck.l_start = 7
			ieon_str_textcheck.l_length =15
			ieon_str_textcheck.s_language = 'en_CA'
			ll_rtn =  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_temp)
			wf_OutPut('  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_return) = ' + string(ll_rtn), False)
		else
			wf_scriptview("ieon_str_textcheck.s_source='Just gave up ag' ")
			wf_scriptview("ieon_str_textcheck.l_start = 7 ")
			wf_scriptview("ieon_str_textcheck.l_length =15 ")
			wf_scriptview("ieon_str_textcheck.s_language = 'en_CA' ")
			wf_scriptview("ll_rtn =  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_temp) ")
			wf_scriptview("wf_OutPut('  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_return) = ' + string(ll_rtn), False) ")
		end if
	case "textchecker_p009_guessesforword04" 
		if ab_execute then	 
			ieon_str_textcheck.s_source='Appeon is a Test chain'
			ieon_str_textcheck.l_start = 3
			ieon_str_textcheck.l_length =9
			ieon_str_textcheck.s_language = 'en_US'
			ll_rtn =  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_temp)
			wf_OutPut('  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_return) = ' + string(ll_rtn), False)
		else
			wf_scriptview("ieon_str_textcheck.s_source='Just gave up ag' ")
			wf_scriptview("ieon_str_textcheck.l_start = 3 ")
			wf_scriptview("ieon_str_textcheck.l_length =9 ")
			wf_scriptview("ieon_str_textcheck.s_language = 'it_IT' ")
			wf_scriptview("ll_rtn =  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_temp) ")
			wf_scriptview("wf_OutPut('  ieon_textchecker.of_guessesforword( ieon_str_textcheck, ls_return) = ' + string(ll_rtn), False) ")
		end if
	case else
		messagebox("Error",ls_testcase+"has no coding")
end choose

//保存执行的数据
if ab_execute then
	wf_saveresult(li_testcaseid)
end if
end subroutine

on w_mobile_textchecker.create
call super::create
end on

on w_mobile_textchecker.destroy
call super::destroy
end on

event open;call super::open;ieon_textchecker = create eon_mobile_textcheckerex


end event

type cb_4 from w_testcase_base`cb_4 within w_mobile_textchecker
end type

type cb_3 from w_testcase_base`cb_3 within w_mobile_textchecker
end type

type cb_2 from w_testcase_base`cb_2 within w_mobile_textchecker
integer weight = 700
end type

type cb_1 from w_testcase_base`cb_1 within w_mobile_textchecker
end type

type mle_output from w_testcase_base`mle_output within w_mobile_textchecker
end type

type mle_2 from w_testcase_base`mle_2 within w_mobile_textchecker
end type

type mle_1 from w_testcase_base`mle_1 within w_mobile_textchecker
end type

type dw_1 from w_testcase_base`dw_1 within w_mobile_textchecker
end type

type gb_1 from w_testcase_base`gb_1 within w_mobile_textchecker
end type

type gb_2 from w_testcase_base`gb_2 within w_mobile_textchecker
end type

type gb_3 from w_testcase_base`gb_3 within w_mobile_textchecker
end type

type gb_4 from w_testcase_base`gb_4 within w_mobile_textchecker
end type

type gb_5 from w_testcase_base`gb_5 within w_mobile_textchecker
end type

