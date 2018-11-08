puts "Скрипт считает цену за товары, на основе данных пользователя."

basket = Hash.new
total_price = Array.new

loop do
  print "Введите название товара: "
  name = gets.chomp
  break if name == "стоп"

  print "Введите цену за единицу товара: "
  cost = gets.chomp.to_f

  print "Введите кол-во товара: "
  count = gets.chomp.to_f

  basket[name.to_sym] = { cost: cost, count: count }
end

puts basket

basket.each { |name, data|
  price = data[:cost] * data[:count]
  puts "Итоговая сумма за #{name}: #{price}"
  total_price.push(price)
}

puts "Итоговая сумма всех покупок: #{total_price.sum}."
