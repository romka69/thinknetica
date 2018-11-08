puts "Скрипт выводит хеш с гласными буквами и ее порядковый номер в алфавите."

vowels = Hash.new

alphabet = ("a"..."z")
alphabet.each_with_index { |word, i|
  if "aeiou".include?(word)
    vowels[word] = i + 1
  end
}

puts vowels
