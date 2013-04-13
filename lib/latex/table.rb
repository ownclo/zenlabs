require 'latex'

module LATEX
  class Table
    def self.count_cols table
      rows = table.split "\n"
      num_cols = rows.first.split.length
    end
  end
end
