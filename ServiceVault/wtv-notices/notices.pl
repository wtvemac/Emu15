print $clients "200 $userssid has no new messages\n";
print $clients "Content-length: 0\n"
print $clients "Content-type: x-wtv/notices\n\n";