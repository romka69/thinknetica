puts "Скрипт выводит те месяцы, у которых количество дней равно 30."

months = {
  january: 31,
  february: 28,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 31,
  september: 30,
  october: 31,
  november: 30,
  december: 31 
}

months.each { |m, d| puts m if d == 30 }
