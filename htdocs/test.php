<?php
// Pretty bad and basic.... this has to be beautified a lot...

$link = @mysql_connect('127.0.0.1', 'root', '');

if(!$link) {
        header("HTTP/1.1 503 can't connect to server");
        exit;
}

$sql = "show status like 'wsrep_local_state';";

$result = mysql_query($sql);

while($row = mysql_fetch_assoc($result))
{

if($row['Variable_name'] == "wsrep_local_state" && $row['Value'] == 4)
{
header("HTTP/1.1 200 OK");

exit;
}

}



header("HTTP/1.1 503 temp down");
