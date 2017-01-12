# YOUR CODE HERE
require 'benchmark'
#
# def fibonacci(n)
# 	if n == 1 || n == 2
#     1
# 	else
# 	   fibonacci(n-1) + fibonacci(n-2)
# 	end
# end
#
#
#
# def fibonacci(n)
#   values = {}
#   values[1] = 1
#   values[2] = 1
#   values[n] ||= fibonacci(n-1) + fibonacci(n-2)
# end



# using memoization:
@cache = [0,1]

def fibonacci(n)
  return @cache[n] if @cache[n]
  @cache[n] = fibonacci(n-1) + fibonacci(n-2)
end

Benchmark.bm do |x|
  x.report { fibonacci(1000)}

end
