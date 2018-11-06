puts "Скрипт вычисляет идеальный вес на основе введенного роста."

print "Введите ваше имя: "
name = gets.chomp.capitalize

print "Введите ваш рост в сантиметрах: "
height = gets.chomp.to_f

ideal_weight = height - 110

if ideal_weight <= 0
  puts "#{name}, ваш вес уже оптимальный."
else
  puts "#{name}, ваш идеальный вес #{ideal_weight} кг."
end
