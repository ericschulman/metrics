import pandas
import math
import numpy as np
import matplotlib.pyplot as plt
import statsmodels.api as sm

FNAME = '../cps09mar.dta'

def write_result(model,no):
	result_doc = open('tex/hw2_reg%s.tex'%no,'w+')
	result_doc.write( model.summary().as_latex() )
	result_doc.close()

def main():
	df = pandas.read_stata(FNAME)

	#part a
	X1 = df.loc[:,('educ','exp')]
	X1['exp_sq'] = X1['exp']**2
	X1 = sm.add_constant(X1)
	y = df['lwage']
	
	model1 = sm.OLS(y,X1).fit()
	write_result(model1,1)
	
	#part b
	e1 = model1.resid
	print sum(e1)
	print np.matmul(e1,X1)

	#part c
	X2 = X1.loc[:,('exp','exp_sq')]
	X2 = sm.add_constant(X2)

	#write result
	model2 = sm.OLS(y,X2).fit()
	write_result(model2,2)

	#actual test part c
	e2 = model2.resid
	print np.matmul(e2,X1['educ'])

	#part d
	model3 = sm.OLS(X1['educ'],X2).fit()
	write_result(model2,2)

	e3 = model3.resid
	print np.matmul(e3,X1['educ'])

	#part e
	model4 = sm.OLS(e2,e3)
	write_result(model2,2)

	#part f
	




if __name__ == "__main__":
	main()
	