print $clients "300 OK.\n";
print $clients "Expires: Wed, 09 Oct 1991 22:00:00 GMT\n";
print $clients "Connection: Keep-Alive\n";
print $clients "wtv-log-url: wtv-log:/log\n";
print $clients "wtv-expire-all: wtv-head-waiter\n";
print $clients "wtv-expire-all: wtv-flahsrom\n";
print $clients "Location: wtv-head-waiter:/login-stage-two?$qurey\n\n";
