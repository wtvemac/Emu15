 				WebTV Server Emulator


 THANKS NAPHEAD FOR YOUR PATIENCE AND HELPING ME USE YOUR BOX TO TRY TO FIND OUT HOW THE VIEWER TELLYSCRIPT 
PREREGISTER RETRIVAL IS DIFFERENT FROM THE BOX. THANKS!!!!

-=Introduction=-

This tool was designed to act like WNI servers.  I can't say that WNI servers do the same as this there mite 
be some extra bechind the seanse actions that the server takes.  What this server does although is as 
follows:

1. Connection is kept alive with the server (Same as WNI servers)
2. Clients can request multible pages within this connection (Same as WNI)
3. Server sends out special proprietary headers to the client (Same as WNI)
4.  Server can work as a HTTP file server.

Abstractions:

1. Server doesn't adhear to any login rules that WNI has.


-=Getting Started=-

The first thing you must do to run this server is download some Perl interpreter like "ActivPerl" located at 
http://www.activestate.com or "Indogoperl" located at http://www.Indogoperl.com.  This interpreter must have 
perl modules IO::Select (yourlibdir/IO/Select.pm) and IO::Socket (yourlibdir/IO/Socket.pm)

Once this step is acomplished you can now click on the icon or type the correct command to run the perl 
script (WebTV.pl).  After it has started it should pring a list of configuration settings that is currently 
true to this server, to change these settings will be discussed later.  After these settings there is two 
lines.

We now have jetison!

I got my ear on IP:PORT

This line just indicates that the server had a succsessful boot up and the IP and PORT that the box or viewer 
will connected to is this.

After you have all this open the viwewer or ask someone on a box to go to the connect setup 
(client:gotoconnectsetup, or file://rom/htmls/connectsetup.html), if your on network you probably wont need 
someone to test this for you on another box.  Once in connectsetup click on the custome redio box and enter 
the IP and PORT information in its repectable input feilds and press connect.

The software that the box has should clear the excisting tellyscript and call a 1800 number to get the new 
TellyScript.  The reson for this is so the box can connect again after you have connected to the 1800 (port 
1615) and the server has given it to you.  This also hapens with the viewer but ther viewer isn't dialing 
anything this is one of the problems, the viewer needs to get a webtv POP IP to connect to some 1800 services 
especialy the WebTV production server since it is protected from a firewall.

The viewer or box should request the url "wtv-1800:/preregister" if not then you got to manualy enter a 
wtv-1800 url.

After this the server should send the file contents of the webtvout.txt file.  What the file contents is not 
important at this time I have some contents already programed once you get the file.


The box or viewer should be brought to a file that has a "WebTV Server Emulator" as the title.


-=webtvout.txt file=-

The file is split up into two parts the headers and the body and is serparated by two returns.

Ex of headers:

200 OK
wtv-service: host=ddd port=333 name=wtv-ddd
Content-Length: 0
Content-Type: text/html; charset=windows-1252
%%%
Ex of body

<html>
<head>
<title>La</title>
</head>
</html>

The headers are used for control, such as service list elements, the body contents type, the body byte 
length, and the error codes.  The body of the file is just what you see such as the image, html document, 
ect.

#Header Messages#

The first part of the headers must be the error code.

The error codes are a thee digit code that tells the condition of the server<->client connection.  The first 
digit is used to state the topic of the conndition.

1=Continue
2=The connection was good or had a successful connection with the server
3=Moved file error
4=Client Error
5=Server Error

The next two digits are specific to its topic these are a list of all the HTTP condition/status codes.  These 
status codes are for the HTTP version 1.1 protocol.

100=The request can be continued 
101=The server has switched protocols in an upgrade header


200=Had a good or sucseful connection
201=A page has been created for you, normaly from a POST command.
202=Accepted to connect
203=Only partial information will be sent
204=The connection was ok and recived the request gread but ther server has nothing to send for that request. 
in other words there is nothing in the file compleatly blank.
205=The client should reset the request.


301=The page has moved
302=The page has moved but the server can find that page and send it to you
303=The page has moved but you got to try a different method to get it (GET POST ect are all methods of 
request)
304=Some clients give a "If-Modified-Since" message to the server and if this file has gone over the date 
given then it will send this saying it is to old for you.
305=The file must be accessed by a proxy server 
307 The redirected request keeps the same verb 


400=You had a bab request, in other words you sent some giberish that the server has no idea what you mean.
401=The server is not allowing you the request this page because you have no authorization to enter it.
402=This page requrers a money to enter.
403=This page is compleatly forbidden, authorization is compleatly useless.
404=The page requested was not found.
405=The method used is not allowed 
406=No responses acceptable to the client were found. 
407 Proxy authorization requred, like http://tarpon.daily.webtv.net/ can't be accessed w/o a spacific proxy. 
408=It took to long for you to make a request and now im going to disconnect you.
409=I couldn't processes your request because of a certen state that im/it is in. please try again. 
410=The file is not here and I have no clue where a redirection address is
411=The server doesn't want a request w/o a defined content length.
412=The request (normaly more than one) tested to be false from server process 
413=The requet is way to long
414=The URI is to long and im not going to processes this.
415=The regest method is not suported in this server 
449=The request should be retried after this (the server will say).


500=The server has a error that is blocking it from giving you this page.
501=The server can't do what you asked it to do for it is not supported
502=The server while acting as a gateway or proxy itself, recived a funny respnce frome the peer or upstream 
server.
503=The server is overloaded.
504=The request timed out while it was wating for a gateway.
505=The HTTP version is not suported from this server.

The webtv browser software acts in different wasy towards these status codes.

1=Alerts a text string that follows the status code and doesn't do anything with the body.
2=Continues to read data and does the normal operation
3=Looks for a "Location" header, if it doesn't find it it will popup "There is no web page or other 
information availiable"
4=Alerts a text string that follows the status code and doesn't do anything with the body.
5=Alerts a text string that follows the status code and doesn't do anything with the body.

2,3=Special operation everything else has a alert...


The next requred header is the Content-Length header.  Since the box is in contstant connection with the 
server it doesn't know when to stop the load wave on the status bar to do this it continues the wave untill 
the full body is done or is equvilent to the content-length specification.  If you don't have a body but 0 as 
the length.

The next header is the content-type.  This will tell the box how to handle the body.  Like to parse it to a 
image or a HTML document.


The mext header is Last-Modified, this is the date in the doucment.lastModified and the info panel.


Others:

wtv-irc-nick, Specifies the IRC nick after this you are allowed to chat.
wtv-home-url, Specifies the home url after you have visited this page you can use the panels
wtv-service, Specifies a service to add to the service list

The service list "acts like" a DNS server it holds a list of IPs and ports and what "protocol" they are 
assigned to.

host=the IP the box will connect
name=The name of the service (ex wtv-setup)
port=the port of the service
flags=How we are going to connect
connections=Where you will connect to this server.


wtv-service: name=wtv-setup host=209.240.194.41 port=1613

wtv-challenge, this seams like a check for tellyscript.  This is the thing that knocks you into a scriptless 
state in Flash, Demo ect.  If your tellyscript does't match the encrypted code specified then you need to go 
get a new one?  There is probably a responce code in the tellyscript that the server validatedes to see if 
you can access the login screen ot not.  The challenge responce code is cached in the 
cache:wtv-challenge-responce page.


wtv-ticket, This is a verry important header it is used to access the server or just break through the walls 
if you want have access to your account then you would need a user-id.  After the server sends this code at 
login it is cached in cache:wtv-ticket.


wtv-service-cookie, We havn't yet figured out this one yet but I think it has to do something with NGs.  This 
is cached in cache:wtv-service-cookie.


user-id, this contains a eccoded user id that is used to access a specific account on there servers.

This file, webtvout.txt is read every request so you don't need to shut down the server to reload it.  If a 
person choses using %url will be subsituted with the url that the user requested.

-=Settings=-
These are the settings that the server reads every time a person connects to the server, not every request.  
It is also read from the ineractive "config" command.

There is a file Config.ini that contains a list of variables, these varables can be modified and // can be 
used as comments.


<clientsconnectsionmax>, this is used to specify how may clients you want on your server at one time.

<listenport>, this is the port the server will be listening on.

<mode>, this is th emode the server is in

1=Server emulator
2=Proxy or box emulator
3=Ineractive server

<a>, this is the proxy servers peer server IP.  It will connect to this and send the headers to.

<b>, This is the proxy servers server port.

<pip>=This is a viewer specified IP:Port if this is 1 then you ca connect to any service.
Please type in to use this command, the wtv-1800 may vary depending on what service the server is on your 
service list.

wtv-1800:/ip?ip=209.240.194.41:1601

<svr>, when you start a proxy server and use the viewer or box on it there is some headers that the clients 
send out this is used to include these headers or not.  1=yes, 0=no

<sfr>, There is a file (servout.txt) that containes predifined headers that will be sent out to the server.  
if you want to send these out to the server 1=yes if not 0=no.


<sfres>, append the webtvout.txt to the top of the responce of the peer server.  1=yes, 0=no


<logws>, This will log the proxy retrivals into a file located in the /file/ directory.  1=yes, 0=no


<alwics>, if you are in modes 1 or 2 and want also the ineractive commands to work put 1 else 0.



<usch>, if this is 1 it will rip off the peer server headers and replace it with the onces in webtvout.txt.


<timestamp, This is a timestamp with will be used in the DOS console window.  1=yes, 0=no


<rtrg>, This is used to use the old method of reading a socket.  This is used to allow telnet to connect and 
enter commands properly.  1=yes, 0=no


<SecurityLevel>, This sets the servers security level.

#Level 0: 
No restrictions

#Level 1:

1. Block server source show.  wtv-1800:/preregister.txt will not work.

#Level 2:

1. Block server source show.  wtv-1800:/preregister.txt will not work.
2. Don't allow user to change other users settings.

#Level 3:

1. Block server source show.  wtv-1800:/preregister.txt will not work.
2. Block inerative commands: cls, sys, exit and die. 
3. Don't allow non-local users to execute perl.
4. Don't allow user to change other users settings.

#Level 4:

1. Block server source show.  wtv-1800:/preregister.txt will not work.
2. Block inerative commands: cls, sys, exit and die. 
3. Don't allow non-local users to open a socket.
4. Don't allow non-local users to execute perl.
5. Don't allow non-local users to search files or directories.
6. Don't allow user to change other users settings.

#Level 5:

1. Block server source show.  wtv-1800:/preregister.txt will not work.
2. Block inerative commands: cls, sys, exit and die. 
3. Blocks server only for local use.

-=servout.txt=-

This is the messages that will be sent out the peer server of the proxy.  This is different than webtvout.txt 
since the server needs some specialized headers that are different than the ones that the box uses.

GET, used to request a url with qurey string in the URL.

POST, used to request a url with posted qurey string.

wtv-show-time-record, Shows the time rates for each refferer page.

wtv-incarnation, Show how many peer servers or reties this client has connected to.

Accept-Language, the langueage prefered by the client for the server to use.

wtv-open-access, If the browser uses a ISP outside of the WebTV ones.

wtv-client-serial-number, the clients SSID

wtv-encryption, To use page encryption or not.

wtv-system-version, The version of software that is currently being used.

wtv-client-rom-type, The clients ROM type. 

wtv-client-bootrom-version, The BootROM or backup ROM version.

wtv-system-chipversion, The clients Chip Version.

wtv-system-sysconfig, The clients system config.

wtv-system-cpuspeed, The clients CPU speed.

wtv-script-id, The tellyscrpt id, 0 if no tellyscript present.

wtv-script-mod, The tellyscrpt modification code, 0 if no tellyscript present. 

-=Other Functions=-

#Chat#

I made this so webtv users on a box can use the ineractive commands.  You would just connent to the server 
just like you would for a IRC server.  You may send headers to the clients connected via whisper.

#Connected user header input#

If the server is on mode 1 the client can specify the headers it want to send out it.

wtv-1800:/sendtome?LaLa=HEADERS...

#Proxy Peer Server#

A client can pick what server the proxy can connect to via this url...

wtv-1800:/ip?ip=IP:PORT



-=Bug Workaraounds=-

There a few problems that you may encounter, there are fixes and they are listed below.

The first problem I must address is chat.  What happends to WebTV users is that when they send in messages 
the last one gets cut off or the message get buffered all crapy.  The reson for this is the nature of how the 
<SOCKHANDLE> works i have a rtgd config variable in the Config.ini file that will fix this problem, please 
set it to zero if this happens.  The problem for setting it to zero is telnet.  Telnet sends all entries and 
the sysread() will buffer all the new messages and doesn't wait till there is a carrage return to return the 
value to the variable so on telnet set this to one if your using telnet on this server.

This isn't really a bug but im going to address as one anyway.  When a box connects sending commands to the 
box via chat isn't really reliable for your not fast enough to send the messages on-time.  In fact the 
ineractive server really has not a whole lot of use.  If you want to send headers out the the box I would 
suggest to use the webtvout.txt file you can update this file and it will load envery conection so you don't 
need to shut down the server when you want to update the file.

If a client goes into another room with out parting the first than there would be a problem since I only set 
this for a client to be in one room at one time.  If a client repeativly parts and joins a room than this 
will happen also.  Please tell people to stay in one room and if the client has problems and repeativly 
enteres the same room then we can't do anything.  I tried my best to solv this problem but so far it doens't 
make much sense why this happens.

-=Chat=-

Chat is used mainly so webtv users can use the ineractive commands via IRC client and control a client 
connection.

To connect you would use a IRC client and put in the host and port as you would in telnet and connect.  You 
should see a introduction message that just tells you your IP and what you shouln't do ect.  Following that 
is a title message that tells you that you are joining this room blah and you can't use any regular IRC 
commands, the /topic command only applies if your using the telnet.html file.  If your not usins file please 
type "/topic command" or "/topic help".  This should give you a list of ineractive commands which I will 
discuss in anohter segment of this file.

Once you join the room you should see a list of clients connected with InfoServ.  The clients connected 
should be a IP or Nick depending if the client is on a IRC clint or not.  If the client is on a IRC and is in 
another room from you then the name should begin with % (WebTV users mite not see this but computers should) 
other than that the name should be regular.

When another client connects wile your in a room you should first see a IP:PORT join the room, this is the IP 
and PORT to the socket of the client connected.  If this client is on a IRC client and it sends the NICK 
command then the nick will change to the nick that the client picked.

If the client sends any headers that this server doesn't understand then the headers would be in the DOS 
console window and in the the room you are in.  If you want to send messages back to this client then you 
would have to whisper this client via wisper panel or /msg panel.

InfoServ is not even done yet its used to give you information on the chat.  Whisper InfoServ and say "help" 
to get a list of commands.


-=Ineractive Server=-

This is used to instantly ineract with a client or a client to control you remotly.

Each of these commands are listed below please note that the sys command could be dangerous because someobe 
has access to your HDD.  I mite remove this. For now its in.

help, This command is used to list all the commands available for this program.

send [mesg], This is used to send a message to all clients connected to this server (Except you).  Please 
subsitute the [mesg] with what you want to send out.

stats, This shows all the clients connected to this server with there IPs.

quit, This is used to disconnect you formaly from this server you can disconnect w/o this command but you 
will be removed from a ghost protection check.

long, This is like send but allows you to send multible lines of messages to this server.  What this does is 
all commands will be directly sent to the client when you want to end this session you would type "endlong"

eval [perl], This executes a perl line and shows you the return value. ex 'perl	print "Hello!!!!!";'

config [variable] [value], This will change a variable in the Config.ini file.

cls, This clears the DOS console window.


sys [command], This executes a DOS command.  If you want this removed please ask me else you may be able to 
do it yourself.

die, What this does it exit the program formaly.


exit, This kills the program all togather.

-=ComputeFCS=-

This is the Fletcher Checksum.  What I belive is used to for the password to log on to a WNI POP server.  
This may help to log the viewer into a TD, Production or any other server from the wtv-1800 server.

When you start this program you must enter someones SSID after that you enter a hex code (Such as EEEE or AF 
Hex is a 16 number, number system 0-F).  What this hex code is mayby the Hex RAM address that the SSID 
resides.  Im not going to explain RAM addresses I am on my site but this is WAY to long of a topic and Im a 
lazy asshole and don't feel like to type a 5 page on it.  After this you should get the password and username 
the should be the one used for the PPP server.  Connect and try but I doubt it will work.


-=Extention Macro Script=-

This is used for you to extend the program w/o having to drowd yourself with the main program.  This macro 
(enlarged, oposite of micro) script is much like the mIRC script.  This script is simple as long as you know 
perl your all set.  The script must be set up as follows:

On PERMIALBILITY:TARGERCOMMAND:CONDITION:{

[Perl Code]

}

Or

On PERMIALBILITY:TARGERCOMMAND:CONDITION:[Perl Code]


*PERMIALBILITY*

This part defines what clients should trigger the script to be executed or not.

R=Remote Machine (peer computer such as a client that is remote (at a distance from) from your computer.)
L=Local Macine; Basicly you conecting to your server.
IP=A specific IP. 209.240.194.*, 209.240.194.41, 209.240.*.* ect..
*=All clients.


*TARGERCOMMAND*

This is the command that the client would sent to the server.  There are 4 commands that the server sends to 
itself when a event accurs.  These commands are "open", "close", "connect", and "disconnect".

open=This is sent when the server opens.
close=This is sent when a 'die' or 'exit' command is sent to the server and the server closes.
connect=This is sent when the server sees a client that has connected.
disconnect=This is sent when a client disconnects from the server.

*CONDITION*

This is perl code that will return true or false.  This can be On *:open:($mode == 2):print "Hey!\n"; This 
script is triggred if the program opens and the mode is 2.


*[Perl Code]*

This is the code that will be executed.  There are some pre-set variables that you mite want to consider when 
making a script.

$trueheaders=This is the header that the client sends with the leading \r (carrage return)
$headers=This is the header that a client sends with out the leading \r
$command=This is the command that the client sends (COMMAND PARAMS1 PARAMS2)
$params=This the the parameters to the command that is sent (COMMAND PARAMS1 PARAMS2)
$protocol=This is the protocol of a GET or POST command (protocol:/url#hastlocation?qurey)
$url=This is everything past the protocol (protocol:/url#hastlocation?qurey)
$url2=This is the "url" requested with the hash location. (protocol:/url#hastlocation?qurey)
$url3=This is the the "url" requested with out the hash location. (protocol:/url#hastlocation?qurey)
$hashlocation=This is the hash location of the url (protocol:/url#hastlocation?qurey)
$paramt=This is the qurey sting of the url (protocol:/url#hastlocation?qurey)

$sockhost=This is the socket host or your IP.
$sockport=This is the socket port or the port that the server is listening on.
$clientport=This is the clients port that is sending the message
$clienthost=This is the clients IP that is sending the message
$iptoddd=This is the clients IP, Port that has connected to this server
$listenport=This is the socket port that was defined in the Config.ini file, this is used when the program 
first opens.
$mode=This is the mode that the server is in.

$hours=This is the current time in hours.
$minutes=This is the current time in minutes.

$var=proccessChange($varz)   This the command that returns the output string which changes all the keyword 
substrings into its equivilent.  Please visit the webtvout.txt help section to view a list of substring 
keywords.

$var=getTicket($ip)
This tries to retriev the ticket from a head waiter service.  If it succeded then it will return the ticket. 

$var=doYouAgree($string,$keywordstring)
This is the wildcard command ex doYouAgree("Hey man sup","Hey*")  this will return true.

setvariable($var,$value)
This sets the value in the Config.ini file ex setvariable("a","209.240.194.46")


 There are many more but these are the ones that server relivance to a script.  To find out the otheres 
either ask me about them or look in the perl script.


-=Mode 4 (WNI server HTTP file handler)=-

This is used to almost compleatly emulate the WNI server.  You can almost create a service of your own.  The 
only thing this server doesn't do is give a tellyscript and handle flash ROM downloads since these files are 
binary and at that we can't figure out how it is assembled.

To have this server mode to work you must have the script file "DummyPerlTarget.txt" it contains the program 
that allows you to have this server to work properly.






-=Appendicies=-
  
@Apendix A@

Headers I didn't talk about that I don't know what they are or don't feel like speding 4 days writing about.

wtv-messenger-login-url
wtv-messenger-server
wtv-messenger-connect-timeout
wtv-messenger-retry-interval
wtv-messenger-passportd-timeout
wtv-messenger-open-conversation-timeout
wtv-messenger-invite-timeout
wtv-messenger-enable
wtv-messenger-address-validate-timeout
FL
AL
BL
RL
FL
AL
BL
RL
wtv-expire
wtv-expire-all
wtv-reload
wtv-reload-all
wtv-lockpage-override
wtv-backgroundmusic-add
wtv-backgroundmusic-remove
wtv-backgroundmusic-clear
wtv-backgroundmusic-load-playlist
wtv-fader-timeout
wtv-goto-url
wtv-input-timeout
wtv-show-time-enabled
wtv-user-inactive-warning-time
wtv-logo-duration
wtv-logo-interval
wtv-logo-input-interval
wtv-demo-mode
wtv-log-url
wtv-ssl-log-url
wtv-mail-count
wtv-name-server
wtv-preregistration-number
wtv-explore-url
wtv-favorite-index-url
wtv-favorite-url
wtv-search-url
wtv-mail-url
wtv-boot-message-led-state
on
blinkSlow
blinkFast
off
wtv-user-name
wtv-domain
wtv-human-name
wtv-irc-nick
wtv-language-header
wtv-tv-antenna
true
wtv-tv-cable
true
wtv-tv-dbs
true
wtv-tv-zipcode
wtv-tv-vbidisable
true
wtv-enable-jellyscript
true
wtv-settings-url
wtv-default-client-useragent
wtv-default-client-scriptprops
wtv-client-serial-number
true
wtv-encryption
wtv-capability-flags
wtv-capability-flags
wtv-system-version
wtv-script-id
wtv-script-mod
wtv-client-date
wtv-client-time-zone
wtv-client-time-dst-rule
wtv-videoad-playid
wtv-videoad-playname
wtv-videoad-path
wtv-spot-url
wtv-spot-clickthru-url
wtv-spot-directive
targeted-spot
wtv-spot-purge-queue
wtv-spot-impression-time
wtv-spot-minimum-time
wtv-spot-duty-cycle
wtv-spot-queue-add
wtv-clickthru-redirect
wtv-spot-doze
wtv-link-transition-enabled
wtv-transition
heavy
light
noads
wtv-transition-override
off
noads
normal
always
wtv-force-lightweight-targets
wtv-force-heavyweight-targets
wtv-noads-targets
queue
adID
creative
queue
time
request-videoad-playid
wtv-boot-url
wtv-census-udp
wtv-saved-session-id
wtv-saved-charged-time
wtv-saved-free-time
content-encoding
ahuf
binary
compress
deflate
gzip
gzipped
lzpf
zlib
date
location
server
WWW-Authenticate
Authorization
Basic
realm
WWW-Authenticate:BasicRealm="/"
wtv-location
wtv-favorites-folders-url
wtv-checksum
wtv-datadownload-checktimeoffset
Last-modified:%s
Content-length:%d
wtv-checksum:%s
wtv-expire-all
wtv-addresses-url
group:%s
ok
invalid
state:%s
version:%ld
last-checkup-time:%s
state:missing
name/
group:%s
state:missing
wtv-messagewatch-url
wtv-messagewatch-checktimeoffset
wtv-datadownload-url
wtv-datadownload-login-url
wtv-datadownload-checktimeoffset
wtv-rename-url
wtv-challenge
wtv-connection-timeout
wtv-tvconnection-timeout
wtv-itvconnection-timeout
wtv-login-timeout
wtv-execute-tellyscript-now
wtv-open-isp-disabled
wtv-home-url
wtv-ssl-timeout
wtv-notifications-port
wtv-notifications-url
wtv-post-home-url
wtv-phone-log-url
wtv-nvstorage-dump
wtv-tcp-log-url
wtv-reconnect-url
wtv-next-reconnect-url
wtv-relogin-url
wtv-service-cookie
wtv-ticket
wtv-visit
wtv-moviesearch-url
user-id
user-kidsafe-level
wtv-metered-pricing
wtv-metered-pricing-interval
wtv-metered-pricing-sessionID
wtv-metered-pricing-track-as-free
wtv-initial-key
wtv-ticket
wtv-open-access
wtv-connect-session-id
wtv-challenge-response
wtv-bypass-proxy
wtv-allow-dsc

wtv-service
reset
connections=
flags=
host=
name=
port=


wtv-service-message
wtv-service-timeout
wtv-check-url
wtv-client-useragent
wtv-client-scriptprops
wtv-check-url-applies-to
wtv-check-url
wtv-location
wtv-explanation-url
wtv-field-name
wtv-encrypted
wtv-ahuf
wtv-lzpf
wtv-trusted
User-Agent
Authorization
wtv-show-time
no-cache
pragma
primary
prefetch
user
messagewatch
download
wtv-request-type
safehtml
wtv-filter
true
wtv-itv-land
wtv-incarnation
wtv-client-address
Accept-Language
wtv-show-time-record
GET
POST
Accept-Language
wtv-incarnation:

 