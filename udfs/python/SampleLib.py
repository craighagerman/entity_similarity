
@outputSchema("word:chararray")
def helloworld():  
  return 'Hello, World'

@outputSchema("word:chararray,num:long")
def complex(word):
  return str(word),len(word)


# No decorator - bytearray
def concat(str):
  return str+str




##################
# Math functions #
##################
#Square - Square of a number of any data type

@outputSchemaFunction("squareSchema")
def square(num):
  return ((num)*(num))

@schemaFunction("squareSchema")
def squareSchema(input):
  return input

#Percent- Percentage
@outputSchema("percent:double")
def percent(num, total):
  return num * 100 / total




####################
# String Functions #
####################
#commaFormat- format a number with commas, 12345-> 12,345
@outputSchema("numformat:chararray")
def commaFormat(num):
  return '{:,}'.format(num)

# #concatMultiple- concat multiple words
# @outputSchema("onestring:chararray")
# def concatMult4(word1, word2, word3, word4):
#   return word1 word2 word3 word4





#######################
# Data Type Functions #
#######################
#collectBag- collect elements of a bag into other bag
#This is useful UDF after group operation
@outputSchema("y:bag{t:tuple(len:int,word:chararray)}") 
def collectBag(bag):
  outBag = []
  for word in bag:
    tup=(len(bag), word[1])
    outBag.append(tup)
  return outBag




# Few comments- 
# Pig mandates that a bag should be a bag of tuples, Python UDFs should follow this pattern.
# Tuples in Python are immutable, appending to a tuple is not possible.



