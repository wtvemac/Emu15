$countxz=0;
$decidedusername="";
$decidedusernameF="";
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
$thethings=substr($url,9);
@valueArray=split(/\&/,$thethings);
chop($valueArray[$#valueArray]);
}

foreach $lalab (@valueArray){
($namem,$valuem)=split(/\=/,$lalab);


$valuem=~tr/+/ /;
$valuem=~s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
if($namem eq "new-subscriber-id"){
$newuserssid=$valuem;
}

if($namem eq "subscriber-name-first"){
$decidedusernameF=$valuem;
}

if($namem eq "subscriber-name-last"){
$decidedusernameL=$valuem;
}

if($namem eq "user-name"){
$decidedusername=$valuem;
}
}

if(!($decidedusername)){
$decidedusername=SubValueWName();
}

if(!($decidedusernameF)){
$decidedusernameF=SubValueWName();
}

if($decidedusername=~/\:/){
print $clients "500 Please get rid of the :\n\n";
}elsif($decidedusernameF=~/\:/){
print $clients "500 Please get rid of the :\n\n";
}elsif($decidedusernameL=~/\:/){
print $clients "500 Please get rid of the :\n\n";
}


$stuffsentout=<<"ERIC"
<html>
<head>
<title>
Internet and e-mail name
</title>
<display nooptions
NoScroll
>
</head>
<body noscroll bgcolor="#191919" text="#42CC55" link="36d5ff"
hspace=0 vspace=0 fontsize="large"
>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=104 height=74 valign=middle align=center bgcolor="3B3A4D">
<img src="wtv-register:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
<td width=20 valign=top align=left bgcolor="3B3A4D">
<img src="ROMCache/Spacer.gif" width=1 height=1>
<td colspan=10 width=436 valign=middle align=left bgcolor="3B3A4D" >
<font color="D6DFD0" size="+2">
<blackface>
<shadow>
<img src="ROMCache/Spacer.gif" width=1 height=4>
<br>
Internet and e-mail name
</shadow>
</blackface>
</font>
<tr>
<td colspan=12 width=560 height=10 valign=top align=left>
<img src="images/Shadow.gif" width=560 height=6>
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
<form ACTION="ValidateReview" ENCTYPE="x-www-form-encoded" METHOD="POST">
<INPUT TYPE="hidden" NAME="wants-byoisp" VALUE="OFF">
<INPUT TYPE="hidden" NAME="correcting" VALUE="">
<INPUT TYPE="hidden" NAME="controller" VALUE="keyboard">
<INPUT TYPE="hidden" NAME="any-promotions" VALUE="">
<INPUT TYPE="hidden" NAME="program-enrollment-code" VALUE="">
<INPUT TYPE="hidden" NAME="payment-method" VALUE="">
<INPUT TYPE="hidden" NAME="subscriber-name-first" VALUE="$decidedusernameF">
<INPUT TYPE="hidden" NAME="subscriber-billing-address" VALUE="147 Burrito Crescent">
<INPUT TYPE="hidden" NAME="subscriber-billing-city" VALUE="Boxford">
<INPUT TYPE="hidden" NAME="subscriber-billing-state" VALUE="MA">
<INPUT TYPE="hidden" NAME="subscriber_billing_zip" VALUE="01921">
<INPUT TYPE="hidden" NAME="subscriber_phone_day" VALUE="6506145000">
<INPUT TYPE="hidden" NAME="subscriber_card_number" VALUE="">
<INPUT TYPE="hidden" NAME="subscriber_card_expires" VALUE="">
<INPUT TYPE="hidden" NAME="subscriber-card-type" VALUE="">
<INPUT TYPE="hidden" NAME="subscriber-card-type-backup" VALUE="">
<INPUT TYPE="hidden" NAME="credit-or-debit" VALUE="">
<INPUT TYPE="hidden" NAME="routing-number" VALUE="">
<INPUT TYPE="hidden" NAME="checking-account-number" VALUE="">
<INPUT TYPE="hidden" NAME="subscriber-password" VALUE="">
<INPUT TYPE="hidden" NAME="subscriber-password2" VALUE="">
<INPUT TYPE="hidden" NAME="new-subscriber-id" VALUE="$newuserssid">
<INPUT TYPE="hidden" NAME="ccauth-trans-id" VALUE="">
<INPUT TYPE="hidden" NAME="user-name" VALUE="$decidedusername">
<INPUT TYPE="hidden" NAME="send-on-my-address" VALUE="">
<INPUT TYPE="hidden" NAME="smart-card-sign-up" VALUE="">
<INPUT TYPE="hidden" NAME="payment-alterations" VALUE="">
<INPUT TYPE="hidden" NAME="next-destination" VALUE="">
<INPUT TYPE="hidden" NAME="new-subscriber-id" VALUE="$newuserssid">
<INPUT TYPE="hidden" NAME="step-order" VALUE="">
<INPUT TYPE="hidden" NAME="subscriber-age" VALUE="">
<INPUT TYPE="hidden" NAME="subscriber-sex" VALUE="">
<INPUT TYPE="hidden" NAME="subscriber-has-computer" VALUE="">
<INPUT TYPE="hidden" NAME="subscriber-has-internet" VALUE="">
<INPUT TYPE="hidden" NAME="other-members-of-household" VALUE="">
<INPUT TYPE="hidden" NAME="is-etv-upgrading" VALUE="">
<INPUT TYPE="hidden" NAME="remote-type" VALUE="">
<input type=hidden name=whatnot
>

<tr>
<td colspan=11 width=540 height=258 valign=top align=left>
<table cellspacing=0 cellpadding=0>	<tr>
<td colspan=2 width=124 valign=top align=left>
<td colspan=2 width=416 valign=top align=left>	<font size="+1">
Choose your Last Name.
<p>
</font>
<tr>
<td width=121 valign=top align=right>
<img src="ROMCache/Spacer.gif" width=1 height=4><br>
Last: <img src="ROMCache/Spacer.gif" width=7 height=1><br>
<td width=3 valign=top align=left>
<td width=174 valign=top align=left>

<INPUT noSubmit NAME="subscriber-name-last" ID="subscriber-name-last" Value="$decidedusernameL"
bgcolor=#444444 text=#ffdd33 cursor=#cc9933
TYPE="text" ASCIIONLY
SIZE="15"
MAXLENGTH="15"><spacer width=8>
<td width=242 valign=top align=left>
<img src="ROMCache/Spacer.gif" width=1 height=4><br>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><br>
FirstName:
$decidedusernameF
</td></tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><br>
Username:
$decidedusername
</td></tr>
</table>
<tr>
<td colspan=12>
<table cellspacing=0 cellpadding=0 width=520>
<tr>
<td width=130>
<td height=2 valign=middle bgcolor="2B2B2B" width=430>
<img src="ROMCache/Spacer.gif" width=430 height=1>
<tr>
<td height=1 valign=top>
<tr>
<td>
<td height=2 valign=top bgcolor="0D0D0D" width=430>
<img src="ROMCache/Spacer.gif" width=430 height=1>
<tr>
<td height=4 valign=top>
<tr>
<td>
<td width=430>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=300 valign=top align=left>
<font size="-1"><i>
To go on, highlight <b>Continue</b> and press	<b>Return</b>.</i></font>
<td width=10 valign=top>
<td width=110 valign=top>
<font size="-1" color="#E7CE4A">
<shadow>
<input type=submit Value=Continue name="Continue" borderimage="file://ROM/Borders/ButtonBorder2.bif" usestyle width=110>
</shadow>
</font>
</form>
</table>
</table>
</body>
</html>
ERIC
    ;

print $clients "200 OK\n";
print $clients "Content-Length: ".length($stuffsentout)."\n";
print $clients "Content-Type: text/html\n\n";
print $clients $stuffsentout;
