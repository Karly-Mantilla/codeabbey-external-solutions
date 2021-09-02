#!/bin/oforth
: /round { over over mod rot + swap / }
: getLn { System.Console askln }
: get-number { getLn asInteger }
: get-lines { [] swap #[ getLn words #asInteger swap map dup first swap second /round +] times }
: pprint { #[ print " " print ] swap apply "" println }

get-number get-lines pprint