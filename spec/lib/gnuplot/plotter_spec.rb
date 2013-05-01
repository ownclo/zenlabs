require_relative "../../../lib/gnuplot/plotter.rb"
require_relative "../../../lib/gnuplot/line.rb"

# This code knows about 'Line' class. It is responsible
# for combining lines into some crazy gnuplot command.
# That is NOT a unit test. Plotter integrates many lines,
# so the test is rather functional.
describe Gnuplot::Plotter do
  let(:plotter) { Gnuplot::Plotter.new }
  let(:line1) { Gnuplot::Line.new(name='NICE PLOT', color='black', cols='1:2') }
  let(:line2) { Gnuplot::Line.new(name='LOAL PLOT', color='brown', cols='1:3') }

  describe "#plot_all" do
    it "returns a string to plot the whole stuff" do
      outp = plotter.plot_all [line1, line2]
      #puts outp
      expect(outp).to match(/NICE PLOT/)
      expect(outp).to match(/LOAL PLOT/)
      expect(outp).to match(/lc rgb 'brown'/ && /lc rgb 'black'/)
    end
  end

  describe "#produce_plots" do
    it "get a list of all plots needed by gnuplot" do
      plots = plotter.produce_plots [line1, line2]
      #puts plots
      expect(plots.length).to eq 4
      expect(plots[0]).to eq line1.generate_points
      expect(plots[3]).to eq line2.generate_spline
    end
  end

  describe "#combine" do
    it "joins lines with gnuplotish syntax" do
      lines = ["A", "B"]
      combo = plotter.combine lines
      #puts combo
      expect(combo).to eq "A,\\\n\"\"\ B"
    end
  end

  describe "#colorize" do
    it "zips lines with colors" do
      colorized = plotter.colorize [line1, line2], ["blue", "brown"]
      expect(colorized[0].color).to eq "blue"
      expect(colorized[1].color).to eq "brown"
    end
  end

  describe "#plot_from_columns" do
    it "produce a reasonable default given a column indexes" do
      out = plotter.plot_from_columns ["1:2", "3:4", "5:6"]
      expect(out).to match(/title '[1,3,5]:[2,4,6]'/)
    end
  end
end
