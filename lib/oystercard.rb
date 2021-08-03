class Oystercard

MINIMUM_FARE = 1
STARTING_BALANCE = 0
MAX_TOP_UP = 90

attr_reader :balance, 
            :entry_station, 
            :exit_station,
            :journey,
            :journeys

  def initialize
    @balance = STARTING_BALANCE
    @in_use = false
    @journeys = Array.new
  end 

  def top_up(money)
    raise "Error: Cannot exceed max balance of #{MAX_TOP_UP}" if ((@balance + money) > MAX_TOP_UP)
    
    @balance += money
  end 

  def in_journey?
    @entry_station != nil ? true : false
  end

  def touch_in(station)
    raise "Insufficient funds!" if @balance < MINIMUM_FARE
    @journey = Hash.new ##??
    @entry_station = station
  end
  
  def touch_out(station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    @exit_station = station

  end

  private

  def deduct(money)
    @balance -= money
  end

end
