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

if(!($bgclr)){
$bgclr="\"#191919\"";
}

if(!($fgclr)){
$fgclr="\"#82A9D9\"";
}

$sigHTML=substr($sigHTML,0,$YadaX)."<body bgcolor=$bgclr text=$fgclr>".substr($sigHTML,(($YadaX+$YadaY)+1))."\n";

print $clients "200 OK\n";
print $clients "Content-Length: ".length($sigHTML)."\n";
print $clients "wtv-expire-all: wtv-mail\n";
print $clients "Content-Type: text/html\n\n";
print $clients $sigHTML;