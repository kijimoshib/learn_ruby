def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(arr_arg)
  arr_arg.inject(0) { |s, value| s + value }
end

def multiply(*args)
  args.reduce(1, :*)
end


def power(num, pow)
  num**pow
end

def factorial(x)
  (x <= 1) ? 1 : x * factorial(x-1)
end

