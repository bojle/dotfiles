#!/usr/bin/python3

# Calculate BMI and Body fat % (according to navy seal
# formula)
# Syntax example:
# bmicalculate.py -a 140 -w 50 -H 2.60 -g 1
# see "bmicalculate.sh -h" for more info.

import argparse

stats = ({"height":1, "weight":1, "age":1, "gender":1, 
        "bmi":1, "bmicategory":"Null", "fatpercent":1})

def bmicalculate(weight, height):
    global stats
    bmi = round(weight / (height ** 2), 2)
    if bmi <= 18.5:
        stats["bmicategory"]="Underweight"
    elif  bmi > 18.5  and  bmi <= 24.9:
	    stats["bmicategory"]="Normal"
    elif  bmi > 24.9  and  bmi <= 29.9:
	    stats["bmicategory"]="Overweight"
    elif bmi > 30:
	    stats["bmicategory"]="Obese"
    else:
        stats["bmicategory"]="Out of Range"
    return bmi

def fatpercentcal(bmi, age, gender):
    fp = (round((1.39 * bmi) + 
        (0.16 * age) - (10.34 * gender) - 9, 2))
    return fp

def print_stats(stats):
    print(f'Height: {stats["height"]}')
    print(f'Weight: {stats["weight"]}')
    print(f'Age: {stats["age"]}')
    if stats["gender"] == True:
        gender = 'Male'
    else:
        gender = 'Female'

    print(f'Gender: {gender}')
    print(f'BMI: {stats["bmi"]} ({stats["bmicategory"]})')
    print(f'Fats: {stats["fatpercent"]}%')

parser = argparse.ArgumentParser(description='Body Stat Meter')
parser.add_argument('-w', '--weight', type=float, required=True, \
        help='Weight (in KGs)')
parser.add_argument('-H', '--height', type=float, required=True, \
        help='Height (in meters)')
parser.add_argument('-a', '--age', type=int, required=True, help='Age')
parser.add_argument('-g', '--gender', type=int, required=True, \
        help='Gender (1 for male, 0 for female)')
args = parser.parse_args()

stats["weight"] = args.weight
stats["height"] = args.height
stats["age"] = args.age
stats["gender"] = 1 if args.gender == True else 0
stats["bmi"] = bmicalculate(weight=stats["weight"], height=stats["height"])
stats["fatpercent"] = fatpercentcal(bmi=stats["bmi"], age=stats["age"], \
        gender=stats["gender"])

print(stats["gender"])
print_stats(stats)
