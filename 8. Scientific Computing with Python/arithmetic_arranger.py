def arithmetic_arranger(problems, answers=False):
  row1 = row2 = row3 = row4 = ''
  
  if (len(problems)>5):
    return 'Error: Too many problems.'
  else:
    for problem in problems:
      problem = problem.split() # num1 operator num2
      num1 = problem[0]
      operator = problem[1]
      num2 = problem[2]
      
      if ((operator!='+') and (operator!='-')):
        return "Error: Operator must be '+' or '-'."
      elif ((len(num1)>4) or (len(num2)>4)):
        return 'Error: Numbers cannot be more than four digits.'
      else:
        try:
          num1= int(num1)
          num2 = int(num2)
        except:
          return 'Error: Numbers must only contain digits.'
      
      
      # now there aren't more errors
      
      # length of characters in problem
      if ( len(str(num1)) >= len(str(num2)) ):
        L = len(str(num1)) +2
      else:
        L = len(str(num2)) +2
      
      # change width according to the length
      
      row1 += f'{num1:>{L}}    ' # formated string f'' with the variable *num1* right aligned (>) with a spacin of *L* (another variable, so {} again)
      row2 += f'{operator} {num2:>{L-2}}    '
      row3 += ''.rjust(L,'-') + '    '
      
      
      # solving
      if (answers==True):
        if (operator=='+'):
          suma = int(num1)+int(num2)
          row4 += f'{suma:>{L}}    '
        elif (operator=='-'):
          resta = int(num1)-int(num2)
          row4 += f'{resta:>{L}}    ' 
        
        arranged_problems = row1.rstrip() + '\n' + row2.rstrip() + '\n' + row3.rstrip() + '\n' + row4.rstrip()
        
      else:
        arranged_problems = row1.rstrip() + '\n' + row2.rstrip() + '\n' + row3.rstrip()
  
  return arranged_problems