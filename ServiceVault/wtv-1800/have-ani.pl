
if(getUserName($userssid,1) ne "AccountDisabled"){
print $clients "300 Moved.\n";
print $clients "wtv-print-log-url: wtv-log:/print-log\n";
print $clients "Location: wtv-1800:/finish-prereg\n\n";
}else{
print $clients "300 Moved.\n";
print $clients "wtv-service: reset\n";
print $clients "wtv-service: name=wtv-head-waiter host=$sockhost port=$sockport flags=0x00000004\n";
print $clients "wtv-service: name=wtv-register host=$sockhost port=$sockport flags=0x00000004\n";
print $clients "wtv-service: name=wtv-log host=$sockhost port=$sockport flags=0x00000004\n";
print $clients "wtv-service: name=wtv-flashrom host=$sockhost port=$sockport flags=0x00000004\n";
print $clients "wtv-print-log-url: wtv-log:/print-log\n";
print $clients "Location: wtv-register:/register\n\n";

}