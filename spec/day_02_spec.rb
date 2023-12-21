RSpec.describe Day02 do
  let(:solution) { described_class.new }

  describe "#game_score" do
    it "calculates the power of the dice needed" do
      expect(solution.game_score(solution.parse_game("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")))
      .to eq 48
    end
  end

  describe "#inputs" do
    subject { solution.inputs }

    it { expect(subject.first).to eq "Game 1: 2 red, 2 green; 6 red, 3 green; 2 red, 1 green, 2 blue; 1 red" }
    it { expect(subject.count).to eq 100 }
  end

  describe "parse_game" do
    it "parses game one" do
      expect(solution.parse_game("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"))
        .to eq(
          {
            "id" => 1,
            "blue" => 6,
            "red" => 4,
            "green" => 2 
          }
        )
    end
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      context "for example" do
        before {
          solution.records = [
            "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
            "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
            "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
            "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
            "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
          ]
        }

        it { is_expected.to eq 8 }
      end

      it { is_expected.to eq 2169 }
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      it { is_expected.to eq 60948 }
    end
  end
end
