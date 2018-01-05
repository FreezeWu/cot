$PBExportHeader$qaappeon_auto.sra
$PBExportComments$Generated Application Object
forward
global type qaappeon_auto from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
boolean gb_exit
end variables

global type qaappeon_auto from application
string appname = "qaappeon_auto"
end type
global qaappeon_auto qaappeon_auto

on qaappeon_auto.create
appname="qaappeon_auto"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on qaappeon_auto.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Profile qaappeon
//mobile下使用离线数据库
if appeongetclienttype() = "MOBILE" then
	SQLCA.DBMS = "ODBC"
	SQLCA.AutoCommit = False
	SQLCA.DBParm ="ConnectString='DBF=qaappeon_remote.udb;driver={ultralite 17};UID=dba;PWD=appeontest';EnabledLocalDB='true'"
else
	SQLCA.DBMS = "OLE DB"
	SQLCA.LogPass = "admin"
	SQLCA.LogId = "sa"
	SQLCA.AutoCommit = False
	SQLCA.DBParm = "PROVIDER='SQLOLEDB',DATASOURCE='192.0.2.254',PROVIDERSTRING='database=qaappeon'"
end if
connect;
if sqlca.sqlcode <> 0 then
	messagebox("Database Error","连接数据库失败："+sqlca.sqlerrtext)
	return
end if

open(w_maintance_frame)
end event

event close;disconnect;
end event

