$MiddleHTML="";
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
splice(@PathArray);
splice(@NGListingsx);
splice(@valueArray);
splice(@stuffinside);
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

if($namem eq "group"){

$ngname=$valuem;
}
if($namem eq "category"){
$NGCategory=$valuem;
}

if($namem eq "chunk"){
$chunk=$valuem;
}
if($namem eq "hasRead"){
$donotgoth=1;


($VCX,$RTY)=split(/\-/,$valuem);
$username=getUserName($userssid);
getUserFile($userssid,"Preferences/visitedNGPosts.txt");
open(FILE,"> $RealDir/UserDataBase/Users/$username/Preferences/visitedNGPosts.txt");
foreach  (@tidly) {
chop;
if($_){
($NGX,$ARTICLEZ,$HITZC)=split(/\:/,$_);
if(($RTY eq $NGX) && ($ARTICLEZ == $VCX)){
$HITZC++;
print FILE "$NGX:$ARTICLEZ:$HITZC\n";
$FDXSC=1;
}else{
print FILE "$NGX:$ARTICLEZ:$HITZC\n";
$FDXS=1;
}
}
}

if(!($FDXSC)){
print FILE "$RTY:$VCX:1\n";
$HITZC=1;
}
close(FILE);
}

if($namem eq "article"){
$articlex=$valuem;
}


}
if(!($donotgoth)){
if(!($chunk)){
$chunk=1;
}





if($NGCategory){

$MiddleHTML="";
if(open(FILE,"$RealDir/NewsGroups/NGList.txt")){
@stuffinside=<FILE>;

foreach $nglisting (@stuffinside){
chop($nglisting);
($ngname,$ngartpop)=split(/\:/,$nglisting);



$MiddleHTML.=<<"ERIC"
<p>
<table cellspacing=0 cellpadding=0 href="wtv-news:/news?group=$ngname" id="id5328" selected>
<tr>
<td abswidth=426 maxlines=1>
$ngname
<tr><td nocolor>
<font size="-1" color=544f53><b>
Article Population: $ngartpop
</font></b>
</table>
ERIC
    ;
}
close(FILE);
}



$stuffsentout=<<"ERIC"
<HTML>
<HEAD>
<script language=javascript>
if (top.frames.length > 1)
top.location="news:alt.discuss.webtv.hacking";
</script>
<TITLE>NG List</TITLE>
</HEAD>
<sidebar width=114 height=420 align=left>
<table cellspacing=0 cellpadding=0 bgcolor=3d2f3a>
<tr>
<td colspan=3 width=104 absheight=4>
<td rowspan=100 width=10 height=420 valign=top align=left bgcolor=191919>
<img src="wtv-mail:/ROMCache/Shadow.gif" width=6 height=420>
<tr>
<td abswidth=6>
<td abswidth=93 absheight=76>
<table href="wtv-home:/home" absheight=76 cellspacing=0 cellpadding=0>
<tr>
<td align=right>
<img src="wtv-home:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td abswidth=6 >
<td abswidth=93 absheight=26 >
<table href="wtv-news:/lobby"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">Lobby</font></shadow></table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td abswidth=6 >
<td abswidth=93 absheight=26 >
<table href="wtv-guide:/help?topic=Discuss&subtopic=Index&appName=Discuss"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">Help</font></shadow></table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 height=237 valign=bottom align=right >
<img src="wtv-forum:/images/BannerDiscuss.gif" width=50 height=165>	<tr><td colspan=3 absheight=36>
</table>
</sidebar>
<body
bgcolor="191919" text="42BD52" link="1bb0f1"
vlink="826f7e"
hspace=0
vspace=0
logo="wtv-forum:/images/news_logo.gif">


<table cellspacing=0 cellpadding=0>
<tr>
<td rowspan=100 width=10 height=384 valign=top align=left>
<td height=16 width=416 valign=top align=left>
<td rowspan=100 width=20 height=384 valign=top align=left>
<tr>
<td height=31 valign=top>
<font size="+1" color="E7CE4A">
<blackface>
<shadow>
News Group Listings
</shadow>
</blackface>
</font>
</table>
<TABLE width=446 cellspacing=0 cellpadding=0>
<tr>
<td rowspan=4 width=10 height=1>
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=1>
<td height=2 width=436 bgcolor="2B2B2B">
<img src="wtv-home:/ROMCache/Spacer.gif" width=436 height=1>
<tr>
<td height=1>
<tr>
<td height=2 bgco2lor="0D0D0D">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td height=6>
</TABLE>
<table cellspacing=0 cellpadding=0>
<tr>
<td abswidth=10>
<td abswidth=426 height=42 valign=bottom>
$MiddleHTML
ERIC
    ;


print $clients "200 OK\n";
print $clients "Content-length: ".length($stuffsentout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $stuffsentout;


}else{

if(open(FILE,"< $RealDir/NewsGroups/$ngname/NGData.txt")){
@stuffinside=<FILE>;
close(FILE);
}

$VCT=0;
foreach $HEY (@stuffinside) {


($MessageID,$xd,$x,$x,$x,$x,$AlDiD)=split(/\x00/,$HEY);
if(!($AlDiD)){
push(@NGListingsx,$HEY);
splice(@stuffinside,$VCT,1,("$_\x001"));
$VCTC=0;

foreach $REPLYs (@stuffinside) {


($MessageID,$ReplyIDx,$x,$x,$x,$x,$AlDiD)=split(/\x00/,$REPLYs);
($x,$ReplyIDx)=split(/\x00/,$REPLYs);
if($ReplyIDx){
if($ReplyIDx eq $MessageID){
splice(@stuffinside,$VCTC,1,("$_\x001"));
push(@NGListingsx,$REPLYs);
}
}
$VCTC++;
}
}
$VCT++;
}



if($articlex){

$MessageID="";
$ThredID="";
if(open(FILE,"< $RealDir/NewsGroups/$ngname/$articlex.txt")){
@stuffinside=<FILE>;
close(FILE);


foreach $grime (@stuffinside){
$WHoleBargon.=$grime;
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


if($dataDesc eq "Organization:"){
$NGOrganization=$data_x;
}
if($dataDesc eq "NNTP-Posting-Host:"){
$NGPostingHost=$data_x;

}

if($dataDesc eq "Mime-Version:"){
$NGMimeVersion=$data_x;
}


if($dataDesc eq "Path:"){
@PathArray=split(/\!/,$data_x);
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
if(length($grime) == 0){
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
$XmessageOffset=length($WHoleBargon);
$WHoleBargon="";
}elsif($dontshowsig){
$XmessageLength=length($WHoleBargon);
}
}

if(substr($grime,0,5) eq "begin"){
$dontshowsig=1;

$STFIY.="[Encryted Attachment, EricSrv Will not Show Attachments]<p>This attachment is a file of [size] [/:filename] <br>".substr($grime,5)."<p>";
}


if(($ThisIsWebTV) && (substr($grime,0,12) ne "--WebTV-Mail") && !($dontshowsig)){
$ThisIsWebTV=1;

if($grime eq "<p>"){
$okedoke=1;
}
if($okedoke){
$STFIY.=$grime
}
}elsif((substr($grime,0,12) ne "--WebTV-Mail") && !($dontshowsig)){
$STFIY.=$grime;

}


if(substr($grime,0,3) eq "end"){
$dontshowsig=0;
$STFIY.="[/Encryted Attachment, EricSrv Will not Show Attachments]<P>";
}

}
}

if(!($BodyContent)){
$BodyContent="bgcolor=191919 text=42DB52";
}

$VCX=0;
foreach (@NGListingsx){
$VCX++;

($x,$x,$ATRX)=split(/\x00/,$_);
if($articlex eq $ATRX){

$XXX=$NGListingsx[$VCX];
($x,$x,$NGNext)=split(/\x00/,$XXX);

}
}




$VCX=(-1);
foreach (@NGListingsx){
($x,$x,$ATRX)=split(/\x00/,$_);
if($articlex eq $ATRX){
$XXX=$NGListingsx[$VCX];
($x,$x,$NGPrev)=split(/\x00/,$XXX);
}
$VCX++;
}




if($NGPrev){
$NGPrevData=<<"ERIC"
<tr>
<td abswidth=6 >
<td abswidth=93 absheight=26 >
<table id="prev"
href="wtv-news:/news?group=$ngname&article=$NGPrev#prev"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">Previous</font></shadow></table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=31262f>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left >
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=433440>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
ERIC
    ;
}

if($NGNext){
$NGNextData=<<"ERIC"
<tr>
<td abswidth=6 >
<td abswidth=93 absheight=26 >
<table selected href="wtv-news:/news?group=$ngname&article=$NGNext"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">Next</font></shadow></table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=31262f>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left >
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=433440>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
ERIC
    ;
}


if(@PathArray){
$PathString="";

foreach $PATHHOST (@PathArray) {
$PathString.="<- $PATHHOST";
}
$PathString=~s/\&/%26/g;
$PathString=~s/\?/%26/g;
$PathString=~s/\=/%3D/g;

$MessageMid.=<<"ERIC"
<tr>
<td valign=top abswidth=65>
Path:
<td valign=top abswidth=335>
<a href=about:$PathString>Post Trace Route</a>
ERIC
    ;


}



if($NGMimeVersion){
$MessageMid.=<<"ERIC"
<tr>
<td valign=top abswidth=65>
Mime:
<td valign=top abswidth=335>
$NGMimeVersion
ERIC
    ;
}
if($NGPostingHost){
$MessageMid.=<<"ERIC"
<tr>
<td valign=top abswidth=65>
Host:
<td valign=top abswidth=335>
$NGPostingHost
ERIC
    ;
}

if($NGOrganization){
$MessageMid.=<<"ERIC"
<tr>
<td valign=top abswidth=65>
Part Of:
<td valign=top abswidth=335>
$NGOrganization
ERIC
    ;
}

$NGFromx=substr($NGFrom,0,index($NGFrom," "));
$NGFromxx=substr($NGFrom,index($NGFrom," ")+1);

$stuffsentout=<<"ERIC"


<HTML>
<HEAD>
<WTVNOSCRIPT>
<SENDPANEL action="wtv-news:/forward?article=$articlex&amp;group=$ngname"
message="Forward this posting to someone else."
label="Forward"
>
<TITLE>$NGSubject</TITLE>
</HEAD>
<FORM action="wtv-news:news" method="POST" name=readform>
<INPUT type=hidden name="hasRead" value="$articlex-$ngname" autosubmit="onenter">
</FORM>
<sidebar width=114 height=420 align=left>
<table cellspacing=0 cellpadding=0 bgcolor=3d2f3a>
<tr>
<td colspan=3 width=104 absheight=4>
<td rowspan=100 width=10 height=420 valign=top align=left bgcolor=191919>
<img src="wtv-mail:/ROMCache/Shadow.gif" width=6 height=420>
<tr>
<td abswidth=6>
<td abswidth=93 absheight=76>
<table href="wtv-home:/home" absheight=76 cellspacing=0 cellpadding=0>
<tr>
<td align=right>
<img src="wtv-home:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td abswidth=6 >
<td abswidth=93 absheight=26 >
<table href="wtv-news:/news?group=$ngname&chunk=$chunk#id$articlex"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">Group</font></shadow></table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
$NGPrevData
$NGNextData
<tr>
<td abswidth=6 >
<td abswidth=90 absheight=26 >
<table id="nextnew"
href="wtv-news:/mime?group=$ngname&article=$NGNextNew"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">Next New</font></shadow></table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>


<tr>
<td abswidth=6 >
<td abswidth=93 absheight=26 >
<table href="wtv-mail:/sendmail?mailto_to=$fromDatax&message_subject=$subjectData&message_id_news=$ngname$articlex"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">Mail to</font></shadow></table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=31262f>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left >
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=433440>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td abswidth=6 >
<td abswidth=93 absheight=26 >
<table href="wtv-mail:/sendmail?mailto_to=$fromDatax&message_subject=$subjectData&message_id_news=$ngname$articlex&discuss-prefix=wtv-news"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">Respond</font></shadow></table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>

<tr>
<td abswidth=6 >
<td abswidth=90 absheight=26 >
<table id="nextnew"
href="wtv-news:/mime?group=$ngname&article=$articlex&source=1"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">Sig HTML</font></shadow></table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 height=144 valign=bottom align=right>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr><td colspan=3 absheight=36>


</table>
</sidebar>
<body $BodyContent
link="189CD6" vlink="826f7e" vspace=0
hspace=0>
<display address="alt.discuss.webtv.hacking (5311)">
<table cellspacing=0 cellpadding=0 width=430>
<tr>
<td width=10 rowspan=99>
<td height=8>
<td>
<td width=20 rowspan=99>

<tr>
<td valign=top abswidth=65>
Group:
<td valign=top abswidth=335>
$ngname
<tr>
<td valign=top>
Date:
<td valign=top>
$NGDate
<tr>
<td valign=top>
From:
<td valign=top>
<a href='wtv-mail:/sendmail?mailto_to=$NGFromx&message_subject=$subjectData&message_id_news=$ngname$articlex'>$NGFromx</a>&nbsp;$NGFromxx
</td>
</tr>


$MessageMid
<tr>
<td valign=top>
Hits: $HITZC
<td valign=top>
<tr>
<td colspan=3 height=34>
<tr>
<td colspan=2 height=22 valign=top>
<font color="E6CD4A">
$NGSubject
</font>
<tr>
<td colspan=2 height=18>
</table>
<br>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=10>
<td width=416>
$STFIY
<p>
<p>
<embed src="wtv-news:/mime?group=$ngname&article=$articlex&message_part_offset=$XmessageOffset&message_part_length=$XmessageLength&wtv-title=signature">
<LINK href="wtv-news:/news?group=$ngname&article=5313" rel=next>
<LINK href="wtv-news:/news?group=$ngname&article=5313" rel=next>
<td width=20>
</table>
</BODY>
</HTML>



ERIC
    ;


}else{
$stuffsentout="NO! article!<p>NewsGroups/$ngname/$articlex.txt";
}


print $clients "200 OK\n";
print $clients "wtv-expire-all: wtv-news\n";
print $clients "Content-length: ".length($stuffsentout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $stuffsentout;

}else{
open(FILE,"< $RealDir/NewsGroups/$ngname/NGCount.txt");
@stuffinside=<FILE>;
close(FILE);

foreach $heys (@stuffinside) {
chop($heys);
if($heys){
$NGCount=$heys;
}
}

$curchunk=($chunk*100);

if(($NGCount <= $curchunk)){
$curchunk=$NGCount;
$firstchunk=(($chunk-1)*100);

}else{
$firstchunk=$curchunk-100;
}


if($chunk == 1){
$AXC=$curchunk;
$ADDEDChunk=$chunk;
$ADDEDChunk++;

$TOPBOtHTML=<<"ERIC"
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=6>
<td width=180 valign=bottom align=right>
<table cellspacing=0 cellpadding=0>
<tr>
<td rowspan=4 height=26 width=30>
<img src="wtv-forum:/images/ListPrevious_D.gif">
<td rowspan=4 height=26 width=11>
<img src="wtv-forum:/images/ListLeftEdge.gif">
<td height=2 valign=top align=left bgcolor="2b2b2b">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<td rowspan=4 height=26 width=11>
<img src="wtv-forum:/images/ListRightEdge.gif">
<td rowspan=4 height=26 width=30>
<a href="wtv-news:/news?group=$ngname&chunk=$ADDEDChunk">
<img src="wtv-forum:/images/ListNext.gif">
</a>
<td rowspan=4 width=5>
<tr>
<td height=2 valign=top align=left>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td height=20 valign=middle align=center>
$firstchunk-$curchunk
<tr>
<td height=2 valign=top align=left bgcolor="000000">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=5 height=3>
</table>	</table>

ERIC
    ;



}elsif($NGCount > $curchunk && !($NGCount <= $curchunk)){
$AXC=$curchunk;
$ADDEDChunk=$chunk;
$ADDEDChunk++;
$SEBEDChunk=$chunk;
$SEBEDChunk--;

$TOPBOtHTML=<<"ERIC"
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=6>
<td width=180 valign=bottom align=right>
<table cellspacing=0 cellpadding=0>
<tr>
<td rowspan=4 height=26 width=30>
<a href="wtv-news:/news?group=$ngname&chunk=$SEBEDChunk">
<img src="wtv-forum:/images/ListPrevious.gif">
</a>
<td rowspan=4 height=26 width=11>
<img src="wtv-forum:/images/ListLeftEdge.gif">
<td height=2 valign=top align=left bgcolor="2b2b2b">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<td rowspan=4 height=26 width=11>
<img src="wtv-forum:/images/ListRightEdge.gif">
<td rowspan=4 height=26 width=30>
<a href="wtv-news:/news?group=$ngname&chunk=$ADDEDChunk">
<img src="wtv-forum:/images/ListNext.gif">
</a>
<td rowspan=4 width=5>
<tr>
<td height=2 valign=top align=left>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td height=20 valign=middle align=center>
$firstchunk-$curchunk
<tr>
<td height=2 valign=top align=left bgcolor="000000">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=5 height=3>
</table>	</table>

ERIC
    ;

}elsif(($NGCount <= $curchunk)){
$AXC=$curchunk;
$SEBEDChunk=$chunk;
$SEBEDChunk--;

$TOPBOtHTML=<<"ERIC"
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=6>
<td width=180 valign=bottom align=right>
<table cellspacing=0 cellpadding=0>
<tr>
<td rowspan=4 height=26 width=30>
<a href="wtv-news:/news?group=$ngname&chunk=$SEBEDChunk">
<img src="wtv-forum:/images/ListPrevious.gif">
</a>
<td rowspan=4 height=26 width=11>
<img src="wtv-forum:/images/ListLeftEdge.gif">
<td height=2 valign=top align=left bgcolor="2b2b2b">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<td rowspan=4 height=26 width=11>
<img src="wtv-forum:/images/ListRightEdge.gif">
<td rowspan=4 height=26 width=30>
<img src="wtv-forum:/images/ListNext_D.gif">
<td rowspan=4 width=5>
<tr>
<td height=2 valign=top align=left>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td height=20 valign=middle align=center>
$firstchunk-$curchunk
<tr>
<td height=2 valign=top align=left bgcolor="000000">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=5 height=3>
</table>	</table>

ERIC
    ;

}else{
$AXC=$NGCount;
$TOPBOtHTML=<<"ERIC"
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=6>
<td width=180 valign=bottom align=right>
<table cellspacing=0 cellpadding=0>
<tr>
<td rowspan=4 height=26 width=30>
<img src="wtv-forum:/images/ListPrevious_D.gif">
<td rowspan=4 height=26 width=11>
<img src="wtv-forum:/images/ListLeftEdge.gif">
<td height=2 valign=top align=left bgcolor="2b2b2b">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<td rowspan=4 height=26 width=11>
<img src="wtv-forum:/images/ListRightEdge.gif">
<td rowspan=4 height=26 width=30>
<a href="wtv-news:/news?group=$ngname&chunk=2">
<img src="wtv-forum:/images/ListNext.gif">
</a>
<td rowspan=4 width=5>
<tr>
<td height=2 valign=top align=left>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td height=20 valign=middle align=center>
$firstchunk-$NGCount
<tr>
<td height=2 valign=top align=left bgcolor="000000">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=5 height=3>
</table>	</table>

ERIC
    ;

}


if(@NGListingsx){
for($i=$firstchunk; $i < $AXC; $i++){
$nglistings=$NGListingsx[$i];
chop($nglistings);

$nglistings=~s/\?\=//eg;
$nglistings=~s/\=\?ISO-8859-1\?Q//g;
$nglistings=~s/=([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;


($MessageID,$ReplyIDx,$NGarticle,$NGSubject,$NGFrom,$NGDate)=split(/\x00/,$nglistings);

if(!($ReplyIDx)){
$NGSubject="* $NGSubject";
}
getUserFile($userssid,"Preferences/visitedNGPosts.txt");
$Crayons="1bb0f1";

foreach  (@tidly) {
if($_){
($NGX,$ARTICLEZ)=split(/\:/,$_);

if(($NGX eq $ngname) && ($NGarticle == $ARTICLEZ)){
$Crayons="826f7e";
}

}

}


$MiddleHTML.=<<"ERIC"
<table cellspacing=0 cellpadding=0>
<tr>
<td abswidth=10>
<td abswidth=426 height=42 valign=bottom>
$PostHead
<table cellspacing=0 cellpadding=0 href="wtv-news:/news?group=$ngname&article=$NGarticle&chunk=$chunk" id="id$NGarticle" nocolor selected>
<tr>
<td abswidth=426 maxlines=1>
<font color=$Crayons>$NGSubject
<tr>
<td maxlines=1>
<font size="-1" color=544f53><b>
$NGFrom, $NGDate 
</b>
</table>
<td abswidth=10>
</table>
ERIC
    ;

}


$stuffsentout=<<"ERIC"
<HTML>
<HEAD>
<script language=javascript>
if (top.frames.length > 1)
top.location="news:$ngname";
</script>
<TITLE>NG List</TITLE>
</HEAD>
<sidebar width=114 height=420 align=left>
<table cellspacing=0 cellpadding=0 bgcolor=3d2f3a>
<tr>
<td colspan=3 width=104 absheight=4>
<td rowspan=100 width=10 height=420 valign=top align=left bgcolor=191919>
<img src="wtv-mail:/ROMCache/Shadow.gif" width=6 height=420>
<tr>
<td abswidth=6>
<td abswidth=93 absheight=76>
<table href="wtv-home:/home" absheight=76 cellspacing=0 cellpadding=0>
<tr>
<td align=right>
<img src="wtv-home:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td abswidth=6 >
<td abswidth=93 absheight=26 >
<table href="wtv-news:/lobby"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">Post</font></shadow></table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td abswidth=6 >
<td abswidth=93 absheight=26 >
<table href="wtv-guide:/help?topic=Discuss&subtopic=Index&appName=Discuss"
cellspacing=0 cellpadding=0>
<tr>
<td abswidth=5>
<td abswidth=90 valign=middle align=left>
<table bgcolor=3d2f3a cellspacing=0 cellpadding=0>
<tr>
<td absheight=1>
<tr>
<td maxlines=1>
<shadow><font sizerange=medium color="E7CE4A">Help</font></shadow></table>
</table>
<td abswidth=5>
<tr>
<td colspan=3 absheight=2 valign=middle align=center bgcolor=231d22>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=1 valign=top align=left <img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 absheight=2 valign=top align=left bgcolor=5b4b58>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td colspan=3 height=237 valign=bottom align=right >
<img src="wtv-forum:/images/BannerDiscuss.gif" width=50 height=165>	<tr><td colspan=3 absheight=36>
</table>
</sidebar>
<body
bgcolor="191919" text="42BD52" link="1bb0f1"
vlink="826f7e"
hspace=0
vspace=0
logo="wtv-forum:/images/news_logo.gif">

<table cellspacing=0 cellpadding=0>
<tr>
<td rowspan=100 width=10 height=384 valign=top align=left>
<td height=16 width=416 valign=top align=left>
<td rowspan=100 width=20 height=384 valign=top align=left>
<tr>
<td height=31 valign=top>
<font size="+1" color="E7CE4A">
<blackface>
<shadow>
Group: $ngname
</shadow>
</blackface>
</font>
</table>
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=6>
<td width=180 valign=bottom align=right>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=10 height=1 valign=top align=left>
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=1>
<td height=33 width=256 valign=bottom>
$NGCount postings
<br>
$TOPBOtHTML
<TABLE width=446 cellspacing=0 cellpadding=0>
<tr>
<td rowspan=4 width=10 height=1>
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=1>
<td height=2 width=436 bgcolor="2B2B2B">
<img src="wtv-home:/ROMCache/Spacer.gif" width=436 height=1>
<tr>
<td height=1>
<tr>
<td height=2 bgcolor="0D0D0D">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td height=6>
</TABLE>
$MiddleHTML
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=6><br>
<TABLE width=446 cellspacing=0 cellpadding=0>
<tr>
<td rowspan=4 width=10 height=1>
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=1>
<td height=2 width=436 bgcolor="2B2B2B">
<img src="wtv-home:/ROMCache/Spacer.gif" width=436 height=1>
<tr>
<td height=1>
<tr>
<td height=2 bgcolor="0D0D0D">
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
<tr>
<td height=6>
</TABLE>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=10 height=1 valign=top align=left>
<img src="wtv-home:/ROMCache/Spacer.gif" width=10 height=1>
<td height=33 width=256 valign=bottom>

$TOPBOtHTML
</BODY>
</HTML>
ERIC
    ;

print $clients "200 OK\n";
print $clients "Content-length: ".length($stuffsentout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $stuffsentout;


}else{

print $clients "400 News group $ngname does not exsist.\n\n";
}
}
}
}
