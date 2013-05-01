module Gnuplot
  class Line
    attr_reader :name, :cols
    attr_accessor :color # You can colorize it.

    def self.new_from_columns cols
      line = Line.new cols, 'black', cols
    end

    def initialize name='NICE PLOT', color='black', cols='1:2'
      @cols=cols
      @color=color
      @name=name
    end

    def generate_points
      style = "w p pt 2 ps 0.7 lc rgb '#{@color}' notitle"
      generate_line @cols, style
    end

    def generate_spline
      style = "title '#{@name}' lt 1 lw 2 lc rgb '#{@color}' s acs"
      cols = @cols + ":(r)"
      generate_line cols, style
    end

    def generate_points_and_spline
      [generate_points, generate_spline]
    end

    def generate_line cols, style="w lp"
      "u #{cols} #{style}"
    end
  end
end
