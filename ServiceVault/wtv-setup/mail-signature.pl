$sigHTML="";
$countxz=0;
$pastcontenttype=0;
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
if($namem eq "sigHTML"){
$sigHTML=$valuem;
}
}

if($sigHTML){
addToUserFile($userssid,"Preferences/sigHTML.txt",$sigHTML,1);

print $clients "200 OK.\n";
print $clients "Content-length: 0\n";
print $clients "wtv-expire-all: wtv-mail\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Content-type: text/html\n\n";

}else{
$sigHTML=getUserFile($userssid,"Preferences/sigHTML.txt");

$tosendout=<<"ERIC"
<HTML>
<head>
<title>	Keyboard setup
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
<blackface><font color=#D6D6D6>	Mail Signature
</font></blackface>
<td width=21>
<img src="wtv-setup:/images/widget.gif" width=16 height=16>
<td width=34>
<spacer type=vertical size=1><br>
<a href="wtv-guide:/help?topic=Settings&subtopic=Keyboard"><font sizerange=small color=#E7CE4A><b>Help</b></font></a>
<td width=12>
<spacer type=horizontal size=12>
</table>
</table>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=15 rowspan=2 bgcolor=#645D5F>
<td width=48 rowspan=2>
<td width=447 height=237 valign=top>
<table cellspacing=0 cellpadding=1>
<tr>
<td height=24>
<tr>
<td align=center bgcolor=#645D5F>
<FORM>
<input type="hidden" autosubmit="onleave">
<textarea cols=100% id="sigHTML" rows=7 bgcolor="#2E2E2A" text="#CBCBCB" cursor="#FFE99B" border=0 nohighlight selected>$sigHTML</textarea>
</table>
<tr>
<td align=right>
<table cellspacing=0 cellpadding=0>
<tr>
<td>
<spacer type=horizontal size=18>
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


print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Connection: Keep-Alive\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;
}