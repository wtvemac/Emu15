use Cwd;
print "Specify '~' for current directory Ex (~/la.txt)\n";
print "Please enter the file name you want to matiplate: C:\\";
chop($filename=<STDIN>);
if($filename=~/\~/){
$cwd=cwd;
$filename=~s/\~/$cwd/;
}else{

$filename="C:\\".$filename;
}

$filename=~s/\\/\//g;

print "Operation:";
print "\n\n Binary Chop=1\n Smart Replace=2\n AlphaNum list sorter (splits by /n)=3\n Get WebTV FR Part Info=4\n Clean up packet dump=5\n Clean Up WebTVIntel.exe File=6 \n\n Enter: ";
chop($operation=<STDIN>);

if($operation == 1){
open(FILE,"< $filename");
$filesize=-s FILE;
#$Time=secToTime(($filesize)*(2));
print "\n Opening $filename which is ".$filesize." in size.  This may take ".$Time." Seconds before this is compleat (Estimation of 2 secs per char).\n";
binmode(FILE);
sysread(FILE,$data,$filesize,0);
close(FILE);
print "Now going to parse file\n";

$endResult=binaryChop($data);

open(FILE,"> BinaryChopResult.txt");
print FILE $endResult;
close(FILE);


}elsif($operation == 2){


print "Now going to parse file....\n";




if(open(FILE,"SmartReplaceProc.wtv")){
@Procs=<FILE>;
close(FILE);



foreach  (@Procs) {
chop;
$ProcX=substr($_,0,index($_,"="));
$ProcXVal=substr($_,index($_,"=")+1);

if($ProcX eq "FileTarget"){
if(substr($ProcXVal,0,1) eq "\""){
$data_X=substr($ProcXVal,1,rindex("\"",$ProcXVal));
}else{
open(FILE,$ProcXVal);
sysread(FILE,$data_X,-s FILE,0);
close(FILE);
}
}

if($ProcX eq "OutPutFileTarget"){
$OutPutFileTarget=$ProcXVal;
}

if($ProcX eq "FileSplitExp"){
$FileSplitExp=$ProcXVal;
}


if($ProcX eq "SearchKeyWord"){
$SearchKeyWord=$ProcXVal;
}


if($ProcX eq "SearchLimit"){
$SearchLimit=$ProcXVal;
}


if($ProcX eq "SearchLimitFull"){
$SearchLimitFull=$ProcXVal;
}


if($ProcX eq "AllowReplaceWhen"){
$AllowReplaceWhen=$ProcXVal;
}

if($ProcX eq "IncludeSplitExp"){
$IncludeSplitExp=$ProcXVal;
}



if($ProcX eq "SearchReplace"){
$SearchReplace=$ProcXVal;
}
}

if($data_X){
if(!($OutPutFileTarget)){
$OutPutFileTarget="SmartReplace.txt";
}




if(!($FileSplitExp)){
push(@AsocArry,"$data_X");
}else{
@AsocArry=split(/$FileSplitExp/,$data_X);

}
if(!($SearchLimit)){
$SearchLimit="g";
}
if(!($SearchLimitFull)){
$SearchLimitFull="g";
}

$OffsetZ=0;
foreach $FFF (@AsocArry) {
$OffsetZ++;


splice(@Press);
if($SearchKeyWord eq "*"){
push(@Press,$FFF);
}elsif(substr($SearchKeyWord,0,1) eq "{"){
$temphgstr="";
$splitnum=substr($SearchKeyWord,1,rindex($SearchKeyWord,"}"));
$countgd=0;

$lenofme=length($FFF)+1;

while($lenofme){
$lenofme--;

if(!((length($temphgstr))%$splitnum) && (length($temphgstr))){

push(@Press,$temphgstr);
$temphgstr="";
$temphgstr.=substr($FFF,$countgd,1);

}else{

$temphgstr.=substr($FFF,$countgd,1);
}


$countgd++;
}

if($temphgstr){
push(@Press,$temphgstr);
}


}else{
@Press=split(/$SearchKeyWord/,$FFF);
}


$Offset=0;
foreach $VVV (@Press) {
$Offset++;


if($SearchLimitFull eq "g"){
$DefineCon="1 == 1";
}elsif($SearchLimitFull eq "l"){
$DefineCon="$OffsetZ == $#Press";
}elsif($SearchLimitFull eq "f"){
$DefineCon="$OffsetZ == 1";
}elsif(substr($SearchLimitFull,0,1) eq "["){
$DefineCon="($OffsetZ%".substr($SearchLimitFull,2,rindex($SearchLimitFull,"]")-2).")";
}elsif(substr($SearchLimitFull,0,2) eq "!["){
$DefineCon="!($OffsetZ%".substr($SearchLimitFull,2,rindex($SearchLimitFull,"]")-2).")";

}else{
($From,$To)=split(/\-/,$SearchLimitFull);
if(!($To)){
$To=$#AsocArry;
}
$To++;
$From--;
$DefineCon="($OffsetZ > $From && $OffsetZ < $To)";
}


if($SearchLimit eq "g"){
$DefineCon1="1 == 1 && $DefineCon";
}elsif($SearchLimit eq "l"){
$DefineCon1="$Offset == $#Press && $DefineCon";
}elsif($SearchLimit eq "f"){
$DefineCon1="$Offset == 1 && $DefineCon";
}elsif(substr($SearchLimitFull,0,1) eq "["){
$DefineCon1="($Offset%".substr($SearchLimitFull,2,length($SearchLimitFull)-1).")";
}elsif(substr($SearchLimitFull,0,2) eq "!["){
$DefineCon1="!($Offset%".substr($SearchLimitFull,2,length($SearchLimitFull)-1).")";

}else{
($From,$To)=split(/\-/,$SearchLimit);
if(!($To)){
$To=$#Press;
}
$To++;
$From--;
$DefineCon1="($Offset > $From && $Offset < $To) && $DefineCon";
}


if(checkAccept($VVV,$AllowReplaceWhen) && eval($DefineCon) && eval($DefineCon1)){

@CXZD=split(/\"/,$SearchReplace);
$Offsetx=0;

foreach $FVC (@CXZD) {
$RSVMe=0;
$replica=$Offsetx;
$replica--;
$Offsetx++;

if(substr($CXZD[$replica],length($CXZD[$replica])-1) eq "\\"){
$ReplaceString=substr($ReplaceString,0,length($ReplaceString)-1);
$Reserveved.="\"$FVC";
$RSVMe=1;
}

if(!($RSVMe)){
if($Reserveved){
$FVC="$Reserveved\"$FVC";
$Reserveved="";
}
if(substr($FVC,0,1) eq "+"){
$FVC=substr($FVC,1);
}


if(substr($FVC,length($FVC)-1) eq "+"){
$FVC=substr($FVC,0,length($FVC)-1);
}


if($FVC eq "SearchString"){
$ReplaceString.=$VVV;
}elsif($FVC eq "SearchString++"){
$ReplaceString.=$Press[$Offset];

}elsif(substr($FVC,0,13) eq "SearchString("){
$CoolX=substr($FVC,13);
$replica=substr($CoolX,0,rindex($CoolX,")"));
$ReplaceString.=join($replica,@Press);

}elsif(substr($FVC,0,14) eq "SearchStringF("){
$CoolX=substr($FVC,14);
$replica=substr($CoolX,0,rindex($CoolX,")"));
$ReplaceString.=join($replica,@AsocArry);


}elsif(substr($FVC,0,13) eq "SearchString["){
$CoolX=substr($FVC,13);
$replica=substr($CoolX,0,rindex($CoolX,"]"));
$ReplaceString.=$Press[$replica];


}elsif(substr($FVC,0,14) eq "SearchStringF["){
$CoolX=substr($FVC,14);
$replica=substr($CoolX,0,rindex($CoolX,"]"));
$ReplaceString.=$AsocArry[$replica];


}elsif($FVC eq "SearchString--"){
$replica=$Offset;
$replica-(2);
$ReplaceString.=$Press[$replica];
}elsif($FVC eq "SearchStringF++"){
$replica=$OffsetZ;
$ReplaceString.=$AsocArry[$replica];
}elsif($FVC eq "SearchStringF--"){
$replica=$OffsetZ;
$replica-(2);
$ReplaceString.=$AsocArry[$replica];
}elsif($FVC eq "(SearchString)"){
$ReplaceString.=$Offset;
}elsif($FVC eq "^SearchString^"){
$ReplaceString.=$#Press
}elsif($FVC eq "(SearchStringF)"){
$ReplaceString.=$OffsetZ;
}elsif($FVC eq "^SearchStringF^"){
$ReplaceString.=$#AsocArry
}else{

$ReplaceString.=$FVC;
}


}else{
$ReplaceString.=$VVV;
}

}
}

if($IncludeSplitExp eq "y"){
$FileSplitExp=~s/\\n/\n/g;
$ReplaceString.=$FileSplitExp;
}
}
}

open(FILE,"> $OutPutFileTarget");
print FILE $ReplaceString;
close(FILE);
}else{
print "No data to preform replace!\n";
}



}else{
print "Couldn't open proceadure file.\n";
}




sub checkAccept {
$VVV=$_[0];
$AllowReplaceWhen=$_[1];
if($AllowReplaceWhen eq "*"){
return 1;
}else{
if(substr($AllowReplaceWhen,0,6) eq "substr"){


chop($arguments=substr($AllowReplaceWhen,6));

$count=0;
$charlen=length($arguments);
$initiatematch=0;
while($charlen){
$count++;
$charlen--;
$curchar=substr($arguments,$count,1);
$buffer.=$curchar;

if($buffer eq "match"){
$initiatematch=1;
$buffer="";
}elsif($curchar eq ","){
chop($buffer);
if($initiatematch){
if(substr($buffer,0,1) eq "("){
$buffer=substr($buffer,1);
}
push(@arg_m,$buffer);
}else{
push(@arg_x,$buffer);
}
$buffer="";
}elsif($curchar eq ")" && ($initiatematch)){
$initiatematch=0;
chop($buffer);
push(@arg_m,$buffer);

$val_ZX=index($string,eval($arg_m[0]),$arg_m[1]);

push(@arg_x,$val_ZX);
splice(@arg_m);

$buffer="";

}




}

push(@arg_x,$buffer);
$count=0;
foreach  (@arg_x) {
if(!($_)){
splice(@arg_x,$count,1);
}
$count++;
}



if(substr($string,$arg_x[0],$arg_x[1])eq eval($arg_x[2])){
return 1;
}else{
return 0;
}

}elsif(substr($AllowReplaceWhen,0,1) eq "C"){
chop($arguments=substr($AllowReplaceWhen,2));
$eval=eval($arguments);
return $VVV=~/$eval/;

}elsif(substr($AllowReplaceWhen,0,1) eq "L"){
chop($arguments=substr($AllowReplaceWhen,2));
@Args=split(/\,/,$arguments);
$temp=$VVV;
$temp=~s/\"/\\\"/g;
$EvalStr="(length(\"$temp\") $Args[1] $Args[0])";
return eval($EvalStr);
}
}



}
}elsif($operation == 3){
open(FILE,"< $filename");
$filesize=-s FILE;
#$Time=secToTime(($filesize)*(2));
binmode(FILE);
sysread(FILE,$data,$filesize,0);
close(FILE);
@SortmeBaby=split(/\n/,$data);
chop(@SortmeBaby);
@SortmeBaby=sort(@SortmeBaby);
foreach  (@SortmeBaby) {
open(FILE,"> SortedList.txt");
print FILE $_;
close(FILE);

}

}elsif($operation == 6){
open(FILE,"< $filename");
$filesize=-s FILE;
#$Time=secToTime(($filesize)*(2));
binmode(FILE);
sysread(FILE,$data,$filesize,0);
close(FILE);

print "Preform binary chop (y/n)? ";
chop($BinChop=<STDIN>);



print "Now going to group file\n";
$RN=0;
open(FILE,"> BinaryGrouping.txt");
close(FILE);

foreach  (split(/\x00\x00\x80\x34\x00\x00\x80/,$data)) {
$RN++;
if($RN == 3){

$_=~s/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/\n\n--------------------------------------------\n\n/g;
$_=~s/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/\n\n--------------------------------------------\n\n/g;
$_=~s/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/\n\n--------------------------------------------\n\n/g;
$_=~s/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/\n\n--------------------------------------------\n\n/g;
$_=~s/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/\n\n--------------------------------------------\n\n/g;
$_=~s/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/\n\n--------------------------------------------\n\n/g;
$_=~s/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/\n\n--------------------------------------------\n\n/g;
$_=~s/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/\n\n--------------------------------------------\n\n/g;
$_=~s/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/\n\n--------------------------------------------\n\n/g;
$_=~s/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/\n\n--------------------------------------------\n\n/g;
$_=~s/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00/\n\n--------------------------------------------\n\n/g;
$_=~s/\x00 x 9/\n\n\n/g;
$_=~s/\x00 x 8/\n\n\n/g;
$_=~s/\x00 x 7/\n\n\n/g;
$_=~s/\x00 x 6/\n\n\n/g;
$_=~s/\x00 x 5/\n\n/g;
$_=~s/\x00 x 4/\n\n/g;
$_=~s/\x00 x 3/\n/g;
$_=~s/\x00 x 2/\n/g;
$_=~s/\x00/\n/g;

if($BinChop eq "y"){
$_=$_=binaryChop($_,1);
}
open(FILE,"> WintelGroup.txt");
print FILE $_;
close(FILE);

}

}

}




print "Press Enter                                                            \n";
for(;;){}












sub binaryChop {

$data=$_[0];
$NoNULLTerm=$_[1];

$BluePrint=0;
$GoForx=0;
$endResult="";
foreach  (split(/|/,$data)) {
print "On Char $BluePrint                 \r";
$rich=ord();
if(($rich > 31) && ($rich < 127) || $rich == 10){
$endResult.=$_;
}elsif($rich == 0){
if(($NoNULLTerm)){
$endResult.=$_;

}else{
if(!($Plata)){
$Plata=1;
}else{
$endResult.="\n\n";
$Plata=0;
}
}
}
$BluePrint++;
}
return $endResult;
} 

