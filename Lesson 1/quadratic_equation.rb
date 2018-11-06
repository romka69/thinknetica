puts "Скрипт решает квадратное уравнение через дискриминант на основе введенных данных."

print "Введите коэффициент 'a': "
a = gets.chomp.to_f

print "Введите коэффициент 'b': "
b = gets.chomp.to_f

print "Введите коэффициент 'c': "
c = gets.chomp.to_f

d = b**2 - 4 * a * c

if d < 0
  puts "Корней нет."
elsif d == 0
  puts "Дискриминант = #{d}. Корень 1 = Корень 2 = #{-b / 2 * a}."
else
  puts "Дискриминант = #{d}."
  puts "Корень 1 = #{(-b + Math.sqrt(d)) / 2 * a}."
  puts "Корень 2 = #{(-b - Math.sqrt(d)) / 2 * a}."
end
