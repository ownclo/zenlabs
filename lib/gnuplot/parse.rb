module Gnuplot
  class PLOT
    def self.parse spec_string
      spec_string.split(',')
    end

    def self.generate_curve cols
    end

    def self.colors
      ["black", "blue", "#006400", "red", "purple", "brown"]
    end
  end
end
