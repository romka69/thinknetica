puts "Скрипт выводит порядковый номер даты, начиная отсчет с начала года, на основе введеных данных."

days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
number_day = 0

print "Введите число: "
day = gets.chomp.to_i

print "Введите месяц: "
month = gets.chomp.to_i

print "Введите год: "
year = gets.chomp.to_i

if (year % 4).zero? && !(year % 100).zero? || (year % 400).zero?
  days_in_months[1] = 29
end

for i in (0..month-2)
  number_day += days_in_months[i]
end

puts "С начала года прошло #{number_day + day} дней."
