$PBExportHeader$w_nativepdf_ds.srw
forward
global type w_nativepdf_ds from w_testcase_base
end type
end forward

global type w_nativepdf_ds from w_testcase_base
end type
global w_nativepdf_ds w_nativepdf_ds

type variables
datastore ids_emp
end variables

forward prototypes
public subroutine wf_scriptexe (integer ai_item, boolean ab_execute)
end prototypes

public subroutine wf_scriptexe (integer ai_item, boolean ab_execute);//执行各测试点，需要重载该函数 ai_item返回的是datawindow的行号
string  ls_testcase,ls_rtn,ls_msg
long li_testcaseid,ll_rtn
if ai_item = 0 then return

ls_testcase = dw_1.getitemstring(ai_item,"testcasename")
li_testcaseid = dw_1.getitemnumber( ai_item,"id")

If ab_execute Then 
	wf_output("-----Test Point:" + ls_testcase + "-----", True)
End If

choose case lower(ls_testcase)	
	case "pdf_p001_customorientation_ds"
		if ab_execute then
			//<0 - Default, 1 - Landscape, 2 - Portrait>
			//get original value
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")
			wf_OutPut("The original value of NativePDF.CustomOrientation = " + ls_rtn, False)

			//set to 1
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=1")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")
			if ls_msg <> "" then
				wf_OutPut("Set to 1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			end if

			//set to 2
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=2")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")
			if ls_msg <> "" then
				wf_OutPut("Set to 2 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 2, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			end if
			
			//set to 3, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=3")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")
			if ls_msg <> "" then
				wf_OutPut("Set to 3 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 3, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			end if

			//set to -1, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=-1")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")
			if ls_msg <> "" then
				wf_OutPut("Set to -1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to -1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			end if

			//set to 0
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=0")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")
			if ls_msg <> "" then
				wf_OutPut("Set to 0 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 0, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			end if
		else
			wf_scriptview('//<0 - Default, 1 - Landscape, 2 - Portrait>   ')
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=1")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=2")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 2 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 2, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 3, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=3")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 3 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 3, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to -1, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=-1")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to -1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=0")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 0 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 0, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
		end if
	case "pdf_p002_customsize_ds"
		if ab_execute then
			//<0 - Default, 1 - A1 594 x 841 mm, 2 - A2 420 x 594 mm, 3 - A3 297 x 420 mm, 4 - A4 210 x 297 mm, 5 - letter 8 1/2 x 11 in, 6 - Legal 8 1/2 x 14 in>
			//get original value
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			wf_OutPut("The original value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 1
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=1")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 1, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if

			//set to 2
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=2")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 2 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 2, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if
			
			//set to 3
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=3")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 3 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 3, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if
			
			//set to 4
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=4")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 4 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 4, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if
			
			//set to 5
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=5")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 5 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 5, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if
			
			//set to 6
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=6")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 6 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 6, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if
			
			//set to 7, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=7")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 7 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 7, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if

			//set to -1, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=-1")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to -1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to -1, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if

			//set to 0
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=0")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 0 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 0, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if
		else
			wf_scriptview('//<0 - Default, 1 - A1 594 x 841 mm, 2 - A2 420 x 594 mm, 3 - A3 297 x 420 mm, 4 - A4 210 x 297 mm, 5 - letter 8 1/2 x 11 in, 6 - Legal 8 1/2 x 14 in>   ')
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=1")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 1, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=2")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 2 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 2, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 3   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=3")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 3 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 3, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 4   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=4")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 4 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 4, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 5   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=5")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 5 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 5, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 6   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=6")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 6 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 6, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 7, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=7")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 7 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 7, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to -1, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=-1")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to -1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=0")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 0 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 0, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
		end if
	case "pdf_p003_imageformat_ds"
		if ab_execute then
			//<0 - bmp, 1 - jpg,2 - png,3 - gif>
			//get original value
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			wf_OutPut("The original value of NativePDF.ImageFormat = " + ls_rtn, False)
			
			//set to 1
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=1")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			if ls_msg <> "" then
				wf_OutPut("Set to 1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 1, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			end if
			
			//set to 2
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=2")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			if ls_msg <> "" then
				wf_OutPut("Set to 2 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 2, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			end if
			
			//set to 3
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=3")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			if ls_msg <> "" then
				wf_OutPut("Set to 3 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 3, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			end if
			
			//set to 4, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=4")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			if ls_msg <> "" then
				wf_OutPut("Set to 4 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 4, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			end if
			
			//set to -1, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=-1")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			if ls_msg <> "" then
				wf_OutPut("Set to -1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to -1, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			end if
			
			//set to 0
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=0")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			if ls_msg <> "" then
				wf_OutPut("Set to 0 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 0, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			end if
		else
			wf_scriptview('//<0 - bmp, 1 - jpg,2 - png,3 - gif>   ')
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=1")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 1, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=2")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 2 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 2, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 3   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=3")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 3 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 3, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 4, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=4")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 4 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 4, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to -1, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=-1")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to -1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=0")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 0 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 0, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
		end if
	case "pdf_p004_pdfstandard_ds"
		if ab_execute then
			//<0 - None, 1 - PDF/A-1a, 2 - PDF/A-1b, 3 - PDF/A-3a, 4 - PDF/A-3b, 5 - PDF/A-3u>
			//get original value
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("The original value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 1
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=1")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 1, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to 2
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=2")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 2 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 2, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to 3
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=3")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 3 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 3, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to 4
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=4")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 4 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 4, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to 5
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=5")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 5 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 5, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to 6, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=6")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 6 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 6, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to -1, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=-1")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to -1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to -1, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to 0
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=0")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 0 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 0, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
		else
			wf_scriptview('//<0 - None, 1 - PDF/A-1a, 2 - PDF/A-1b, 3 - PDF/A-3a, 4 - PDF/A-3b, 5 - PDF/A-3u>   ')
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=1")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 1, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=2")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 2 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 2, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 3   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=3")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 3 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 3, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 4   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=4")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 4 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 4, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 5   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=5")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 5 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 5, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 6, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=6")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 6 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 6, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to -1, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=-1")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to -1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=0")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 0 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 0, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
		end if
	case "pdf_p005_useprintspec_ds"
		if ab_execute then
			//<NO - Use Native PDF Settings, YES - Use Settings in Print Specifications>
			//get original value
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			wf_OutPut("The original value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to true, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=true")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			if ls_msg <> "" then
				wf_OutPut("Set to true error, " + ls_msg, False)
			else
				wf_OutPut("Set to true, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			end if
			
			//set to false, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=false")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			if ls_msg <> "" then
				wf_OutPut("Set to false error, " + ls_msg, False)
			else
				wf_OutPut("Set to false, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			end if
			
			//set to abc, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=abc")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			if ls_msg <> "" then
				wf_OutPut("Set to abc error, " + ls_msg, False)
			else
				wf_OutPut("Set to abc, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			end if
			
			//set to empty string, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=''")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			if ls_msg <> "" then
				wf_OutPut("Set to empty string error, " + ls_msg, False)
			else
				wf_OutPut("Set to empty string, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			end if
			
			//set to yes
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=yes")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			if ls_msg <> "" then
				wf_OutPut("Set to yes error, " + ls_msg, False)
			else
				wf_OutPut("Set to yes, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			end if
			
			//set to no
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=no")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			if ls_msg <> "" then
				wf_OutPut("Set to no error, " + ls_msg, False)
			else
				wf_OutPut("Set to no, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			end if
		else
			wf_scriptview('//<NO - Use Native PDF Settings, YES - Use Settings in Print Specifications>   ')
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to true, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=true")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to true error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to true, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to false, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=false")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to false error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to false, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to abc, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=abc")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to abc error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to abc, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to empty string, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=~'~'")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to empty string error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to empty string, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to yes   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=yes")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to yes error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to yes, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to no   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=no")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to no error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to no, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
		end if
	case "pdf_p006_method_ds"
		if ab_execute then
			//<Distill!, XSLFOP!, NativePDF!>
			//get original value
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.Method")
			wf_OutPut("The original value of NativePDF.Method = " + ls_rtn, False)			
			
			//set to NativePDF!
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.Method=NativePDF!")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.Method")
			if ls_msg <> "" then
				wf_OutPut("Set to NativePDF! error, " + ls_msg, False)
			else
				wf_OutPut("Set to NativePDF!, the value of NativePDF.Method = " + ls_rtn, False)
			end if
			
			//set to XSLFOP!
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.Method=XSLFOP!")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.Method")
			if ls_msg <> "" then
				wf_OutPut("Set to XSLFOP! error, " + ls_msg, False)
			else
				wf_OutPut("Set to XSLFOP!, the value of NativePDF.Method = " + ls_rtn, False)
			end if
			
			//set to PDF!, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.Method=PDF!")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.Method")
			if ls_msg <> "" then
				wf_OutPut("Set to PDF! error, " + ls_msg, False)
			else
				wf_OutPut("Set to PDF!, the value of NativePDF.Method = " + ls_rtn, False)
			end if
			
			//set to empty string, invalid value
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.Method=''")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.Method")
			if ls_msg <> "" then
				wf_OutPut("Set to empty string error, " + ls_msg, False)
			else
				wf_OutPut("Set to empty string, the value of NativePDF.Method = " + ls_rtn, False)
			end if
			
			//set to Distill!
			ls_msg = ids_emp.Modify("DataWindow.Export.PDF.Method=Distill!")
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.Method")
			if ls_msg <> "" then
				wf_OutPut("Set to Distill! error, " + ls_msg, False)
			else
				wf_OutPut("Set to Distill!, the value of NativePDF.Method = " + ls_rtn, False)
			end if
		else
			wf_scriptview('//<Distill!, XSLFOP!, NativePDF!>   ')
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.Method")   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('//set to NativePDF!   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.Method=NativePDF!")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.Method")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to NativePDF! error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to NativePDF!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to XSLFOP!   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.Method=XSLFOP!")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.Method")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to XSLFOP! error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to XSLFOP!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to PDF!, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.Method=PDF!")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.Method")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to PDF! error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to PDF!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to empty string, invalid value   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.Method=~'~'")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.Method")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to empty string error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to empty string, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to Distill!   ')
			wf_scriptview('ls_msg = ids_emp.Modify("DataWindow.Export.PDF.Method=Distill!")   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.Method")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to Distill! error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to Distill!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
		end if
	case "pdf_p007_customorientation2_ds"
		if ab_execute then
			//get original value
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
			wf_OutPut("The original value of NativePDF.CustomOrientation = " + ls_rtn, False)

			//set to 1
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 1
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
			wf_OutPut("Set to 1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)

			//set to 2
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 2
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
			wf_OutPut("Set to 2, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			
			//set to 3, invalid value
			if appeongetclienttype() = "WEB" then
				ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 3
				ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
				wf_OutPut("Set to 3, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			else
				try
					ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 3
				Catch(NullObjectError ex10_1)
					wf_OutPut("Set to 3, nullobjecterror = " + ex10_1.GetMessage(), False)
				Catch(RuntimeError ex10_2)
					wf_OutPut("Set to 3, runtimeerror = " + ex10_2.GetMessage(), False)
				Catch(Exception ex10_3)
					wf_OutPut("Set to 3, exception = " + ex10_3.GetMessage(), False)
				end try
			end if
			
			//set to -1, invalid value
			if appeongetclienttype() = "WEB" then
				ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = -1
				ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
				wf_OutPut("Set to -1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			else
				try
					ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = -1
				Catch(NullObjectError ex11_1)
					wf_OutPut("Set to -1, nullobjecterror = " + ex11_1.GetMessage(), False)
				Catch(RuntimeError ex11_2)
					wf_OutPut("Set to -1, runtimeerror = " + ex11_2.GetMessage(), False)
				Catch(Exception ex11_3)
					wf_OutPut("Set to -1, exception = " + ex11_3.GetMessage(), False)
				end try
			end if
			
			//set to 0
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 0
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
			wf_OutPut("Set to 0, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
		else
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 1   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation   ')
			wf_scriptview('wf_OutPut("Set to 1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 2   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation   ')
			wf_scriptview('wf_OutPut("Set to 2, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('//set to 3, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 3   ')
			wf_scriptview('	ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation   ')
			wf_scriptview('	wf_OutPut("Set to 3, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 3   ')
			wf_scriptview('	Catch(NullObjectError ex01_1)   ')
			wf_scriptview('		wf_OutPut("Set to 3, nullobjecterror = " + ex01_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex01_2)   ')
			wf_scriptview('		wf_OutPut("Set to 3, runtimeerror = " + ex01_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex01_3)   ')
			wf_scriptview('		wf_OutPut("Set to 3, exception = " + ex01_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to -1, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = -1   ')
			wf_scriptview('	ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = -1   ')
			wf_scriptview('	Catch(NullObjectError ex05_1)   ')
			wf_scriptview('		wf_OutPut("Set to -1, nullobjecterror = " + ex05_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex05_2)   ')
			wf_scriptview('		wf_OutPut("Set to -1, runtimeerror = " + ex05_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex05_3)   ')
			wf_scriptview('		wf_OutPut("Set to -1, exception = " + ex05_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 0   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation   ')
			wf_scriptview('wf_OutPut("Set to 0, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
		end if	
	case "pdf_p008_customsize2_ds"
		if ab_execute then
			//get original value
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("The original value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 1
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 1
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("Set to 1, the value of NativePDF.CustomSize = " + ls_rtn, False)

			//set to 2
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 2
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("Set to 2, the value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 3
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 3
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("Set to 3, the value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 4
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 4
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("Set to 4, the value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 5
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 5
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("Set to 5, the value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 6
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 6
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("Set to 6, the value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 7, invalid value
			if appeongetclienttype() = "WEB" then
				ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize = 7
				ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize
				wf_OutPut("Set to 7, the value of NativePDF.CustomSize = " + ls_rtn, False)
			else
				try
					ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize = 7
				Catch(NullObjectError ex12_1)
					wf_OutPut("Set to 7, nullobjecterror = " + ex12_1.GetMessage(), False)
				Catch(RuntimeError ex12_2)
					wf_OutPut("Set to 7, runtimeerror = " + ex12_2.GetMessage(), False)
				Catch(Exception ex12_3)
					wf_OutPut("Set to 7, exception = " + ex12_3.GetMessage(), False)
				end try
			end if
			
			//set to -1, invalid value
			if appeongetclienttype() = "WEB" then
				ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize = -1
				ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize
				wf_OutPut("Set to -1, the value of NativePDF.CustomSize = " + ls_rtn, False)
			else
				try
					ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize = -1
				Catch(NullObjectError ex13_1)
					wf_OutPut("Set to -1, nullobjecterror = " + ex13_1.GetMessage(), False)
				Catch(RuntimeError ex13_2)
					wf_OutPut("Set to -1, runtimeerror = " + ex13_2.GetMessage(), False)
				Catch(Exception ex13_3)
					wf_OutPut("Set to -1, exception = " + ex13_3.GetMessage(), False)
				end try
			end if
			
			//set to 0
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 0
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			wf_OutPut("Set to 0, the value of NativePDF.CustomSize = " + ls_rtn, False)
		else
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 1   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("Set to 1, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 2   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("Set to 2, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 3   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 3   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("Set to 3, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 4   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 4   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("Set to 4, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 5   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 5   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("Set to 5, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 6   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 6   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("Set to 6, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 7, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize = 7   ')
			wf_scriptview('	ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('	wf_OutPut("Set to 7, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize = 7   ')
			wf_scriptview('	Catch(NullObjectError ex03_1)   ')
			wf_scriptview('		wf_OutPut("Set to 7, nullobjecterror = " + ex03_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex03_2)   ')
			wf_scriptview('		wf_OutPut("Set to 7, runtimeerror = " + ex03_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex03_3)   ')
			wf_scriptview('		wf_OutPut("Set to 7, exception = " + ex03_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to -1, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize = -1   ')
			wf_scriptview('	ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize = -1   ')
			wf_scriptview('	Catch(NullObjectError ex04_1)   ')
			wf_scriptview('		wf_OutPut("Set to -1, nullobjecterror = " + ex04_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex04_2)   ')
			wf_scriptview('		wf_OutPut("Set to -1, runtimeerror = " + ex04_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex04_3)   ')
			wf_scriptview('		wf_OutPut("Set to -1, exception = " + ex04_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 0   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('wf_OutPut("Set to 0, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
		end if
	case "pdf_p009_imageformat2_ds"
		if ab_execute then
			//get original value
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat
			wf_OutPut("The original value of NativePDF.ImageFormat = " + ls_rtn, False)
			
			//set to 1
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 1
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			wf_OutPut("Set to 1, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			
			//set to 2
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 2
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			wf_OutPut("Set to 2, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			
			//set to 3
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 3
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			wf_OutPut("Set to 3, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			
			//set to 4, invalid value
			if appeongetclienttype() = "WEB" then
				ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 4
				ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat
				wf_OutPut("Set to 4, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			else
				try
					ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 4
				Catch(NullObjectError ex14_1)
					wf_OutPut("Set to 4, nullobjecterror = " + ex14_1.GetMessage(), False)
				Catch(RuntimeError ex14_2)
					wf_OutPut("Set to 4, runtimeerror = " + ex14_2.GetMessage(), False)
				Catch(Exception ex14_3)
					wf_OutPut("Set to 4, exception = " + ex14_3.GetMessage(), False)
				end try
			end if
			
			//set to -1, invalid value
			if appeongetclienttype() = "WEB" then
				ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = -1
				ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat
				wf_OutPut("Set to -1, the value of NativePDF.CustomSize = " + ls_rtn, False)
			else
				try
					ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = -1
				Catch(NullObjectError ex15_1)
					wf_OutPut("Set to -1, nullobjecterror = " + ex15_1.GetMessage(), False)
				Catch(RuntimeError ex15_2)
					wf_OutPut("Set to -1, runtimeerror = " + ex15_2.GetMessage(), False)
				Catch(Exception ex15_3)
					wf_OutPut("Set to -1, exception = " + ex15_3.GetMessage(), False)
				end try
			end if
			
			//set to 0
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 0
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			wf_OutPut("Set to 0, the value of NativePDF.ImageFormat = " + ls_rtn, False)
		else
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 1   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('wf_OutPut("Set to 1, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 2   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('wf_OutPut("Set to 2, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('//set to 3   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 3   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('wf_OutPut("Set to 3, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('//set to 4, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 4   ')
			wf_scriptview('	ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat   ')
			wf_scriptview('	wf_OutPut("Set to 4, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 4   ')
			wf_scriptview('	Catch(NullObjectError ex05_1)   ')
			wf_scriptview('		wf_OutPut("Set to 4, nullobjecterror = " + ex05_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex05_2)   ')
			wf_scriptview('		wf_OutPut("Set to 4, runtimeerror = " + ex05_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex05_3)   ')
			wf_scriptview('		wf_OutPut("Set to 4, exception = " + ex05_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to -1, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = -1   ')
			wf_scriptview('	ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = -1   ')
			wf_scriptview('	Catch(NullObjectError ex06_1)   ')
			wf_scriptview('		wf_OutPut("Set to -1, nullobjecterror = " + ex06_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex06_2)   ')
			wf_scriptview('		wf_OutPut("Set to -1, runtimeerror = " + ex06_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex06_3)   ')
			wf_scriptview('		wf_OutPut("Set to -1, exception = " + ex06_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 0   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('wf_OutPut("Set to 0, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
		end if
	case "pdf_p010_pdfstandard2_ds"
		if ab_execute then
			//get original value
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard
			wf_OutPut("The original value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 1
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 1
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("Set to 1, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 2
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 2
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("Set to 2, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 3
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 3
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("Set to 3, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 4
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 4
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("Set to 4, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 5
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 5
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("Set to 5, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 6, invalid value
			if appeongetclienttype() = "WEB" then
				ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 6
				ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard
				wf_OutPut("Set to 6, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			else
				try
					ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 6
				Catch(NullObjectError ex16_1)
					wf_OutPut("Set to 6, nullobjecterror = " + ex16_1.GetMessage(), False)
				Catch(RuntimeError ex16_2)
					wf_OutPut("Set to 6, runtimeerror = " + ex16_2.GetMessage(), False)
				Catch(Exception ex16_3)
					wf_OutPut("Set to 6, exception = " + ex16_3.GetMessage(), False)
				end try
			end if
			
			//set to -1, invalid value
			if appeongetclienttype() = "WEB" then
				ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = -1
				ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard
				wf_OutPut("Set to -1, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			else
				try
					ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = -1
				Catch(NullObjectError ex17_1)
					wf_OutPut("Set to -1, nullobjecterror = " + ex17_1.GetMessage(), False)
				Catch(RuntimeError ex17_2)
					wf_OutPut("Set to -1, runtimeerror = " + ex17_2.GetMessage(), False)
				Catch(Exception ex17_3)
					wf_OutPut("Set to -1, exception = " + ex17_3.GetMessage(), False)
				end try
			end if
			
			//set to 0
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 0
			ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("Set to 0, the value of NativePDF.PDFStandard = " + ls_rtn, False)
		else
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 1   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("Set to 1, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 2   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("Set to 2, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 3   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 3   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("Set to 3, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 4   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 4   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("Set to 4, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 5   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 5   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("Set to 5, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 6, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 6   ')
			wf_scriptview('	ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard   ')
			wf_scriptview('	wf_OutPut("Set to 6, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 6   ')
			wf_scriptview('	Catch(NullObjectError ex07_1)   ')
			wf_scriptview('		wf_OutPut("Set to 6, nullobjecterror = " + ex07_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex07_2)   ')
			wf_scriptview('		wf_OutPut("Set to 6, runtimeerror = " + ex07_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex07_3)   ')
			wf_scriptview('		wf_OutPut("Set to 6, exception = " + ex07_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to -1, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = -1   ')
			wf_scriptview('	ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = -1   ')
			wf_scriptview('	Catch(NullObjectError ex08_1)   ')
			wf_scriptview('		wf_OutPut("Set to -1, nullobjecterror = " + ex08_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex08_2)   ')
			wf_scriptview('		wf_OutPut("Set to -1, runtimeerror = " + ex08_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex08_3)   ')
			wf_scriptview('		wf_OutPut("Set to -1, exception = " + ex08_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 0   ')
			wf_scriptview('ls_rtn = ids_emp.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("Set to 0, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
		end if
	case "pdf_p011_useprintspec2_ds"
		if ab_execute then
			//get original value
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("The original value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to true, invalid value
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = true
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("Set to true, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to false, invalid value
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = false
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("Set to false, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to random string, invalid value
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = "abc"
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("Set to abc, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to empty string, invalid value
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = ""
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("Set to empty string, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to yes, valid value
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = "yes"
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("Set to yes, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to no, valid value
			ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = "no"
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("Set to no, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
		else
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to true, invalid value   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = true   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("Set to true, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to false, invalid value   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = false   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("Set to false, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to random string, invalid value   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = "abc"   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("Set to abc, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to empty string, invalid value   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = ""   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("Set to empty string, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to yes, valid value   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = "yes"   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("Set to yes, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to no, valid value   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = "no"   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("Set to no, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
		end if
	case "pdf_p012_method2_ds"
		if ab_execute then
			//get original value
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.Method
			wf_OutPut("The original value of NativePDF.Method = " + ls_rtn, False)
			
			//set to NativePDF!
			ids_emp.Object.DataWindow.Export.PDF.Method = NativePDF!
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.Method
			wf_OutPut("Set to NativePDF!, the value of NativePDF.Method = " + ls_rtn, False)
			
			//set to XSLFOP!
			ids_emp.Object.DataWindow.Export.PDF.Method = XSLFOP!
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.Method
			wf_OutPut("Set to XSLFOP!, the value of NativePDF.Method = " + ls_rtn, False)
			
			//set to PDF!, invalid value
			if appeongetclienttype() = "WEB" then
				ids_emp.Object.DataWindow.Export.PDF.Method = PDF!
				ls_rtn = ids_emp.Object.DataWindow.Export.PDF.Method
				wf_OutPut("Set to PDF!, the value of NativePDF.Method = " + ls_rtn, False)
			else
				try
					ids_emp.Object.DataWindow.Export.PDF.Method = PDF!
				Catch(NullObjectError ex18_1)
					wf_OutPut("Set to PDF!, nullobjecterror = " + ex18_1.GetMessage(), False)
				Catch(RuntimeError ex18_2)
					wf_OutPut("Set to PDF!, runtimeerror = " + ex18_2.GetMessage(), False)
				Catch(Exception ex18_3)
					wf_OutPut("Set to PDF!, exception = " + ex18_3.GetMessage(), False)
				end try
			end if
			
			//set to empty string, invalid value
			ids_emp.Object.DataWindow.Export.PDF.Method = ""
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.Method
			wf_OutPut("Set to empty string, the value of NativePDF.Method = " + ls_rtn, False)
			
			//set to Distill!
			ids_emp.Object.DataWindow.Export.PDF.Method = Distill!
			ls_rtn = ids_emp.Object.DataWindow.Export.PDF.Method
			wf_OutPut("Set to Distill!, the value of NativePDF.Method = " + ls_rtn, False)
		else
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.Method   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('//set to NativePDF!   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.Method = NativePDF!   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.Method   ')
			wf_scriptview('wf_OutPut("Set to NativePDF!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('//set to XSLFOP!   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.Method = XSLFOP!   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.Method   ')
			wf_scriptview('wf_OutPut("Set to XSLFOP!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('//set to PDF!, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	ids_emp.Object.DataWindow.Export.PDF.Method = PDF!   ')
			wf_scriptview('	ls_rtn = ids_emp.Object.DataWindow.Export.PDF.Method   ')
			wf_scriptview('	wf_OutPut("Set to PDF!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		ids_emp.Object.DataWindow.Export.PDF.Method = PDF!   ')
			wf_scriptview('	Catch(NullObjectError ex09_1)   ')
			wf_scriptview('		wf_OutPut("Set to PDF!, nullobjecterror = " + ex09_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex09_2)   ')
			wf_scriptview('		wf_OutPut("Set to PDF!, runtimeerror = " + ex09_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex09_3)   ')
			wf_scriptview('		wf_OutPut("Set to PDF!, exception = " + ex09_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to empty string, invalid value   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.Method = ""   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.Method   ')
			wf_scriptview('wf_OutPut("Set to empty string, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('//set to Distill!   ')
			wf_scriptview('ids_emp.Object.DataWindow.Export.PDF.Method = Distill!   ')
			wf_scriptview('ls_rtn = ids_emp.Object.DataWindow.Export.PDF.Method   ')
			wf_scriptview('wf_OutPut("Set to Distill!, the value of NativePDF.Method = " + ls_rtn, False)   ')
		end if
	case else
		messagebox("Error",ls_testcase+"has no coding")
end choose

//保存执行的数据
if ab_execute then
	wf_saveresult(li_testcaseid)
end if
end subroutine

on w_nativepdf_ds.create
call super::create
end on

on w_nativepdf_ds.destroy
call super::destroy
end on

event open;call super::open;transaction sql2
sql2 = create transaction

// Profile appeonsample
SQL2.DBMS = "ODBC"
SQL2.AutoCommit = False
SQL2.DBParm = "ConnectString='DSN=AppeonSample;UID=dba;PWD=sql'"

connect using sql2;

ids_emp = create datastore
ids_emp.dataobject = 'd_emp_freeform'
ids_emp.settransobject(sql2)
ids_emp.retrieve()
end event

event close;call super::close;destroy ids_emp
end event

type cb_4 from w_testcase_base`cb_4 within w_nativepdf_ds
end type

type cb_3 from w_testcase_base`cb_3 within w_nativepdf_ds
end type

type cb_2 from w_testcase_base`cb_2 within w_nativepdf_ds
end type

type cb_1 from w_testcase_base`cb_1 within w_nativepdf_ds
end type

type mle_output from w_testcase_base`mle_output within w_nativepdf_ds
end type

type mle_2 from w_testcase_base`mle_2 within w_nativepdf_ds
end type

type mle_1 from w_testcase_base`mle_1 within w_nativepdf_ds
end type

type dw_1 from w_testcase_base`dw_1 within w_nativepdf_ds
end type

type gb_1 from w_testcase_base`gb_1 within w_nativepdf_ds
end type

type gb_2 from w_testcase_base`gb_2 within w_nativepdf_ds
end type

type gb_3 from w_testcase_base`gb_3 within w_nativepdf_ds
end type

type gb_4 from w_testcase_base`gb_4 within w_nativepdf_ds
end type

type gb_5 from w_testcase_base`gb_5 within w_nativepdf_ds
end type

