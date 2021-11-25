#!/usr/bin/bash

first=( "Interated" "Total"	"Systematized" "Parallel" "Functional" "Responsive"	 "Optional" "Synchronized" "Compatible" "Balanced" )
second=( "Management" "Organizational" "Monitored"  "Reciprocal" "Digital" "Logistical" "Transitional" "Incremental" "Fifth-generation" "Policy"  )
third=( "Options" "Flexibility" "Capability" "Mobility" "Programing" "Concept" "Time-phase" "Projection" "Hardware" "Contingency" )

c=$(( RANDOM % 10 ))
printf "%s " ${first[c]}
c=$(( RANDOM % 10 ))
printf "%s " ${second[c]}
c=$(( RANDOM % 10 ))
printf "%s\n" ${third[c]}
