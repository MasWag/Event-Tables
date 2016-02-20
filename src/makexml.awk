#!/bin/awk -f

BEGIN {
    print "<?xml version=\"1.0\" ?>"
    print "<?xml-stylesheet href=\"timetable.xsl\" type=\"text/xml\" ?>"
    print "<article>"
}

# title
$1=="%" && NR==1 {
    sub("% ","");
    print "<title>"$0"</title>"
}
# date
$1=="%" && NR==2 {
    sub("% ","");
    print "<date>"$0"</date>"
}
# name of aim
$1=="%" && NR==3 {
    sub("% ","");
    name_of_aim=$0
}
# aim
$1=="%" && NR==4 {
    sub("% ","");
    print "<hoshin title=\""name_of_aim"\" >"
    print $0
    print "</hoshin>" 
}

# events
/^=+$/ {
    if (in_events) {
        print "</events>"
    } else {
        print "<main>"
        in_events = 1
    }
    match (last_line,/{.*}/)
    if (!RSTART) {
        print "<events title=\"" last_line "\" >"
    } else {
        print "<events title=\"" substr(last_line,1,RSTART-1) "\" aim=\"" substr(last_line,RSTART+1,RLENGTH-2) "\" >"
    }
}

# event
$1 == "*" {
    sub("* ","");
    split ($0,elements,"|")
    print "<event time=\"" elements[1] "\">"
    print "<subject>"
    print elements[2]
    print "</subject>"
    print "<note>"
    print elements[3]
    print "</note>"
    print "</event>"
}

{last_line=$0}

END{
    if (in_events) {
        print "</events>"
        print "</main>"
    }
    print "</article>"
}
