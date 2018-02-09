import pandas
import matplotlib.pyplot as plt
import statsmodels.api as sm

FNAME = '../cps09mar.dta'

def main():
	df = pandas.read_stata(FNAME)
	#part a
	print list(df)
	X = df[['educ', 'exp']]
	X['exp_sq'] = X['exp']**2
	X = sm.add_constant(X)
	y = df['lwage']
	
	#write result
	model_result = sm.OLS(y,X).fit()
	result_doc = open('tex/hw2_reg1.tex','w+')
	result_doc.write( model_result.summary().as_latex() )
	result_doc.close()


if __name__ == "__main__":
	main()
	