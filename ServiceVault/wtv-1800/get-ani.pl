$countxz=0;
splice(@valueArray);
$pastcontenttype=0;
$HTMLCont="";
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
if($namem eq "t-baggage-parms"){
$Baggage=$valuem;
}


}




$HTMLCont.=<<"ERIC"
<html>
<head>
<display nostatus nooptions nosave nosend skipback clearback switchtowebmode>
<title>Get ANI Phone Number</title>
</head>
<body noscroll bgcolor="#191919" text="#42CC55" link="36d5ff" fontsize="large"
hspace=0 vspace=0>
<table cellspacing=0 cellpadding=0>
<tr><td width=104 height=74 valign=middle align=center bgcolor="3B3A4D">
<img src="wtv-1800:/ROMCache/WebTVLogoJewel.gif" width=86 height=64>
<td width=20 valign=top align=left bgcolor="3B3A4D">
<img src="wtv-1800:/ROMCache/Spacer.gif" width=1 height=1>
<td colspan=10 width=436 valign=middle align=left bgcolor="3B3A4D">
<font color="D6DFD0" size="+2"><blackface><shadow>
<img src="wtv-1800:/ROMCache/Spacer.gif" width=1 height=4>
<br>
Your phone number
</shadow>
</blackface>
</font>
<tr>
<td colspan=12 width=560 height=10 valign=top align=left>
<img src="wtv-1800:/images/Shadow.gif" width=560 height=6>
<tr>
<td width=104 height=10 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=67 valign=top align=left>
<td width=20 valign=top align=left>
<td width=68 valign=top align=left>
<td width=20 valign=top align=left>
<form action="validate-manual-ani" enctype="x-www-form-encoded" method="POST">
<tr>
<td colspan=11 width=540 height=258 valign=top align=left>
<table cellspacing=0 cellpadding=0>
<tr>
<td colspan=2 width=124 valign=top align=left>
<td colspan=2 width=416 valign=top align=left>
<font size=+1>
Type in the telephone number of your Internet terminal's phone line.
This will help us choose the WebTV access number nearest you.
<tr>
<td colspan=4 height=7 valign=top align=right>
<tr>
<td colspan=4 height=7 valign=top align=right>
<tr>
<td width=121 valign=top align=right>
<td width=3 valign=top align=left>
<td align=top align=left colspan=2>
<i>example 202-555-1212</i>
<tr>
<td colspan=4 height=7 valign=top align=right>
<tr>
<td width=121 valign=top align=right>
<img src="wtv-1800:/ROMCache/Spacer.gif"
width=1 height=4><br>
Phone<img src="wtv-1800:/ROMCache/Spacer.gif" width=8 height=1>
<td width=3 valign=top align=left>
<td width=174 valign=top align=left>
<input name="ani" id="ani" numbers
bgcolor=#444444 text=#ffdd33 cursor=#cc9933
value="" type="text" size="12" maxlength="12"
noSubmit>
<td width=242 valign=top align=left>
<img src="wtv-1800:/ROMCache/Spacer.gif"
width=10 height=1>Press <img src="wtv-1800:/images/Sony/CenterButton.gif"
align=absmiddle>
to type. </table>
<tr><td colspan=2>
<td colspan=99 abswidth=436 absheight=2 bgcolor=2B2B2B>
<img src="wtv-1800:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td absheight=1>
<tr><td colspan=2>
<td colspan=99 abswidth=436 absheight=2 bgcolor=0D0D0D>
<img src="wtv-1800:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td height=7>
<tr>
<td width=104 valign=middle align=center>
<td width=20 valign=middle align=center>
<td colspan=9 width=416 valign=top align=left>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=306 valign=top align=left>
<font size=-1><i>
To go on, highlight <b>Continue</b> and press
the center
<img src="wtv-1800:/images/Sony/CenterButton.gif"
align=absmiddle>
button.
</i></font><td width=112 valign=top align=right>
<font size=-1 color=#e7ce4a>
<shadow>
<input type=submit
value=Continue
name=Continue
borderimage="file://ROM/Borders/ButtonBorder2.bif"
usestyle width=110>
</shadow>
</font>
<input type="Hidden" name="t-baggage-parms"
value="$Baggage">
</form>
</table>
</body>
</html>

ERIC
    ;

print $clients "200 OK\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-service: reset\n";
print $clients "wtv-service: name=wtv-1800 host=$sockhost port=$sockport flags=0x00000004\n";
print $clients "Content-length: ".length($HTMLCont)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $HTMLCont;



