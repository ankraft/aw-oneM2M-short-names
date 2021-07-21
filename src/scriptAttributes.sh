#!/bin/bash
# Change the following line if jq is installed somewhere else
jq=/usr/local/bin/jq

snfile=attributes.json


awkCommand='
{	
	split($0,o,"%"); 
	print "<item arg='\''" o[1] "'\''>"
	print "  <title>" o[1] "</title>"
	print "  <subtitle>" o[2] "</subtitle>"
	print "  <text type=\"largetype\">" o[1] "</text>"
	print "  <text type=\"copy\">" o[1] "</text>"
    print "  <mod key=\"cmd\" subtitle=\"" o[3] "\"/>"
    print "  <mod key=\"alt\" subtitle=\"" o[4] "\"/>"
	print "</item>"
}
'
echo "<items>"
$jq -r '.[] | select(.shortName == "{query}" or (.attribute | test("{query}"; "i"))) | "\(.attribute) - \(.shortname)%\(.occursIn | @csv)%\(.documents | @csv)%\(.categories | @csv)"' $snfile | tr -d \" | sort -u | awk "$awkCommand"

echo "</items>"
