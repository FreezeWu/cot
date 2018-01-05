$PBExportHeader$w_mobile_barcode.srw
forward
global type w_mobile_barcode from w_testcase_base
end type
end forward

global type w_mobile_barcode from w_testcase_base
end type
global w_mobile_barcode w_mobile_barcode

type variables
eon_mobile_barcodeex ieon_barcode
string is_data
long il_format
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

//				barcode format list
// 					 	 0 - unknown
//						 1 - EAN-2, GS1 2-digit add-on
//						 2 - EAN-5, GS1 5-digit add-on
//						 3 - EAN-8, EAN-8
//						 4 - UPC-E4
//						 5 - ISBN-10, from EAN-13
//				*		 6 - UPC-A 
//				*		 7 - EAN-13
//						 8 - ISBN-13, from EAN-13
//						 9 - COMPOSITE, EAN/UPC composite
//						 10 - Interleaved 2 of 5
//				*		 11 - CODE 128
//						 12 - CODE93
//				*		 13 - CODE39
//						 14 - ITF	
//				*		 20 - QR CODE
//						 21 - DataMatrix
//						 22 - AZTEC

choose case ls_testcase
		case "barcode_p001_createUPC"
			if ab_execute then
				il_format = 6
				is_data = 'True'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = '3435367'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'dfgfd34234fd'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'http://192.0.3.127'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
			else
				wf_scriptview("il_format = 6 ")
				wf_scriptview("is_data = 'True' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = '3435367' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'dfgfd34234fd' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'http://192.0.3.127' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
			end if
		case "barcode_p002_createEAN13"
			if ab_execute then
				il_format = 7
				is_data = 'True'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = '3435367'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'dfgfd34234fd'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'http://192.0.3.127'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
			else
				wf_scriptview("il_format = 7 ")
				wf_scriptview("is_data = 'True' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = '3435367' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'dfgfd34234fd' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'http://192.0.3.127' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
			end if
		case "barcode_p003_createCODE128"
			if ab_execute then
				il_format = 11
				is_data = 'True'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = '3435367'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'dfgfd34234fd'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'http://192.0.3.127'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
			else
				wf_scriptview("il_format = 11 ")
				wf_scriptview("is_data = 'True' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = '3435367' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'dfgfd34234fd' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'http://192.0.3.127' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
			end if
		case "barcode_p004_createCODE39"
			if ab_execute then
				il_format = 13
				is_data = 'True'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = '3435367'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'dfgfd34234fd'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'http://192.0.3.127'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
			else
				wf_scriptview("il_format = 13 ")
				wf_scriptview("is_data = 'True' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = '3435367' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'dfgfd34234fd' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'http://192.0.3.127' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
			end if
		case "barcode_p005_createQRCODE"
			if ab_execute then
				il_format = 20
				is_data = 'True'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = '3435367'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'dfgfd34234fd'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'http://192.0.3.127'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
			else
				wf_scriptview("il_format = 20 ")
				wf_scriptview("is_data = 'True' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = '3435367' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'dfgfd34234fd' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'http://192.0.3.127' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file,lb_data) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
			end if
		case "barcode_p006_create2UPC"
			if ab_execute then
				il_format = 6
				is_data = 'True'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = '3435367'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'dfgfd34234fd'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'http://192.0.3.127'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
			else
				wf_scriptview("il_format = 6 ")
				wf_scriptview("is_data = 'True' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = '3435367' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'dfgfd34234fd' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'http://192.0.3.127' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
			end if
		case "barcode_p007_create2EAN13"
			if ab_execute then
				il_format = 7
				is_data = 'True'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = '3435367'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'dfgfd34234fd'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'http://192.0.3.127'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
			else
				wf_scriptview("il_format = 7 ")
				wf_scriptview("is_data = 'True' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = '3435367' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'dfgfd34234fd' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'http://192.0.3.127' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
			end if
		case "barcode_p008_create2CODE128"
			if ab_execute then
				il_format = 11
				is_data = 'True'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = '3435367'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'dfgfd34234fd'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'http://192.0.3.127'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
			else
				wf_scriptview("il_format = 11 ")
				wf_scriptview("is_data = 'True' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = '3435367' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'dfgfd34234fd' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'http://192.0.3.127' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
			end if
		case "barcode_p009_create2CODE39"
			if ab_execute then
				il_format = 13
				is_data = 'True'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = '3435367'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'dfgfd34234fd'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'http://192.0.3.127'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
			else
				wf_scriptview("il_format = 13 ")
				wf_scriptview("is_data = 'True' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = '3435367' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'dfgfd34234fd' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'http://192.0.3.127' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
			end if
		case "barcode_p010_create2QRCODE"
			if ab_execute then
				il_format = 20
				is_data = 'True'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = '3435367'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'dfgfd34234fd'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
				is_data = 'http://192.0.3.127'
				ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file)
				wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False)
			else
				wf_scriptview("il_format = 20 ")
				wf_scriptview("is_data = 'True' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = '3435367' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'dfgfd34234fd' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
				wf_scriptview("is_data = 'http://192.0.3.127' ")
				wf_scriptview("ll_rtn = ieon_barcode.of_create(is_data,il_format,ls_file) ")
				wf_scriptview("wf_OutPut('The return of of_create('+is_data+','+string(il_format)+') = ' + string(ll_rtn), False) ")
			end if		
		case else
			messagebox("Error",ls_testcase+"has no coding")
end choose

//保存执行的数据
if ab_execute then
	wf_saveresult(li_testcaseid)
end if
end subroutine

event open;call super::open;ieon_barcode = create eon_mobile_barcodeex
end event

on w_mobile_barcode.create
call super::create
end on

on w_mobile_barcode.destroy
call super::destroy
end on

type cb_4 from w_testcase_base`cb_4 within w_mobile_barcode
end type

type cb_3 from w_testcase_base`cb_3 within w_mobile_barcode
end type

type cb_2 from w_testcase_base`cb_2 within w_mobile_barcode
end type

type cb_1 from w_testcase_base`cb_1 within w_mobile_barcode
end type

type mle_output from w_testcase_base`mle_output within w_mobile_barcode
end type

type mle_2 from w_testcase_base`mle_2 within w_mobile_barcode
end type

type mle_1 from w_testcase_base`mle_1 within w_mobile_barcode
end type

type dw_1 from w_testcase_base`dw_1 within w_mobile_barcode
end type

type gb_1 from w_testcase_base`gb_1 within w_mobile_barcode
end type

type gb_2 from w_testcase_base`gb_2 within w_mobile_barcode
end type

type gb_3 from w_testcase_base`gb_3 within w_mobile_barcode
end type

type gb_4 from w_testcase_base`gb_4 within w_mobile_barcode
end type

type gb_5 from w_testcase_base`gb_5 within w_mobile_barcode
end type

