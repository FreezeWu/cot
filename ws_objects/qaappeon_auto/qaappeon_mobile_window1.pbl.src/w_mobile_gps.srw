$PBExportHeader$w_mobile_gps.srw
forward
global type w_mobile_gps from w_testcase_base
end type
end forward

global type w_mobile_gps from w_testcase_base
end type
global w_mobile_gps w_mobile_gps

type variables
eon_mobile_geolocationex ieon_gps
long il_locationaccuracy,il_distancefilter
end variables

forward prototypes
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
end prototypes

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);//执行各测试点，需要重载该函数 ai_item返回的是datawindow的行号
string  ls_testcase,ls_rtn,ls_file
long li_testcaseid,ll_rtn
blob lb_data
eon_mobile_str_coordinates  leon_coordinate

if ai_item = 0 then return

ls_testcase = dw_1.getitemstring(ai_item,"testcasename")
li_testcaseid = dw_1.getitemnumber( ai_item,"id")
If ab_execute Then 
	wf_output("-----Test Point:" + ls_testcase + "-----", True)
End If

choose case ls_testcase
		case "gps_p001_close"
			if ab_execute then
				//Closes the GPS functionality.
				//1 - Success.
				//-1 - It is called in PowerBuilder or Appeon Web, or there is an error.
				ll_rtn = ieon_gps.of_isenabled()
				if ll_rtn = 1 then
					il_locationaccuracy = 0
					il_distancefilter = 100
					ieon_gps.of_open(il_locationaccuracy, il_distancefilter)
				else
					wf_OutPut( ' GPS Service is not enabled. ', False)
				end if
				ll_rtn = ieon_gps.of_close()
				wf_OutPut('The return of of_close() = ' + string(ll_rtn), False)
			else
				wf_scriptview("//Closes the GPS functionality. ")
				wf_scriptview("//1 - Success. ")
				wf_scriptview("//-1 - It is called in PowerBuilder or Appeon Web, or there is an error. ")
				wf_scriptview("ll_rtn = ieon_gps.of_isenabled() ")
				wf_scriptview("if ll_rtn = 1 then ")
				wf_scriptview("	il_locationaccuracy = 0 ")
				wf_scriptview("	il_distancefilter = 100 ")
				wf_scriptview("	ieon_gps.of_open(il_locationaccuracy, il_distancefilter) ")
				wf_scriptview("else ")
				wf_scriptview("	wf_OutPut( ' GPS Services is not enabled. ', False) ")
				wf_scriptview("end if ")
				wf_scriptview("ll_rtn = ieon_gps.of_close() ")
				wf_scriptview("wf_OutPut('The return of of_close() = ' + string(ll_rtn), False) ")
			end if
		case "gps_p002_open"
			if ab_execute then
				//Opens the GPS functionality.
				//locationaccuracy: Location accuracy update, recommended to use 0 or 1 for the automatic selection
				//distancefilter:Location filter, used to control the location update message frequency (in meters).
				il_locationaccuracy = 0
				il_distancefilter = 100
				ll_rtn = ieon_gps.of_open(il_locationaccuracy,il_distancefilter)
				wf_OutPut('The return of of_open('+string(il_locationaccuracy)+','+string(il_distancefilter)+') = ' + string(ll_rtn), False)
				il_distancefilter = 1000
				ll_rtn = ieon_gps.of_open(il_locationaccuracy,il_distancefilter)
				wf_OutPut('The return of of_open('+string(il_locationaccuracy)+','+string(il_distancefilter)+') = ' + string(ll_rtn), False)
				il_distancefilter = 10000
				ll_rtn = ieon_gps.of_open(il_locationaccuracy,il_distancefilter)
				wf_OutPut('The return of of_open('+string(il_locationaccuracy)+','+string(il_distancefilter)+') = ' + string(ll_rtn), False)
				il_locationaccuracy = 1
				il_distancefilter = 100
				ll_rtn = ieon_gps.of_open(il_locationaccuracy,il_distancefilter)
				wf_OutPut('The return of of_open('+string(il_locationaccuracy)+','+string(il_distancefilter)+') = ' + string(ll_rtn), False)
				il_distancefilter = 1000
				ll_rtn = ieon_gps.of_open(il_locationaccuracy,il_distancefilter)
				wf_OutPut('The return of of_open('+string(il_locationaccuracy)+','+string(il_distancefilter)+') = ' + string(ll_rtn), False)
				il_distancefilter = 10000
				ll_rtn = ieon_gps.of_open(il_locationaccuracy,il_distancefilter)
				wf_OutPut('The return of of_open('+string(il_locationaccuracy)+','+string(il_distancefilter)+') = ' + string(ll_rtn), False)
			else
				wf_scriptview("//Opens the GPS functionality. ")
				wf_scriptview("//locationaccuracy: Location accuracy update, recommended to use 0 or 1 for the automatic selection ")
				wf_scriptview("//distancefilter:Location filter, used to control the location update message frequency (in meters). ")
				wf_scriptview("il_locationaccuracy = 0 ")
				wf_scriptview("il_distancefilter = 100 ")
				wf_scriptview("ll_rtn = ieon_gps.of_open(il_locationaccuracy,il_distancefilter) ")
				wf_scriptview("wf_OutPut('The return of of_open('+string(il_locationaccuracy)+','+string(il_distancefilter)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("il_distancefilter = 1000 ")
				wf_scriptview("ll_rtn = ieon_gps.of_open(il_locationaccuracy,il_distancefilter) ")
				wf_scriptview("wf_OutPut('The return of of_open('+string(il_locationaccuracy)+','+string(il_distancefilter)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("il_distancefilter = 10000 ")
				wf_scriptview("ll_rtn = ieon_gps.of_open(il_locationaccuracy,il_distancefilter) ")
				wf_scriptview("wf_OutPut('The return of of_open('+string(il_locationaccuracy)+','+string(il_distancefilter)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("il_locationaccuracy = 1 ")
				wf_scriptview("il_distancefilter = 100 ")
				wf_scriptview("ll_rtn = ieon_gps.of_open(il_locationaccuracy,il_distancefilter) ")
				wf_scriptview("wf_OutPut('The return of of_open('+string(il_locationaccuracy)+','+string(il_distancefilter)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("il_distancefilter = 1000 ")
				wf_scriptview("ll_rtn = ieon_gps.of_open(il_locationaccuracy,il_distancefilter) ")
				wf_scriptview("wf_OutPut('The return of of_open('+string(il_locationaccuracy)+','+string(il_distancefilter)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("il_distancefilter = 10000 ")
				wf_scriptview("ll_rtn = ieon_gps.of_open(il_locationaccuracy,il_distancefilter) ")
				wf_scriptview("wf_OutPut('The return of of_open('+string(il_locationaccuracy)+','+string(il_distancefilter)+') = ' + string(ll_rtn), False) ")
			end if
		case "gps_p003_isenabled"
			if ab_execute then
				//Detects if the GPS service can be used.
				//1 - Eabled.
				//0 - Disabled.
				//-1 - It is called in PowerBuilder or Appeon Web, or there is an error.
				ll_rtn = ieon_gps.of_isenabled()
				wf_OutPut('The return of of_isenabled() = ' + string(ll_rtn), False)
			else
				wf_scriptview("//Detects if the GPS service can be used. ")
				wf_scriptview("//1 - Eabled. ")
				wf_scriptview("//0 - Disabled. ")
				wf_scriptview("//-1 - It is called in PowerBuilder or Appeon Web, or there is an error. ")
				wf_scriptview("ll_rtn = ieon_gps.of_isenabled() ")
				wf_scriptview("wf_OutPut('The return of of_isenabled() = ' + string(ll_rtn), False) ")
			end if
		case "gps_p004_getcurrentposition"
			if ab_execute then
				//Gets the current position information.
				//1 - Success.
				//-1 - It is called in PowerBuilder or Appeon Web, or there is an error.
				il_locationaccuracy = 1
				il_distancefilter = 100
				ieon_gps.of_open(il_locationaccuracy,il_distancefilter)
				ll_rtn = ieon_gps.of_getcurrentposition(leon_coordinate)
				wf_OutPut('The return of of_getcurrentposition() = ' + string(ll_rtn), False)
				wf_OutPut('经度 = ' + string(leon_coordinate.dec_longitude), False)
				wf_OutPut('纬度 = ' + string(leon_coordinate.dec_latitude), False)
				wf_OutPut('偏北度 = ' + string(leon_coordinate.dec_heading), False)
				wf_OutPut('速度 = ' + string(leon_coordinate.dec_speed), False)
				wf_OutPut('经纬精度 = ' + string(leon_coordinate.dec_accuracy), False)
				wf_OutPut('海拔 = ' + string(leon_coordinate.dec_altitude), False)
				wf_OutPut('海拔精度 = ' + string(leon_coordinate.dec_altitudeaccuracy), False)
				wf_OutPut('纬时间度 = ' + string(leon_coordinate.dt_timestamp), False)
			else
				wf_scriptview("//Gets the current position information. ")
				wf_scriptview("//1 - Success. ")
				wf_scriptview("//-1 - It is called in PowerBuilder or Appeon Web, or there is an error. ")
				wf_scriptview("il_locationaccuracy = 1 ")
				wf_scriptview("il_distancefilter = 100 ")
				wf_scriptview("ieon_gps.of_open(il_locationaccuracy,il_distancefilter) ")
				wf_scriptview("ll_rtn = ieon_gps.of_getcurrentposition(leon_coordinate) ")
				wf_scriptview("wf_OutPut('The return of of_getcurrentposition() = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('经度 = ' + string(leon_coordinate.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('纬度 = ' + string(leon_coordinate.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('偏北度 = ' + string(leon_coordinate.dec_heading), False) ")
				wf_scriptview("wf_OutPut('速度 = ' + string(leon_coordinate.dec_speed), False) ")
				wf_scriptview("wf_OutPut('经纬精度 = ' + string(leon_coordinate.dec_accuracy), False) ")
				wf_scriptview("wf_OutPut('海拔 = ' + string(leon_coordinate.dec_altitude), False) ")
				wf_scriptview("wf_OutPut('海拔精度 = ' + string(leon_coordinate.dec_altitudeaccuracy), False) ")
				wf_scriptview("wf_OutPut('纬时间度 = ' + string(leon_coordinate.dt_timestamp), False) ")
			end if
		case else
			messagebox("Error",ls_testcase+"has no coding")
end choose

//保存执行的数据
if ab_execute then
	wf_saveresult(li_testcaseid)
end if
end subroutine

on w_mobile_gps.create
call super::create
end on

on w_mobile_gps.destroy
call super::destroy
end on

event open;call super::open;ieon_gps = create eon_mobile_geolocationex
end event

type cb_4 from w_testcase_base`cb_4 within w_mobile_gps
end type

type cb_3 from w_testcase_base`cb_3 within w_mobile_gps
end type

type cb_2 from w_testcase_base`cb_2 within w_mobile_gps
end type

type cb_1 from w_testcase_base`cb_1 within w_mobile_gps
end type

type mle_output from w_testcase_base`mle_output within w_mobile_gps
end type

type mle_2 from w_testcase_base`mle_2 within w_mobile_gps
end type

type mle_1 from w_testcase_base`mle_1 within w_mobile_gps
end type

type dw_1 from w_testcase_base`dw_1 within w_mobile_gps
end type

type gb_1 from w_testcase_base`gb_1 within w_mobile_gps
end type

type gb_2 from w_testcase_base`gb_2 within w_mobile_gps
end type

type gb_3 from w_testcase_base`gb_3 within w_mobile_gps
end type

type gb_4 from w_testcase_base`gb_4 within w_mobile_gps
end type

type gb_5 from w_testcase_base`gb_5 within w_mobile_gps
end type

