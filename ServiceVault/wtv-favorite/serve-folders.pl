$OddHTML="";
$EvenHTML="";

splice(@FavData);
$tosendout="";
$stuff=getUserFile($userssid,"Favorites/FavData.txt");
foreach  (@tidly){
chop;
if($_){
$CXZ=substr($_,0,index($_," "));

if($CXZ ne "FolderCount:"){
push(@FavData,$_);
}

}
}

@FavData=sort(@FavData);

$Halfit=(($#FavData)+1)/2;
$OddCount=(index($Halfit,".5") > 0) ? $Halfit+(.5) : $Halfit;

$EvenCount=(($#FavData)+1)-$OddCount;
$countXZ=0;
$EvenCountX=0;
$OddCountX=0;
$Contenma=0;
foreach  (@FavData){
$countXZ++;
$foldname=$FavData[$countXZ-1];
if(!($countXZ%2)){
$EvenCountX++;

if($EvenCountX == 1){


$EvenHTML.=<<"ERIC"
<tr><td width=225 height=42 align=center valign=middle background="ROMCache/RightTop.gif">
<table width=50% cellspacing=0 cellpadding=0>
<tr><td width=5 height=20>
<td align=center height=20 width=140 maxlines=1>
<a href="wtv-favorite:/serve-browser?favorite-folder-name=$foldname" selected>
<font size=-1>
<limittext value="$foldname" width=140></a>
</font>
<td width=20>
</table>
ERIC
    ;

}elsif($EvenCountX == $EvenCount){


$EvenHTML.=<<"ERIC"
<tr><td width=225 height=42 align=center valign=middle background="ROMCache/RightMiddle.gif">
<table width=50% cellspacing=0 cellpadding=0>
<tr><td width=5 height=20>
<td align=center height=20 width=140 maxlines=1>
<a href="wtv-favorite:/serve-browser?favorite-folder-name=$foldname" >
<font size=-1>
<limittext value="$foldname" width=140></a>
</font>
<td width=20>
</table>
ERIC
    ;
if(!($Contenma)){
$EvenHTML.=<<"ERIC"
<tr><td width=225 height=42 align=center valign=middle background="ROMCache/RightBottom.gif">
<table width=50% cellspacing=0 cellpadding=0>
<tr><td width=5 height=20>
<td align=center height=20 width=140 maxlines=1>
<a href="wtv-favorite:/serve-browser?favorite-folder-name=$foldname" >
<font size=-1>
<limittext value="" width=140></a>
</font>
<td width=20>
</table>
ERIC
    ;

$Contenma=1;
}
}else{

$EvenHTML.=<<"ERIC"
<tr><td width=225 height=42 align=center valign=middle background="ROMCache/RightMiddle.gif">
<table width=50% cellspacing=0 cellpadding=0>
<tr><td width=5 height=20>
<td align=center height=20 width=140 maxlines=1>
<a href="wtv-favorite:/serve-browser?favorite-folder-name=$foldname" >
<font size=-1>
<limittext value="$foldname" width=140></a>
</font>
<td width=20>
</table>
ERIC
    ;

}

}else{

$OddCountX++;

if($OddCountX == 1){

$OddHTML.=<<"ERIC"
<tr><td width=225 height=42 align=center valign=middle background="ROMCache/LeftTop.gif">
<table width=50% cellspacing=0 cellpadding=0>
<tr><td width=40 height=20>
<td align=center height=20 width=140 maxlines=1>
<a href="wtv-favorite:/serve-browser?favorite-folder-name=$foldname" >
<font size=-1>
<limittext value="$foldname" width=140></a>
</font>
<td width=20>
</table>
ERIC
    ;


}elsif($OddCountX == $OddCount){

$OddHTML.=<<"ERIC"
<tr><td width=225 height=42 align=center valign=middle background="ROMCache/LeftMiddle.gif">
<table width=50% cellspacing=0 cellpadding=0>
<tr><td width=40 height=20>
<td align=center height=20 width=140 maxlines=1>
<a href="wtv-favorite:/serve-browser?favorite-folder-name=$foldname" >
<font size=-1>
<limittext value="$foldname" width=140></a>
</font>
<td width=20>
</table>
ERIC
    ;
if(!($Contenma)){

$OddHTML.=<<"ERIC"
<tr><td width=225 height=33 align=center valign=middle background="ROMCache/LeftBottom.gif">
<table width=50% cellspacing=0 cellpadding=0>
<tr><td width=40 height=20>
<td align=center height=20 width=140 maxlines=1>
<a href="wtv-favorite:/serve-browser?favorite-folder-name=$foldname" >
<font size=-1>
<limittext value="" width=140></a>
</font>
<td width=20>
</table>
ERIC
    ;
$Contenma=1;
}

}else{

$OddHTML.=<<"ERIC"
<tr><td width=225 height=42 align=center valign=middle background="ROMCache/LeftMiddle.gif">
<table width=50% cellspacing=0 cellpadding=0>
<tr><td width=40 height=20>
<td align=center height=20 width=140 maxlines=1>
<a href="wtv-favorite:/serve-browser?favorite-folder-name=$foldname" >
<font size=-1>
<limittext value="$foldname" width=140></a>
</font>
<td width=20>
</table>
ERIC
    ;

}

}

}


$tosendout=<<"ERIC"
<HTML>
<HEAD>
<TITLE>
Favorite folders
</TITLE>
<DISPLAY
>
</HEAD>
<body bgcolor="#26171A" text="#D2D2D3" link="#FFE99B" vlink="#FFE99B" fontsize="medium" vspace=0 hspace=0>
<sidebar width=109 height=384>
<tr><td absheight=384>
<table cellspacing=0 cellpadding=0 bgcolor=#3C343D>
<tr><td valign=top absheight=196>
<table cellspacing=0 cellpadding=0 absheight=196>
<tr>
<td valign=top width=100% height=50%>
<table cellspacing=0 cellpadding=0>
<tr>
<td height=1>
<tr>
<td width=6>
<td width=100% align=center absheight=79>
<table href="wtv-home:/home" width=100% absheight=79 cellspacing=0 cellpadding=0>
<tr>
<td width=100% align=center>
<img src="wtv-home:/ROMCache/WebTVLogoJewel.gif" width=87 height=67>
</table>
<td width=5>
<tr><td colspan=3 width=100% absheight=2 bgcolor=#6C676B>
<img src="wtv-home:/ROMCache/Spacer.gif" width=104 height=1>
<tr><td width=93 colspan=3>


<table cellspacing=0 cellpadding=0>
<tr><td width=5 absheight=26>
<td width=93>
<table width=100% cellspacing=0 cellpadding=0 href="wtv-favorite:/serve-add-folder-page">
<tr><td>
<table cellspacing=0 cellpadding=0>
<tr><td><shadow><font color=E7CE4A>
&nbsp;Add&nbsp;folder
</table>
</table>



<td width=5>
<tr><td colspan=3 width=104 absheight=2 bgcolor=#6C676B>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
<tr><td width=93 colspan=3>
<table cellspacing=0 cellpadding=0>
<tr><td abswidth=5 absheight=26>
<td width=93>
<table width=100% cellspacing=0 cellpadding=0 href="wtv-favorite:/serve-discard-folders">
<tr><td>
<table cellspacing=0 cellpadding=0>
<tr><td><shadow><font color=E7CE4A>
&nbsp;Remove
</table>
</table>
<td abswidth=5>
<tr><td colspan=3 width=104 absheight=2 bgcolor=#6C676B>
<img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
<tr><td width=93 colspan=3>
</table>
</table>
<td abswidth=5 bgcolor=#726267>
<tr><td valign=top absheight=188>
<table cellspacing=0 cellpadding=0 absheight=188>
<tr><td width=100%><img src="wtv-home:/ROMCache/Spacer.gif" width=100% height=1>
<td align=right valign=bottom>
</table>
<td abswidth=5 bgcolor=#726267>
</table>
</sidebar>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=451 colspan=2 align=center bgcolor=#726267>
<spacer type=vertical size=13>
<tr>
<td height=8 bgcolor=#544447 colspan=2>
<img src="wtv-favorite:/images/CornerTop.gif" width=8 height=8>
<tr>
<td bgcolor=#544447 width=13>
<spacer type=horizontal size=13>
<td bgcolor=#544447 width=438 valign=top>
<table cellspacing=0 cellpadding=0 width=438 border=0 transparency=50>
<tr>
<td height=60>
<img src="wtv-favorite:/images/Favorites.gif" width=202 height=46>
<img src=wtv-home:/ROMCache/TreasureChest1.gif width=75 height=42 transparency=50%>
<td width=128 valign=middle>
</table>
<tr>
<td colspan=2>
<table cellspacing=0 cellpadding=0 bgcolor=#3C343D>
<tr>
<td width=451 absheight=25>
<table cellspacing=0 cellpadding=0>
<tr>
<td width=13 absheight=25>
<spacer type=horizontal size=13>
<td width=370 maxlines=1>
<font sizerange=medium color=#D6D6D6><blackface>	Favorite folders
for AccountDisabled
</blackface></font>
<td width=21>
<img src="wtv-favorite:/images/help-arrow.gif" width=16 height=16>
<td width=34>
<spacer type=vertical size=1><br>
<a href="wtv-guide:/help?topic=Favorites&subtopic=Index&appName=Favorites"><font sizerange=small color=#E6CD4A><b>Help</b></font></a>
<td width=13>
<spacer type=horizontal size=13>
</table>
</table>
<tr>
<td colspan=2 height=4 bgcolor=#544447>
</table>
</table>




<table cellspacing=0 cellpadding=0>
<tr><td align=left valign=top>
<table cellspacing=0 cellpadding=0 width=225>

$OddHTML


</table>
<td valign=top align=left>
<table cellspacing=0 cellpadding=0 width=225>
<tr><td bgcolor=#544447 absheight=21>&nbsp;

$EvenHTML


</table>
</table>
<table cellspacing=0 cellpadding=0>
<tr><td width=451 height=2 background="ROMCache/FoldersCoverBorder.gif"><img src="wtv-home:/ROMCache/Spacer.gif" width=1 height=1>
</table>
</BODY>
</HTML>
ERIC
    ;


print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;