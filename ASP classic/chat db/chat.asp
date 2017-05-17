<% 
  Session.TimeOut = 1

  If Session("UserName") <> "" Then
    Response.Write "Пользователь: " & Session("UserName") & "<br>"
  Else
    Response.Write "Вы покинули чат. <br>" 
  End If

  If Request("go") = "Войти" Then
   Response.Redirect("Entrance.asp")
  End If

  If Request("exit") = "Выйти" Then


    Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open "DSN=chat; UID=root;PWD=12345;database=chat"
    getout = ""
    getout = getout & " : покинул комнату "
    getout = getout & date & " " & time
    strSQL = "insert into chat (color, nick, message) values ('" & Session("UserColor") & "', '" & Session("UserName") & "', '" & getout & "')"
	conn.execute(strSQL)
	strSQL = ""
	strSQL = "delete from nicks where nick like '" & Session("UserName") & "'"
	conn.execute(strSQL)

	conn.close
    Session("UserName") = ""
    Response.Redirect "chat.asp"

  End If 

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
</head>
<script>

function ReEnter()
{
 //alert ("ReEntering now ...");
 window.navigate("Entrance.asp");
}

</script>

<body>

<%
 TextStr = Trim (Request.Form("txtbox"))
   If TextStr <> "" Then
   		Dim Conn, strSQL

    	Set Conn = Server.CreateObject("ADODB.Connection")
   		Conn.Open "DSN=chat; UID=root;PWD=12345;database=chat"

      Select Case CInt(Request.Form("MsgIcon"))
        Case 0  'Smile
          ImageFileName = """images/icon1.gif"""
        Case 2  'Smile
          ImageFileName = """images/icon2.gif"""
        Case 3  'Smile
          ImageFileName = """images/icon3.gif"""
        Case 4  'Smile
          ImageFileName = """images/icon4.gif"""
        Case 5  'Smile
          ImageFileName = """images/icon5.gif"""
        Case 6  'Smile
          ImageFileName = """images/icon6.gif"""
        Case 7  'Smile
          ImageFileName = """images/icon7.gif"""
        Case 8  'Smile
          ImageFileName = """images/icon8.gif"""
        Case 9  'Smile
          ImageFileName = """images/icon9.gif"""
        Case 10  'Smile
          ImageFileName = """images/icon10.gif"""
        Case 11  'Smile
          ImageFileName = """images/icon11.gif"""
        Case 12  'Smile
          ImageFileName = """images/icon12.gif"""
        Case 13  'Smile
          ImageFileName = """images/icon13.gif"""
        Case 14  'Smile
          ImageFileName = """images/icon14.gif"""
      End Select

      If (ImageFileName <> "") Then
      
      strSQL = "insert into chat (color, smile, nick, message) values ('" & Session("UserColor") & "', '" & ImageFileName & "','" & Session("UserName") & "', '" & image & TextStr & "')"
      Else
      strSQL = "insert into chat (color, nick, message) values ('" & Session("UserColor") & "', '" & Session("UserName") & " :', '" & TextStr & "')"
      End If
      conn.execute(strSQL)
      conn.close
      Application("IsRefresh") = True

   End If
%>

<FORM method="post" action="chat.asp">

 <table>
  <tr>

 <td valign="top" align="right">
   <INPUT type="radio" name="MsgIcon" value="0" CHECKED>нет&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="10"><IMG SRC="Images/icon10.gif" alt="улыбка" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="11"><IMG SRC="Images/icon11.gif" alt="возмущение" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="12"><IMG SRC="Images/icon12.gif" alt="подмигивание" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="13"><IMG SRC="Images/icon13.gif" alt="плохо" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="14"><IMG SRC="Images/icon14.gif" alt="хорошо" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="2" ><IMG SRC="Images/icon2.gif" alt="поговорим" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <BR>
   <INPUT type="radio" name="MsgIcon" value="3" ><IMG SRC="Images/icon3.gif" alt="лампочка" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="4" ><IMG SRC="Images/icon4.gif" alt="внимание" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="5" ><IMG SRC="Images/icon5.gif" alt="вопрос" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="6" ><IMG SRC="Images/icon6.gif" alt="радость" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="7" ><IMG SRC="Images/icon7.gif" alt="одобрение" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="8" ><IMG SRC="Images/icon8.gif" alt="раздражение" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="9" ><IMG SRC="Images/icon9.gif" alt="грусть" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <BR>
  </td>

  <td>
    <textarea cols="56" rows="5" Style="font: 8pt 'Verdana'" value="" name="txtbox"></textarea>
  </td>

  <td valign="top">
    <table><tr><td>
<%  If Session("UserName") <> "" Then %>
     <Input type = Submit Style="font: 8pt 'Verdana'; Width: 55" value="Сказать" name="go">
     </td></tr><tr><td>
     <Input type = Submit Style="font: 8pt 'Verdana'; Width: 55" value="Выйти" name="exit">
    </form>
<%  Else %>
     </form>
     <form method="post" action="chat.asp" target="_top">
      <Input type = Submit Style="font: 8pt 'Verdana'; Width: 55" value="Войти" name="go" Onclick="ReEnter()";>
     </form>
<%  End If %>
    </td></tr></table>
  </td>

  </tr>
 </table>


</body>
</html>