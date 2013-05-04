require 'namings'

module Namings
  def self.strip_extension name
    File.basename name, File.extname(name)
  end

  def self.escape_special_symbols name
    pattern = /(\'|\"|_|\/|\-|\\)/
    name.gsub(pattern){|match|"\\"  + match}
  end
end
