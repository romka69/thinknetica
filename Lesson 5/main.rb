require_relative 'train'
require_relative 'trains/passenger_train'
require_relative 'trains/cargo_train'
require_relative 'wagon'
require_relative 'wagons/passenger_wagon'
require_relative 'wagons/cargo_wagon'
require_relative 'station'
require_relative 'route'

@stations = []
@trains = []
@routes = []

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
    puts "
--- Меню станции ---
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
      break
    when 5
      exit
    else
      puts WRONG_CHOISE
    end
  end
end

def create_station
  loop_handler = true

  while loop_handler
    print "Введите название станции: "
    name = gets.chomp.to_s

    if station_in_stations?(name) || name.empty?
      puts "Не задано имя или станция с таким именем уже есть, попробуйте еще раз."
    else
      @stations.push(Station.new(name))
      puts "Станция '#{name}' создана."
      loop_handler = false
    end
  end
end

def stations_list
  if @stations.empty?
    puts "Станции не созданы."
  else
    puts "Список станций:"
    @stations.each { |station| puts station.name }
  end
end

def train_list_on_station
  if @stations.empty?
    puts "Станции не созданы."
  else
    @stations.each { |station|
      puts "На станции '#{station.name}' стоят поезда:"
      station.train_list
    }
  end
end

def station_in_stations?(name)
  @stations.each { |station|
    return true if station.name == name
  }
  false
end

def train_menu
  loop do
    puts "
--- Меню поезда ---
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
      break
    when 8
      exit
    else
      puts WRONG_CHOISE
    end
  end
end

def create_train
  loop_handler = true

  while loop_handler
    print "Введите номер поезда: "
    number = gets.chomp.to_s

    if train_in_trains?(number) || number.empty? 
      puts "Не задан номер или с поезд с таким номером уже есть, попробуйте еще раз."
    else
      print "Поезд будет: 1. грузовым 2. пассажирским. Введите число: "
      type = gets.chomp.to_i

      case type
      when 1
        @trains.push(CargoTrain.new(number))
        puts "Поезд '#{number}' создан."
        loop_handler = false
      when 2
        @trains.push(PassengerTrain.new(number))
        puts "Поезд '#{number}' создан."
        loop_handler = false
      else
        puts "Не задан тип поезда или задан неправильно, попробуйте еще раз."
      end
    end
  end
end

def set_route_to_train
  if @trains.empty?
    puts "Сначала необходимо создать поезд."
  elsif @routes.empty?
    puts "Сначала необходимо создать маршрут."
  else
    route = select_route
    train = select_train
    train.set_route(route)
    puts "Выбранный путь добавлен в поезд '#{train.number}'."
  end
end

def add_wagon
  if @trains.empty?
    puts "Сначала необходимо создать поезд."
  else
    train = select_train
	
    if train.type == :passenger
      train.add_wagon(PassengerWagon.new)
	  puts "Вагон добавлен к поезду '#{train.number}'."
    elsif train.type == :cargo
      train.add_wagon(CargoWagon.new)
	  puts "Вагон добавлен к поезду '#{train.number}'."
    end
  end
end

def del_wagon
  if @trains.empty?
    puts "Сначала необходимо создать поезд."
  else
    train = select_train
	
    if train.wagons.size == 0
      puts "У данного поезда нет вагонов."
    else
      train.del_wagon
      puts "Вагон удален с поезда '#{train.number}'."
	end
  end
end

def to_next_station
  if @trains.empty?
    puts "Сначала необходимо создать поезд."
  else
    train = select_train
	
	if route_in_train?(train)
      cur_station1 = train.current_station
      train.move_next_station
      cur_station2 = train.current_station

      if cur_station1 == cur_station2
        puts "Поезд '#{train.number}' не движется дальше, т.к. находится на крайней станции."
      else
        puts "Поезд '#{train.number}' прибыл на станцию '#{cur_station2.name}'."
	  end
	end
  end
end

def to_previous_station
  if @trains.empty?
    puts "Сначала необходимо создать поезд."
  else
    train = select_train
	
    if route_in_train?(train)
      cur_station1 = train.current_station
      train.move_previous_station
      cur_station2 = train.current_station

      if cur_station1 == cur_station2
        puts "Поезд '#{train.number}' не движется назад, т.к. находится на крайней станции."
      else
        puts "Поезд '#{train.number}' прибыл на станцию '#{cur_station2.name}'."
	  end
	end
  end
end

def train_in_trains?(number)
  @trains.each { |train|
    return true if train.number == number
  }
  false
end

def route_in_train?(train)
  if train.route == []
    puts "Сначала необходимо назначить поезду маршрут."
    return false
  end
  true
end

def route_menu
  loop do
    puts "
--- Меню станции ---
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
      break
    when 5
      exit
    else
      puts WRONG_CHOISE
    end
  end
end

def create_route
  loop_handler = true
  
  while loop_handler
    if @stations.size < 2
      puts "Для создания пути необходимы 2 станции, создано #{@stations.size}."
	  loop_handler = false
    else
	  puts "Начало маршрута:"
      station1 = select_station
      puts "Конец маршрута:"
      station2 = select_station
	  
	  if station1.name != station2.name
        @routes.push(Route.new(station1, station2))
        puts "Маршрут '#{station1.name} - #{station2.name}' создан.'"
		loop_handler = false
      else
	    puts "Неверный выбор станций, попробуйте еще раз."
	  end
    end
  end
end

def add_station_to_route
  if @routes.empty?
    puts "Сначала необходимо создать маршрут."
  else	
    route = select_route
    station = select_station

    if station_in_route?(station, route)
      puts "В маршруте уже есть станция '#{station.name}'."
    else
      route.add_station(station)
      puts "В маршрут добавлена станция '#{station.name}'."
	end
  end
end

def del_station_from_route
  if @routes.empty?
    puts "Сначала необходимо создать маршрут."
  else
    route = select_route
    station = select_station

    if route.stations.size < 2
      puts "Нет станций для удаления."
    elsif station_in_route?(station, route)
      route.del_station(station)
      puts "Из маршрута удалена станция '#{station.name}'."
    else
      puts "В маршруте нет станции '#{station.name}'."
	end
  end
end

def station_in_route?(station, route)
  route.stations.each { |station_from_route|
    return true if station_from_route.name == station.name
  }
  false
end

def select_route
  choice_route = ''

  loop do
    puts "Введите число, что бы выбрать маршрут."
    @routes.each_with_index { |route, i| puts "#{i}. '#{route.stations[0].name}'-'#{route.stations[-1].name}'" }
    choice = gets.chomp

    if choice == ""
      puts "Не выбрано число, попробуйте еще раз."
    elsif choice.to_i >= 0 && choice.to_i <= @routes.size - 1
      choice_route = @routes[choice.to_i]
    end

    break unless choice_route.to_s.empty?
    puts "Неправильно выбрано число, попробуйте еще раз."
  end

  return choice_route
end

def select_station
  choice_station = ''

  loop do
    puts "Введите число, чтобы выбрать станцию."
    @stations.each_with_index { |station, i| puts "#{i}. #{station.name}" }
    choice = gets.chomp

    if choice == ""
      puts "Не выбрано число, попробуйте еще раз."
    elsif choice.to_i >= 0 && choice.to_i <= @stations.size - 1
      choice_station = @stations[choice.to_i]
    end

    break unless choice_station.to_s.empty?
    puts "Неправильно выбрано число, попробуйте еще раз."
  end

  return choice_station
end

def select_train
  choice_train = ''

  loop do
    puts "Введите число, чтобы выбрать поезд."
    @trains.each_with_index { |train, i| puts "#{i}. #{train.number}" }
    choice = gets.chomp

    if choice == ""
      puts "Не выбрано число, попробуйте еще раз."
    elsif choice.to_i >= 0 && choice.to_i <= @trains.size - 1
      choice_train = @trains[choice.to_i]
    end

    break unless choice_train.to_s.empty?
    puts "Неправильно выбрано число, попробуйте еще раз."
  end

  return choice_train
end

main_menu
