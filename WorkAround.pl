#!/usr/bin/perl

#+##############################################+#
##############################
# This is a old file that 	 #
# was used to start WebTV.pl #
# then WebTV.exe			 #
##############################

#For thoes people that don't want a heavy script loaded into RAM use this.
#Boy what a transition from this to WebTV.exe.

#+##############################################+#



#This is closely related to winsock.h abd sys/socket.h so im going to use this so I can translate it to C++ faster.

#use IO::File;
use Socket;
$whos=0;

($name) = gethostbyname('');

####################EDITING##########################
#This is what your  (your computer in this case) will send to the client connected.
$outfromserv="400 WebTeeeeeVeeee!

";
$listenport=1618;
######################################################

##############################################################
#                     SHORT  PRIMER                          #
##############################################################
#Once a person is connected the box automaticly connects to a#
#head-waiter service and requests the wtv-head-waiter:/login #
#page, the /login page can't be sent correctly w/o a SSID and# 
#the box build.  If the head-waiter service has got enough 	 #
#data to continue the service sends a wtv-challenge as well  #
#as headers to tell the box either to go to the "need a   	 #
#upgrade" page or to the /login-stage-two page.  If it was	 #
#/login-stage-two the box takes the wtv-challenge and 		 #
#"responds"	to it by wtv-challenge-responce the service 												 #
#checks the responce, and if it is correct it will send the 
# source to the page which contains the links to the 
# users in the account or there is on the main user on the 
# account it will go strait to the splash screen.  Once the user
# clicks on a user the box then requests either a password page 
# or goes directly to the splash page.  While at the splash page
## the server send hundreds of headers which will be used during
# the user is


##############################################################
#   DO NOT EDIT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING	 #
##############################################################


print "Server running...........\n";
print "Now go to connect setup (client:gotoconnect)\n";
print "Check custom radio button\n"; 
print "put this in first (ip) field ::-> $name -> or your IP resolve $name to get it\n";
print "Put this in the second field ::-> $listenport\n";
print "Type wtv-1800:/fuck in the location bar and press enter\n";
print "Count to 3 and type client:showservices in the location bar and press enter there should be a service list shown that has more that wtv-1800\n";
print "Goto wtv-head-waiter:/login to get the ticket, after that you can go to any other service.\n\n";
print "Edit this file, WorkAround.pl, to change headers sent out.\n\n";





#It is important to put checks...




#Return Protocol TCP to a number
$proto=getprotobyname('tcp');





#Open a socket and define "Server" with file descripter


if($error){
print "There were conflicts when we where trying to run this program.\n";
#Runs a DOS command (or UNIX)
#system("Pause");
#now only if I can terminate this once a user clicks close in the console window.
}

socket(Server, PF_INET, SOCK_STREAM, $proto);
setsockopt(Server, SOL_SOCKET, SO_REUSEADDR, pack("l", 3));
bind(Server, sockaddr_in($listenport,INADDR_ANY));
listen(Server, 3);



#accept incoming connections
while(accept(CLIENT,Server)){
$d=<CLIENT>;
print $d;
print CLIENT $outfromserv; 
}
###########################################

