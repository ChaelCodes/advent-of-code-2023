RSpec.describe Day01 do
  let(:solution) { described_class.new }

  describe "#calibration_value" do
    it { expect(solution.calibration_value("treb7uchet")).to eq 77 }
    it { expect(solution.calibration_value("1abc2")).to eq 12 }
    it { expect(solution.calibration_value("pqr31stu8vwx")).to eq 38 }
    it { expect(solution.calibration_value("a1b2c3d4e5f")).to eq 15 }
    
    context "when part 2" do
      let(:solution) { described_class.new(part: 2) }

      it { expect(solution.calibration_value("two1nine")).to eq 29 }
      it { expect(solution.calibration_value("eightwothree")).to eq 83 }
      it { expect(solution.calibration_value("abcone2threexyz")).to eq 13 }
      it { expect(solution.calibration_value("xtwone3four")).to eq 24 }
      it { expect(solution.calibration_value("4nineeightseven2")).to eq 42 }
      it { expect(solution.calibration_value("zoneight234")).to eq 14 }
      it { expect(solution.calibration_value("7pqrstsixteen")).to eq 76 }
      it { expect(solution.calibration_value("eightwoneight")).to eq 88 }
    end
  end

  describe "#inputs" do
    subject { solution.inputs }

    it { expect(subject.first).to eq "23krgjlpone" }
    it { expect(subject.count).to eq 1000 }
  end

  describe "#solve" do
    subject { solution.solve }

    context "for example" do
      before { solution.records = %w[1abc2 pqr3stu8vwx a1b2c3d4e5f treb7uchet] }

      it { is_expected.to eq 142 }
    end

    context "for part 1" do
      it { is_expected.to eq 54667 }
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      it { is_expected.to eq 54203 }
    end
  end
end
