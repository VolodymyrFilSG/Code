<%
 Iname = Trim (Request.Form("nickname"))
  
  Set Conn = Server.CreateObject("ADODB.Connection")
  

 If iname = "" Then
   msg = "Использование пробелов в псевдониме недопустимо!"
 Else 


 If InStr(iname,"<") < 1 Then

  Conn.Open "DSN=chat;"
  Set RS = Server.CreateObject("ADODB.Recordset")
  strSQL = "Select nick FROM nicks WHERE 1"
  RS.Open strSQL, Conn
  RS.MoveFirst
  on error resume Next
  Do While Not RS.EOF
        if RS.Fields("nick") = iname Then
        iserror = true
        msg = "<font color='red'>Повтор псевдонимов недопустим. Введите другой псевдоним.</font>"
        end if
        On Error Resume Next
        RS.MoveNext
  Loop
  CONN.close
'    Do While Not InStream.AtEndOfStream
'    Line = InStream.ReadLine()
'    If Trim (Line) = Iname Then	' Nick has been used 
'     IsError = True		
'     msg = "<font color='red'>Повтор псевдонимов недопустим. Введите другой псевдоним.</font>"
'      Exit Do				
'    End If
'    On Error Resume Next
'    InStream.SkipLine()
'   Loop	

   Set InStream = Nothing
	
   If Not IsError Then
    Conn.Open "DSN=chat;"
     strSQL = "INSERT INTO nicks (nick) VALUES ('" & iname & "')"
     conn.execute(strSQL)
     CONN.close
     IsError = False
     Session("UserName") = Iname
     Session("UserColor") = Request("user_color")
     Session("RefreshTime") = Request("RefreshTime")
     Session("LNum") = Request("LNum")

     Set FileObject = Server.CreateObject("Scripting.FileSystemObject")
     TFile = Server.MapPath ("/Chat/Chat.txt")
     Set InStream = FileObject.OpenTextFile (TFile, 1, False )

     FileContents = Trim(InStream.ReadALL)

     TextStr = "<table><tr><td><B><font color='" & Session("UserColor") &"'>" & Session("UserName") & "</font></B>" &_
               " : " & "вошел в чат - " & date & " " & time & "</td></tr></table>"

     Set OutStream = FileObject.CreateTextFile (TFile, True)
     OutStream.WriteLine(TextStr)
     OutStream.WriteLine(FileContents)

     Set OutStream = Nothing
     Set TextStr   = Nothing
     Set InStream  = Nothing
     Set FileContents = Nothing

     Response.Redirect("MainFS.asp")		

   End If

   IsError = false

  End If 

 End If
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
</head>

<body>
<BR><BR><BR>

<center>
<font color="#000000" size=+2>Добро пожаловать в Чат</font>
</center>

<BR>
<center>
<p>Сейчас в чате:</p>

<table align= "center" width= 400 border = 0>
<tr><td align= "center">
<%
  Set FileObject = Server.CreateObject("Scripting.FileSystemObject")
  TestFile = Server.MapPath ("/Chat/Nicks.txt")

  On Error Resume Next	
  Set InStream = FileObject.OpenTextFile (TestFile, 1, False, False)

  CurUser = 0
  Odd = 0
  NameNum = 0

  Do While Not InStream.AtEndOfStream
    If Odd = 0 Then
      If NameNum = 10 Then 
        Response.Write "</td></tr><tr><td align= 'center'>"
        NameNum = 0
      End If
      Str = InStream.ReadLine()
      If Str <> "" Then
        Response.Write "[" & Str & "]&nbsp;"
        Odd = 1
        CurUser = CurUser + 1
        NameNum = NameNum + 1
      End If
    Else
      Odd = 0
      InStream.SkipLine()
    End If
  Loop	

  If CurUser = 0 Then
    Response.Write "нет пользователей"
  Else
    Response.Write "</td></tr><tr><td align= 'center'>Всего " & CurUser
  End If

  Set Instream = Nothing

%>
</td></tr></table>
<br>

<Form name="Nickname" method="post" action="Entrance.asp">

 <table width= 400 border = 1>

  <tr>
   <td>Ваш псевдоним:</td>
   <td><input type=text name="nickname" value=""></td>
  </tr>

  <tr>
   <td valign="top">Ваш цвет:</td>
   <td>
   <FONT FACE="arial, verdana, helvetica" SIZE="2">
   <INPUT TYPE="radio" NAME="user_color" VALUE="#000000" CHECKED> <FONT COLOR="#000000">Текст 
   <INPUT TYPE="radio" NAME="user_color" VALUE="#0000FF"> <FONT COLOR="#0000FF">Текст<BR>
   <INPUT TYPE="radio" NAME="user_color" VALUE="#FF0000"> <FONT COLOR="#FF0000">Текст 
   <INPUT TYPE="radio" NAME="user_color" VALUE="#800080"> <FONT COLOR="#800080">Текст 
   <INPUT TYPE="radio" NAME="user_color" VALUE="#008000"> <FONT COLOR="#008000">Текст<br>
   <INPUT TYPE="radio" NAME="user_color" VALUE="#CC0000"> <FONT COLOR="#CC0000">Текст 
   <INPUT TYPE="radio" NAME="user_color" VALUE="#FF00FF"> <FONT COLOR="#FF00FF">Текст 
   <INPUT TYPE="radio" NAME="user_color" VALUE="#808080"> <FONT COLOR="#808080">Текст<br>
   <INPUT TYPE="radio" NAME="user_color" VALUE="#A020F0"> <FONT COLOR="#A020F0">Текст 
   <INPUT TYPE="radio" NAME="user_color" VALUE="#800000"> <FONT COLOR="#800000">Текст 
   <INPUT TYPE="radio" NAME="user_color" VALUE="#000080"> <FONT COLOR="#000080">Текст<br>
   <INPUT TYPE="radio" NAME="user_color" VALUE="#808000"> <FONT COLOR="#808000">Текст 
   <INPUT TYPE="radio" NAME="user_color" VALUE="#FF9900"> <FONT COLOR="#FF9900">Текст 
   <INPUT TYPE="radio" NAME="user_color" VALUE="#008080"> <FONT COLOR="#008080">Текст<br>
   </FONT>
   </td>
  </tr>

  <tr>
   <TD>Обновление чата:</TD>
   <TD><SELECT NAME="RefreshTime">
    <OPTION VALUE="5">5
    <OPTION VALUE="10">10
    <OPTION VALUE="15"Selected>15
    <OPTION VALUE="20">20
    <OPTION VALUE="30">30
    <OPTION VALUE="60">60
   </SELECT>&nbsp;секунд
   </TD>
  </tr>

  <tr>
  <td>Просматриваемых сообщений:</td>
  <td><INPUT TYPE="text" NAME="LNum" VALUE="30" SIZE="2" MAXLENGTH="2"></td>
  </tr>

 </table>
 <br>
 <input type=submit name="okbtn" value="Войти">
</Form>

<BR><H6><%=msg%><br>Использование HTML тэгов недопустимо!</h6><BR>
</center>

</body>
</html>