

$tosendout=<<"ERIC"
<display nosave nosend>
<title>News Group Setup</title>
<sidebar width=20%>
<img src="wtv-tricks:/images/Favorites_bg.jpg">
</sidebar>
<body bgcolor="#191919" text="#44cc55" link="36d5ff" vlink="36d5ff" vspace=0>

<br>
<br>
<h1>News Group Setup</h1>
<br>
Please choose one of our fine links to our marvelous pages.	<p>
<a href=wtv-news:/propose-delete-post>Delete Posts</a><br>
<a href=wtv-news:/propose-drug-post>Modify Posts</a><br>
<a href=wtv-news:/propose-delete-group>Delete groups</a><br>
<a href=wtv-news:/propose-update-groups>Update group listings</a><br>
ERIC
    ;

print $clients "200 OK.\n";
print $clients "Content-length: ".length($tosendout)."\n";
print $clients "Content-type: text/html\n\n";
print $clients $tosendout;

