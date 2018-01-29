import pandas
import matplotlib.pyplot as plt
import statsmodels.api as sm

FNAME = 'cps09mar.dta'
CATEGORIES = [12,16,18,20]

def main():
	#part a
	df = pandas.read_stata(FNAME)
	plt.figure()
	df['educ'].plot.hist()
	plt.savefig('part_a')

	#part b-e
	stats = dict()
	for y in CATEGORIES:
		stats[y] = helper(df,y)

	#part f-g
	for y in CATEGORIES:
		diff = stats[y][1] - stats[12][1]
		se =  (stats[y][2]/stats[y][0])**(.5)
		t_value = diff / se
		stats[y].append(diff)
		stats[y].append(se)
		stats[y].append(t_value)

	#write result to file
	result = open("hw1_results.txt","w+")
	result.write('num_obs,mean,var,q25,q50,q75,diff,se,tstat\n')
	for y in CATEGORIES:
		result.write('%s,%s,%s,%s,%s,%s,%s,%s,%s\n'% tuple(stats[y]) )

	result.close()


def helper(df,y):
	df = df[df.educ == y]
	num_obs = df['educ'].count()

	plt.figure()
	df['lwage'].plot.density()
	plt.savefig('part_b_%s'%y)
	
	mean = df['lwage'].mean()
	var = df['lwage'].var()
	
	q25 = df['lwage'].quantile(q=.25)
	q50 = df['lwage'].quantile(q=.5)
	q75 = df['lwage'].quantile(q=.75)

	#last 2 fields to be filled in later
	return [num_obs,mean,var,q25,q50,q75]


def do_regression():
	df = pandas.read_stata(FNAME)
	df = df[(df.educ == 12) | (df.educ == 16)| (df.educ == 18)| (df.educ == 20)]
	
	#set up X matrix
	X = pandas.get_dummies(df['educ'], prefix='educ')
	X = X[['educ_16', 'educ_18', 'educ_20']]
	X = sm.add_constant(X)
	
	y = df['lwage']
	
	#write result
	model_result = sm.OLS(y,X).fit()
	result_doc = open('hw1_reg.txt','w+')
	result_doc.write( model_result.summary().as_text() )
	result_doc.close()


if __name__ == "__main__":
	main()
	do_regression()