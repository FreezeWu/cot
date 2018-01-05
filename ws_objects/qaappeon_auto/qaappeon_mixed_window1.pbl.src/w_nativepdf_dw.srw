$PBExportHeader$w_nativepdf_dw.srw
forward
global type w_nativepdf_dw from w_testcase_base
end type
type dw_2 from datawindow within w_nativepdf_dw
end type
end forward

global type w_nativepdf_dw from w_testcase_base
dw_2 dw_2
end type
global w_nativepdf_dw w_nativepdf_dw

type variables
transaction sql2
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
	case "pdf_p001_customorientation"
		if ab_execute then
			//<0 - Default, 1 - Landscape, 2 - Portrait>
			//get original value
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")
			wf_OutPut("The original value of NativePDF.CustomOrientation = " + ls_rtn, False)

			//set to 1
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=1")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")
			if ls_msg <> "" then
				wf_OutPut("Set to 1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			end if

			//set to 2
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=2")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")
			if ls_msg <> "" then
				wf_OutPut("Set to 2 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 2, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			end if
			
			//set to 3, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=3")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")
			if ls_msg <> "" then
				wf_OutPut("Set to 3 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 3, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			end if

			//set to -1, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=-1")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")
			if ls_msg <> "" then
				wf_OutPut("Set to -1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to -1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			end if

			//set to 0
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=0")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")
			if ls_msg <> "" then
				wf_OutPut("Set to 0 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 0, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			end if
		else
			wf_scriptview('//<0 - Default, 1 - Landscape, 2 - Portrait>   ')
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=1")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=2")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 2 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 2, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 3, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=3")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 3 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 3, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to -1, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=-1")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to -1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomOrientation=0")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomOrientation")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 0 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 0, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
		end if
	case "pdf_p002_customsize"
		if ab_execute then
			//<0 - Default, 1 - A1 594 x 841 mm, 2 - A2 420 x 594 mm, 3 - A3 297 x 420 mm, 4 - A4 210 x 297 mm, 5 - letter 8 1/2 x 11 in, 6 - Legal 8 1/2 x 14 in>
			//get original value
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			wf_OutPut("The original value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 1
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=1")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 1, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if

			//set to 2
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=2")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 2 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 2, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if
			
			//set to 3
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=3")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 3 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 3, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if
			
			//set to 4
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=4")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 4 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 4, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if
			
			//set to 5
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=5")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 5 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 5, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if
			
			//set to 6
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=6")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 6 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 6, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if
			
			//set to 7, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=7")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 7 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 7, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if

			//set to -1, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=-1")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to -1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to -1, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if

			//set to 0
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=0")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			if ls_msg <> "" then
				wf_OutPut("Set to 0 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 0, the value of NativePDF.CustomSize = " + ls_rtn, False)
			end if
		else
			wf_scriptview('//<0 - Default, 1 - A1 594 x 841 mm, 2 - A2 420 x 594 mm, 3 - A3 297 x 420 mm, 4 - A4 210 x 297 mm, 5 - letter 8 1/2 x 11 in, 6 - Legal 8 1/2 x 14 in>   ')
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=1")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 1, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=2")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 2 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 2, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 3   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=3")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 3 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 3, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 4   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=4")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 4 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 4, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 5   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=5")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 5 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 5, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 6   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=6")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 6 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 6, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 7, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=7")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 7 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 7, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to -1, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=-1")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to -1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.CustomSize=0")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 0 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 0, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
		end if
	case "pdf_p003_imageformat"
		if ab_execute then
			//<0 - bmp, 1 - jpg,2 - png,3 - gif>
			//get original value
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			wf_OutPut("The original value of NativePDF.ImageFormat = " + ls_rtn, False)
			
			//set to 1
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=1")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			if ls_msg <> "" then
				wf_OutPut("Set to 1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 1, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			end if
			
			//set to 2
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=2")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			if ls_msg <> "" then
				wf_OutPut("Set to 2 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 2, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			end if
			
			//set to 3
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=3")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			if ls_msg <> "" then
				wf_OutPut("Set to 3 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 3, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			end if
			
			//set to 4, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=4")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			if ls_msg <> "" then
				wf_OutPut("Set to 4 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 4, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			end if
			
			//set to -1, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=-1")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			if ls_msg <> "" then
				wf_OutPut("Set to -1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to -1, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			end if
			
			//set to 0
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=0")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			if ls_msg <> "" then
				wf_OutPut("Set to 0 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 0, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			end if
		else
			wf_scriptview('//<0 - bmp, 1 - jpg,2 - png,3 - gif>   ')
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=1")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 1, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=2")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 2 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 2, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 3   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=3")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 3 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 3, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 4, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=4")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 4 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 4, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to -1, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=-1")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to -1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.ImageFormat=0")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 0 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 0, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
		end if
	case "pdf_p004_pdfstandard"
		if ab_execute then
			//<0 - None, 1 - PDF/A-1a, 2 - PDF/A-1b, 3 - PDF/A-3a, 4 - PDF/A-3b, 5 - PDF/A-3u>
			//get original value
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("The original value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 1
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=1")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 1, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to 2
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=2")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 2 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 2, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to 3
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=3")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 3 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 3, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to 4
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=4")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 4 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 4, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to 5
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=5")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 5 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 5, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to 6, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=6")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 6 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 6, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to -1, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=-1")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to -1 error, " + ls_msg, False)
			else
				wf_OutPut("Set to -1, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
			
			//set to 0
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=0")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			if ls_msg <> "" then
				wf_OutPut("Set to 0 error, " + ls_msg, False)
			else
				wf_OutPut("Set to 0, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			end if
		else
			wf_scriptview('//<0 - None, 1 - PDF/A-1a, 2 - PDF/A-1b, 3 - PDF/A-3a, 4 - PDF/A-3b, 5 - PDF/A-3u>   ')
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=1")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 1, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=2")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 2 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 2, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 3   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=3")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 3 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 3, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 4   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=4")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 4 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 4, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 5   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=5")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 5 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 5, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 6, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=6")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 6 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 6, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to -1, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=-1")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to -1 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.PDFStandard=0")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to 0 error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to 0, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
		end if
	case "pdf_p005_useprintspec"
		if ab_execute then
			//<NO - Use Native PDF Settings, YES - Use Settings in Print Specifications>
			//get original value
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			wf_OutPut("The original value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to true, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=true")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			if ls_msg <> "" then
				wf_OutPut("Set to true error, " + ls_msg, False)
			else
				wf_OutPut("Set to true, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			end if
			
			//set to false, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=false")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			if ls_msg <> "" then
				wf_OutPut("Set to false error, " + ls_msg, False)
			else
				wf_OutPut("Set to false, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			end if
			
			//set to abc, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=abc")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			if ls_msg <> "" then
				wf_OutPut("Set to abc error, " + ls_msg, False)
			else
				wf_OutPut("Set to abc, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			end if
			
			//set to empty string, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=''")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			if ls_msg <> "" then
				wf_OutPut("Set to empty string error, " + ls_msg, False)
			else
				wf_OutPut("Set to empty string, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			end if
			
			//set to yes
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=yes")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			if ls_msg <> "" then
				wf_OutPut("Set to yes error, " + ls_msg, False)
			else
				wf_OutPut("Set to yes, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			end if
			
			//set to no
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=no")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")
			if ls_msg <> "" then
				wf_OutPut("Set to no error, " + ls_msg, False)
			else
				wf_OutPut("Set to no, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			end if
		else
			wf_scriptview('//<NO - Use Native PDF Settings, YES - Use Settings in Print Specifications>   ')
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to true, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=true")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to true error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to true, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to false, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=false")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to false error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to false, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to abc, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=abc")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to abc error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to abc, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to empty string, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=~'~'")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to empty string error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to empty string, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to yes   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=yes")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to yes error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to yes, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to no   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.NativePDF.UsePrintSpec=no")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.UsePrintSpec")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to no error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to no, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
		end if
	case "pdf_p006_method"
		if ab_execute then
			//<Distill!, XSLFOP!, NativePDF!>
			//get original value
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.Method")
			wf_OutPut("The original value of NativePDF.Method = " + ls_rtn, False)
			
			//set to NativePDF!
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.Method=NativePDF!")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.Method")
			if ls_msg <> "" then
				wf_OutPut("Set to NativePDF! error, " + ls_msg, False)
			else
				wf_OutPut("Set to NativePDF!, the value of NativePDF.Method = " + ls_rtn, False)
			end if
			
			//set to XSLFOP!
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.Method=XSLFOP!")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.Method")
			if ls_msg <> "" then
				wf_OutPut("Set to XSLFOP! error, " + ls_msg, False)
			else
				wf_OutPut("Set to XSLFOP!, the value of NativePDF.Method = " + ls_rtn, False)
			end if
			
			//set to PDF!, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.Method=PDF!")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.Method")
			if ls_msg <> "" then
				wf_OutPut("Set to PDF! error, " + ls_msg, False)
			else
				wf_OutPut("Set to PDF!, the value of NativePDF.Method = " + ls_rtn, False)
			end if
			
			//set to empty string, invalid value
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.Method=''")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.Method")
			if ls_msg <> "" then
				wf_OutPut("Set to empty string error, " + ls_msg, False)
			else
				wf_OutPut("Set to empty string, the value of NativePDF.Method = " + ls_rtn, False)
			end if
			
			//set to Distill!
			ls_msg = dw_2.Modify("DataWindow.Export.PDF.Method=Distill!")
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.Method")
			if ls_msg <> "" then
				wf_OutPut("Set to Distill! error, " + ls_msg, False)
			else
				wf_OutPut("Set to Distill!, the value of NativePDF.Method = " + ls_rtn, False)
			end if
		else
			wf_scriptview('//<Distill!, XSLFOP!, NativePDF!>   ')
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.Method")   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('//set to NativePDF!   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.Method=NativePDF!")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.Method")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to NativePDF! error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to NativePDF!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to XSLFOP!   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.Method=XSLFOP!")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.Method")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to XSLFOP! error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to XSLFOP!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to PDF!, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.Method=PDF!")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.Method")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to PDF! error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to PDF!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to empty string, invalid value   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.Method=~'~'")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.Method")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to empty string error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to empty string, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to Distill!   ')
			wf_scriptview('ls_msg = dw_2.Modify("DataWindow.Export.PDF.Method=Distill!")   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.Method")   ')
			wf_scriptview('if ls_msg <> "" then   ')
			wf_scriptview('	wf_OutPut("Set to Distill! error, " + ls_msg, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	wf_OutPut("Set to Distill!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('end if   ')
		end if
		
	case "pdf_p007_customorientation2"
		if ab_execute then
			//get original value
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
			wf_OutPut("The original value of NativePDF.CustomOrientation = " + ls_rtn, False)

			//set to 1
			dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 1
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
			wf_OutPut("Set to 1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)

			//set to 2
			dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 2
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
			wf_OutPut("Set to 2, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			
			//set to 3, invalid value
			if appeongetclienttype() = "WEB" then
				dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 3
				ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
				wf_OutPut("Set to 3, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			else
				try
					dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 3
				Catch(NullObjectError ex01_1)
					wf_OutPut("Set to 3, nullobjecterror = " + ex01_1.GetMessage(), False)
				Catch(RuntimeError ex01_2)
					wf_OutPut("Set to 3, runtimeerror = " + ex01_2.GetMessage(), False)
				Catch(Exception ex01_3)
					wf_OutPut("Set to 3, exception = " + ex01_3.GetMessage(), False)
				end try
			end if
			
			//set to -1, invalid value
			if appeongetclienttype() = "WEB" then
				dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = -1
				ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
				wf_OutPut("Set to -1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
			else
				try
					dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = -1
				Catch(NullObjectError ex02_1)
					wf_OutPut("Set to -1, nullobjecterror = " + ex02_1.GetMessage(), False)
				Catch(RuntimeError ex02_2)
					wf_OutPut("Set to -1, runtimeerror = " + ex02_2.GetMessage(), False)
				Catch(Exception ex02_3)
					wf_OutPut("Set to -1, exception = " + ex02_3.GetMessage(), False)
				end try
			end if
			
			//set to 0
			dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 0
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation
			wf_OutPut("Set to 0, the value of NativePDF.CustomOrientation = " + ls_rtn, False)
		else
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 1   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation   ')
			wf_scriptview('wf_OutPut("Set to 1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 2   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation   ')
			wf_scriptview('wf_OutPut("Set to 2, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('//set to 3, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 3   ')
			wf_scriptview('	ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation   ')
			wf_scriptview('	wf_OutPut("Set to 3, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 3   ')
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
			wf_scriptview('	dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = -1   ')
			wf_scriptview('	ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = -1   ')
			wf_scriptview('	Catch(NullObjectError ex05_1)   ')
			wf_scriptview('		wf_OutPut("Set to -1, nullobjecterror = " + ex05_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex05_2)   ')
			wf_scriptview('		wf_OutPut("Set to -1, runtimeerror = " + ex05_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex05_3)   ')
			wf_scriptview('		wf_OutPut("Set to -1, exception = " + ex05_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation = 0   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomOrientation   ')
			wf_scriptview('wf_OutPut("Set to 0, the value of NativePDF.CustomOrientation = " + ls_rtn, False)   ')
		end if
	case "pdf_p008_customsize2"
		if ab_execute then
			//get original value
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("The original value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 1
			dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 1
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("Set to 1, the value of NativePDF.CustomSize = " + ls_rtn, False)

			//set to 2
			dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 2
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("Set to 2, the value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 3
			dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 3
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("Set to 3, the value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 4
			dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 4
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("Set to 4, the value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 5
			dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 5
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("Set to 5, the value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 6
			dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 6
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize
			wf_OutPut("Set to 6, the value of NativePDF.CustomSize = " + ls_rtn, False)
			
			//set to 7, invalid value
			if appeongetclienttype() = "WEB" then
				dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize = 7
				ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize
				wf_OutPut("Set to 7, the value of NativePDF.CustomSize = " + ls_rtn, False)
			else
				try
					dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize = 7
				Catch(NullObjectError ex03_1)
					wf_OutPut("Set to 7, nullobjecterror = " + ex03_1.GetMessage(), False)
				Catch(RuntimeError ex03_2)
					wf_OutPut("Set to 7, runtimeerror = " + ex03_2.GetMessage(), False)
				Catch(Exception ex03_3)
					wf_OutPut("Set to 7, exception = " + ex03_3.GetMessage(), False)
				end try
			end if
			
			//set to -1, invalid value
			if appeongetclienttype() = "WEB" then
				dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize = -1
				ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize
				wf_OutPut("Set to -1, the value of NativePDF.CustomSize = " + ls_rtn, False)
			else
				try
					dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize = -1
				Catch(NullObjectError ex04_1)
					wf_OutPut("Set to -1, nullobjecterror = " + ex04_1.GetMessage(), False)
				Catch(RuntimeError ex04_2)
					wf_OutPut("Set to -1, runtimeerror = " + ex04_2.GetMessage(), False)
				Catch(Exception ex04_3)
					wf_OutPut("Set to -1, exception = " + ex04_3.GetMessage(), False)
				end try
			end if
			
			//set to 0
			dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 0
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")
			wf_OutPut("Set to 0, the value of NativePDF.CustomSize = " + ls_rtn, False)
		else
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 1   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("Set to 1, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 2   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("Set to 2, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 3   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 3   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("Set to 3, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 4   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 4   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("Set to 4, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 5   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 5   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("Set to 5, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 6   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 6   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('wf_OutPut("Set to 6, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('//set to 7, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize = 7   ')
			wf_scriptview('	ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('	wf_OutPut("Set to 7, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize = 7   ')
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
			wf_scriptview('	dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize = -1   ')
			wf_scriptview('	ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize = -1   ')
			wf_scriptview('	Catch(NullObjectError ex04_1)   ')
			wf_scriptview('		wf_OutPut("Set to -1, nullobjecterror = " + ex04_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex04_2)   ')
			wf_scriptview('		wf_OutPut("Set to -1, runtimeerror = " + ex04_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex04_3)   ')
			wf_scriptview('		wf_OutPut("Set to -1, exception = " + ex04_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.CustomSize= 0   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.CustomSize")   ')
			wf_scriptview('wf_OutPut("Set to 0, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
		end if
	case "pdf_p009_imageformat2"
		if ab_execute then
			//get original value
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat
			wf_OutPut("The original value of NativePDF.ImageFormat = " + ls_rtn, False)
			
			//set to 1
			dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 1
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			wf_OutPut("Set to 1, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			
			//set to 2
			dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 2
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			wf_OutPut("Set to 2, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			
			//set to 3
			dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 3
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			wf_OutPut("Set to 3, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			
			//set to 4, invalid value
			if appeongetclienttype() = "WEB" then
				dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 4
				ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat
				wf_OutPut("Set to 4, the value of NativePDF.ImageFormat = " + ls_rtn, False)
			else
				try
					dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 4
				Catch(NullObjectError ex05_1)
					wf_OutPut("Set to 4, nullobjecterror = " + ex05_1.GetMessage(), False)
				Catch(RuntimeError ex05_2)
					wf_OutPut("Set to 4, runtimeerror = " + ex05_2.GetMessage(), False)
				Catch(Exception ex05_3)
					wf_OutPut("Set to 4, exception = " + ex05_3.GetMessage(), False)
				end try
			end if
			
			//set to -1, invalid value
			if appeongetclienttype() = "WEB" then
				dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = -1
				ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat
				wf_OutPut("Set to -1, the value of NativePDF.CustomSize = " + ls_rtn, False)
			else
				try
					dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = -1
				Catch(NullObjectError ex06_1)
					wf_OutPut("Set to -1, nullobjecterror = " + ex06_1.GetMessage(), False)
				Catch(RuntimeError ex06_2)
					wf_OutPut("Set to -1, runtimeerror = " + ex06_2.GetMessage(), False)
				Catch(Exception ex06_3)
					wf_OutPut("Set to -1, exception = " + ex06_3.GetMessage(), False)
				end try
			end if
			
			//set to 0
			dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 0
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")
			wf_OutPut("Set to 0, the value of NativePDF.ImageFormat = " + ls_rtn, False)
		else
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 1   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('wf_OutPut("Set to 1, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 2   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('wf_OutPut("Set to 2, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('//set to 3   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 3   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('wf_OutPut("Set to 3, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('//set to 4, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 4   ')
			wf_scriptview('	ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat   ')
			wf_scriptview('	wf_OutPut("Set to 4, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 4   ')
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
			wf_scriptview('	dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = -1   ')
			wf_scriptview('	ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.CustomSize = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = -1   ')
			wf_scriptview('	Catch(NullObjectError ex06_1)   ')
			wf_scriptview('		wf_OutPut("Set to -1, nullobjecterror = " + ex06_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex06_2)   ')
			wf_scriptview('		wf_OutPut("Set to -1, runtimeerror = " + ex06_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex06_3)   ')
			wf_scriptview('		wf_OutPut("Set to -1, exception = " + ex06_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = 0   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.ImageFormat")   ')
			wf_scriptview('wf_OutPut("Set to 0, the value of NativePDF.ImageFormat = " + ls_rtn, False)   ')
		end if
	case "pdf_p010_pdfstandard2"
		if ab_execute then
			//get original value
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard
			wf_OutPut("The original value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 1
			dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 1
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("Set to 1, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 2
			dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 2
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("Set to 2, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 3
			dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 3
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("Set to 3, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 4
			dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 4
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("Set to 4, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 5
			dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 5
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("Set to 5, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			
			//set to 6, invalid value
			if appeongetclienttype() = "WEB" then
				dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 6
				ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard
				wf_OutPut("Set to 6, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			else
				try
					dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 6
				Catch(NullObjectError ex07_1)
					wf_OutPut("Set to 6, nullobjecterror = " + ex07_1.GetMessage(), False)
				Catch(RuntimeError ex07_2)
					wf_OutPut("Set to 6, runtimeerror = " + ex07_2.GetMessage(), False)
				Catch(Exception ex07_3)
					wf_OutPut("Set to 6, exception = " + ex07_3.GetMessage(), False)
				end try
			end if
			
			//set to -1, invalid value
			if appeongetclienttype() = "WEB" then
				dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = -1
				ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard
				wf_OutPut("Set to -1, the value of NativePDF.PDFStandard = " + ls_rtn, False)
			else
				try
					dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = -1
				Catch(NullObjectError ex08_1)
					wf_OutPut("Set to -1, nullobjecterror = " + ex08_1.GetMessage(), False)
				Catch(RuntimeError ex08_2)
					wf_OutPut("Set to -1, runtimeerror = " + ex08_2.GetMessage(), False)
				Catch(Exception ex08_3)
					wf_OutPut("Set to -1, exception = " + ex08_3.GetMessage(), False)
				end try
			end if
			
			//set to 0
			dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 0
			ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")
			wf_OutPut("Set to 0, the value of NativePDF.PDFStandard = " + ls_rtn, False)
		else
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 1   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 1   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("Set to 1, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 2   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 2   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("Set to 2, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 3   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 3   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("Set to 3, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 4   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 4   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("Set to 4, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 5   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 5   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("Set to 5, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('//set to 6, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 6   ')
			wf_scriptview('	ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard   ')
			wf_scriptview('	wf_OutPut("Set to 6, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 6   ')
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
			wf_scriptview('	dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = -1   ')
			wf_scriptview('	ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard   ')
			wf_scriptview('	wf_OutPut("Set to -1, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = -1   ')
			wf_scriptview('	Catch(NullObjectError ex08_1)   ')
			wf_scriptview('		wf_OutPut("Set to -1, nullobjecterror = " + ex08_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex08_2)   ')
			wf_scriptview('		wf_OutPut("Set to -1, runtimeerror = " + ex08_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex08_3)   ')
			wf_scriptview('		wf_OutPut("Set to -1, exception = " + ex08_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to 0   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 0   ')
			wf_scriptview('ls_rtn = dw_2.Describe("DataWindow.Export.PDF.NativePDF.PDFStandard")   ')
			wf_scriptview('wf_OutPut("Set to 0, the value of NativePDF.PDFStandard = " + ls_rtn, False)   ')
		end if
	case "pdf_p011_useprintspec2"
		if ab_execute then
			//get original value
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("The original value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to true, invalid value
			dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = true
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("Set to true, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to false, invalid value
			dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = false
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("Set to false, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to random string, invalid value
			dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = "abc"
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("Set to abc, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to empty string, invalid value
			dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = ""
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("Set to empty string, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to yes, valid value
			dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = "yes"
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("Set to yes, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
			
			//set to no, valid value
			dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = "no"
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec
			wf_OutPut("Set to no, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)
		else
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to true, invalid value   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = true   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("Set to true, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to false, invalid value   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = false   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("Set to false, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to random string, invalid value   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = "abc"   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("Set to abc, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to empty string, invalid value   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = ""   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("Set to empty string, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to yes, valid value   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = "yes"   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("Set to yes, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
			wf_scriptview('//set to no, valid value   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = "no"   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec   ')
			wf_scriptview('wf_OutPut("Set to no, the value of NativePDF.UsePrintSpec = " + ls_rtn, False)   ')
		end if
	case "pdf_p012_method2"
		if ab_execute then
			//get original value
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.Method
			wf_OutPut("The original value of NativePDF.Method = " + ls_rtn, False)
			
			//set to NativePDF!
			dw_2.Object.DataWindow.Export.PDF.Method = NativePDF!
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.Method
			wf_OutPut("Set to NativePDF!, the value of NativePDF.Method = " + ls_rtn, False)
			
			//set to XSLFOP!
			dw_2.Object.DataWindow.Export.PDF.Method = XSLFOP!
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.Method
			wf_OutPut("Set to XSLFOP!, the value of NativePDF.Method = " + ls_rtn, False)
			
			//set to PDF!, invalid value
			if appeongetclienttype() = "WEB" then
				dw_2.Object.DataWindow.Export.PDF.Method = PDF!
				ls_rtn = dw_2.Object.DataWindow.Export.PDF.Method
				wf_OutPut("Set to PDF!, the value of NativePDF.Method = " + ls_rtn, False)
			else
				try
					dw_2.Object.DataWindow.Export.PDF.Method = PDF!
				Catch(NullObjectError ex09_1)
					wf_OutPut("Set to PDF!, nullobjecterror = " + ex09_1.GetMessage(), False)
				Catch(RuntimeError ex09_2)
					wf_OutPut("Set to PDF!, runtimeerror = " + ex09_2.GetMessage(), False)
				Catch(Exception ex09_3)
					wf_OutPut("Set to PDF!, exception = " + ex09_3.GetMessage(), False)
				end try
			end if
			
			//set to empty string, invalid value
			dw_2.Object.DataWindow.Export.PDF.Method = ""
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.Method
			wf_OutPut("Set to empty string, the value of NativePDF.Method = " + ls_rtn, False)
			
			//set to Distill!
			dw_2.Object.DataWindow.Export.PDF.Method = Distill!
			ls_rtn = dw_2.Object.DataWindow.Export.PDF.Method
			wf_OutPut("Set to Distill!, the value of NativePDF.Method = " + ls_rtn, False)
		else
			wf_scriptview('//get original value   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.Method   ')
			wf_scriptview('wf_OutPut("The original value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('//set to NativePDF!   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.Method = NativePDF!   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.Method   ')
			wf_scriptview('wf_OutPut("Set to NativePDF!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('//set to XSLFOP!   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.Method = XSLFOP!   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.Method   ')
			wf_scriptview('wf_OutPut("Set to XSLFOP!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('//set to PDF!, invalid value   ')
			wf_scriptview('if appeongetclienttype() = "WEB" then   ')
			wf_scriptview('	dw_2.Object.DataWindow.Export.PDF.Method = PDF!   ')
			wf_scriptview('	ls_rtn = dw_2.Object.DataWindow.Export.PDF.Method   ')
			wf_scriptview('	wf_OutPut("Set to PDF!, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('else   ')
			wf_scriptview('	try   ')
			wf_scriptview('		dw_2.Object.DataWindow.Export.PDF.Method = PDF!   ')
			wf_scriptview('	Catch(NullObjectError ex09_1)   ')
			wf_scriptview('		wf_OutPut("Set to PDF!, nullobjecterror = " + ex09_1.GetMessage(), False)   ')
			wf_scriptview('	Catch(RuntimeError ex09_2)   ')
			wf_scriptview('		wf_OutPut("Set to PDF!, runtimeerror = " + ex09_2.GetMessage(), False)   ')
			wf_scriptview('	Catch(Exception ex09_3)   ')
			wf_scriptview('		wf_OutPut("Set to PDF!, exception = " + ex09_3.GetMessage(), False)   ')
			wf_scriptview('	end try   ')
			wf_scriptview('end if   ')
			wf_scriptview('//set to empty string, invalid value   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.Method = ""   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.Method   ')
			wf_scriptview('wf_OutPut("Set to empty string, the value of NativePDF.Method = " + ls_rtn, False)   ')
			wf_scriptview('//set to Distill!   ')
			wf_scriptview('dw_2.Object.DataWindow.Export.PDF.Method = Distill!   ')
			wf_scriptview('ls_rtn = dw_2.Object.DataWindow.Export.PDF.Method   ')
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

event open;call super::open;sql2 = create transaction

// Profile appeonsample
SQL2.DBMS = "ODBC"
SQL2.AutoCommit = False
SQL2.DBParm = "ConnectString='DSN=AppeonSample;UID=dba;PWD=sql'"

connect using sql2;

dw_2.settransobject(sql2)
dw_2.retrieve()
end event

on w_nativepdf_dw.create
int iCurrent
call super::create
this.dw_2=create dw_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
end on

on w_nativepdf_dw.destroy
call super::destroy
destroy(this.dw_2)
end on

event close;call super::close;disconnect using sql2;
end event

type cb_4 from w_testcase_base`cb_4 within w_nativepdf_dw
end type

type cb_3 from w_testcase_base`cb_3 within w_nativepdf_dw
end type

type cb_2 from w_testcase_base`cb_2 within w_nativepdf_dw
end type

type cb_1 from w_testcase_base`cb_1 within w_nativepdf_dw
end type

type mle_output from w_testcase_base`mle_output within w_nativepdf_dw
end type

type mle_2 from w_testcase_base`mle_2 within w_nativepdf_dw
end type

type mle_1 from w_testcase_base`mle_1 within w_nativepdf_dw
end type

type dw_1 from w_testcase_base`dw_1 within w_nativepdf_dw
end type

type gb_1 from w_testcase_base`gb_1 within w_nativepdf_dw
end type

type gb_2 from w_testcase_base`gb_2 within w_nativepdf_dw
end type

type gb_3 from w_testcase_base`gb_3 within w_nativepdf_dw
end type

type gb_4 from w_testcase_base`gb_4 within w_nativepdf_dw
end type

type gb_5 from w_testcase_base`gb_5 within w_nativepdf_dw
end type

type dw_2 from datawindow within w_nativepdf_dw
integer x = 1102
integer y = 548
integer width = 686
integer height = 400
integer taborder = 40
string title = "none"
string dataobject = "d_emp_freeform"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

