splice(@valueArray);
$ADBAction="";
$ADBnick="";
$ADBAddy="";
$countxz=0;
$Endresult="";
$pastcontenttype=0;
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

if($namem eq "nickname"){
$ADBnick=$valuem;
}
if($namem eq "address"){
$ADBAddy=$valuem;
}
if($namem eq "action"){
$ADBAction=$valuem;
}

}

if(($ADBAction eq "add")){
if(index($ADBAddy,"\@") == (-1)){
$ADBAddy.="\@$ServerMailaddress";
}


if((substr($ADBAddy,index($ADBAddy,"\@")+1) eq $ServerMailaddress) && !(matchUsername(substr($ADBAddy,0,index($ADBAddy,"\@"))))){
print $clients "300 OK\n";
print $clients "Location: client:showalert?message=The+E-mail+address+<b>$ADBAddy</b>+does+not+exsist+on+this server.\n\n";


}else{
if($ModifyMe){
$stuff=getUserFile($userssid,"Preferences/addressbook.txt");
@tidly=split(/\x00/,$stuff);
$CXZL=0;
$firsty="";
$FVC=0;
foreach $DDDC (@tidly) {
$CXZL++;
if(($CXZL)){
if(!($CXZL%2)){
$EmailZX=$DDDC;
$FVC++;
if($FVC > 1){
$firsty="\x00";
}


if((($EmailZX eq $ADBAddyX) && ($UsernameZX eq $ADBnickX))){
$Endresult.="$firsty$ADBnick\x00$ADBAddy";
}else{
$Endresult.="$firsty$UsernameZX\x00$EmailZX";
}

}else{
$UsernameZX=$DDDC;
}
}

}
addToUserFile($userssid,"Preferences/addressbook.txt","$Endresult",1);
$ModifyMe=0;

}else{

if(getUserFile($userssid,"Preferences/addressbook.txt")){
addToUserFile($userssid,"Preferences/addressbook.txt","\x00$ADBnick\x00$ADBAddy");
}else{
addToUserFile($userssid,"Preferences/addressbook.txt","$ADBnick\x00$ADBAddy",1);
}
}
print $clients "300 OK\n";
print $clients "wtv-expire-all: wtv-mail\n";
print $clients "wtv-addresses-url: wtv-mail:/addresslist\n";
print $clients "Location: wtv-mail:/addressbook\n\n";
}
}elsif(($ADBAction eq "edit")){


$lala="";
if(($ADBAddy) && ($ADBnick)){
$lala="Modify";
$ADBAddyX=$ADBAddy;
$ADBnickX=$ADBnick;
$ModifyMe=1;
}else{
$lala="Add";

$ADBnick="";
$ADBAddy="";
}

$sendstuffout=<<"ERIC"
<HTML>
<head>
<title>	$lala an address book entry
</title>
<DISPLAY poweroffalert>
<SAVEPANEL
message="Save this address"
action="client:submitform?name=addressform&submitname=action&submitvalue=Add"
label="Save"
>
<SENDPANEL action="wtv-mail:/sendmail"
message="Write a new message"
label="Write"
>
<script language="Javascript">
// class-like-thing AddressBook
function AddressBook_AddEntry(ID, nickname, canDoMessenger, newFromMessenger)
{	var newEntry = new AddressBookEntry(ID, nickname, canDoMessenger, newFromMessenger);
var index = this.Entries.length;
this.Entries[index] = newEntry;
}
// returns true if the given entry is already in the list
function AddressBook_EntryExists(ID)
{	var bookLength = this.EntryCount(); var i;
if (bookLength == 0)
return false;
for (i=0; i < bookLength; i++)
{	var currentEntry = this.Entries[i];
if (StringsIdentical(ID, currentEntry.email ))
return true;
}
return false;
}
function AddressBook_IntegrateBuddies()
{	var needIntegration = false;
needIntegration = this.CheckForNewBuddies();
if (needIntegration)
window.location = integrationURL;
else
window.location = noIntegrationURL;
}
function AddressBook_EntryCount() {return this.Entries.length; }
// run through client's idea of the friends list, adding in people
// who weren't already in the address book
// keep track if the address book has changed as a result, because
// if so we have to trigger the service to re-write it
function AddressBook_CheckForNewBuddies()
{
return newBuddiesExist;
}
function AddressBook()
{	this.Entries = new Array();
this.hasChanged = false;
this.EntryCount = AddressBook_EntryCount;
this.IntegrateBuddies = AddressBook_IntegrateBuddies;
this.EntryExists = AddressBook_EntryExists;
this.AddEntry = AddressBook_AddEntry;
this.CheckForNewBuddies = AddressBook_CheckForNewBuddies; }
</script>
<script language="Javascript">
// class-like-thing AddressBookEntry
function AddressBookEntry(ID, name, canDoMessenger, newFromMessenger)
{	this.nickname = name;
this.email = ID;
this.needsFlushing = newFromMessenger;
// if we don't get the okay from the service, we still know we're okay
// if the Messenger service itself handed us over!
if (canDoMessenger == "true")
this.canDoMessenger = true;
else
this.canDoMessenger = newFromMessenger;
this.Nickname = AddressBookEntry_Nickname;
this.Email = AddressBookEntry_Email;
this.IsMyFriend = AddressBookEntry_IsMyFriend;
this.SpewFriendStatus = AddressBookEntry_SpewFriendStatus;
this.SpewBlockStatus = AddressBookEntry_SpewBlockStatus;
this.SpewOnlineStatus = AddressBookEntry_SpewOnlineStatus;
this.IsValidMessengerTarget = AddressBookEntry_IsValidMessengerTarget;
this.toString = AddressBookEntry_ToString;
}
function AddressBookEntry_Nickname() {return this.nickname; }
function AddressBookEntry_Email() {return this.email; }
function AddressBookEntry_IsValidMessengerTarget() {return this.canDoMessenger; }
function AddressBookEntry_IsMyFriend()
{
return false; }
function AddressBookEntry_ToString()
{	var name = this.Email;
return name.toLowerCase();
}
function AddressBookEntry_SpewOnlineStatus()
{	}
// this is a US English-specific function which assumes the *first* part
// of the nickname is appropriate to use as a short name
function makeShortName(longName)
{	var unescapedName = unescape(longName);
var tempName;
var spaceIndex = 1;
if (unescapedName == "")
return "This person";
spaceIndex = unescapedName.indexOf(" ");
if (spaceIndex == -1 || spaceIndex == 0)
return unescapedName;
tempName = unescapedName.substring(0, spaceIndex);
return tempName;
}
function AddressBookEntry_SpewFriendStatus(page, spewAnchor, entryIsNew)
{
// do nothing: no status to display
// should not actually be called if client doesn't support messenger,
// but is defined here just in case
}
function AddressBookEntry_SpewBlockStatus(page, spewAnchor, entryIsNew)
{
// do nothing: no status to display
// should not actually be called if client doesn't support messenger,
// but is defined here just in case
}
// convenience routines
// return true if entries match
function StringsIdentical(a, b)
{	var aEntry = unescape(a.toLowerCase());
var bEntry = unescape(b.toLowerCase());
if (aEntry == bEntry)
return true;
else
return false;
}
</script>
<script language="Javascript">
var entryIsNew = true;
var entryAddress = ""; var entryNickname = "";
var messengerOptionsVisible = false;
var thisEntry = new AddressBookEntry(entryAddress, entryNickname, "", entryIsNew);
function doDiscard()
{	var discardLink = "wtv-mail:/addressbook?camefrom=&action=discard&nickname=";
window.location = discardLink;
}
</script>
</head>
<body bgcolor="#212F3A" text="#A3BCD4" link="#B3A147" vlink="#B3A147" fontsize="medium" vspace=0 hspace=0>
<sidebar width=109>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=104 height=420 bgcolor=#2A2E3B valign=top>
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
<table cellspacing=0 cellpadding=0 href="client:goback"
selected
>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Done</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
</table>
<td width=5 bgcolor=#596874>
</table>
</sidebar>
<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=451 colspan=2 align=center bgcolor=#596874>
<spacer type=vertical size=13>
<tr>
<td height=8 bgcolor=#212F3A colspan=2>
<img src="wtv-mail:/content/images/CornerTop.gif" width=8 height=8>
<tr>
<td bgcolor=#212F3A width=451 valign=top>
<table cellspacing=0 cellpadding=0 width=451>
<tr>
<td bgcolor=#212F3A width=13>
<spacer type=horizontal size=13>
<td height=60>
<img src="wtv-mail:/content/images/Addressbook.gif" width=300 height=45>
<td width=215 valign=middle>
<td width=15>
</table>
<tr>
<td colspan=2>
<table cellspacing=0 cellpadding=0 bgcolor=#121921>
<tr>
<td width=451 absheight=25>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=13 absheight=25>
<spacer type=horizontal size=13>
<td width=370 maxlines=1>
<font sizerange=medium color=#D6D6D6><blackface>	$lala an address book entry
</blackface></font>
<td width=21>
<img src="wtv-mail:/content/images/widget.gif" width=16 height=16>
<td width=34>
<spacer type=vertical size=1><br>
<a href="wtv-guide:/help?topic=Addressbook&subtopic=Index" nextDown=nickname><font sizerange=small color=#E6CD4A><b>Help</b></font></a>
<td width=13>
<spacer type=horizontal size=13>
</table>
</table>
</table>
<form action="/addressbook" name="addressform" method ="POST">
<table cellspacing=0 cellpadding=0>
<tr>
<td width=14 rowspan=4>
<td height=12>
<tr>
<td>
Type a name and electronic mail address to add to
your address book, then choose <B>Add</B>.
<tr>
<td height=12>
<tr>
<td valign=top height=174>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=80>Name
<td>
<INPUT type="text" bgcolor=#202020
cursor=#cc9933
text="E7CE4A"
font=proportional
id="nickname"
name="nickname"
value="$ADBnick"
size=25
maxlength=90
autoactivate
autoascii
nosubmit>
<tr>
<td height=10 colspan=2>
<tr>
<td>E-mail
<td>
<TEXTAREA bgcolor=#202020
cursor=#cc9933
text="E7CE4A"
font=proportional
nosoftbreaks nohardbreaks	name="address"
size=25
rows=1
value="$ADBAddy"
maxlength=1000
autoactivate
autoascii
nosubmit
growable></TEXTAREA>
</table>
</table>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=439 align=right>
<FONT COLOR="#E7CE4A"><SHADOW>
<INPUT TYPE=SUBMIT BORDERIMAGE="file://ROM/Borders/ButtonBorder2.bif" NAME=done value="Add"
USESTYLE WIDTH=103
NOARGS>
</SHADOW></FONT>
<td width=12>
</table>
<input type=hidden name="camefrom" value="">
<input type="hidden" name="action" value="add">
<input type="hidden" name="consider_showing_messenger" value="true">
<input type="hidden" name="selected" value="true">
</form>
</body>
</HTML>
ERIC
    ;



}else{
$MailADDYs="";
$stuff=getUserFile($userssid,"Preferences/addressbook.txt");
@tidly=split(/\x00/,$stuff);


$CXZL=0;
foreach $DDDC (@tidly) {
$CXZL++;

if($CXZL){
if(!($CXZL%2)){
$EmailZX=$DDDC;

$MailADDYs.=<<"ERIC"
<table text="#E6E6E6" bgcolor=#121921 cellspacing=0 cellpadding=0>
<tr>
<td bgcolor=#212F3A>
<img src="wtv-mail:/content/images/Addressbook/top-left.gif" width=8 height=8>
</td>
<td abswidth=320 bgcolor=#121921>
</td>
<td bgcolor=#121921>
</td>
<td bgcolor=#212F3A>
<img src="wtv-mail:/content/images/Addressbook/top-right.gif" width=8 height=8>
</td>
</tr>
<tr bgcolor=#121921>
<td>
</td>
<td>
<table>
<tr>
<td>
$EmailZX<br>
$UserNameZX
</td>
</tr>
<tr>
<td>
<a href=mailto:$EmailZX>&nbsp;&#128;&nbsp;Write e-mail</a>
</td>
</tr>
</table>
</td>
<td bgcolor=#121921>
<a href=wtv-mail:/addressbook?camefrom=&action=edit&nickname=$UserNameZX&address=$EmailZX>Change</a>
</td>
</tr>
<tr>
<td bgcolor=#212F3A>
<img src="wtv-mail:/content/images/Addressbook/bottom-left.gif" width=8 height=8>
</td>
<td bgcolor=#121921>
</td>
<td bgcolor=#121921>
</td>
<td bgcolor=#212F3A>
<img src="wtv-mail:/content/images/Addressbook/bottom-right.gif" width=8 height=8>
</td>
</tr>
</table>
<p>
ERIC
    ;


}else{
$UserNameZX=$DDDC;

}
}

}
$usermame=getUserName($userssid);
$sendstuffout=<<"ERIC"
<SAVEPANEL message ="The address book cannot be saved, because it is part of WebTV">
<SENDPANEL action="wtv-mail:/sendmail"
message="Write a new message"
label="Write">
<HTML>
<head>
<title>	Addresses for $usermame
</title>
</head>
<body bgcolor="#212F3A" text="#A3BCD4" link="#B3A147" vlink="#B3A147" fontsize="medium" vspace=0 hspace=0>
<sidebar width=109>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=104 height=420 bgcolor=#2A2E3B valign=top>
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
<table cellspacing=0 cellpadding=0 href="client:goback"
>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Done</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
<tr>
<td width=10 height=26>
<td width=89 valgn=middle>
<table cellspacing=0 cellpadding=0 href="/addressbook?action=edit&camefrom=&new_address=true&selected=new"
selected
>	<tr>
<td height=1>
<tr>
<td><shadow><font sizerange=medium color=#E6CD4A>Add</font></shadow>
</table>
<td width=5>
<tr>	<td bgcolor=#4A525A height=2 width=104 colspan=3>
</table>
<td width=5 bgcolor=#596874>
</table>
</sidebar>


<table cellspacing=0 cellpadding=0 border=0>
<tr>
<td width=451 colspan=2 align=center bgcolor=#596874>
<spacer type=vertical size=13>
</td>
</tr>
<tr>
<td height=8 bgcolor=#212F3A colspan=2>
<img src="wtv-mail:/content/images/CornerTop.gif" width=8 height=8>
</td>
</tr>

<tr>
<td bgcolor=#212F3A width=451 valign=top>

<table cellspacing=0 cellpadding=0 width=451>
<tr>
<td bgcolor=#212F3A width=13>
<spacer type=horizontal size=13>
</td>
<td height=60>
<img src="wtv-mail:/content/images/Addressbook.gif" width=300 height=45>
<td width=215 valign=middle>
</td>
<td width=15>
</td>
</tr>
</table>
<tr>
<td colspan=2>


<table cellspacing=0 cellpadding=0 bgcolor=#121921>
<tr>
<td width=451 absheight=25>


<table cellspacing=0 cellpadding=0>
<tr>
<td width=13 absheight=25>
<spacer type=horizontal size=13>
</td>

<td width=370 maxlines=1>
<font sizerange=medium color=#D6D6D6><blackface>	Addresses for $usermame
</blackface></font>
</td>



<td width=21>
<img src="wtv-mail:/content/images/widget.gif" width=16 height=16 noprint>
</td>

<td width=36>
<spacer type=vertical size=1><br>
<a href="wtv-guide:/help?topic=Addressbook&subtopic=Index" ><img src="wtv-mail:/content/images/mail_help_image.gif" width=35 height=17 noprint></a>
</td>

<td width=13>
<spacer type=horizontal size=13>
</td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
<p>


Choose <b>Add</b> to add a name and an electronic mail address to your
address book.
<p>





<!--Lets fix this thing that WNI made.  Didn't seam to work out for me.  WNI must have something in there special that changes every new address.-->



<center>
$MailADDYs
</center>
</body>
</HTML>
ERIC
    ;

}
print $clients "200 OK\n";
print $clients "Content-length: ".length($sendstuffout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $sendstuffout;
