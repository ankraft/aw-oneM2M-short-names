#!/bin/bash
# Change the following line if jq is installed somewhere else
jq=/usr/local/bin/jq

snfile=responseStatusCodes.json


awkCommand='
{	
	split($0,o,"%"); 
	split(o[3],http," ") 
	split(o[4],coap," ") 

	print "<item arg='\''" o[1] "'\''>"
	print "  <title>" o[1] "</title>"
	print "  <subtitle>HTTP: " http[1] " | CoAP: " coap[1] " | " o[2] "</subtitle>"
	print "  <text type=\"largetype\">" o[1] "</text>"
	print "  <text type=\"copy\">" o[1] "</text>"
    print "  <mod key=\"alt\" subtitle=\"HTTP status code: " o[3] "\"/>"
    print "  <mod key=\"cmd\" subtitle=\"CoAP response code: " o[4] "\"/>"
	print "</item>"
}
'
echo "<items>"
$jq -r '.[] | select(.rsc == "{query}" or (.description | test("{query}"; "i"))) | "\(.rsc) - \(.description)%\(.class)%\(.http)%\(.coap)"' $snfile | tr -d \" | sort -u | awk "$awkCommand"

echo "</items>"
