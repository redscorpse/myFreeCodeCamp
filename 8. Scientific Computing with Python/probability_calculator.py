import copy
import random
# Consider using the modules imported above.

class Hat:
	def __init__(self, **args):
		self.args = args
		self.contents = []
		for i in args:
			for n in range(args[i]):
				self.contents.append(i)

	def draw(self,dBalls):
		if dBalls > len(self.contents):
			return self.contents
		else:
			Drawed = []
			while dBalls > 0:
				dBalls-=1
				Drawed.append( self.contents.pop(random.randrange(len(self.contents))) )
			return Drawed



def experiment(hat, expected_balls, num_balls_drawn, num_experiments):

	N = 0
	M = 0

	while N < num_experiments:
		N+=1

		# IMPORTANT!! Errors without this:
		hatCopy = copy.deepcopy(hat)
		
		# we draw some balls
		Drawed = hatCopy.draw(num_balls_drawn)
		#print('--------\n', Drawed)
	
		# and we expect some
		Expected = []
		for i in expected_balls:
				for n in range(expected_balls[i]):
					Expected.append(i)
		#print(f'{expected_balls} ---> {Expected}')
	
		# if we draw Expected from Drawed
		copyDrawed = Drawed
		canDraw = []
		for i in Expected:
			if i in copyDrawed:
				#move from list1 to list2
				canDraw.append( copyDrawed.pop(copyDrawed.index(i)) )

		
		if canDraw == Expected:
			M+=1
		#print(f'   {canDraw} / {Expected}, {M}')

	#print(M, N, M/N)
	return M/N




hat = Hat(blue=3,red=2,green=6)
probability = experiment(hat=hat, expected_balls={"blue":2,"green":1}, num_balls_drawn=4, num_experiments=1000)
print(probability) # expected = 0.272
        