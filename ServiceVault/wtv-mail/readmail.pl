

$therestisbody=0;
$ThisIsWebTV=0;
$stuffsentoutX="";
$happenagain=0;
$dontshowsig=0;
$okedoke=0;
$HTML="";
$therestisbody=0;
$message_id="";
$mailbox_name="";
$countxz=0;
$pastcontenttype=0;
$STFIY="";
$fromdata="";
$subjectData="";
$prevastuff="";
$nextastuff="";
$BodyContent="";
$nextcolor="";
$prevcolor="";
$FVDZ="";
$countxz=0;
$pastcontenttype=0;

$countxz=0;
$ngname="";
$stuffsentoutX="";
$articlex="";
$pastcontenttype=0;
$goahead=0;
$ngsource=0;
$STUFF="";
$XmessageLength=0;
$XmessageOffset=0;

$TOPBOtHTML="";
$countxz=0;
$ngname="";
$chunk=0;
$stuffsentout="";
$okedoke=0;
$chunk="";
$articlex="";
$STFIY="";
$therestisbody=0;
$pastcontenttype=0;
$BodyContent="";
$NGMimeVersion="";
$NGPostingHost="";
$NGOrganization="";
$MessageMid="";
$NGCount=0;
$curchunk=0;
$firstchunk=0;
$AXC=0;
$ADDEDChunk=0;
$happenagain=0;
$XmessageLength=0;
$XmessageOffset=0;
$ThisIsWebTV=0;
$dontshowsig=0;
$FDXSC=0;
$donotgoth=0;
$NGCategory=0;
$WHoleBargon="";


splice(@valueArray);
foreach $thethings (@headersforye) {
$countxz++;
if(lc(substr($thethings,0,index($thethings," "))) eq "content-length:"){
$pastcontenttype=1;
}

if($countxz eq ($#headersforye)+1 && $pastcontenttype){
@valueArray=split(/\&/,$thethings);
}
}
if(!($valueArray[0])){
chop($qurey);
@valueArray=split(/\&/,$qurey);
}

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);

$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;


if($namem eq "message_id"){
$message_id=$valuem;
}
if($namem eq "mailbox_name"){
$mailbox_name=$valuem;
}

}
if(!($mailbox_name)){
$mailbox_name="inbox";
}

getUserFile($userssid,"Mail/$mailbox_name/MailData.txt");
$fdvfddd=0;
foreach $grime (@tidly){
chop($grime);
($count_x,$a,$b,$c,$d)=split(/\x00/,$grime);
if($message_id == $count_x){
$HITZC=$d+1;
$FVDZ.="$count_x\x00$a\x00$b\x00$c\x00"."$HITZC\n";


if($#tidly > $fdvfddd){
$temp=$message_id;
$temp++;

$nextastuff="href='wtv-mail:/readmail?message_id=".$temp."&mailbox_name=$mailbox_name'";
$nextcolor="#E6CD4A"
}else{
$nextastuff="";
$nextcolor="#4A525A";
}
$temp=$message_id;
$temp--;

if($fdvfddd > 0){
$prevastuff="href='wtv-mail:/readmail?message_id=".$temp."&mailbox_name=$mailbox_name'";
$prevcolor="#E6CD4A"
}else{
$prevcolor="#4A525A";
$prevastuff="";

}

}else{
$FVDZ.="$count_x\x00$a\x00$b\x00$c\x00$d\n";

}
$fdvfddd++;
}
addToUserFile($userssid,"Mail/$mailbox_name/MailData.txt",$FVDZ,1);

$stuff=getUserFile($userssid,"Mail/$mailbox_name/$message_id.txt");



if(!($stuff)){

print $clients "500 Couldn't find mail contents.  It may be possible that it was deleted or saved.\n\n";
}else{

getUserFile($userssid,"Mail/$mailbox_name/$message_id.txt");



foreach $grime (@tidly){

chop($grime);

$grime=~s/\?\=//eg;
$grime=~s/\=\?ISO-8859-1\?Q//g;
$grime=~s/=([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
$dataDesc=substr($grime,0,index($grime," "));
$data_x=substr($grime,index($grime," ")+1);


if(!($therestisbody)){
if($dataDesc eq "Subject:"){
$NGSubject=$data_x;
$subjectData="Re: $data_x";
$subjectData=~tr/ /+/;
$subjectData=~s/\=/%3d/g;
$subjectData=~s/\&/%26/g;
$subjectData=~s/\?/%3f/g;



}

if($dataDesc eq "Date:"){
$NGDate=$data_x;
}
if($dataDesc eq "To:"){
$NGTo=$data_x;
}


if($dataDesc eq "X-WebTV-Stationery:"){
@StationaryArray=split(/; /,$data_x);
foreach  (@StationaryArray) {
if(substr($_,0,7) eq "BGColor"){
$BodyContent.=" bgcolor=".substr($_,8);
}

if(substr($_,0,9) eq "TextColor"){
$BodyContent.=" text=".substr($_,10);
}


if(substr($_,0,9) eq "background"){
$BodyContent.=" background=".substr($_,10);
}



}


}

if($dataDesc eq "From:"){
$NGFrom=$data_x;
$fromdata=$data_x;
$fromdata=~tr/ /+/;
$fromdata=~s/\=/%3d/g;
$fromdata=~s/\&/%26/g;
$fromdata=~s/\?/%3f/g;

}
if(length($dataDesc) == 0){

$therestisbody=1;
}
}else{
if(!($dontshowsig)){
if(length($grime) == 0 || ($grime eq "\n" || $grime eq  "\r")){
$grime="<p>";
}

if(substr($grime,0,3) eq ">>>"){
$grime="<br><font size=1>".substr($grime,4)."</font>";
}elsif(substr($grime,0,2) eq ">>"){
$grime="<br><font size=1>".substr($grime,3)."</font>";
}elsif(substr($grime,0,1) eq ">"){
$grime="<br><font size=-1>".substr($grime,2)."</font>";
}

if(substr($grime,0,12) eq "--WebTV-Mail"){
$ThisIsWebTV=1;
$happenagain++;
if(!($happenagain%2)){
$dontshowsig=1;
}
}

if(substr($grime,0,5) eq "begin"){
$dontshowsig=1;

$STFIY.="[Encryted Attachment, EricSrv Will not Show Attachments]<p>This attachment is a file of [size] [/:filename] <br>".substr($grime,5)."<p>";
}
if(substr($grime,0,3) eq "end"){
$dontshowsig=0;
$STFIY.="[/Encryted Attachment, EricSrv Will not Show Attachments]<P>";
}


if(($ThisIsWebTV) && (substr($grime,0,12) ne "--WebTV-Mail") && !($dontshowsig)){
$ThisIsWebTV=1;

if($grime eq "<p>"){
$okedoke=1;
}
if($okedoke){
$STFIY.=$grime;
}
}elsif((substr($grime,0,12) ne "--WebTV-Mail") && !($dontshowsig)){
$STFIY.=$grime;

}

}else{

if(!($goahead)){
if(substr($grime,0,13) eq "Content-Type:"){
$ContentTypeXX=substr($grime,13);

}

if(length($grime) == 0){


$goahead=1;
}
}else{
if(substr($grime,0,7) ne "--WebTV"){
$stuffsentoutX.=$grime;
}


}
if(!($ContentTypeXX)){
$ContentTypeXX="text/html";
}
$stuffsentoutX=~s/<href/<a href/g;
$stuffsentoutX=~s/<ahref/<a href/g;
$stuffsentoutX=~s/=([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;



}



}
}
if(!($BodyContent)){
$BodyContent="bgcolor=#171726 text=#82A9D9";
}


$NGFromx=substr($NGFrom,0,index($NGFrom," "));
$NGFromxx=substr($NGFrom,index($NGFrom," ")+1);
if($NGFromxx == $NGFromxx){
$NGFromxx="(None)"
}

$NGFromxxc=substr($NGFromxx,1,length($NGFromxx)-2);
$NGFromxc=$NGFromx;


$NGFromxxc=~s/=/\%3d/g;
$NGFromxxc=~s/\?/\%3f/g;
$NGFromxxc=~s/\&/\%26/g;
$NGFromxc=~s/=/\%3d/g;
$NGFromxc=~s/\?/\%3f/g;
$NGFromxc=~s/\&/\%26/g;






$HTML=<<"ERIC"

 <body $BodyContent link="#BDA73A" vlink="#62B362" vspace=0 hspace=0>
<form action="wtv-mail:/sendmail#focus" method="post" name=sendform >

 <input type=hidden name="mailto_to">
 <input type=hidden name="wtv-saved-message-id" value="MailTo">
 <input type=hidden name="message_reply_all_cc" value="">
 <input type=hidden name="saveoff" value="true" autosubmit="onleave">
 
 <sidebar width=109>
 <table cellspacing=0 cellpadding=0><tr><td width=104 height=420 bgcolor=#262E3D valign=top>
 <table cellspacing=0 cellpadding=0><tr>
 <td height=7 colspan=3>
<spacer type=vertical size=7><tr><td width=7>
 <spacer type=horizontal size=7>
 <td width=87 href="wtv-home:/home">
 <img src="wtv-mail:/ROMCache/WebTVLogoJewel.gif" width=87 height=67><td width=10>
 <spacer type=horizontal size=10>
 </table>
 <spacer type=vertical size=6>
 <table cellspacing=0 cellpadding=0 border=0><tr>
<td bgcolor=#4A525A height=2 width=104 colspan=3><tr>
<td width=10 height=26>
<td width=89 valgn=middle>
<table cellspacing=0 cellpadding=0 href="wtv-mail:/listmail" >
<tr><td height=1><tr><td><shadow>
<font sizerange=medium color=#E6CD4A>Mail list</font></shadow>
</table>
<td width=5>
<tr>
<td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
<table cellspacing=0 cellpadding=0 $nextastuff id=addressbook>
<tr>
<td height=1>

<tr>
<td><shadow><font sizerange=medium color=$nextcolor>Next</font></shadow>
</table>
<td width=5>
<tr>    <td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
<table cellspacing=0 cellpadding=0 $prevastuff
 id=addressbook>
<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=$prevcolor>Previous</font></shadow>
</table>
<td width=5>
<tr>    <td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
<table cellspacing=0 cellpadding=0 href="client:soundcapture?notify=javascript%3ADoneGabbing()&device=audio&rate=8000&name=cache%3Avoicemail.wav&donebuttonlabel=Add%20to%20Message&open" id=addressbook>
<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Forward</font></shadow>
</table>
<td width=5>
<tr>    <td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
<table cellspacing=0 cellpadding=0 href="wtv-mail:/sendmail?message_to=$fromdata&message_subject=$subjectData" id=addressbook>
<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Write</font></shadow>
</table>
<td width=5>
<tr>    <td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>


<table cellspacing=0 cellpadding=0 href="wtv-mail:/listmail?delete=$message_id&discard=1&mailbox_name=$mailbox_name&" id=addressbook>
<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Discard</font></shadow>
</table>
<td width=5>
<tr>    <td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>



<table cellspacing=0 cellpadding=0 href="wtv-mail:/listmail?delete=$message_id&confirmmanover=1&save=1&mailbox_name=$mailbox_name&" id=addressbook>
<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Save</font></shadow>
</table>
<td width=5>
<tr>    <td bgcolor=#4A525A height=2 width=104 colspan=3>
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
<td width=370 maxlines=1>
<font sizerange=medium color=#D6D6D6><blackface> Read a message </blackface></font>
<td width=21>
<img src="wtv-mail:/content/images/widget.gif" width=16 height=16 noprint>
<td width=36>
<spacer type=vertical size=1><br>
<a href="wtv-guide:/help?topic=Mail&subtopic=Index&appName=Mail" ><img src="wtv-mail:/content/images/mail_help_image.gif" width=35 height=17 noprint></a>
<td width=13>
<spacer type=horizontal size=13>
</table>
</table>
</table>
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<spacer type=horizontal size=13>
<td>
<spacer type=vertical size=5><br>
<table cellspacing=0 cellpadding=0>
<tr>
<td abswidth=2 bgcolor=#495360>
<td absheight=13 colspan=3>
<tr>
<td abswidth=2 bgcolor=#495360>
<td abswidth=13>
<td abswidth=385>
<table cellspacing=1 cellpadding=1>
<tr>
<td>
<table cellspacing=0 cellpadding=0 width=430>
<tr>
<td width=10 rowspan=99>
<td height=8>
<td>
<td width=20 rowspan=99>

<tr>
<td valign=top abswidth=65>
From:
<td valign=top abswidth=335>
$NGFromx&nbsp;<a href='wtv-mail:/addtoaddressbook?address=$NGFromxc&nickname=$NGFromxxc'>$NGFromxx</a>
<tr>
<td valign=top>
To:
<td valign=top>
$NGTo
<tr>

<td valign=top>
Date:
<td valign=top>
$NGDate
<tr>
<td valign=top abswidth=80>
Subject:
<td valign=top>
$NGSubject
<tr>
<td valign=top>
Hits:
<td valign=top>
$HITZC
<tr>
<td colspan=3 height=34>

<br>
$STFIY
<p>
$stuffsentoutX

ERIC
    ;

print $clients "200 OK\n";
print $clients "Content-Length: ".length($HTML)."\n";
print $clients "wtv-expire-all: wtv-mail\n";
print $clients "Content-Type: text/html\n\n";
print $clients $HTML;

}


