puts "Скрипт выводит в массиве ряд фибоначчи до 100."

fib1, fib2 = 1, 1
fib_array = [1, 1]

loop do
  fib_sum = fib2 + fib1
  break if fib_sum > 100
  fib_array.push(fib_sum)
  fib1 = fib2
  fib2 = fib_sum
end

print fib_array
