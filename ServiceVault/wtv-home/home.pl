$username=getUserName($userssid);
$stuff=getUserFile($userssid,"Mail/inbox/MailCount.txt");

if($stuff == 0 || !($stuff)){
$mbimage="wtv-home:/images/OpenMailbox0.gif";
}elsif($stuff == 1){
$mbimage="wtv-home:/images/OpenMailbox1.gif";
}elsif($stuff > 1){
$mbimage="wtv-home:/images/OpenMailbox3.gif";
}


$thingssentout=<<"ERIC"
<HTML>
<HEAD>
<script>
function ClientWRKAR(ggg){
if(ggg){
document.open("text/url")
document.write(ggg)
document.close()
}
}


</script>

<TITLE>
Home for $username</TITLE>
<DISPLAY noscroll fontsize="medium"> </HEAD>
<sidebar width=138>
<table cellspacing=0 cellpadding=0 bgcolor="30364D">
<tr>	 		 
<td width=138 absheight=112 valign=top align=center>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=9><br>
<img src="wtv-home:/ROMCache/Spacer.gif" width=7 height=1><a HREF="wtv-home:/credits-legal"><img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=2><img src="wtv-home:/ROMCache/WebTVLogoJewel.gif" width=127 height=98></A>
<tr>
<td absheight=5>
<table cellspacing=0 cellpadding=0>
<tr><td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td abswidth=138 absheight=1 valign=top align=left>
<tr><td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
<tr>			
<td absheight=25>
<table cellspacing=0 cellpadding=0>
<tr>
<td height=2>
<tr>
<td abswidth=7>
<td abswidth=125>
<table cellspacing=0 cellpadding=0 href="wtv-setup:/setup">
<tr><td>
<table cellspacing=0 cellpadding=0>
<tr><td><shadow><font size=3 color=e7ce4a>&nbsp;Setup</font></shadow>
</table>
</table>
<td abswidth=6>
</table>
<tr>
<td absheight=5>
<table cellspacing=0 cellpadding=0>
<tr><td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td abswidth=138 absheight=1 valign=top align=left>
<tr><td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
<tr>
<td absheight=25>
<table cellspacing=0 cellpadding=0>
<tr>
<td height=2>
<tr>
<td abswidth=7>
<td abswidth=125>
<table cellspacing=0 cellpadding=0 href="wtv-guide:/guide">
<tr><td>
<table cellspacing=0 cellpadding=0>
<tr><td><shadow><font size=3 color=e7ce4a>&nbsp;Using WebTV</font></shadow>
</table>
</table>
<td abswidth=6>
</table>
<tr>
<td absheight=5>
<table cellspacing=0 cellpadding=0>
<tr><td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td abswidth=138 absheight=1 valign=top align=left>
<tr><td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>


<table cellspacing=0 cellpadding=0>
<tr><td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td abswidth=138 absheight=1 valign=top align=left>
<tr><td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
<tr>
<td absheight=25>
<table cellspacing=0 cellpadding=0>
<tr>
<td height=2>
<tr>
<td abswidth=7>
<td abswidth=125>
<table cellspacing=0 cellpadding=0 href="wtv-tricks:/tricks">
<tr><td>
<table cellspacing=0 cellpadding=0>
<tr><td><shadow><font size=3 color=e7ce4a>&nbsp;WebTV Tricks</font></shadow>
</table>
</table>
<td abswidth=6>
</table>
<tr>
<td absheight=5>
<table cellspacing=0 cellpadding=0>
<tr><td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td abswidth=138 absheight=1 valign=top align=left>
<tr><td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>

<table cellspacing=0 cellpadding=0>
<tr><td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td abswidth=138 absheight=1 valign=top align=left>
<tr><td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
<tr>
<td absheight=25>
<table cellspacing=0 cellpadding=0>
<tr>
<td height=2>
<tr>
<td abswidth=7>
<td abswidth=125>
<table cellspacing=0 cellpadding=0 href="client:relogin">
<tr><td>
<table cellspacing=0 cellpadding=0>
<tr><td><shadow><font size=3 color=e7ce4a>&nbsp;Relogin</font></shadow>
</table>
</table>
<td abswidth=6>
</table>
<tr>
<td absheight=5>
<table cellspacing=0 cellpadding=0>
<tr><td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td abswidth=138 absheight=1 valign=top align=left>
<tr><td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>


<table cellspacing=0 cellpadding=0>
<tr><td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td abswidth=138 absheight=1 valign=top align=left>
<tr><td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
<tr>
<td absheight=25>
<table cellspacing=0 cellpadding=0>
<tr>
<td height=2>
<tr>
<td abswidth=7>
<td abswidth=125>
<table cellspacing=0 cellpadding=0 href="wtv-home:/community">
<tr><td>
<table cellspacing=0 cellpadding=0>
<tr><td><shadow><font size=3 color=e7ce4a>&nbsp;Community</font></shadow>
</table>
</table>
<td abswidth=6>
</table>
<tr>
<td absheight=5>
<table cellspacing=0 cellpadding=0>
<tr><td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td abswidth=138 absheight=1 valign=top align=left>
<tr><td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>

<table cellspacing=0 cellpadding=0>
<tr><td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td abswidth=138 absheight=1 valign=top align=left>
<tr><td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>


<table cellspacing=0 cellpadding=0>
<tr><td abswidth=138 absheight=2 valign=middle align=center bgcolor="1C1E28">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td abswidth=138 absheight=1 valign=top align=left>
<tr><td abswidth=138 absheight=2 valign=top align=left bgcolor="4D5573">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
<tr>
<td absheight=20>
<tr>
<td absheight=2>
<tr>
<td align=right>
<spacer type="vertical" width=48 height=126>
<tr>
<td absheight=5>
</table>
</sidebar>
<body background="wtv-home:/ROMCache/BackgroundGradient.gif" text="AA9B4A" link="6977a9" vlink="6977a9" hspace=0 vspace=0>
<table cellspacing=0 cellpadding=0 width=100% height=100%>
<tr>
<td rowspan=99 background="wtv-home:/images/BackgroundGradientEdge.gif" width=6 height=100%>
<img src="wtv-home:/ROMCache/Spacer.gif" width=6 height=1>
<tr>
<td valign=top>
<table cellspacing=0 cellpadding=0 width=100% absheight=113>
<tr>
<td width=5%>
<td absheight=113 width=18%>
<table cellspacing=0 cellpadding=0 border=0 href="wtv-mail:/listmail" selected nocolor width=100%>
<tr>
<td height=10>
<tr>
<td align=center>
<img src="$mbimage" border=0 width=61 height=52>
<tr>
<td height=4>
<tr>
<td valign=bottom>
<table cellspacing=0 cellpadding=0 width=100%><tr><td align=center>&nbsp;&nbsp;<font size=3 color=#000000>Mail</font></table>
</table>
<td width=6%>
<td absheight=113 width=22%>
<table cellspacing=0 cellpadding=0 border=0 href="wtv-favorite:/favorite" nocolor>
<tr>
<td height=12>
<tr>
<td align=center>
<img src="wtv-home:/ROMCache/TreasureChest1.gif" border=0 width=92 height=52>
<tr>
<td height=2>
<tr>
<td valign=bottom>
<table cellspacing=0 cellpadding=0 width=100%><tr><td align=center><font size=3 color=#000000>Favorites&nbsp;</font></table>
</table>
<td width=5%>
<td absheight=113 width=19%>
<table cellspacing=0 cellpadding=0 border=0 href="wtv-explore2:/top" nocolor>
<tr>
<td height=5>
<tr>
<td align=center>
<img src="wtv-home:/ROMCache/NavigationGlobe0.gif" border=0 width=68 height=59>
<tr>
<td height=2>
<tr>
<td valign=bottom>
<table cellspacing=0 cellpadding=0 width=100%><tr><td align=center><font size=3 color=#000000>Explore</font></table>
</table>
<td absheight=113 width=3%>
<td absheight=113 width=20%>
<table cellspacing=0 cellpadding=0 border=0 href="wtv-center:/search-page" nocolor>
<tr>
<td height=12>
<tr>
<td align=center>
<img src="wtv-home:/ROMCache/Binoculars0.gif" border=0 width=80 height=51>
<tr>
<td height=2>
<tr>
<td valign=bottom>
<table cellspacing=0 cellpadding=0 width=100%><tr><td align=center><font size=3 color=#000000>Search</font></table>
</table>
<td width=9%>
</table>
<tr>
<td absheight=15>&nbsp;
<tr>
<td valign=middle align=center>
<table cellspacing=0 cellpadding=0 width=394>
<tr>
<td abswidth=100% absheight=135 valign=middle align=center>
<table>
<tr><td>
<center>
<table>
<tr>
<td>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<br>
<A HREF="wtv-explore2:/spotlights/free_update.spot/index.service.html">
<img src="wtv-home:/images/dynamic/free_updateteaser.gif" width=364 height=120></A>
</TD>
</TR>
</table>
</table><br>
<tr>
<td width=100% absheight=28>
<tr>
<td width=100% align=center absheight=84>
<table cellspacing=0 cellpadding=0 width=100%>
<tr>
<td abswidth=98 absheight=84 align=left>
<a href="wtv-aroundtown:/aroundtown"><img src="wtv-home:/images/AroundTown.gif" width=94 height=84></a>
<td abswidth=98 absheight=84 align=left>
<img src=wtv-home:/ROMCache/Spacer.gif width=18 height=1><a href="wtv-content:/tvguide/TVGuide.tmpl"><img src="wtv-home:/ROMCache/TVGuide.gif" width=74 height=84></a>
<td abswidth=98 absheight=84 align=left>
<img src=wtv-home:/ROMCache/Spacer.gif width=12 height=1><a href="wtv-center:/Welcome"><img src="wtv-home:/images/CrapyFigureOut.jpg" width=70 height=84></a>
<td abswidth=98 absheight=84 align=left>
<img src=wtv-home:/ROMCache/Spacer.gif width=1 height=1><a href="wtv-center:/DocuView?index=true"><img src="wtv-home:/images/Hacka.jpg" width=94 height=84></a>
</table>
</table>
</body>
</html>
ERIC
    ;


print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-backgroundmusic-load-playlist: wtv-music:/get-playlist\n";
print $clients "wtv-printer-model: -1,-1\n";
print $clients "wtv-printer-pen: 0,0,1,0\n";
print $clients "wtv-printer-setup: 0,0,1,0\n";
print $clients "wtv-language-header: en-US,en\n";
print $clients "Content-Length: ".length($thingssentout)."\n";
print $clients "Content-Type: text/html\n\n";
print $clients $thingssentout;
