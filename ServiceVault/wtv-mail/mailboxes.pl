$username=getUserName($userssid);


$mailCounta=getUserFile($userssid,"Mail/mbox/MailCount.txt");
$mailCountb=getUserFile($userssid,"Mail/inbox/MailCount.txt");
$mailCountc=getUserFile($userssid,"Mail/sent/MailCount.txt");
$mailCountd=getUserFile($userssid,"Mail/trash/MailCount.txt");

if(!($mailCounta)){
$amesg="No Messages";
}else{
$amesg="$mailCounta Message(s)";
}

if(!($mailCountb)){
$bmesg="No Messages";
}else{
$bmesg="$mailCountb Message(s)";
}

if(!($mailCountc)){
$cmesg="No Messages";
}else{
$cmesg="$mailCountc Message(s)";
}

if(!($mailCountd)){
$dmesg="No Messages";
}else{
$dmesg="$mailCountd Message(s)";
}

$thingssentout=<<"ERIC"
<HTML>
<HEAD>
<DISPLAY fontsize="medium">
<SENDPANEL action="wtv-mail:/sendmail"
message="Write a new message"
label="Write"
>
<SAVEPANEL
action="wtv-mail:/listmail?mailbox_name=mbox"
message="View your saved messages"
label="View"
>
<TITLE>
Mailboxes for $username
</TITLE>
</HEAD>
<print blackandwhite>
<sidebar width=114 height=420 align=left>
<table cellspacing=0 cellpadding=0 bgcolor=333b5a>
<tr>
<td colspan=3 width=104 absheight=4>
<td rowspan=100 width=10 height=420 valign=top align=left bgcolor=191919>
<img src="wtv-mail:/ROMCache/Shadow.gif" width=6 height=420>
<tr>
<td abswidth=6>
<td abswidth=93 absheight=76>
<table href="wtv-home:/home" absheight=76 cellspacing=0 cellpadding=0 width=100%>
<tr>
<td abswidth=6>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1>
<td align=center>
<img src="wtv-mail:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=202434>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=515b84>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td abswidth=6>
<td abswidth=93 absheight=25>
<table
href="wtv-mail:/sendmail"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=333b5a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1><shadow><font sizerange=medium color="E7CE4A">Write</font></shadow>
</table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=202434>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=515b84>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td abswidth=6>
<td abswidth=93 absheight=25>
<table
href="wtv-mail:/addressbook"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=333b5a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1><shadow><font sizerange=medium color="E7CE4A">Addresses</font></shadow>
</table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=202434>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=515b84>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td abswidth=6>
<td abswidth=93 absheight=25>
<table
href="wtv-setup:/mail"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=333b5a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1><shadow><font sizerange=medium color="E7CE4A">Setup</font></shadow>
</table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=202434>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=515b84>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 height=205 valign=bottom align=right >
<img src="wtv-mail:/ROMCache/BannerMail.gif" width=50 height=96>
<tr><td colspan=3 absheight=36>
</table>
</sidebar>
<body bgcolor="191919" text="42BD52" link="189CD6"
vlink="189CD6" FONTSIZE="medium"
vspace=0>
<table cellspacing=0 cellpadding=0>
<tr>
<td colspan=2 height=16 valign=top align=left>
<tr>
<td colspan=2 height=39 valign=top>
<font size=+1 color="E7CE4A">
<blackface>
<shadow>
Mailboxes for $username
</shadow>
</blackface>
</font>
<tr>
<td colspan=2 height=25 valign=top>
Choose a mailbox to view the messages in it.
</table>
<TABLE cellspacing=0 cellpadding=0>
<tr>
<td height=2 abswidth=500 valign=middle align=center bgcolor="2B2B2B">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td height=1 valign=top align=left>
<tr>
<td height=2 valign=top align=left bgcolor="0D0D0D">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td height=5 valign=top align=left>
</TABLE	<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=6>
<TABLE cellspacing=2 cellpadding=0 href="wtv-mail:/listmail" selected>
<TR>
<TD absheight=58 width=105 align=center><img src="wtv-mail:/ROMCache/MailTray.gif">
<TD width=225 valign=top><b>In box with new and<br>unsaved messages</b>
<TD width=120 valign=top>$bmesg
</TABLE>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=10>
<TABLE cellspacing=2 cellpadding=0 href="wtv-mail:/listmail?mailbox_name=mbox">
<TR>
<TD absheight=58 width=105 align=center><img src="wtv-mail:/ROMCache/MailboxStorage.gif">
<TD width=225 valign=top><b>Messages you<br>have saved</b>
<TD width=120 valign=top>$amesg
</TABLE>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=10>
<TABLE cellspacing=2 cellpadding=0 href="wtv-mail:/listmail?mailbox_name=sent">
<TR>
<TD absheight=58 width=105 align=center><img src="wtv-mail:/ROMCache/MailboxSent.gif">
<TD width=225 valign=top><b>Copies of messages<br>you have sent</b>
<TD width=120 valign=top> $cmesg
</TABLE>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=10>
<TABLE cellspacing=2 cellpadding=0 href="wtv-mail:/listmail?mailbox_name=trash">
<TR>
<TD absheight=58 width=105 align=center><img src="wtv-mail:/ROMCache/MailboxDiscard.gif">
<TD width=225 valign=top><b>Messages you<br>have discarded</b>
<TD width=120 valign=top> $dmesg 
</TABLE>
ERIC
    ;


print $clients "200 OK\n";
print $clients "Content-Length: ".length($thingssentout)."\n";
print $clients "Content-Type: text/html\n\n";
print $clients $thingssentout;