#Prime Number Search!
#If i or you succesful then COOL!  For thoes of you downloading this from my site please try to find the way primary numbers are sequenced!  
&Init;
sub Init {
$primenumcountX=0;
splice(@countset);
$perfectnumbercountX=0;
splice(@countPriN);
splice(@countPN);



print "\n";
print "Enter Number to Factor (x-y): ";
chop($primecount=<STDIN>);


if($primecount > 999999){
print "This number is a large number it mite take some time are you sure you want to wait (Y/n)? ";
chop($dedid=<STDIN>);
if($dedid eq "n"){
&Init;
}else{
&Facotr;

}
}else{
&Facotr;
}
}


sub Facotr {
($S,$E)=split(/\-/,$primecount);
if(!($E)){
$E=$S;
$hasend=0;
}

for($i=(($S)+1); $i < $E; $i++){
$primecount=$i;


$count=1;
$nope=0;
splice(@facots);
while($count<(($primecount)-1)){
$count++;

if(!($primecount%$count)){
$nope=1;
push(@facots,$count);
}

}

open(FILE,">> Primes.html");
print FILE "<tr>";

if(!($nope)){
print FILE "<td>$primecount</td><td><font color=\"blue\">prime number</font></td><td>({$primecount,1})</td>";
$primenumcountX++;
push(@countPriN,$primecount);

}else{
print FILE "<td>$primecount</td><td>Composite</td>";
print FILE "<td>";

print FILE "{";
$coubt=0;
$perfect_number=0;
unshift(@facots,1);
foreach (@facots){
if($#facots == $coubt){
print FILE "$_";
$perfect_number+=$_;
}else{
$perfect_number+=$_;
print FILE "$_,";
}
$coubt++;
}
print FILE "}";
print FILE "</td>";

print FILE "<td>$#facots => ".($#facots/$primecount)." => ".($primecount/$#facots)." => ".($primecount+$#facots)." => ".($primecount-$#facots)."</td>";
push(@countset,$#facots);

if($perfect_number == $primecount){
print FILE "<td> = <font color=\"green\">$perfect_number (Perfect Number => ".($perfect_number/$primecount)." => ".($primecount/$perfect_number)." => ".($primecount+$perfect_number)." => ".($primecount-$perfect_number).")</font></td>";
$perfectnumbercountX++;
push(@countPN,$perfect_number);

}


}
}
print "-Done-\n";
print FILE "</tr></table><p>";
close(FILE);


$mean=$E-$S;
$extream=0;
foreach (@countset){
$extream+=$_;
}
$avrg=($extream/$mean);



open(FILE,"< Primes.html");
sysread(FILE,$avidreader,-s FILE,0);
close(FILE);
$PRIs="<p><h4>Primary Numbers (Percent From Whole: ".(($#countPriN/$mean)*100).")</h4><p>";
$lastPri=0;
foreach (@countPriN){
$PRIs.="$_ (Length From Last: ".($_-$lastPri).")<br>";
$lastPri=$_;
}


$PRIs.="<p><h4>Perfect Numbers (Percent From Whole: ".(($#countPN/$mean)*100).")</h4><p>";
$lastPN=0;
foreach (@countPN){
$PRIs.="$_ (Length From Last: ".($_-$lastPN).")<br>";
$lastPN=$_;

}


$avidreaderd=<<"ERIC"
<center>
<h1>Interesting Prime Number Reasearch</h1>
</center><p>
Whopdididia lala..
<p>
<body bgcolor="#000066" text="#F0F0F0">
Total Numbers Scaned: $mean<br>
Number of Primes: $primenumcountX<br>
Number of Perfect Numbers: $perfectnumbercountX<br>
Average Set Length:	$avrg<br>
<p>
Notes: (b/a) => (a/b) => (a+b) => (a-b)<br>
a: \$primecount<br>
b: \$perfect_number<br>
b: \$#facots<br>
<p>
$PRIs
<p>
<table bgcolor="#000033" bordercolor="#000044" align="left" border="2"
bordercolorlight="#000055" bordercolordark="#000022" height="235"><tr><th>#</th><th>Property</th><th>Factors</th><th>Set Count</th><th>Perfect Number</th></tr>


ERIC
    ;
open(FILE,"> Primes.html");

print FILE "$avidreaderd$avidreader";
close(FILE)
&Init;
}
