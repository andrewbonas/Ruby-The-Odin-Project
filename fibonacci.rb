# iteration
def fibs(num)
  array = [0,1]
  n = 2
  while n <= num do
    array[n] = array[n-1] + array[n-2]
    n +=1
  end
array
end

p fibs(10)

# recursion
def fibs_rec(num)
  return num if num <=1
  fibs_rec( num - 1 ) + fibs_rec( num - 2 )
end
p fibs_rec(10)