puts "Скрипт выводит массив чисел от 10 до 100 с шагом 5."

numbers = Array.new

for i in 10..100
  numbers.push(i) if i % 5 == 0
end

print numbers
