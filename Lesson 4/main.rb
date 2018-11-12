require_relative 'train'
require_relative 'trains/passenger_train'
require_relative 'trains/cargo_train'
require_relative 'wagon'
require_relative 'wagons/passenger_wagon'
require_relative 'wagons/cargo_wagon'
require_relative 'station'
require_relative 'route'

HELLO_STRINGS = "
-----------------------------------------
|                                       |
| [T] [R] [A] [I] [N] [S]   [D] [E] [V] |
|                                       |
-----------------------------------------
"
WRONG_CHOISE = "Введите число согласно меню."

def main_menu
  loop do
    puts HELLO_STRINGS
    puts "
          --- Главное меню ---
          
-----------------------------------------
Введите номер опции:
1. Перейти в меню станций
2. Перейти в меню поезда
3. Перейти в меню маршрутов
4. Выйти из программы
"
    choice = gets.chomp.to_i

    case choice
    when 1
      station_menu
    when 2
      train_menu
    when 3
      route_menu
    when 4
      exit
    else
      puts WRONG_CHOISE
    end
  end
end

def station_menu
  loop do
    puts HELLO_STRINGS
    puts "
          --- Меню станции ---

-----------------------------------------
Введите номер опции:
1. Создать станцию
2. Посмотреть список всех станций
3. Посмотреть список поездов на станции
4. Вернуться в главное меню
5. Выйти из программы
"
    choice = gets.chomp.to_i

    case choice
    when 1
      create_station
    when 2
      stations_list
    when 3
      train_list_on_station
    when 4
      main_menu
    when 5
      exit
    else
      puts WRONG_CHOISE
    end
  end

  def create_station
  end

  def stations_list
  end

  def train_list_on_station
  end
end

def train_menu
  loop do
    puts HELLO_STRINGS
    puts "
           --- Меню поезда ---

-----------------------------------------
Введите номер опции:
1. Создать поезд
2. Назначить маршрут поезду
3. Добавить вагон к поезду
4. Отцепить вагон от поезда
5. Следовать до следующей станции
6. Следовать до предыдущей станции
7. Вернуться в главное меню
8. Выйти из программы
"
    choice = gets.chomp.to_i

    case choice
    when 1
      create_train
    when 2
      set_route_to_train
    when 3
      add_wagon
    when 4
      del_wagon
    when 5
      to_next_station
    when 6
      to_previous_station
    when 7
      main_menu
    when 8
      exit
    else
      puts WRONG_CHOISE
    end
  end

  def create_train
  end

  def set_route_to_train
  end

  def add_wagon
  end

  def del_wagon
  end

  def to_next_station
  end

  def to_previous_station
  end
end

def route_menu
  loop do
    puts HELLO_STRINGS
    puts "
          --- Меню станции ---
          
-----------------------------------------
Введите номер опции:
1. Создать маршрут
2. Добавить станцию к маршруту
3. Удалить станцию из маршрута
4. Вернуться в главное меню
5. Выйти из программы
"
    choice = gets.chomp.to_i

    case choice
    when 1
      create_route
    when 2
      add_station_to_route
    when 3
      del_station_from_route
    when 4
      main_menu
    when 5
      exit
    else
      puts WRONG_CHOISE
    end
  end

  def create_route
  end

  def add_station_to_route
  end

  def del_station_from_route
  end
end

main_menu
