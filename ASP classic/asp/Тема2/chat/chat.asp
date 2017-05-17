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
    Set FileObject = Server.CreateObject("Scripting.FileSystemObject")
    TestFile = Server.MapPath ("/Chat/Chat.txt")
    Set InStream= FileObject.OpenTextFile (TestFile, 1, false )

    FileContents = Trim(InStream.ReadALL)
    textstr = "<table><tr><td><b><font color='" & Session("UserColor") &_
              "'>" & Session("UserName") & "</font></B> : " &_
              "покинул чат - " & date & " " & time & "</td></tr></table>"

    Set OutStream= FileObject.CreateTextFile (TestFile, True)
    OutStream.WriteLine(textstr)
    OutStream.WriteLine(filecontents)

    Set OutStream = Nothing
    Set textstr   = Nothing
    Set Instream  = Nothing
    Set filecontents = Nothing

    Set FileObject = Server.CreateObject("Scripting.FileSystemObject")
    TestFile = Server.MapPath ("/Chat/Nicks.txt")
    Set InStream = FileObject.OpenTextFile (TestFile, 1, false )
  
    ResultText = ""

    While InStream.AtEndOfStream <> True
     textstr = InStream.ReadLine
     If textstr <> Session("UserName") Then 
      ResultText = ResultText & textstr & CHR(13) & CHR(10)
     End If
    WEnd

    Set f = FileObject.GetFile(TestFile) 
    Set txtstream = f.OpenAsTextStream (2, -2)
    txtstream.Write ResultText
    txtstream.Close

    Set OutStream = Nothing
    Set textstr   = Nothing
    Set Instream  = Nothing
    Set filecontents = Nothing

    Session("UserName") = ""
    'Response.Redirect "FrameSet.asp"

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

 If InStr(TextStr, "<") < 1 Then
   If TextStr <> "" Then
      Set FileObject = Server.CreateObject("Scripting.FileSystemObject")
      TestFile = Server.MapPath ("/Chat/Chat.txt")
      On Error Resume Next
      Set InStream= FileObject.OpenTextFile (TestFile, 1, false )
      On Error Resume Next

      filecontents = Trim(InStream.ReadALL)

      Select Case CInt(Request.Form("MsgIcon"))
        Case 0  'Smile
          ImageFileName = ""
        Case 7  'Smile
          ImageFileName = "Images\icon7.gif"
        Case 2  'Smile
          ImageFileName = "Images\icon2.gif"
        Case 3  'Smile
          ImageFileName = "Images\icon3.gif"
        Case 4  'Smile
          ImageFileName = "Images\icon4.gif"
        Case 5  'Smile
          ImageFileName = "Images\icon5.gif"
        Case 6  'Smile
          ImageFileName = "Images\icon6.gif"
        Case 8  'Smile
          ImageFileName = "Images\icon8.gif"
        Case 9  'Smile
          ImageFileName = "Images\icon9.gif"
        Case 10  'Smile
          ImageFileName = "Images\icon10.gif"
        Case 11  'Smile
          ImageFileName = "Images\icon11.gif"
        Case 12  'Smile
          ImageFileName = "Images\icon12.gif"
        Case 13  'Smile
          ImageFileName = "Images\icon13.gif"
        Case 14  'Smile
          ImageFileName = "Images\icon14.gif"
      End Select

      TextStr = Replace(TextStr, vbCrLf, "<br>")

      If (ImageFileName <> "") Then
         TextStr = "<table><tr><td width=15 valign='top'><img src = '" & ImageFileName & "'></td>" &_
                   "<td width=70 valign='top'><B><font color = '" & Session("UserColor") &_
                   "'>" & Session("UserName") & "</td><td>" &_
                   "</font></B>" & " : " & TextStr & "</td></tr></table>"
      Else
         TextStr = "<table><tr><td width=15 valign='top'></td>" &_
                   "<td width=70 valign='top'><B><font color = '" & Session("UserColor") &_
                   "'>" & Session("UserName") & "</td><td>" &_
                   "</font></B>" & " : " & TextStr & "</td></tr></table>"
      End If

      Set OutStream = FileObject.CreateTextFile (TestFile, True)
      OutStream.WriteLine(textstr)
      OutStream.WriteLine(filecontents)

      Set OutStream = Nothing
      Set textstr = Nothing
      Set Instream = Nothing
      Set filecontents = Nothing

      Application("IsRefresh") = True

   End If
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
   <INPUT type="radio" name="MsgIcon" value="2" ><IMG SRC="Images/icon2.gif"  alt="поговорим" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <BR>
   <INPUT type="radio" name="MsgIcon" value="3" ><IMG SRC="Images/icon3.gif"  alt="лампочка" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="4" ><IMG SRC="Images/icon4.gif"  alt="внимание" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="5" ><IMG SRC="Images/icon5.gif"  alt="вопрос" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="6" ><IMG SRC="Images/icon6.gif"  alt="радость" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="7" ><IMG SRC="Images/icon7.gif"  alt="одобрение" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="8" ><IMG SRC="Images/icon8.gif"  alt="раздражение" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
   <INPUT type="radio" name="MsgIcon" value="9" ><IMG SRC="Images/icon9.gif"  alt="грусть" HEIGHT=15 WIDTH=15 ALIGN=ABSCENTER>&nbsp;&nbsp;
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