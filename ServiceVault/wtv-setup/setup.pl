$username=getUserName($userssid);


$thingssentout=<<"ERIC"
<HTML>
<head>
<title>	Settings for $username
</title>
</head>
<body bgcolor="#2E2E2A" text="#CBCBCB" link="#FFE99B" vlink="#FFE99B" hspace=0 vspace=0 fontsize="medium">
<table cellspacing=0 cellpadding=0 border=0 bgcolor=#645D5F>
<tr>
<td height=7 colspan=4>
<tr>
<td width=7>
<td width=87 href="wtv-home:/home">
<img src="wtv-setup:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
<td width=7>
<td width=459 valign=bottom>
<img src="wtv-setup:/images/Settings.gif" width=197 height=58>
<tr>
<td height=5 colspan=4>
</table>
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=15 height=25 bgcolor=#645D5F>
<td width=545 height=25 bgcolor=#2E2E2A gradcolor=#23231F gradangle=90>
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=8 height=25 valign=top>
<img src="wtv-setup:/images/CornerTop.gif" width=8 height=8>
<td width=78>
<td width=392 valign=middle>
<blackface><font color=#D6D6D6>	Settings for $username
</font></blackface>
<td width=55>
<td width=12>
<spacer type=horizontal size=12>
</table>
</table>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=15 rowspan=2 bgcolor=#645D5F>
<td width=48 rowspan=2>
<td width=497 height=237 valign=top>
<table border=0 cellspacing=0 cellpadding=0>
<tr>
<td height=10 colspan=3>	<tr>
<td valign=top><a href="wtv-setup:/edit-self-begin" >&#128;&nbsp;<blackface>Password</blackface></a>
<td width=20>
<td valign=top>Change your password
<tr>
<td height=5 colspan=3>	<tr>
<td valign=top><a href="wtv-setup:/text" >&#128;&nbsp;<blackface>Text size</blackface></a>
<td width=20>
<td valign=top>Make text bigger or smaller
<tr>
<td height=5 colspan=3>	<tr>
<td valign=top><a href="wtv-setup:/sound" >&#128;&nbsp;<blackface>Music</blackface></a>
<td width=20>
<td valign=top>Play background songs
<tr>
<td height=5 colspan=3>	<tr>
<td valign=top><a href="wtv-setup:/keyboard" >&#128;&nbsp;<blackface>Keyboard</blackface></a>
<td width=20>
<td valign=top>Choose an on-screen keyboard
<tr>
<td height=5 colspan=3>	<tr>
<td valign=top><a href="wtv-setup:/screen" >&#128;&nbsp;<blackface>Television</blackface></a>
<td width=20>
<td valign=top>Your remote and TV picture
<tr>
<td height=5 colspan=3>	<tr>
<td valign=top><a href="wtv-home:/Credits-Legal" >&#128;&nbsp;<blackface>Terms of service</blackface></a>
<td width=20>
<td valign=top>Rules and regulations
<tr>
<td height=5 colspan=3>	<tr>
<td valign=top><a href="wtv-home:/credits-privacy" >&#128;&nbsp;<blackface>Privacy policy</blackface></a>
<td width=20>
<td valign=top>About personal information
<tr>
<td height=5 colspan=3>	</table>
<tr>
<td align=right>
<table cellspacing=0 cellpadding=0>
<tr>
<td>
<spacer type=horizontal size=12>
<form action=client:goback>
<font color="#E7CE4A" size=-1><shadow>
<input
selected
type=submit borderimage="file://ROM/Borders/ButtonBorder2.bif" value=Done name="Done" usestyle width=103>
</shadow></font></form>
<td abswidth=12>
<tr>
<td height=12 colspan=2>
</table>
</table>
</body>
</HTML>
ERIC
    ;



print $clients "200 OK\n";
print $clients "Content-Length: ".length($thingssentout)."\n";
print $clients "Content-Type: text/html\n\n";
print $clients $thingssentout;