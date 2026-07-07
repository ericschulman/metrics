import pandas
import matplotlib.pyplot as plt
import statsmodels.api as sm

FNAME = '../cps09mar.dta'
CATEGORIES = [12,16,18,20]

def main():
	#part a
	df = pandas.read_stata(FNAME)
	plt.figure()
	hist = df[(df.educ > 1)]
	hist['educ'].plot.hist()
	plt.savefig('part_a')

	#part b-e
	stats = dict()
	for y in CATEGORIES:
		stats[y] = helper(df,y)

	#write result to file
	result = open("hw1_results.csv","w+")
	result.write('num_obs,mean,var,q25,q50,q75\n')
	for y in CATEGORIES:
		result.write('%s,%s,%s,%s,%s,%s\n'% tuple(stats[y]) )

	result.close()

	#part f-g
	result = open("hw1_results.tex","w+")
	result.write('\\begin{tabular}{ c c c c c c } \\\\')
	result.write(' Year 1 & Year 2 & Diff & SE & T-Value & Reject \\\\ \n \hline \n')
	for y in CATEGORIES:
		for x in CATEGORIES:
			diff = stats[y][1] - stats[x][1]
			se =  (stats[y][2]/stats[y][0])**(.5)
			t_value = diff / se
			reject = (t_value > 2.02) or (t_value < -2.02)
			result.write('%s & %s & %s & %s & %s & %s \\\\ \n'% (y,x,diff,se,t_value,reject) )
	result.write('\\end{tabular}')
	result.close()


def helper(df,y):
	df = df[df.educ == y]
	num_obs = df['educ'].count()

	plt.figure()
	df['lwage'].plot.density()
	plt.xlim(0, 7)
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
	result_doc = open('hw1_reg.tex','w+')
	result_doc.write( model_result.summary().as_latex() )
	result_doc.close()


if __name__ == "__main__":
	main()
	do_regression()