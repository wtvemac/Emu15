print $clients "300 Moved\n";
print $clients "Connection: Keep-alive\n";
#Go ahead im not doing a thing to block the sendoff!
print $clients "Location: wtv-mail:/sendmail?message_to=$url2&$qurey\n\n";