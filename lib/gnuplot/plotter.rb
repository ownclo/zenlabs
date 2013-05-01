module Gnuplot
  # TODO: Default stylings should be set in constructor
  class Plotter
    def plot_from_columns columns
      lines = columns.map do |cols|
        Line.new_from_columns cols
      end
      plot_all lines
    end

    def plot_all lines
      combine produce_plots(lines)
    end

    def produce_plots lines
      lines.map do |line|
        produce_plot(line)
      end.flatten
    end

    def combine lines
      lines.join(",\\\n\"\" ")
    end

    def colorize lines, colors=default_colors
      lines.zip colors do |line, color|
        line.color = color
      end
      lines
    end

    private

    def produce_plot line
      line.generate_points_and_spline
    end

    def default_colors
      ["black", "blue", "#006400", "red", "purple", "brown"]
    end
  end
end
