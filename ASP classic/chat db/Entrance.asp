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
  Session("UserName") = Iname
  on error resume Next
    Do While Not RS.EOF
        if RS.Fields("nick") = iname Then
        iserror = true
        msg = "<font color='red'>Повтор псевдонимов недопустим. Введите другой псевдоним.</font>"
        end if
        On Error Resume Next
        RS.MoveNext
  	Loop
    If Not IsError Then
    
    strSQL = "INSERT INTO nicks (nick) VALUES ('" & iname & "')"
    conn.execute(strSQL)
    IsError = False
    Session("room") = Request("room")
    Session("UserColor") = Request("user_color")
    Session("RefreshTime") = Request("RefreshTime")
    Session("LNum") = Request("LNum")

    Conn.Open "DSN=chat; UID=root;PWD=12345;database=chat"
    getIN = ""
    getIN = getin & " : вошел в комнату "
    getIN = getin & date & " " & time
    strSQL = "insert into chat (color, nick, message) values ('" & Session("UserColor") & "', '" & Session("UserName") & "', '" & getin & "')"
	conn.execute(strSQL)
    conn.close
    Response.Redirect("MainFS.asp")		
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
    Dim Conn, RS, strSQL, strOut
    strOut = ""

    Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open "DSN=chat; UID=root;PWD=12345;database=chat"

    Set RS = Server.CreateObject("ADODB.Recordset")
    strSQL = "SELECT nick, id FROM nicks WHERE db = '" & Session("room") & "' order by id desc"

    RS.Open strSQL, Conn
    RS.MoveFirst
    on error resume next
    users = -1
    Do While Not RS.EOF
        strOut = strOut & "<p>[" & RS.Fields("nick") & "]</p>"
        users = users + 1
        RS.MoveNext
    Loop
    Conn.Close

    x = len(strout) - 13
    strout = mid(strOut, 1, x)

    RS.Close
    Set RS = Nothing
    
    Set Conn = Nothing

    if x = 0 then
    Response.Write("Нiкого немає онлайн")
    else
    Response.Write(users & " користувачiв")
    end if
    Response.Write strOut
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
   <TD>Выбор комнаты:</TD>
   <TD><SELECT NAME="room">
    <OPTION VALUE="1"Selected>1
    <OPTION VALUE="2">2
    <OPTION VALUE="3">3
    <OPTION VALUE="4">4
    <OPTION VALUE="5">5
   </SELECT>
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