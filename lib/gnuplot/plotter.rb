module Gnuplot
  # XXX: Default stylings should be set in constructor
  class Plotter
    def generate_points cols, color='black'
      style = "w p pt 2 ps 0.7 lc rgb '#{color}' notitle"
      generate_curve cols, style
    end

    def generate_spline cols, name = "PLOT_NAME", color='black'
      style = "title '#{name}' lt 1 lw 2 lc rgb '#{color}' s acs"
      cols += ":(r)"
      generate_curve cols, style
    end

    def generate_curve cols, style="w lp"
      "u #{cols} #{style}"
    end

    def combine_lines plots
      plots.join("\\\n\"\"")
    end

    def colors
      ["black", "blue", "#006400", "red", "purple", "brown"]
    end
  end
end

# LINE IS A VALUE OBJECT
module Gnuplot
  class Line
    attr_reader :name, :color, :cols
    def initialize cols='1:2', color='black', name='NICE PLOT'
      @cols=cols
      @color=color
      @name=name
    end
  end
end
