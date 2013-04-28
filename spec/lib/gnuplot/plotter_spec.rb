require_relative "../../../lib/gnuplot/plotter.rb"

describe Gnuplot::Plotter do
  let(:plotter) { Gnuplot::Plotter.new }
  let(:line) { Struct.new(:cols, :color, :name) }
  let(:line1) { line.new(color='black',
                         cols='1:2',
                         name='NICE PLOT') }
  let(:line2) { line.new(color='black',
                         cols='1:3',
                         name='LOAL PLOT') }

  describe "#generate_curve" do
    context "fully specified parameters" do
      it "outputs gnuplot instruction for plotting curve" do
        spec_string = "1:2"
        style_string = "w lp notitle"
        out = plotter.generate_curve spec_string, style_string
        expect(out).to eq "u 1:2 w lp notitle"
      end
    end

    context "with style non-specified" do
      it "produces line with 'w lp'" do
        spec_string = "1:2"
        out = plotter.generate_curve spec_string
        expect(out).to eq "u 1:2 w lp"
      end
    end
  end

  describe "#generate_points" do
    it "outputs point-plot" do
      out = plotter.generate_points "1:2", "brown"
      expected =  "u 1:2 w p pt 2 ps 0.7 lc rgb 'brown' notitle"
      expect(out).to eq expected
    end

    it "color is black by default" do
      out = plotter.generate_points "1:2"
      expected =  "u 1:2 w p pt 2 ps 0.7 lc rgb 'black' notitle"
      expect(out).to eq expected
    end
  end

  describe "#generate_spline" do
    it "outputs nicely smoothed line" do
      out = plotter.generate_spline "1:2", "NICE PLOT", 'brown'
      expected = "u 1:2:(r) title 'NICE PLOT' lt 1 lw 2 lc rgb 'brown' s acs"
      expect(out).to eq expected
    end
  end

  describe "#combine_lines" do
    it "joins lines with gnuplotish syntax" do
      #line1 = plotter.generate_points "1:2", 
      #line2 = plotter.generate_spline "1:2", "NICE PLOT"
      #expected = "u 1:2 w p pt 2 ps 0.7 
    end
  end

  describe "#generate_spline_and_points" do
    #out = plotter.generate_spline_and_points cols="1:2",
      #title="NICE PLOT", color="brown"
    #expected = 
  end
end
