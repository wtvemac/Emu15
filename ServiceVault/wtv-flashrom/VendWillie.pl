$thingssentout=<<"ERIC"
<html>
<head>
<title>Vender [Willy Coke]</title>

<script>
function Putin(a,b){
alert(b);
if(a == 1){
document.a.IP.value=b;
}else{
document.a.Path.value=b;
}

}
</script>
</head>

<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>
<br>
<h1>Flashrom Setup</h1>
<p>
This page is used to setup a FlashROM service and begin to dowload a build.  Please enter the IP, port, path, and whether this is a client:updateflash or redirect.<p>
<form name=a>
<table>

<tr><td>
<b>IP</b>: </td><td><table><tr><td> <input name=IP bgcolor=#191919 text=#66dd99 nohighlight border=0 maxlength=15 size=15></td><td>
<select onChange="Putin(1,this.value)">
<option value="WebTV Services 5.5 209.240.294.416">WebTV Services 5.5 209.240.294.416
<option value="WebTV Services 5.5 209.240.294.416">WebTV Services 5.5 209.240.294.416
</select>
</td></tr></table></td>
</td></tr>
<tr><td>
<b>Port</b>: </td><td><input name=Port bgcolor=#191919 text=#66dd99 value="1618" nohighlight border=0 maxlength=6 size=6>
</td></tr>
<tr><td>
<b>Path</b>: </td><td><table><tr><td> <input name=Path bgcolor=#191919 text=#66dd99 nohighlight border=0 maxlength=15 size=15></td><td>
<select onChange="Putin(2,this.value)" value="gfddfggfsd">
<option value="WebTV Services 5.5 209.240.294.416">WebTV Services 5.5 209.240.294.416
<option value="WebTV Services 5.5 209.240.294.416">WebTV Services 5.5 209.240.294.416
</select>
</td></tr></table></td>
</td></tr>
</table>

<table><tr><td>UpdateFlash:</td><td> <input name="operation" value="UpdateFlash" type="radio"></td><td> Redirect:</td><td><input name="operation" value="redirect" type="radio"></td></tr></table></td>
</table>
<input type=submit value="Kick it">
ERIC
    ;


print $clients "200 OK\r\n";
print $clients "Content-Length: ".length($thingssentout)."\r\n";
print $clients "Content-Type: text/html\r\n\r\n";
print $clients $thingssentout;