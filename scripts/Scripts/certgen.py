#!/usr/bin/python
import os
import csv
import sys

# Configuration 
tags = ["Name"]
tag_positions = { tags[0]: [ 233, 335 ] }
tag_pointsizes = { tags[0]: 60 }
tag_font_path = "/usr/share/fonts/Helvetica/Helvetica.ttf"
tag_fill_color = "black"
In_imagefilepath = os.path.join(os.environ.get("HOME"), "certificates/cert.jpeg")
Out_imagefilepath = os.path.join(os.environ.get("HOME"), "certificates/certdir")
template_cmd = "convert" + f" {In_imagefilepath}" + f" -font {tag_font_path}" + f" -fill {tag_fill_color}" 

# Create the values list.
# Values contains the fields that are relevant to the program
def field_value_mapper(field_list):
    values = []
    for index, val in enumerate(field_list):
        for tagval in tags:
            if val == tagval:
                values.append(index)
    return values

# Takes the current list, field list and values.
def cmd_string_gen(liste, fields, values):
    final_cmd = template_cmd
    for i in values:
        final_cmd = final_cmd  + f" -pointsize {tag_pointsizes[fields[i]]}" + f" -draw \"text {tag_positions[fields[i]][0]},{tag_positions[fields[i]][1]} '{liste[i]}'\"" 
    outfilename = liste[min(values)] # The name of the resultant file is the first value in the tags list
    final_cmd = final_cmd + f" {Out_imagefilepath}/{outfilename}.jpg"
    return final_cmd


# Open csv file, create a fields list and procedurally create a list containing each row of the file.
with open(sys.argv[1]) as csvfile:
    reader = csv.reader(csvfile)
    fields = reader.__next__()
    values = field_value_mapper(fields)
    for liste in reader:
        os.system(cmd_string_gen(liste, fields, values))
