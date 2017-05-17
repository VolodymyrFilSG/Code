<%@ LANGUAGE = VBScript%>

<% 
 If Session("UserName") = "" Then
  Response.Redirect("Entrance.asp")
 End If
%>

<HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<TITLE>ASP - Чат Своими силами</TITLE>
</head>

<Frameset rows="80%,20%">
 <frame name="textFrame" src="RightFS.asp">
 <frame name="chatFrame" src="chat.asp">
</Frameset>

</HTML>