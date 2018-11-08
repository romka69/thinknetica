puts "Скрипт выводит в массиве ряд фибоначчи до 100."

fib_array = [1, 1]

loop do
  fib_sum = fib_array.last(2).sum
  break if fib_sum > 100
  fib_array.push(fib_sum)
end

print fib_array
