require_relative "../../../lib/gnuplot/line.rb"

describe Gnuplot::Line do
  let(:line) { Gnuplot::Line.new('NICE PLOT', 'blue', '1:2') }

  describe "#generate_line" do
    context "fully specified parameters" do
      it "outputs gnuplot instruction for plotting line" do
        spec_string = "1:2"
        style_string = "w lp notitle"
        out = line.generate_line spec_string, style_string
        expect(out).to eq "u 1:2 w lp notitle"
      end
    end

    context "with style non-specified" do
      it "produces line with 'w lp'" do
        spec_string = "1:2"
        out = line.generate_line spec_string
        expect(out).to eq "u 1:2 w lp"
      end
    end
  end

  describe "#generate_points" do
    it "outputs point-plot" do
      out = line.generate_points
      expected =  "u 1:2 w p pt 2 ps 0.7 lc rgb 'blue' notitle"
      expect(out).to eq expected
    end

    it "color is black by default" do
      out = line.generate_points
      expected =  "u 1:2 w p pt 2 ps 0.7 lc rgb 'blue' notitle"
      expect(out).to eq expected
    end
  end

  describe "#generate_spline" do
    it "outputs nicely smoothed line" do
      out = line.generate_spline
      expected = "u 1:2:(r) title 'NICE PLOT' lt 1 lw 2 lc rgb 'blue' s acs"
      expect(out).to eq expected
    end
  end

  describe "#generate_points_and_spline" do
    it "returns a list of two lines" do
      expected = [line.generate_points, line.generate_spline]
      expect(line.generate_points_and_spline).to eq expected
    end
  end

  describe "Line.new_from_columns" do
    it "generates a line with name and cols set" do
      cols = "1:2"
      line = Gnuplot::Line.new_from_columns cols
      expect(line.name).to eq cols
      expect(line.cols).to eq cols
    end
  end
end
