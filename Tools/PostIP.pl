#!/usr/bin/perl

#PostIP

use CGI qw(param);

$IP=param('IP');
$PORT=param('PORT');
print "Content-type: text/html\n\n";

open(FILE,"> Nap.txt");
print FILE "$IP:$PORT\n";
close(FILE);

