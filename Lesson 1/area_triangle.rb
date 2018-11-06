puts "Скрипт вычисляет площадь треугольника на основе введенного основания и высоты."

print "Введите основание треугольника: "
base_triangle = gets.chomp.to_f

print "Введите высоту треугольника: "
height_triangle = gets.chomp.to_f

puts "Площадь треугольника: #{0.5 * base_triangle * height_triangle}."
