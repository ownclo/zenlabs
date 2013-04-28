require_relative "../../../lib/gnuplot/parser.rb"

describe Gnuplot::Parser do
  describe "#parse" do
    it "splits input string by comma" do
      spec_string = "1:2,3:4,5:6"
      out = Gnuplot::Parser.parse spec_string
      expect(out).to eq ["1:2", "3:4", "5:6"]
    end
  end
end
