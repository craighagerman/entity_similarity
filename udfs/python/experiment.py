#experiment.py

from pig_util import outputSchema
 

@outputSchema('printlen:None')
def printlen(row):
	print type(row), ' ', len(row)


