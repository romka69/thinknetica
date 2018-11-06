puts "Скрипт запрашивает 3 стороны треугольника"
puts "и определяет по теореме Пифагора, является ли треугольник прямогульным."

print "Введите первую сторону треугольника: "
side_1 = gets.chomp.to_f

print "Введите вторую сторону треугольника: "
side_2 = gets.chomp.to_f

print "Введите третью сторону треугольника: "
side_3 = gets.chomp.to_f

if side_1 > side_2 && side_1 > side_3
  hypotenuse = side_1
  a = side_2
  b = side_3
elsif side_2 > side_1 && side_2 > side_3
  hypotenuse = side_2
  a = side_1
  b = side_3
else
  hypotenuse = side_3
  a = side_1
  b = side_2
end

if hypotenuse**2 == a**2 + b**2
  puts "Треугольник прямоугольный."
elsif side_1 == side_2 && side_1 == side_3
  puts "Треугольник равнобедренный и равносторонний, но не прямоугольный."
else
  puts "Треугольник равнобедренный." 
end
