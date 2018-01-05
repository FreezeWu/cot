$PBExportHeader$w_mobile_map.srw
forward
global type w_mobile_map from w_testcase_base
end type
type uo_1 from eon_mobile_mapex within w_mobile_map
end type
end forward

global type w_mobile_map from w_testcase_base
uo_1 uo_1
end type
global w_mobile_map w_mobile_map

type variables
eon_mobile_str_annotation  ieon_annotation
eon_mobile_str_mapoption  ieon_mapoption
eon_mobile_str_coordinates ieon_coordinate
long  il_id,il_idarray[]
decimal{6} id_longitude,id_latitude
boolean ib_allowmove
string is_address
eon_mobile_geolocationex ieon_gps
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
		case "map_p001_open1"
			if ab_execute then
				//Opens the default map application at the specified position.
				
				//b_locatetocurrentlocation : Sets the initail location after loading the map.
				//If it is true, the map automatically locates to the current location.
				//If it is false, the map automatically locates to the location according to input value.
				
				//dec_longitude : Sets the longitude of a location after loading the map,
 				//the value is valid only when b_locatetocurrentlocation is false.
				 
				//dec_latitude : Sets the latitue of a location after loading the map.
				//the value is valid only when b_locatetocurrentlocation is false.
				
				//b_allowmove : Sets Whether the user can move the map.
				//b_allowzoom : Sets Whether the user can zoom the map.
				//i_mapaccuracy : Sets the map display accuracy (in meters).
				//i_maptype : Sets the type of the map.
				//0 - Map. / 1 - Satellite. / 2 - Mixed.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.dec_longitude = 0
				ieon_mapoption.dec_latitude = 0
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 0
				ll_rtn = uo_1.of_open( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_open() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.dec_longitude = 0 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 0 ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 0 ")
				wf_scriptview("ll_rtn = uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_open() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p002_open2"
			if ab_execute then
				//Opens the default map application at the specified position.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.dec_longitude = 0
				ieon_mapoption.dec_latitude = 0
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 123.12
				ieon_mapoption.i_maptype = 1
				ll_rtn = uo_1.of_open( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_open() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Opens the default map application at the specified position. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.dec_longitude = 0 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 0 ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 123.12 ")
				wf_scriptview("ieon_mapoption.i_maptype = 1 ")
				wf_scriptview("ll_rtn = uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_open() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p003_open3"
			if ab_execute then
				//Opens the default map application at the specified position.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.dec_longitude = 0
				ieon_mapoption.dec_latitude = 0
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 487
				ieon_mapoption.i_maptype = 2
				ll_rtn = uo_1.of_open( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_open() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Opens the default map application at the specified position. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.dec_longitude = 0 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 0 ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 487 ")
				wf_scriptview("ieon_mapoption.i_maptype = 2 ")
				wf_scriptview("ll_rtn = uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_open() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p004_open4"
			if ab_execute then
				//Opens the default map application at the specified position.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.dec_longitude = 0
				ieon_mapoption.dec_latitude = 0
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 4567
				ieon_mapoption.i_maptype = 3
				ll_rtn = uo_1.of_open( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_open() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Opens the default map application at the specified position. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.dec_longitude = 0 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 0 ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 4567 ")
				wf_scriptview("ieon_mapoption.i_maptype = 3 ")
				wf_scriptview("ll_rtn = uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_open() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p005_open5"
			if ab_execute then
				//Opens the default map application at the specified position.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.dec_longitude = 0
				ieon_mapoption.dec_latitude = 0
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 20000
				ieon_mapoption.i_maptype = 4
				ll_rtn = uo_1.of_open( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_open() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Opens the default map application at the specified position. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.dec_longitude = 0 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 0 ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 20000 ")
				wf_scriptview("ieon_mapoption.i_maptype = 4 ")
				wf_scriptview("ll_rtn = uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_open() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p006_open6"
			if ab_execute then
				//Opens the default map application at the specified position.
				ieon_mapoption.b_locatetocurrentlocation = false
				ieon_mapoption.dec_longitude = -1
				ieon_mapoption.dec_latitude = -1
				ieon_mapoption.b_allowmove = false
				ieon_mapoption.b_allowzoom = false
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 4
				ll_rtn = uo_1.of_open( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_open() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Opens the default map application at the specified position. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = false ")
				wf_scriptview("ieon_mapoption.dec_longitude = -1 ")
				wf_scriptview("ieon_mapoption.dec_latitude = -1 ")
				wf_scriptview("ieon_mapoption.b_allowmove = false ")
				wf_scriptview("ieon_mapoption.b_allowzoom = false ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 4 ")
				wf_scriptview("ll_rtn = uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_open() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p007_open7"
			if ab_execute then
				//Opens the default map application at the specified position.
				ieon_mapoption.b_locatetocurrentlocation = false
				ieon_mapoption.dec_longitude = 0
				ieon_mapoption.dec_latitude = 0
				ieon_mapoption.b_allowmove = false
				ieon_mapoption.b_allowzoom = false
				ieon_mapoption.i_mapaccuracy = 123.12
				ieon_mapoption.i_maptype = 3
				ll_rtn = uo_1.of_open( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_open() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Opens the default map application at the specified position. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = false ")
				wf_scriptview("ieon_mapoption.dec_longitude = 0 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 0 ")
				wf_scriptview("ieon_mapoption.b_allowmove = false ")
				wf_scriptview("ieon_mapoption.b_allowzoom = false ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 123.12 ")
				wf_scriptview("ieon_mapoption.i_maptype = 3 ")
				wf_scriptview("ll_rtn = uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_open() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p008_open8"
			if ab_execute then
				//Opens the default map application at the specified position.
				ieon_mapoption.b_locatetocurrentlocation = false
				ieon_mapoption.dec_longitude = 132.22
				ieon_mapoption.dec_latitude = 38.20
				ieon_mapoption.b_allowmove = false
				ieon_mapoption.b_allowzoom = false
				ieon_mapoption.i_mapaccuracy = 487
				ieon_mapoption.i_maptype = 2
				ll_rtn = uo_1.of_open( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_open() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Opens the default map application at the specified position. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = false ")
				wf_scriptview("ieon_mapoption.dec_longitude = 132.22 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 38.20 ")
				wf_scriptview("ieon_mapoption.b_allowmove = false ")
				wf_scriptview("ieon_mapoption.b_allowzoom = false ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 487 ")
				wf_scriptview("ieon_mapoption.i_maptype = 2 ")
				wf_scriptview("ll_rtn = uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_open() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p009_open9"
			if ab_execute then
				//Opens the default map application at the specified position.
				ieon_mapoption.b_locatetocurrentlocation = false
				ieon_mapoption.dec_longitude = 113.94
				ieon_mapoption.dec_latitude = 22.55
				ieon_mapoption.b_allowmove = false
				ieon_mapoption.b_allowzoom = false
				ieon_mapoption.i_mapaccuracy = 4567
				ieon_mapoption.i_maptype = 1
				ll_rtn = uo_1.of_open( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_open() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Opens the default map application at the specified position. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = false ")
				wf_scriptview("ieon_mapoption.dec_longitude = 113.94 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 22.55 ")
				wf_scriptview("ieon_mapoption.b_allowmove = false ")
				wf_scriptview("ieon_mapoption.b_allowzoom = false ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 4567 ")
				wf_scriptview("ieon_mapoption.i_maptype = 1 ")
				wf_scriptview("ll_rtn = uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_open() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p010_open10"
			if ab_execute then
				//Opens the default map application at the specified position.
				ieon_mapoption.b_locatetocurrentlocation = false
				ieon_mapoption.dec_longitude = 121.11
				ieon_mapoption.dec_latitude = 43.22
				ieon_mapoption.b_allowmove = false
				ieon_mapoption.b_allowzoom = false
				ieon_mapoption.i_mapaccuracy = 20000
				ieon_mapoption.i_maptype = 0
				ll_rtn = uo_1.of_open( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_open() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Opens the default map application at the specified position. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = false ")
				wf_scriptview("ieon_mapoption.dec_longitude = 121.11 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 43.22 ")
				wf_scriptview("ieon_mapoption.b_allowmove = false ")
				wf_scriptview("ieon_mapoption.b_allowzoom = false ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 20000 ")
				wf_scriptview("ieon_mapoption.i_maptype = 0 ")
				wf_scriptview("ll_rtn = uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_open() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p011_close"
			if ab_execute then
				//Closes the default map application.
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_close()
				wf_OutPut('The return of of_close() = ' + string(ll_rtn), False)
			else
				wf_scriptview("//Closes the default map application. ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_close() ")
				wf_scriptview("wf_OutPut('The return of of_close() = ' + string(ll_rtn), False) ")
			end if
		case "map_p012_refresh1"
			if ab_execute then
				//Refreshes the map according to the specified information.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.dec_longitude = 0
				ieon_mapoption.dec_latitude = 0
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 0
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_refresh( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Refreshes the map according to the specified information. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.dec_longitude = 0 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 0 ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 0 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_refresh( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p013_refresh2"
			if ab_execute then
				//Refreshes the map according to the specified information.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.dec_longitude = 0
				ieon_mapoption.dec_latitude = 0
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 123.12
				ieon_mapoption.i_maptype = 1
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_refresh( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Refreshes the map according to the specified information. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.dec_longitude = 0 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 0 ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 123.12 ")
				wf_scriptview("ieon_mapoption.i_maptype = 1 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_refresh( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p014_refresh3"
			if ab_execute then
				//Refreshes the map according to the specified information.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.dec_longitude = 0
				ieon_mapoption.dec_latitude = 0
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 487
				ieon_mapoption.i_maptype = 2
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_refresh( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Refreshes the map according to the specified information. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.dec_longitude = 0 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 0 ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 487 ")
				wf_scriptview("ieon_mapoption.i_maptype = 2 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_refresh( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p015_refresh4"
			if ab_execute then
				//Refreshes the map according to the specified information.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.dec_longitude = 0
				ieon_mapoption.dec_latitude = 0
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 4567
				ieon_mapoption.i_maptype = 3
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_refresh( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Refreshes the map according to the specified information. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.dec_longitude = 0 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 0 ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 4567 ")
				wf_scriptview("ieon_mapoption.i_maptype = 3 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_refresh( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p016_refresh5"
			if ab_execute then
				//Refreshes the map according to the specified information.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.dec_longitude = 0
				ieon_mapoption.dec_latitude = 0
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 20000
				ieon_mapoption.i_maptype = 4
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_refresh( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Refreshes the map according to the specified information. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.dec_longitude = 0 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 0 ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 20000 ")
				wf_scriptview("ieon_mapoption.i_maptype = 4 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_refresh( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p017_refresh6"
			if ab_execute then
				//Refreshes the map according to the specified information.
				ieon_mapoption.b_locatetocurrentlocation = false
				ieon_mapoption.dec_longitude = 0
				ieon_mapoption.dec_latitude = -1
				ieon_mapoption.b_allowmove = false
				ieon_mapoption.b_allowzoom = false
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 4
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_refresh( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Refreshes the map according to the specified information. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = false ")
				wf_scriptview("ieon_mapoption.dec_longitude = 0 ")
				wf_scriptview("ieon_mapoption.dec_latitude = -1 ")
				wf_scriptview("ieon_mapoption.b_allowmove = false ")
				wf_scriptview("ieon_mapoption.b_allowzoom = false ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 4 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_refresh( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p018_refresh7"
			if ab_execute then
				//Refreshes the map according to the specified information.
				ieon_mapoption.b_locatetocurrentlocation = false
				ieon_mapoption.dec_longitude = -1
				ieon_mapoption.dec_latitude = 38.20
				ieon_mapoption.b_allowmove = false
				ieon_mapoption.b_allowzoom = false
				ieon_mapoption.i_mapaccuracy = 123.12
				ieon_mapoption.i_maptype = 3
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_refresh( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Refreshes the map according to the specified information. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = false ")
				wf_scriptview("ieon_mapoption.dec_longitude = -1 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 38.20 ")
				wf_scriptview("ieon_mapoption.b_allowmove = false ")
				wf_scriptview("ieon_mapoption.b_allowzoom = false ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 123.12 ")
				wf_scriptview("ieon_mapoption.i_maptype = 3 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_refresh( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p019_refresh8"
			if ab_execute then
				//Refreshes the map according to the specified information.
				ieon_mapoption.b_locatetocurrentlocation = false
				ieon_mapoption.dec_longitude = 132.22
				ieon_mapoption.dec_latitude = 123.11
				ieon_mapoption.b_allowmove = false
				ieon_mapoption.b_allowzoom = false
				ieon_mapoption.i_mapaccuracy = 487
				ieon_mapoption.i_maptype = 2
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_refresh( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Refreshes the map according to the specified information. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = false ")
				wf_scriptview("ieon_mapoption.dec_longitude = 132.22 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 123.11 ")
				wf_scriptview("ieon_mapoption.b_allowmove = false ")
				wf_scriptview("ieon_mapoption.b_allowzoom = false ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 487 ")
				wf_scriptview("ieon_mapoption.i_maptype = 2 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_refresh( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p020_refresh9"
			if ab_execute then
				//Refreshes the map according to the specified information.
				ieon_mapoption.b_locatetocurrentlocation = false
				ieon_mapoption.dec_longitude = 200
				ieon_mapoption.dec_latitude = 48.66
				ieon_mapoption.b_allowmove = false
				ieon_mapoption.b_allowzoom = false
				ieon_mapoption.i_mapaccuracy = 4567
				ieon_mapoption.i_maptype = 1
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_refresh( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Refreshes the map according to the specified information. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = false ")
				wf_scriptview("ieon_mapoption.dec_longitude = 200 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 48.66 ")
				wf_scriptview("ieon_mapoption.b_allowmove = false ")
				wf_scriptview("ieon_mapoption.b_allowzoom = false ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 4567 ")
				wf_scriptview("ieon_mapoption.i_maptype = 1 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_refresh( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p021_refresh10"
			if ab_execute then
				//Refreshes the map according to the specified information.
				ieon_mapoption.b_locatetocurrentlocation = false
				ieon_mapoption.dec_longitude = 179.86
				ieon_mapoption.dec_latitude = 0.56
				ieon_mapoption.b_allowmove = false
				ieon_mapoption.b_allowzoom = false
				ieon_mapoption.i_mapaccuracy = 20000
				ieon_mapoption.i_maptype = 0
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_refresh( ieon_mapoption)
				wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False)
				wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False)
				wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False)
				wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False)
				wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False)
				wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False)
				wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False)
				wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Refreshes the map according to the specified information. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = false ")
				wf_scriptview("ieon_mapoption.dec_longitude = 179.86 ")
				wf_scriptview("ieon_mapoption.dec_latitude = 0.56 ")
				wf_scriptview("ieon_mapoption.b_allowmove = false ")
				wf_scriptview("ieon_mapoption.b_allowzoom = false ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 20000 ")
				wf_scriptview("ieon_mapoption.i_maptype = 0 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_refresh( ieon_mapoption) ")
				wf_scriptview("wf_OutPut('b_locatetocurrentlocation = ' + string(ieon_mapoption.b_locatetocurrentlocation), False) ")
				wf_scriptview("wf_OutPut('dec_longitude = ' + string(ieon_mapoption.dec_longitude), False) ")
				wf_scriptview("wf_OutPut('dec_latitude = ' + string(ieon_mapoption.dec_latitude), False) ")
				wf_scriptview("wf_OutPut('b_allowmove = ' + string(ieon_mapoption.b_allowmove), False) ")
				wf_scriptview("wf_OutPut('b_allowzoom = ' + string(ieon_mapoption.b_allowzoom), False) ")
				wf_scriptview("wf_OutPut('i_mapaccuracy = ' + string(ieon_mapoption.i_mapaccuracy), False) ")
				wf_scriptview("wf_OutPut('i_maptype = ' + string(ieon_mapoption.i_maptype), False) ")
				wf_scriptview("wf_OutPut('The return of of_refresh() = ' + string(ll_rtn), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p022_addresstocoordinate1"
			if ab_execute then
				//Obtains the longitude and latitude according to the address.
 				//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 0
				uo_1.of_open( ieon_mapoption)
				is_address = '深圳'
				ll_rtn = uo_1.of_addresstocoordinate(is_address,id_longitude, id_latitude)
				wf_OutPut('The return of of_addresstocoordinate(深圳) = ' + string(ll_rtn), False)
				wf_OutPut('The longitude = ' + string(id_longitude), False)
				wf_OutPut('The latitude = ' + string(id_latitude), False)
				uo_1.of_close()
			else
				wf_scriptview("//Obtains the longitude and latitude according to the address. ")
				wf_scriptview("//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 0 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("is_address = '深圳' ")
				wf_scriptview("ll_rtn = uo_1.of_addresstocoordinate(is_address,id_longitude, id_latitude) ")
				wf_scriptview("wf_OutPut('The return of of_addresstocoordinate(深圳) = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('The longitude = ' + string(id_longitude), False) ")
				wf_scriptview("wf_OutPut('The latitude = ' + string(id_latitude), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p023_addresstocoordinate2"
			if ab_execute then
				//Obtains the longitude and latitude according to the address.
 				//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 1
				uo_1.of_open( ieon_mapoption)
				is_address = 'London'
				ll_rtn = uo_1.of_addresstocoordinate(is_address,id_longitude, id_latitude)
				wf_OutPut('The return of of_addresstocoordinate(London) = ' + string(ll_rtn), False)
				wf_OutPut('The longitude = ' + string(id_longitude), False)
				wf_OutPut('The latitude = ' + string(id_latitude), False)
				uo_1.of_close()
			else
				wf_scriptview("//Obtains the longitude and latitude according to the address. ")
				wf_scriptview("//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 1 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("is_address = 'London' ")
				wf_scriptview("ll_rtn = uo_1.of_addresstocoordinate(is_address,id_longitude, id_latitude) ")
				wf_scriptview("wf_OutPut('The return of of_addresstocoordinate(London) = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('The longitude = ' + string(id_longitude), False) ")
				wf_scriptview("wf_OutPut('The latitude = ' + string(id_latitude), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p024_addresstocoordinate3"
			if ab_execute then
				//Obtains the longitude and latitude according to the address.
 				//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 2
				uo_1.of_open( ieon_mapoption)
				is_address = 'New York'
				ll_rtn = uo_1.of_addresstocoordinate(is_address,id_longitude, id_latitude)
				wf_OutPut('The return of of_addresstocoordinate(New York) = ' + string(ll_rtn), False)
				wf_OutPut('The longitude = ' + string(id_longitude), False)
				wf_OutPut('The latitude = ' + string(id_latitude), False)
				uo_1.of_close()
			else
				wf_scriptview("//Obtains the longitude and latitude according to the address. ")
				wf_scriptview("//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 2 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("is_address = 'New York' ")
				wf_scriptview("ll_rtn = uo_1.of_addresstocoordinate(is_address,id_longitude, id_latitude) ")
				wf_scriptview("wf_OutPut('The return of of_addresstocoordinate(London) = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('The longitude = ' + string(id_longitude), False) ")
				wf_scriptview("wf_OutPut('The latitude = ' + string(id_latitude), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p025_addresstocoordinate4"
			if ab_execute then
				//Obtains the longitude and latitude according to the address.
 				//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 3
				uo_1.of_open( ieon_mapoption)
				is_address = 'zhengzhou'
				ll_rtn = uo_1.of_addresstocoordinate(is_address,id_longitude, id_latitude)
				wf_OutPut('The return of of_addresstocoordinate(zhengzhou) = ' + string(ll_rtn), False)
				wf_OutPut('The longitude = ' + string(id_longitude), False)
				wf_OutPut('The latitude = ' + string(id_latitude), False)
				uo_1.of_close()
			else
				wf_scriptview("//Obtains the longitude and latitude according to the address. ")
				wf_scriptview("//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 3 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("is_address = 'zhengzhou' ")
				wf_scriptview("ll_rtn = uo_1.of_addresstocoordinate(is_address,id_longitude, id_latitude) ")
				wf_scriptview("wf_OutPut('The return of of_addresstocoordinate(London) = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('The longitude = ' + string(id_longitude), False) ")
				wf_scriptview("wf_OutPut('The latitude = ' + string(id_latitude), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p026_addresstocoordinate5"
			if ab_execute then
				//Obtains the longitude and latitude according to the address.
 				//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 4
				uo_1.of_open( ieon_mapoption)
				is_address = '珠海'
				ll_rtn = uo_1.of_addresstocoordinate(is_address,id_longitude, id_latitude)
				wf_OutPut('The return of of_addresstocoordinate(珠海) = ' + string(ll_rtn), False)
				wf_OutPut('The longitude = ' + string(id_longitude), False)
				wf_OutPut('The latitude = ' + string(id_latitude), False)
				uo_1.of_close()
			else
				wf_scriptview("//Obtains the longitude and latitude according to the address. ")
				wf_scriptview("//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 4 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("is_address = '珠海' ")
				wf_scriptview("ll_rtn = uo_1.of_addresstocoordinate(is_address,id_longitude, id_latitude) ")
				wf_scriptview("wf_OutPut('The return of of_addresstocoordinate(London) = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('The longitude = ' + string(id_longitude), False) ")
				wf_scriptview("wf_OutPut('The latitude = ' + string(id_latitude), False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p027_coordinatetoaddress1"
			if ab_execute then
				//Converts the longitude and latitude into the corresponding address. 
				//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 0
				uo_1.of_open( ieon_mapoption)
				id_longitude = 113.94
				id_latitude = 22.55
				ll_rtn = uo_1.of_coordinatetoaddress(id_longitude, id_latitude, is_address)
				wf_OutPut('The return of of_coordinatetoaddress(' +string(id_longitude)+ ',' +string(id_latitude)+ ') = ' + string(ll_rtn), False)
				wf_OutPut('The address = ' + is_address, False)
				uo_1.of_close()
			else
				wf_scriptview("//Converts the longitude and latitude into the corresponding address. ")
				wf_scriptview("//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 0 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("id_longitude = 113.94 ")
				wf_scriptview("id_latitude = 22.55 ")
				wf_scriptview("ll_rtn = uo_1.of_coordinatetoaddress(id_longitude, id_latitude, is_address) ")
				wf_scriptview("wf_OutPut('The return of of_coordinatetoaddress(' +string(id_longitude)+ ',' +string(id_latitude)+ ') = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('The address = ' + is_address, False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p028_coordinatetoaddress2"
			if ab_execute then
				//Converts the longitude and latitude into the corresponding address. 
				//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 1
				uo_1.of_open( ieon_mapoption)
				id_longitude = 0
				id_latitude = 0
				ll_rtn = uo_1.of_coordinatetoaddress(id_longitude, id_latitude, is_address)
				wf_OutPut('The return of of_coordinatetoaddress(' +string(id_longitude)+ ',' +string(id_latitude)+ ') = ' + string(ll_rtn), False)
				wf_OutPut('The address = ' + is_address, False)
				uo_1.of_close()
			else
				wf_scriptview("//Converts the longitude and latitude into the corresponding address. ")
				wf_scriptview("//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 1 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("id_longitude = 0 ")
				wf_scriptview("id_latitude = 0 ")
				wf_scriptview("ll_rtn = uo_1.of_coordinatetoaddress(id_longitude, id_latitude, is_address) ")
				wf_scriptview("wf_OutPut('The return of of_coordinatetoaddress(' +string(id_longitude)+ ',' +string(id_latitude)+ ') = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('The address = ' + is_address, False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p029_coordinatetoaddress3"
			if ab_execute then
				//Converts the longitude and latitude into the corresponding address. 
				//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 2
				uo_1.of_open( ieon_mapoption)
				id_longitude = 121.11
				id_latitude = 38.20
				ll_rtn = uo_1.of_coordinatetoaddress(id_longitude, id_latitude, is_address)
				wf_OutPut('The return of of_coordinatetoaddress(' +string(id_longitude)+ ',' +string(id_latitude)+ ') = ' + string(ll_rtn), False)
				wf_OutPut('The address = ' + is_address, False)
				uo_1.of_close()
			else
				wf_scriptview("//Converts the longitude and latitude into the corresponding address. ")
				wf_scriptview("//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 2 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("id_longitude = 121.11 ")
				wf_scriptview("id_latitude = 38.20 ")
				wf_scriptview("ll_rtn = uo_1.of_coordinatetoaddress(id_longitude, id_latitude, is_address) ")
				wf_scriptview("wf_OutPut('The return of of_coordinatetoaddress(' +string(id_longitude)+ ',' +string(id_latitude)+ ') = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('The address = ' + is_address, False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p030_coordinatetoaddress4"
			if ab_execute then
				//Converts the longitude and latitude into the corresponding address. 
				//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 3
				uo_1.of_open( ieon_mapoption)
				id_longitude = -10
				id_latitude = -20
				ll_rtn = uo_1.of_coordinatetoaddress(id_longitude, id_latitude, is_address)
				wf_OutPut('The return of of_coordinatetoaddress(' +string(id_longitude)+ ',' +string(id_latitude)+ ') = ' + string(ll_rtn), False)
				wf_OutPut('The address = ' + is_address, False)
				uo_1.of_close()
			else
				wf_scriptview("//Converts the longitude and latitude into the corresponding address. ")
				wf_scriptview("//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 3 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("id_longitude = -10 ")
				wf_scriptview("id_latitude = -20 ")
				wf_scriptview("ll_rtn = uo_1.of_coordinatetoaddress(id_longitude, id_latitude, is_address) ")
				wf_scriptview("wf_OutPut('The return of of_coordinatetoaddress(' +string(id_longitude)+ ',' +string(id_latitude)+ ') = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('The address = ' + is_address, False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p031_coordinatetoaddress5"
			if ab_execute then
				//Converts the longitude and latitude into the corresponding address. 
				//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 4
				uo_1.of_open( ieon_mapoption)
				id_longitude = -20
				id_latitude = 123.11
				ll_rtn = uo_1.of_coordinatetoaddress(id_longitude, id_latitude, is_address)
				wf_OutPut('The return of of_coordinatetoaddress(' +string(id_longitude)+ ',' +string(id_latitude)+ ') = ' + string(ll_rtn), False)
				wf_OutPut('The address = ' + is_address, False)
				uo_1.of_close()
			else
				wf_scriptview("//Converts the longitude and latitude into the corresponding address. ")
				wf_scriptview("//Note: before this function is called, be sure to add an eon_mobile_mapex control and call the of_open function of this control to open the map successfully. ")
				wf_scriptview("ieon_mapoption.b_locatetocurrentlocation = true ")
				wf_scriptview("ieon_mapoption.b_allowmove = true ")
				wf_scriptview("ieon_mapoption.b_allowzoom = true ")
				wf_scriptview("ieon_mapoption.i_mapaccuracy = 10 ")
				wf_scriptview("ieon_mapoption.i_maptype = 4 ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("id_longitude = -20 ")
				wf_scriptview("id_latitude = 123.11 ")
				wf_scriptview("ll_rtn = uo_1.of_coordinatetoaddress(id_longitude, id_latitude, is_address) ")
				wf_scriptview("wf_OutPut('The return of of_coordinatetoaddress(' +string(id_longitude)+ ',' +string(id_latitude)+ ') = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('The address = ' + is_address, False) ")
				wf_scriptview("uo_1.of_close() ")
			end if
		case "map_p032_annotation1"
			if ab_execute then
				//Adds a map annotation then select it and remove it.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 0
				ieon_annotation.dec_longitude = 0
				ieon_annotation.dec_latitude = 0
				ieon_annotation.s_title = ''
				ieon_annotation.s_subtitle = ''
				ieon_annotation.i_pincolor = 0
				ieon_annotation.s_pinimage = ''
				ib_allowmove = true
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_addannotation( ieon_annotation, ib_allowmove)
				il_id = ieon_annotation.l_id
				wf_OutPut('The return of of_addannotation() = ' + string(ll_rtn), False)
				wf_OutPut('addannotation ID = ' + string(il_id), False)
				ll_rtn = uo_1.of_selectannotation( ieon_annotation)
				wf_OutPut('The return of of_selectannotation() = ' + string(ll_rtn), False)
				ll_rtn = uo_1.of_removeannotation( ieon_annotation)
				wf_OutPut('The return of of_removeannotation() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Adds a map annotation then select it and remove it.")
				wf_scriptview("ieon_annotation.dec_longitude = 0 ")
				wf_scriptview("ieon_annotation.dec_latitude = 0 ")
				wf_scriptview("ieon_annotation.s_title = '' ")
				wf_scriptview("ieon_annotation.s_subtitle = '' ")
				wf_scriptview("ieon_annotation.i_pincolor = 0 ")
				wf_scriptview("ieon_annotation.s_pinimage = '' ")
				wf_scriptview("ib_allowmove = true ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_addannotation( ieon_annotation, ib_allowmove) ")
				wf_scriptview("wf_OutPut('The return of of_addannotation() = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('addannotation ID = ' + string(il_id), False) ")
				wf_scriptview("ll_rtn = uo_1.of_selectannotation( ieon_annotation) ")
				wf_scriptview("wf_OutPut('The return of of_selectannotation() = ' + string(ll_rtn), False) ")
				wf_scriptview("ll_rtn = uo_1.of_removeannotation( ieon_annotation) ")
				wf_scriptview("wf_OutPut('The return of of_removeannotation() = ' + string(ll_rtn), False) ")
			end if		
		case "map_p033_annotation2"
			if ab_execute then
				//Adds a map annotation then select it and remove it.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 0
				ieon_annotation.dec_longitude = 113.94
				ieon_annotation.dec_latitude = 22.55
				ieon_annotation.s_title = 'test1'
				ieon_annotation.s_subtitle = 'subtest1'
				ieon_annotation.i_pincolor = 1
				ieon_annotation.s_pinimage = ''
				ieon_annotation.l_id = 1
				ib_allowmove = true
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_addannotation( ieon_annotation, ib_allowmove)
				il_id = ieon_annotation.l_id
				wf_OutPut('The return of of_addannotation() = ' + string(ll_rtn), False)
				wf_OutPut('addannotation ID = ' + string(il_id), False)				
				ll_rtn = uo_1.of_selectannotation( il_id)
				wf_OutPut('The return of of_selectannotation() = ' + string(ll_rtn), False)
				ll_rtn = uo_1.of_removeannotation( il_id)
				wf_OutPut('The return of of_removeannotation() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Adds a map annotation then select it and remove it.")
				wf_scriptview("ieon_annotation.dec_longitude = 113.94 ")
				wf_scriptview("ieon_annotation.dec_latitude = 22.55 ")
				wf_scriptview("ieon_annotation.s_title = 'test1' ")
				wf_scriptview("ieon_annotation.s_subtitle = 'subtest1' ")
				wf_scriptview("ieon_annotation.i_pincolor = 1 ")
				wf_scriptview("ieon_annotation.s_pinimage = '' ")
				wf_scriptview("ib_allowmove = true ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_addannotation( ieon_annotation, ib_allowmove) ")
				wf_scriptview("wf_OutPut('The return of of_addannotation() = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('addannotation ID = ' + string(il_id), False) ")
				wf_scriptview("ll_rtn = uo_1.of_selectannotation( il_id) ")
				wf_scriptview("wf_OutPut('The return of of_selectannotation() = ' + string(ll_rtn), False) ")
				wf_scriptview("ll_rtn = uo_1.of_removeannotation( il_id) ")
				wf_scriptview("wf_OutPut('The return of of_removeannotation() = ' + string(ll_rtn), False) ")
			end if
		case "map_p034_removeallannotation"
			if ab_execute then
				//Removes all map annotations that are added by of_addannotation.
				ieon_mapoption.b_locatetocurrentlocation = true
				ieon_mapoption.b_allowmove = true
				ieon_mapoption.b_allowzoom = true
				ieon_mapoption.i_mapaccuracy = 10
				ieon_mapoption.i_maptype = 0
				ieon_annotation.dec_longitude = 20
				ieon_annotation.dec_latitude = 30
				ieon_annotation.s_title = 'Pic'
				ieon_annotation.s_subtitle = 'subPic'
				ieon_annotation.i_pincolor = 2
				ieon_annotation.s_pinimage = 'title.png'
				ib_allowmove = true
				uo_1.of_open( ieon_mapoption)
				ll_rtn = uo_1.of_addannotation( ieon_annotation, ib_allowmove)
				il_id = ieon_annotation.l_id
				wf_OutPut('The return of of_addannotation() = ' + string(ll_rtn), False)
				wf_OutPut('addannotation ID = ' + string(il_id), False)
				ieon_annotation.dec_longitude = 66.66
				ieon_annotation.dec_latitude = 77.77
				ieon_annotation.s_title = 'test2'
				ieon_annotation.s_subtitle = 'subtest2'
				ieon_annotation.i_pincolor = 3
				ieon_annotation.s_pinimage = ''
				ib_allowmove = true
				ll_rtn = uo_1.of_addannotation( ieon_annotation, ib_allowmove)
				il_id = ieon_annotation.l_id
				wf_OutPut('The return of of_addannotation() = ' + string(ll_rtn), False)
				wf_OutPut('addannotation ID = ' + string(il_id), False)
				ll_rtn = uo_1.of_removeallannotation()
				wf_OutPut('The return of of_removeallannotation() = ' + string(ll_rtn), False)
				ll_rtn = uo_1.of_selectannotation( il_id)
				wf_OutPut('After remove, the return of of_selectannotation() = ' + string(ll_rtn), False)
				uo_1.of_close()
			else
				wf_scriptview("//Removes all map annotations that are added by of_addannotation. ")
				wf_scriptview("ieon_annotation.dec_longitude = 20 ")
				wf_scriptview("ieon_annotation.dec_latitude = 30 ")
				wf_scriptview("ieon_annotation.s_title = 'Pic' ")
				wf_scriptview("ieon_annotation.s_subtitle = 'subPic' ")
				wf_scriptview("ieon_annotation.i_pincolor = 2 ")
				wf_scriptview("ieon_annotation.s_pinimage = 'title.png' ")
				wf_scriptview("ib_allowmove = true ")
				wf_scriptview("uo_1.of_open( ieon_mapoption) ")
				wf_scriptview("ll_rtn = uo_1.of_addannotation( ieon_annotation, ib_allowmove) ")
				wf_scriptview("wf_OutPut('The return of of_addannotation() = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('addannotation ID = ' + string(il_id), False) ")
				wf_scriptview("ieon_annotation.dec_longitude = 66.66 ")
				wf_scriptview("ieon_annotation.dec_latitude = 77.77 ")
				wf_scriptview("ieon_annotation.s_title = 'test2' ")
				wf_scriptview("ieon_annotation.s_subtitle = 'subtest2' ")
				wf_scriptview("ieon_annotation.i_pincolor = 3 ")
				wf_scriptview("ieon_annotation.s_pinimage = '' ")
				wf_scriptview("ib_allowmove = true ")
				wf_scriptview("ll_rtn = uo_1.of_addannotation( ieon_annotation, ib_allowmove) ")
				wf_scriptview("wf_OutPut('The return of of_addannotation() = ' + string(ll_rtn), False) ")
				wf_scriptview("wf_OutPut('addannotation ID = ' + string(il_id), False) ")
				wf_scriptview("ll_rtn = uo_1.of_removeallannotation() ")
				wf_scriptview("wf_OutPut('The return of of_removeallannotation() = ' + string(ll_rtn), False) ")
				wf_scriptview("ll_rtn = uo_1.of_selectannotation( il_id) ")
				wf_scriptview("wf_OutPut('After remove, the return of of_selectannotation() = ' + string(ll_rtn), False) ")
			end if
		case else
			messagebox("Error",ls_testcase+"has no coding")
end choose

//保存执行的数据
if ab_execute then
	wf_saveresult(li_testcaseid)
end if
end subroutine

on w_mobile_map.create
int iCurrent
call super::create
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
end on

on w_mobile_map.destroy
call super::destroy
destroy(this.uo_1)
end on

event open;call super::open;ieon_gps = create eon_mobile_geolocationex

ieon_gps.of_register( cb_1, 'ue_changed', '')
end event

type cb_4 from w_testcase_base`cb_4 within w_mobile_map
end type

type cb_3 from w_testcase_base`cb_3 within w_mobile_map
end type

type cb_2 from w_testcase_base`cb_2 within w_mobile_map
end type

type cb_1 from w_testcase_base`cb_1 within w_mobile_map
end type

type mle_output from w_testcase_base`mle_output within w_mobile_map
end type

type mle_2 from w_testcase_base`mle_2 within w_mobile_map
end type

type mle_1 from w_testcase_base`mle_1 within w_mobile_map
end type

type dw_1 from w_testcase_base`dw_1 within w_mobile_map
end type

type gb_1 from w_testcase_base`gb_1 within w_mobile_map
end type

type gb_2 from w_testcase_base`gb_2 within w_mobile_map
end type

type gb_3 from w_testcase_base`gb_3 within w_mobile_map
end type

type gb_4 from w_testcase_base`gb_4 within w_mobile_map
end type

type gb_5 from w_testcase_base`gb_5 within w_mobile_map
end type

type uo_1 from eon_mobile_mapex within w_mobile_map
event destroy ( )
integer x = 27
integer y = 1036
integer width = 878
integer height = 588
integer taborder = 50
boolean border = true
end type

on uo_1.destroy
call eon_mobile_mapex::destroy
end on

event oe_loadstart;call super::oe_loadstart;string ls_dcp
ls_dcp = "oe_loadstart occur"
end event

