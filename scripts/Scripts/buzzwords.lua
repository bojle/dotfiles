#!/usr/bin/lua

first = { "Interated", "Total",	"Systematized", "Parallel", "Functional", "Responsive",	 "Optional", "Synchronized", "Compatible", "Balanced" }
second = { "Management", "Organizational", "Monitored",  "Reciprocal", "Digital", "Logistical", "Transitional", "Incremental", "Fifth-generation", "Policy"  }
third = { "Options", "Flexibility", "Capability", "Mobility", "Programing", "Concept", "Time-phase", "Projection", "Hardware", "Contingency" }

i1 = math.random(1, 10)
i2 = math.random(1, 10)
i3 = math.random(1, 10)
io.write(string.format("%s %s %s\n", first[i1], second[i2], third[i3]))
