#!/bin/bash
# Change the following line if jq is installed somewhere else
jq=/usr/local/bin/jq

snfile=resourceTypes.json


awkCommand='
{	
	split($0,o,"%"); 
	split(o[2],type," ") 
	split(o[3],resource," ") 
	split(o[4],shortname," ") 

	print "<item arg='\''" o[1] " - " type[1] "'\''>"
	print "  <title>" o[1] "</title>"
	print "  <subtitle>Resource Type: " type[1] "</subtitle>"
	print "  <text type=\"largetype\">" o[1] " - " type[1] "</text>"
	print "  <text type=\"copy\">" resource[1] "</text>"
    print "  <mod key=\"shift\" subtitle=\"Copy short name to clipboard: " shortname[1] "\"/>"
    print "  <mod key=\"cmd\" subtitle=\"Copy resource type name to clipboard: " resource[1] "\"/>"
    print "  <mod key=\"alt\" subtitle=\"Copy resource type to clipboard: " type[1] "\"/>"
	print "</item>"
}
'
echo "<items>"
$jq -r '.[] | select(.type == "{query}" or (.resource | test("{query}"; "i")) or (.shortname | test("{query}"; "i"))) | "\(.resource) - \(.shortname)%\(.type)%\(.resource)%\(.shortname)"' $snfile | tr -d \" | sort -u | awk "$awkCommand"

echo "</items>"
