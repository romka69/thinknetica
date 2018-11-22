class PassengerWagon < Wagon
  attr_reader :seats, :busy_seats

  def initialize(type = :passenger, seats)
    @seats = seats.to_i
    @busy_seats = 0
    super
  end

  def take_seat
    @busy_seats += 1
  end
end
