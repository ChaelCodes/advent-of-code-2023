class Day02
  attr_accessor :records, :part

  # 12 red cubes, 13 green cubes, and 14 blue cubes

  def initialize(part: 1)
    self.records = inputs
    self.part = part
  end

  def game_score(game)
    game["red"] * game["green"] * game["blue"]
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    File.readlines("./inputs/day_#{day_match[:number]}.txt", chomp: true)
  end

  def parse_game(game)
    game_id = /Game (\d+)/.match(game)
    cube_colors = game.scan(/(\d+) (blue|green|red)/)
    cubes = {
      "id" => game_id[1].to_i,
      "blue" => 0,
      "red" => 0,
      "green" => 0
    }
    cube_colors.each { |quantity, color| cubes[color] = [quantity.to_i, cubes[color]].max }
    cubes
  end

  def solve_part_1
    records.map { parse_game(_1) }
      .filter { valid_game(_1) }
      .sum { _1["id"] }
  end

  def solve_part_2
    records.map { parse_game(_1) }
      .map { game_score(_1) }
      .sum
  end

  def solve
    if part == 1
      solve_part_1
    else
      solve_part_2
    end
  end

  def valid_game(game)
    game["red"] <= 12 && game["green"] <= 13 && game["blue"] <= 14
  end
end
