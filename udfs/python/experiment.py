#experiment.py

from pig_util import outputSchema

 

@outputSchema('printlen:None')
def printlen(row):
	print type(row), ' ', len(row)


@outputSchema("word:chararray")
def helloworld():  
  return 'Hello, World'



@outputSchemaFunction("squareSchema")
def square(num):
  return ((num)*(num))


@schemaFunction("squareSchema")
def squareSchema(input):
  return input
