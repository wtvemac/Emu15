$MiddleSectionHTML="";
$username=getUserName($userssid);
$countxz=0;
$pastcontenttype=0;
$Boota="";
$mailbox_name="";
$mailbox_name_x="";
$centah="";
$countSectionHTML="";
$bulk_delete="";
$confirmmanover=0;
$actiontobewreckon=0;
$imagetobewreckon=0;
$mailtransitto=0;
$deleteconfirmed="";
splice(@deletemail);
splice(@valueArray);
foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "content-length:"){
$pastcontenttype=1;
}

if($countxz eq ($#headersforye)+1 && $pastcontenttype){
@valueArray=split(/\&/,$thethings);
chop($valueArray[$#valueArray]);
}
}
if(!($valueArray[0])){
@valueArray=split(/\&/,$qurey);
chop($valueArray[$#valueArray]);
}

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);


$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

if($namem eq "mailbox_name"){
$mailbox_name=$valuem;
}
if($namem eq "bulk_delete"){
$bulk_delete=$valuem;
}

if($namem eq "delete"){
if($valuem){
push(@deletemail,$valuem);
}
}

if($namem eq "confirmmanover"){
$confirmmanover=1;
}

if($namem eq "select_all"){
$select_all=$valuem;
}

if($namem eq "deleteconfirmed"){
$deleteconfirmed=1;
}

if($namem eq "discard"){
$actiontobewreckon="discard";
$imagetobewreckon="wtv-mail:/ROMCache/MailboxDiscard.gif";
$mailtransitto="trash";
}


if($namem eq "save"){
$actiontobewreckon="save";
$imagetobewreckon="wtv-mail:/ROMCache/MailboxStorage.gif";
$mailtransitto="mbox";
}
}


if($deletemail[0]){
if(!($confirmmanover)){
$#deletemail++;											   
chop($params);
$params=~s/\=/%3d/g;
$params=~s/\&/%26/g;
$params=~s/\?/%3f/g;
$params.="\%26confirmmanover\%3d1";


if($mailtransitto eq "trash" && $mailbox_name eq "trash"){
$params.="%26deleteconfirmed%3d1";
print $clients "300 Moved.\n";
print $clients "Location: client:showalert?message=Are+you+sure+you+want+to+permenently+delete+this+message+from+our+servers%3f&buttonlabel2=Cancle&buttonaction2=client:goback&buttonlabel1=Ok&buttonaction1=$params&image=$imagetobewreckon\n\n";

}elsif($mailtransitto eq $mailbox_name){
print $clients "500 I am sorry but your mail isn't going any place.\n\n";
}else{


print $clients "300 Moved.\n";
print $clients "Location: client:showalert?message=Are+you+sure+you+want+to+$actiontobewreckon+the+$#deletemail+E-Mail+message(s)+from+$mailbox_name\%3f&buttonlabel2=Cancle&buttonaction2=client:goback&buttonlabel1=Ok&buttonaction1=$params&image=$imagetobewreckon\n\n";

}
}else{
$mailCount=getUserFile($userssid,"Mail/$mailtransitto/MailCount.txt");
$username=getUserName($userssidx);
$nononono=getUserFile($userssid,"Mail/$mailbox_name/MailCount.txt");
getUserFile($userssid,"Mail/$mailbox_name/mailData.txt");
open(USERStrm,"> $RealDir/UserDataBase/Users/$username/Mail/$mailbox_name/mailData.txt");

foreach $grimeg (@tidly){
foreach $tidlede (@deletemail) {
($count_x,$b,$c,$d,$e)=split(/\x00/,$grimeg);
if($count_x == $tidlede){
$mailCount++;
if(!($deleteconfirmed)){
addToUserFile($userssid,"Mail/$mailtransitto/mailData.txt","$mailCount\x00$b\x00$c\x00$d\x00$e");
$filestuff=getUserFile($userssid,"Mail/$mailbox_name/$count_x.txt");
addToUserFile($userssid,"Mail/$mailtransitto/$mailCount.txt",$filestuff);
}
$nononono--;
deleteUserFile($userssid,"Mail/$mailbox_name/$count_x.txt")
}else{
print USERStrm $grimeg;
}

}
}
close(USERStrm);
addToUserFile($userssid,"Mail/$mailtransitto/mailCount.txt",$mailCount,1);
addToUserFile($userssid,"Mail/$mailbox_name/mailCount.txt",$nononono,1);

$filestuff="";
splice(@deletemail);
print $clients "300 Moved.\n";
print $clients "wtv-expire-all: wtv-mail\n";
print $clients "Location: wtv-mail:/listmail?mailbox_name=$mailbox_name\n\n";

}
}else{

if(!($mailbox_name)){
$mailbox_name="inbox";
}
$mailCount=getUserFile($userssid,"Mail/$mailbox_name/MailCount.txt");



if(($mailCount) eq 0 || !($mailCount)){
$countSectionHTML="$username, you have no new$mailbox_name_x messages.";
}else{
getUserFile($userssid,"Mail/$mailbox_name/mailData.txt");
$Boota=<<"ERIC"
<table cellspacing=0 cellpadding=0 href="wtv-mail:/listmail?mailbox_name=$mailbox_name&bulk_delete=true"
selected
>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Clean</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
ERIC
    ;



$countSectionHTML="$username, you have $mailCount$mailbox_name_x message(s).<table cellspacing=0 cellpadding=2 width=420><tr>
<td abswidth=151 height=24 valign=middle align=left>
<font size=-1><b>
From
<td abswidth=211 valign=middle align=left>
<font size=-1><b>
Subject
<td abswidth=46 valign=middle align=right>
<font size=-1><b>
Date</td>
</tr></table></td>
</tr></table>";
@tidly=reverse(@tidly);
foreach $grime (@tidly){
($count_x,$subject_x,$from_x,$date_x,$HasRead_x)=split(/\x00/,$grime);
if(!($subject_x)){
$subject_x="(No subject)"
}
$bold="";
if(!($HasRead_x)){
$bold="<b>";
}

if($bulk_delete){

$deleteorlist=<<"ERIC"
<table cellspacing=0 cellpadding=2 width=420 id="id$count_x"
selected
>
<tr>
<td abswidth=-4 align=center valign=middle maxlines=1>
<td abswidth=51 maxlines=1>
<input type=checkbox name="delete" $toenail value="$count_x">
ERIC
    ;
}else{
$deleteorlist=<<"ERIC"
<table cellspacing=0 cellpadding=2 width=420
href="readmail?message_id=$count_x&mailbox_name=$mailbox_name#next" id="id$count_x"
selected>
<tr>
<td abswidth=-4 align=center valign=middle maxlines=1>
ERIC
    ;
}

$MiddleSectionHTML.=<<"ERIC"
<table cellspacing=0 cellpadding=0>

<tr>
<td abswidth=8>
<td abswidth=420>
$deleteorlist
<td abswidth=151 maxlines=1>
$bold

<font color=189CD6>

$from_x

<td abswidth=211 maxlines=1>
$bold

<font color=189CD6>
$subject_x
<td abswidth=46 maxlines=1 align=right>
$bold

<font color=189CD6>
$date_x
</table>
</table>
ERIC
    ;
}
}



if(!($bulk_delete)){

if($mailbox_name eq "sent"){
$centah=<<"ERIC"
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=36 height=33 background="wtv-mail:/content/images/tab_edge_left.gif">
<td width=107 align=middle background="wtv-mail:/content/images/tab_bg.gif">
<spacer type=vertical size=3><br>
<a href="wtv-mail:/listmail?mailbox_name=sent"><font color=#BDA73A>Saved</font></a>
<td width=27 background="wtv-mail:/content/images/tab_1_f.gif">
<td width=107 align=middle background="wtv-mail:/content/images/tab_bg_hl.gif">
<spacer type=vertical size=3><br>
Sent
<td width=27 background="wtv-mail:/content/images/tab_1_m.gif">
<td width=107 align=middle background="wtv-mail:/content/images/tab_bg_hl.gif">
<spacer type=vertical size=3><br>
<a href="wtv-mail:/listmail?mailbox_name=trash"><font color=#BDA73A>Discarded</font></a>
<td width=40 background="wtv-mail:/content/images/tab_edge_right_hl.gif">
</table>
</table>
ERIC
    ;
$mailbox_name_x=" sent";
}elsif($mailbox_name eq "mbox"){
$centah=<<"ERIC"
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=36 height=33 background="wtv-mail:/content/images/tab_edge_left.gif">
<td width=107 align=middle background="wtv-mail:/content/images/tab_bg.gif">
<spacer type=vertical size=3><br>
Saved
<td width=27 background="wtv-mail:/content/images/tab_1_f.gif">
<td width=107 align=middle background="wtv-mail:/content/images/tab_bg_hl.gif">
<spacer type=vertical size=3><br>
<a href="wtv-mail:/listmail?mailbox_name=sent"><font color=#BDA73A>Sent</font></a>
<td width=27 background="wtv-mail:/content/images/tab_1_m.gif">
<td width=107 align=middle background="wtv-mail:/content/images/tab_bg_hl.gif">
<spacer type=vertical size=3><br>
<a href="wtv-mail:/listmail?mailbox_name=trash"><font color=#BDA73A>Discarded</font></a>
<td width=40 background="wtv-mail:/content/images/tab_edge_right_hl.gif">
</table>
</table>
ERIC
    ;
$mailbox_name_x=" saved";
}elsif($mailbox_name eq "trash"){
$centah=<<"ERIC"
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=36 height=33 background="wtv-mail:/content/images/tab_edge_left.gif">
<td width=107 align=middle background="wtv-mail:/content/images/tab_bg.gif">
<spacer type=vertical size=3><br>
<a href="wtv-mail:/listmail?mailbox_name=mbox"><font color=#BDA73A>Saved</font></a>
<td width=27 background="wtv-mail:/content/images/tab_1_f.gif">
<td width=107 align=middle background="wtv-mail:/content/images/tab_bg_hl.gif">
<spacer type=vertical size=3><br>
<a href="wtv-mail:/listmail?mailbox_name=sent"><font color=#BDA73A>Sent</font></a>
<td width=27 background="wtv-mail:/content/images/tab_1_m.gif">
<td width=107 align=middle background="wtv-mail:/content/images/tab_bg_hl.gif">
<spacer type=vertical size=3><br>Discarded
<td width=40 background="wtv-mail:/content/images/tab_edge_right_hl.gif">
</table>
</table>
ERIC
    ;
$mailbox_name_x=" trashed";
}else{
$mailbox_name_x="";
$centah="";
}

if($mailbox_name ne "inbox"){
$thingssentout=<<"ERIC"

<html>
<head>
<sendpanel action="wtv-mail:/sendmail"
message="Write a new message"
label="Write">
<savepanel message = "You are already viewing your saved mail">
<HTML>
<head>
<title>	Mail storage for $username</title>
</head>
<body bgcolor="#1F2033" text="#82A9D9" link="#BDA73A" vlink="#7A9FCC" fontsize="medium" vspace=0 hspace=0>
<sidebar width=109>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=104 height=420 bgcolor=#262E3D valign=top>
<table cellspacing=0 cellpadding=0>
<tr>
<td height=7 colspan=3>
<spacer type=vertical size=7>
<tr>
<td width=7>
<spacer type=horizontal size=7>
<td width=87 href="wtv-home:/home">
<img src="wtv-mail:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
<td width=10>
<spacer type=horizontal size=10>
</table>
<spacer type=vertical size=6>




<table cellspacing=0 cellpadding=0 border=0>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
<table cellspacing=0 cellpadding=0 href="wtv-mail:/listmail"
selected
>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Mail list</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
</table>


<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>

$Boota
</table>


<td width=5 bgcolor=#5B6C81>
</table>
</sidebar>
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=451 colspan=2 align=center bgcolor=#5B6C81>
<spacer type=vertical size=13>
<tr>
<td height=8 bgcolor=#171726 colspan=2>
<img src="wtv-mail:/content/images/CornerTop.gif" width=8 height=8>
<tr>
<td bgcolor=#171726 width=451 valign=top>
<table cellspacing=0 cellpadding=0 width=451>
<tr>
<td bgcolor=#171726 width=13>
<spacer type=horizontal size=13>
<td height=60>
<img src="wtv-mail:/content/images/Mail.gif" width=87 height=45>
<img src="wtv-mail:/ROMCache/OpenMailbox3.gif" width=61 height=47 transparency=60>
<td width=215 valign=middle>
<td width=15>
</table>
<tr>
<td colspan=2>
<table cellspacing=0 cellpadding=0 bgcolor=#2C323D>
<tr>
<td width=451 absheight=25>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=13 absheight=25>
<spacer type=horizontal size=13>
<td width=269 maxlines=1>
<font sizerange=medium color=#D6D6D6><blackface>	Mail storage	</blackface></font>
<td width=21>
<td width=80 >
<spacer type=vertical size=1><br>
<td width=21>
<img src="wtv-mail:/content/images/widget.gif" width=16 height=16>
<td width=34>
<spacer type=vertical size=1><br>
<a href="wtv-guide:/help?topic=Mail&subtopic=Index&appName=Mail" ><font sizerange=small color=#E6CD4A><b>Help</b></font></a>
<td width=13>
<spacer type=horizontal size=13>
</table>
</table>
</table>
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=451 bgcolor="#171726">
<spacer type=vertical size=5>
$centah	<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=13 bgcolor="#1F2033">
<td width=438 valign=top bgcolor="#1F2033">
<spacer type=vertical size=13><br>
<font sizerange=medium>	$countSectionHTML
</font><br>
<spacer type=vertical size=13>
<spacer type=vertical size=5>
</body>
</html>
$MiddleSectionHTML

ERIC
    ;
}else{
if($Boota){
$Boota.="<tr><td width=10 height=26><td width=89 valgn=middle>";
}
$thingssentout=<<"ERIC"
<html>
<head>
<sendpanel action="wtv-mail:/sendmail"
message="Write a new message"
label="Write">
<savepanel
action="wtv-mail:/listmail?mailbox_name=mbox"
message="View your saved messages"
label="View saved messages">
<HTML>
<head>
<title>	Mail list for $username
</title>
</head>
<body bgcolor="#171726" text="#82A9D9" link="#BDA73A" vlink="#7A9FCC" fontsize="medium" vspace=0 hspace=0>
<sidebar width=109>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=104 height=420 bgcolor=#262E3D valign=top>
<table cellspacing=0 cellpadding=0>
<tr>
<td height=7 colspan=3>
<spacer type=vertical size=7>
<tr>
<td width=7>
<spacer type=horizontal size=7>
<td width=87 href="wtv-home:/home">
<img src="wtv-mail:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
<td width=10>
<spacer type=horizontal size=10>
</table>
<spacer type=vertical size=6>
<table cellspacing=0 cellpadding=0 border=0>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
<table cellspacing=0 cellpadding=0 href="wtv-mail:/sendmail"
selected
>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Write</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>

<table cellspacing=0 cellpadding=0 href="wtv-mail:/mailboxes"
selected>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Mail Boxes</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>


<table cellspacing=0 cellpadding=0 href="wtv-mail:/listmail?mailbox_name=mbox"
selected>
<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Storage</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>


$Boota
<table cellspacing=0 cellpadding=0 href="wtv-mail:/addressbook?camefrom=inbox"
selected
>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Addresses</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
<table cellspacing=0 cellpadding=0 href="wtv-mail:/mail-services"
selected
>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Services</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
</table>
<td width=5 bgcolor=#5B6C81>


</table>
</sidebar>
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=451 colspan=2 align=center bgcolor=#5B6C81>
<spacer type=vertical size=13>
<tr>
<td height=8 bgcolor=#171726 colspan=2>
<img src="wtv-mail:/content/images/CornerTop.gif" width=8 height=8>
<tr>
<td bgcolor=#171726 width=451 valign=top>
<table cellspacing=0 cellpadding=0 width=451>
<tr>
<td bgcolor=#171726 width=13>
<spacer type=horizontal size=13>
<td height=60>
<img src="wtv-mail:/content/images/Mail.gif" width=87 height=45>
<img src="wtv-mail:/ROMCache/OpenMailbox3.gif" width=61 height=47 transparency=60>
<td width=215 valign=middle>
<td width=15>
</table>
<tr>
<td colspan=2>
<table cellspacing=0 cellpadding=0 bgcolor=#2C323D>
<tr>
<td width=451 absheight=25>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=13 absheight=25>
<spacer type=horizontal size=13>
<td width=269 maxlines=1>
<font sizerange=medium color=#D6D6D6><blackface>	Mail list
</blackface></font>
<td width=21>
<img src="wtv-mail:/content/images/widget.gif" width=16 height=16>
<td width=80 >
<spacer type=vertical size=1><br>
<a href="wtv-setup:/mail"><font sizerange=small color=#E6CD4A><b>Settings</b></font></a>
<td width=21>
<img src="wtv-mail:/content/images/widget.gif" width=16 height=16>
<td width=34>
<spacer type=vertical size=1><br>
<a href="wtv-guide:/help?topic=Mail&subtopic=Index&appName=Mail" ><font sizerange=small color=#E6CD4A><b>Help</b></font></a>
<td width=13>
<spacer type=horizontal size=13>
</table>
</table>
</table>
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td bgcolor=#171726 width=13>
<spacer type=horizontal size=7>
<td bgcolor=#171726 width=438 valign=top>
<spacer type=vertical size=13><br>
<font sizerange=medium>
$countSectionHTML
</font><br>
</td>
</tr>
</table>
<p>
$MiddleSectionHTML
<spacer type=vertical size=6>
<spacer type=vertical size=5>
</body>
</html>
ERIC
    ;
}
}else{
if($mailbox_name eq "mbox" or $mailbox_name eq "inbox" or $mailbox_name eq "sent" or $mailbox_name eq "trash"){
if($mailbox_name ne "inbox"){
$entail="Storage";

}else{
$entail="Mail List";

}
if($mailCount > 0){

if($select_all){
$checkoper="0";
$checkmessage="Unmark";
$toenail=" checked=1 ";
}else{
$checkoper="true";
$checkmessage="Mark All";
$toenail="";
}

$centah.=<<"ERIC"
<table cellspacing=0 cellpadding=0 href="client:submitform?name=deleteform&submitname=discard&submitvalue=true"
selected
xnocancel
>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Discard</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
ERIC
    ;
}

if($mailbox_name eq "inbox" or $mailbox_name eq "sent"){
$centah.=<<"ERIC"

<table cellspacing=0 cellpadding=0 href="client:submitform?name=deleteform&submitname=save&submitvalue=true"
selected
xnocancel
>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Save</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
ERIC
    ;
}

$centah.=<<"ERIC"
<table cellspacing=0 cellpadding=0 href="wtv-mail:/listmail?bulk_delete=true&select_all=$checkoper&mailbox_name=inbox#bogus"
selected
xnocancel
>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>$checkmessage</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
ERIC
    ;

}

$thingssentout=<<"ERIC"
<html>
<head>
<sendpanel action="wtv-mail:/sendmail"
message="Write a new message"
label="Write">
<savepanel
action="wtv-mail:/listmail?mailbox_name=mbox"
message="View your saved messages"
label="View saved messages">
<HTML>
<head>
<title>	Clean up mail list
</title>
</head>
<body bgcolor="#171726" text="#82A9D9" link="#BDA73A" vlink="#7A9FCC" fontsize="medium" vspace=0 hspace=0>
<form action="wtv-mail:/listmail" method="get" name="deleteform">
<input type="hidden" name="mailbox_name" value="$mailbox_name">
<sidebar width=109>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=104 height=420 bgcolor=#262E3D valign=top>
<table cellspacing=0 cellpadding=0>
<tr>
<td height=7 colspan=3>
<spacer type=vertical size=7>
<tr>
<td width=7>
<spacer type=horizontal size=7>
<td width=87 href="wtv-home:/home">
<img src="wtv-mail:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
<td width=10>
<spacer type=horizontal size=10>
</table>
<spacer type=vertical size=6>
<table cellspacing=0 cellpadding=0 border=0>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
<table cellspacing=0 cellpadding=0 href="wtv-mail:/listmail?mailbox_name=$mailbox_name"
selected
>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>$entail</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
$centah




</table>
<td width=5 bgcolor=#5B6C81>
</table>
</sidebar>
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=451 colspan=2 align=center bgcolor=#5B6C81>
<spacer type=vertical size=13>
<tr>
<td height=8 bgcolor=#171726 colspan=2>
<img src="wtv-mail:/content/images/CornerTop.gif" width=8 height=8>
<tr>
<td bgcolor=#171726 width=451 valign=top>
<table cellspacing=0 cellpadding=0 width=451>
<tr>
<td bgcolor=#171726 width=13>
<spacer type=horizontal size=13>
<td height=60>
<img src="wtv-mail:/content/images/Mail.gif" width=87 height=45>
<img src="wtv-mail:/ROMCache/OpenMailbox3.gif" width=61 height=47 transparency=60>
<td width=215 valign=middle>
<td width=15>
</table>
<tr>
<td colspan=2>
<table cellspacing=0 cellpadding=0 bgcolor=#2C323D>
<tr>
<td width=451 absheight=25>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=13 absheight=25>
<spacer type=horizontal size=13>
<td width=269 maxlines=1>
<font sizerange=medium color=#D6D6D6><blackface>	Clean up mail list
</blackface></font>
<td width=21>
<td width=80 >
<spacer type=vertical size=1><br>
<td width=21>
<img src="wtv-mail:/content/images/widget.gif" width=16 height=16>
<td width=34>
<spacer type=vertical size=1><br>
<a href="wtv-guide:/help?topic=Mail&subtopic=Index&appName=Mail" ><font sizerange=small color=#E6CD4A><b>Help</b></font></a>
<td width=13>
<spacer type=horizontal size=13>
</table>
</table>
</table>
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td bgcolor=#171726 width=13>
<spacer type=horizontal size=13>
<td bgcolor=#171726 width=438 valign=top>
<spacer type=vertical size=13><br>
<font sizerange=medium>	Mark messages you want to move from the mail list, and then choose <b>Discard</b> or <b>Save</b>.
</font><br>
<spacer type=vertical size=6>
$MiddleSectionHTML
<spacer type=vertical size=5>
</body>
</html>
ERIC
    ;

}

print $clients "200 OK\n";
print $clients "Content-Length: ".length($thingssentout)."\n";
print $clients "Content-Type: text/html\n\n";
print $clients $thingssentout;

}



