#This script tells the dummy target script where to go when opening a file.
$closewhendone=0;
$skratchheaders=0;

if(substr($params,0,1) eq "/"){
$params=substr($params,1,index($params," "));
if($TrueFileServer){
$params=":/".$params;
}

$closewhendone=1;
$skratchheaders="HTTP/1.1 ";
}


if(substr($params,0,7) eq "http://"){
$params=substr($params,(7)+index(substr($params,(7)),"/")+1);
if($TrueFileServer){
$params=":/".$params;
}

$closewhendone=1;
$skratchheaders="HTTP/1.1 ";
}