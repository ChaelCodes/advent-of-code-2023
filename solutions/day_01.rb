class Day01
  attr_accessor :records, :part

  NUMBERS = {
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9"
  }

  def initialize(part: 1)
    self.records = inputs
    self.part = part
  end

  def calibration_value(decorated_value)
    decorated_value = decorated_value.gsub(/(?=(one|two|three|four|five|six|seven|eight|nine))/) { NUMBERS[$1] } if part == 2
    captured_values = decorated_value.scan(/\d/)
    (captured_values[0] + captured_values[-1]).to_i
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    File.readlines("./inputs/day_#{day_match[:number]}.txt", chomp: true)
  end

  def solve
    records.map { calibration_value(_1) }.sum
  end
end
