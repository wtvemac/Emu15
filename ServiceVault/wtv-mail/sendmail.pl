$username=getUserName($userssid);
$bgclr="";
$fgclr="";
#$humanname=getHumanName($userssid);
$countxz=0;
$pastcontenttype=0;
splice(@valueArray);
$sendoff=0;
$saveoff=0;
$message_subject="";
$message_bodyV="";
$message_toV="";
$message_subjectV="";
$message_ccV="";
$message_body="";
$clearme="";
$message_to="";
$message_cc="";
$humanname="";
$therestisbody=0;
$DDD=getUserHumanNameL($userssid);
$CCC=getUserHumanNameF($userssid);
$togglesign="";
$no_sig="";
$humanname="$CCC $DDD";
$sigHTML="";
$stuff=getUserFile($userssid,"Mail/outbox/MailTo.txt");

if(($stuff)){


foreach $grime (@tidly){

chop($grime);

$grime=~s/=([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
$dataDesc=substr($grime,0,index($grime," "));
$data_x=substr($grime,index($grime," ")+1);


if(!($therestisbody)){

if($dataDesc eq "Subject:"){
$message_subjectV=$data_x;
}

if($dataDesc eq "To:"){
$message_toV=$data_x;
}


if($dataDesc eq "Cc:"){
$message_ccV=$data_x;
}


if(length($grime) == 0){
$therestisbody=1;
}
}else{

$message_bodyV.=$grime;

}
}
}

$countxz=0;
splice(@headersforye);
$pastcontenttype=0;

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
if($namem eq "message_subject"){
$message_subject=$valuem;
}


if($namem eq "message_body"){
$message_body=$valuem;

}


if($namem eq "message_to"){
$message_to=$valuem;

}


if($namem eq "mailto_to"){
$message_to=$valuem;

}

if($namem eq "to"){
$message_to=$valuem;
}

if($namem eq "mailto_to"){
$mailto_to=$valuem;
}

if($namem eq "wtv-saved-message-id"){
$wtv_saved_message_id=$valuem;
}

if($namem eq "message_reply_all_cc"){
$message_reply_all_cc=$valuem;
}

if($namem eq "message_cc"){
$message_cc=$valuem;

}
if($namem eq "saveoff"){
$saveoff=$valuem;

}

if($namem eq "sendoff"){
$sendoff=$valuem;

}


if($namem eq "clear"){
$clearme=$valuem;

}


if($namem eq "clear"){
$clearme=$valuem;

}


if($namem eq "togglesign"){
$togglesign=$valuem;
}

if($namem eq "no_sig"){
$no_sig=$valuem;
}


}

if(($message_body) || ($message_cc) || ($message_to) || ($message_subject)){
addToUserFile($userssid,"Mail/outbox/MailTo.txt",,1);
}else{
$message_body=$message_bodyV;
$message_cc=$message_ccV;
$message_to=$message_toV;
$message_subject=$message_subjectV;
}






if($saveoff){
print $clients "200 OK\n";
print $clients "Content-Length: 0\n";
print $clients "Content-Type: text/html\n\n";


open(FILE,"> $RealDir/UserDataBase/Users/$username/Mail/outbox/MailTo.txt");
print FILE "From: $username\@$ServerMailaddress\n";
print FILE "To: $message_to\n";
print FILE "Cc: $message_cc\n";
print FILE "Date: Sunday, November 12, 2000\n";
print FILE "Subject: $message_subject\n\n";
print FILE "$message_body\n";
close(FILE);


}elsif($sendoff){


if(length($message_to) < 3){
print $clients "500 Please enter a user to E-Mail.\n\n";
}else{

$smalldate="$mounths/$days";

$hangman=" $message_to,$message_cc";
$hangman=~s/ /$null/;
@reciparray=split(/,/,$hangman);
foreach $recips (@reciparray){
if(!($recips=~/\@/)){
$recips.="\@$ServerMailaddress";
}
$recips.=" ";
$recips=substr($recips,0,index($recips," "));
#chop($recips);
($targetuser,$targetdomain)=split(/\@/,$recips);


if(!($no_sig)){
$sigHTML=getUserFile($userssid,"Preferences/sigHTML.txt");


$YadaX=index($sigHTML,"<body");
$bodyTag=substr($sigHTML,$YadaX);
$YadaY=rindex($bodyTag,">");
$bodyTag=substr($bodyTag,0,$YadaY);
$bodyTag=substr($bodyTag,5);


$bgclr=substr($bodyTag,index($bodyTag,"bgcolor="));
$bgclr=substr($bgclr,0,index($bgclr," "));
$bgclr=substr($bgclr,8);

$fgclr=substr($bodyTag,index($bodyTag,"text="));
$fgclr=substr($fgclr,0,index($fgclr," "));
$fgclr=substr($fgclr,5);
}
if(!($bgclr)){
$bgclr="\"#191919\"";
}

if(!($fgclr)){
$fgclr="\"#82A9D9\"";
}


if($targetdomain eq $ServerMailaddress){
if(!(matchUsername($targetuser))){
print $clients "500 No such user at \"$recips\"\n\n";
}else{
open(FILE,"UserDataBase/Users/$targetuser/Mail/inbox/MailCount.txt");
chop($MailCount=<FILE>);
close(FILE);
open(FILE,"> UserDataBase/Users/$targetuser/Mail/inbox/MailCount.txt");
print FILE ($MailCount=$MailCount+1)."\n";
close(FILE);

open(FILE,">> UserDataBase/Users/$targetuser/Mail/inbox/MailData.txt");
print FILE "$MailCount\x00$message_subject\x00$username\@$ServerMailaddress\x00$smalldate";
close(FILE);
open(FILE,"> UserDataBase/Users/$targetuser/Mail/inbox/$MailCount.txt");
print FILE "From: $username\@$ServerMailaddress ($humanname)\n";
print FILE "To: $message_to\n";
print FILE "Subject: $message_subject\n";
print FILE "X-WebTV-Stationery: BGColor $bgclr;TextColor $fgclr\n";
print FILE "Date: $formateddate\n\n";
print FILE "--WebTV-Mail-9896-1069\n";
print FILE "Content-Type: Text/Plain; Charset=US-ASCII\n";
print FILE "Content-Transfer-Encoding: 7Bit\n\n";
print FILE "$message_body\n\n"; 
if(!($no_sig)){
print FILE "--WebTV-Mail-9896-1069\n";
print FILE "Content-Description: signature\n";
print FILE "Content-Disposition: Inline\n";
print FILE "Content-Type: Text/HTML; Charset=ISO-8859-1\n";
print FILE "Content-Transfer-Encoding: Quoted-Printable\n\n";
print FILE "$sigHTML\n";
}
close(FILE);



}

}elsif(!($MailExchangers{$targetdomain})){
print $clients "500 Invalid e-mail domain at \"$recips\"\n\n";
}else{
$sockz=IO::Socket::INET->new("$MailExchangers{$targetdomain}:25");
print $sockz "HELO $username\r\n";
$actionCount=0;
while($buffer=<$sockz>){
chop($buffer) if $buffer=~/\n/;
chop($buffer) if $buffer=~/\r/;


$cmd_x=substr($buffer,0,index($buffer," "));

if($cmd_x == 550){
print $clients "500 the address $recips is invalid\n\n";
close($sockz);

}elsif($cmd_x == 250){
$actionCount++;

if($actionCount == 1){
print $sockz "MAIL FROM: $username\@$ServerMailaddress\r\n";
}elsif($actionCount == 2){
print $sockz "RCPT TO: $recips\r\n";
}elsif($actionCount == 3){
print $sockz "DATA\r\n";
print $sockz "From: $username\@$ServerMailaddress ($humanname)\r\n";
print $sockz "To: $message_to\r\n";
print $sockz "Reply-to: $message_from\r\n";
print $sockz "X-Mailer: Eric-MacDonalds WebTV Emulator 1.3\r\n";
print $sockz "Subject: $message_subject\r\n";
print $sockz "X-WebTV-Stationery: BGColor $bgclr;TextColor $fgcl\r\n";
print $sockz "Date: $formateddate\r\n\r\n";
print $sockz "--WebTV-Mail-9896-1069\r\r\r\n";
print $sockz "Content-Type: Text/Plain; Charset=US-ASCII\r\n";
print $sockz "Content-Transfer-Encoding: 7Bit\r\n\r\n";
print $sockz "$message_body\n\n[Don't e-mail this user your message will not go through]\r\n\r\n"; 
if(!($no_sig)){
print $sockz "--WebTV-Mail-9896-1069\r\n";
print $sockz "Content-Description: signature\r\n";
print $sockz "Content-Disposition: Inline\r\n";
print $sockz "Content-Type: Text/HTML; Charset=ISO-8859-1\r\n";
print $sockz "Content-Transfer-Encoding: Quoted-Printable\r\n\r\n";
print $sockz "$sigHTML\n";
}
print $sockz "\r\n.\r\n";
close($sockz);
print $clients "300 OK\n";
print $clients "Location: wtv-mail:/listmail\n\n";

}
}elsif(substr($cmd_x,0,1) == 5){
print $clients "500 There was a error while trying to send the E-mail to $recips. [$buffer]\n\n";
close($sockz);
}


}

}
}

open(FILE,"UserDataBase/Users/$username/Mail/sent/MailCount.txt");
chop($MailCount=<FILE>);
close(FILE);
open(FILE,"> UserDataBase/Users/$username/Mail/sent/MailCount.txt");
print FILE ($MailCount=$MailCount+1)."\n";
close(FILE);
open(FILE,">> UserDataBase/Users/$targetuser/Mail/sent/MailData.txt");
print FILE "$MailCount\x00$message_subject\x00$username\@$ServerMailaddress\x00$smalldate\x00"."1\n";
close(FILE);
open(FILE,"> UserDataBase/Users/$username/Mail/sent/$MailCount.txt");

print FILE "From: $username\@$ServerMailaddress ($humanname)\n";
print FILE "To: $message_to\n";
print FILE "Subject: $message_subject\n";
print FILE "X-WebTV-Stationery: BGColor #171726; TextColor #D6D6D6\n";
print FILE "Date: $formateddate\n\n";
print FILE "--WebTV-Mail-9896-1069\n";
print FILE "Content-Type: Text/Plain; Charset=US-ASCII\n";
print FILE "Content-Transfer-Encoding: 7Bit\n\n";
print FILE "$message_body\n\n"; 
if(!($no_sig)){
print FILE "--WebTV-Mail-9896-1069\n";
print FILE "Content-Description: signature\n";
print FILE "Content-Disposition: Inline\n";
print FILE "Content-Type: Text/HTML; Charset=ISO-8859-1\n";
print FILE "Content-Transfer-Encoding: Quoted-Printable\n\n";
print FILE "$sigHTML\n";
}
close(FILE);



}
print $clients "300 OK\n";
print $clients "wtv-expire-all: wtv-mail\n";
print $clients "Location: wtv-mail:/listmail\n\n";




}else{
if($clearme){
addToUserFile($userssid,"Mail/outbox/MailTo.txt",,1);
$message_body="";
$message_cc="";
$message_to="";
$message_subject="";
}

if($togglesign eq "false"){
$CoolSigstuff="<input type=hidden name=\"no_sig\" value=\"true\">";
$CoolSigstuff2="";
$CoolSigstuff3="true";
$CoolSigstuff5="Add Signature";

}else{
$CoolSigstuff="";
$CoolSigstuff2="<embed src=wtv-mail:/GetSignature>";
$CoolSigstuff3="false";
$CoolSigstuff5="Remove Signature";

$sigHTML=getUserFile($userssid,"Preferences/sigHTML.txt");


$YadaX=index($sigHTML,"<body");
$bodyTag=substr($sigHTML,$YadaX);
$YadaY=rindex($bodyTag,">");
$bodyTag=substr($bodyTag,0,$YadaY);
$bodyTag=substr($bodyTag,5);


$bgclr=substr($bodyTag,index($bodyTag,"bgcolor="));
$bgclr=substr($bgclr,0,index($bgclr," "));
$bgclr=substr($bgclr,8);

$fgclr=substr($bodyTag,index($bodyTag,"text="));
$fgclr=substr($fgclr,0,index($fgclr," "));
$fgclr=substr($fgclr,5);
}


if(!($bgclr)){
$bgclr="\"#191919\"";
}
if(!($fgclr)){
$fgclr="\"#82A9D9\"";
}




$HTML=<<"ERIC"
<display poweroffalert >
<sendpanel action="javascript:Submit()" message="Send this message now" label="Send message">
<savepanel message="Messages that you are writing cannot be saved. Send it to yourself if you would like a copy.">
<HTML>
<head>
<script language=javascript> 
function ClientWRKAR(ggg){
if(ggg){
document.open("text/url")
document.write(ggg)
document.close()
}
}


function Submit() {
ClientWRKAR("client:showsplash?message=Sending%20Message&animation=file://ROM/Animations/mail.ani&action=client:submitform%3Fname%3Dsendform%26submitname%3Dsendoff%26submitvalue%3DSend");
 }
 function ErasingMedia(victim) {
 var myURL;
 myURL = "client:submitform?name=sendform&submitvalue=false" + "&submitname=" + victim;
 if (victim == "gabbing") {
      document.forms.sendform.elements.message_voicemail_data.disabled = true;
 }
 if (victim == "snapping") {
     document.forms.sendform.elements.message_snapshot_data.disabled = true;
 }
 ClientWRKAR(myURL);
 location.reload();
      }
 function Signing(desiredState) {
        var myURL;
 myURL="client:submitform?name=sendform&submitvalue=$CoolSigstuff3"+"&submitname=togglesign";
 ClientWRKAR(myURL);
 location.reload();
 }
 function DoneSnapping() {
      ClientWRKAR("client:submitform?name=sendform&submitname=snapping&submitvalue=true");
 location.reload();
      }
 function DoneGabbing() {
        var myURL;
 myURL = "client:submitform?name=sendform&submitname=gabbing&submitvalue=cache%3Avoicemail.wav";
ClientWRKAR("client:submitform?name=sendform&submitname=gabbing&submitvalue=true");
 location.reload();
      }
 </script>
 
 
 <title> Write a message </title>
 </head>
 

 
 <body bgcolor="#171726" text="#82A9D9" link="#BDA73A" vlink="#62B362" vspace=0 hspace=0>
<form action="wtv-mail:/sendmail#focus" method="postg" name=sendform >
 
 <input type=hidden name="mailto_to">
 <input type=hidden name="wtv-saved-message-id" value="MailTo">
$CoolSigstuff<input type=hidden name="message_reply_all_cc" value="">
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
<td  bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
<table cellspacing=0 cellpadding=0 href="javascript:ClientWRKAR('client:openaddresspanel')" id=addressbook>
<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Address</font></shadow>
</table>
<td width=5>
<tr>    <td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
<table cellspacing=0 cellpadding=0 href="javascript:ClientWRKAR('client:showalert?sound=none&message=Are%20you%20sure%20you%20want%20to%20erase%20this%20entire%20message%3F&buttonlabel2=Don\\'t%20Erase&buttonaction2=client:donothing&buttonlabel1=Erase&buttonaction1=wtv-mail:/sendmail%3Fclear%3Dtrue#focus')" id=addressbook>
<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Erase</font></shadow>
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
<font sizerange=medium color=#D6D6D6><blackface> Write a message </blackface></font>
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
<td bgcolor=#171726 width=13>
<spacer type=horizontal size=13>
<td bgcolor=#171726 width=438 valign=top>
<spacer type=vertical size=5><br>
<table cellspacing=0 cellpadding=0 bgcolor=$bgclr text=$fgclr>
<tr>
<td absheight=2 colspan=5 bgcolor=#495360>
<tr>
<td abswidth=2 bgcolor=#495360>
<td absheight=13 colspan=3>
<td abswidth=2 bgcolor=#000000>
<tr>
<td abswidth=2 bgcolor=#495360>
<td abswidth=13>
<td abswidth=385>
<table cellspacing=0 cellpadding=0>     <tr>
<td width=80 valign=top align=right>
<font color=white>From:&nbsp;</font>
<td width=305 valign=top>
<font color=white>$username\@$ServerMailaddress</font>
<font color=white>$humanname</font>
<tr>
<td height=13 valign=middle colspan=2>
<img src="wtv-mail:/content/images/sendmail_panel_dots.gif" width=385 height=2>
<tr>
<td width=80 valign=top align=right>
<a href="javascript:ClientWRKAR('client:openaddresspanel')">To:</a>&nbsp; <td width=305 valign=top>
<textarea bgcolor=$bgclr cursor=#BDA73A nosoftbreaks borderimage="file://ROM/Borders/textfield.alt1.bif" nohardbreaks font=proportional text=white name="message_to" border=0 width=305 rows=1 growable autoactivate addresses autoascii nohighlight value="$message_to"></textarea>
<tr>
<td height=13 valign=middle colspan=2>
<img src="wtv-mail:/content/images/sendmail_panel_dots.gif" width=385 height=2>
<tr>
<td width=80 valign=top align=right>
<a href="javascript:ClientWRKAR('client:openaddresspanel')">Cc:</a>&nbsp; <td width=305 valign=top>
<textarea bgcolor=$bgclr cursor=#BDA73A nosoftbreaks borderimage="file://ROM/Borders/textfield.alt1.bif" nohardbreaks font=proportional text=white name="message_cc" border=0 width=305 rows=1 growable autoactivate addresses autoascii nohighlight value="$message_cc"></textarea>
<tr>
<td height=13 valign=middle colspan=2>
<img src="wtv-mail:/content/images/sendmail_panel_dots.gif" width=385 height=2>
<tr>
<td width=80 valign=top align=right>
<font color=white>Subject:&nbsp;</font>
<td width=305 valign=top>
<textarea bgcolor=$bgclr cursor=#BDA73A nosoftbreaks borderimage="file://ROM/Borders/textfield.alt1.bif" nohardbreaks text=white name="message_subject" font=proportional border=0 width=305 rows=1 growable autoactivate maxlength=70 selected nohighlight autohiragana value="$message_subject"></textarea>
<tr>
<td height=13 valign=middle colspan=2>
<img src="wtv-mail:/content/images/sendmail_panel_dots.gif" width=385 height=2>
<tr>
<td width=305 colspan=2>
<textarea nosoftbreaks bgcolor=$bgclr text=white cursor=#BDA73A name="message_body" font=proportional border=0 rows=3 width=386 nohighlight autoactivate autohiragana growable nextdown="Send" value="$message_body"></textarea>
</table>
<body bgcolor=#191919 text=white link=#BDA73A vlink=#62B362 vspace=0 hspace=0>
<p>
$CoolSigstuff2
<td abswidth=13>
<td abswidth=2 bgcolor=#000000>
<tr>
<td abswidth=2 bgcolor=#495360>
<td absheight=13 colspan=3>
<td abswidth=2 bgcolor=#000000>
<tr>
<td absheight=2 colspan=5 bgcolor=#000000>
</table>
<tr>
<td width=13 bgcolor=#171726>
<td width=438 bgcolor=#171726>
<spacer type=vertical size=5><br>
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=305 valign=top>
<a href="javascript:Signing('signingoff')">
<img src="wtv-mail:/content/images/RemoveButton.gif" align=absmiddle height=25 width=25>&nbsp;$CoolSigstuff5
&nbsp;</a>
<br>
<td align=right valign=top width=110>
<FONT COLOR="#E7CE4A"><SHADOW>
<INPUT TYPE=SUBMIT BORDERIMAGE="file://ROM/Borders/ButtonBorder2.bif" action="javascript:Submit()" value="Send" name="Send" id="Send" xnocancel width=103 USESTYLE NOARGS>
</SHADOW></FONT>
</table>
<spacer type=vertical size=5>
</form>
</table>
</body>
</HTML>

ERIC
    ;


print $clients "200 OK\n";
print $clients "Content-Length: ".length($HTML)."\n";
print $clients "wtv-expire-all: wtv-mail\n";
print $clients "Content-Type: text/html\n\n";
print $clients $HTML;
}