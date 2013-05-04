require_relative "../../../lib/namings/extensions.rb"

describe Namings do
  describe "#strip_extension" do
    it "strips the extension of a file" do
      file_name = "foo_bar baz.tex.foo"
      expected  = "foo_bar baz.tex"
      stripped  = Namings::strip_extension file_name
      expect(stripped).to eq expected
    end

    context "no extension" do
      it "leave the filename unmodified" do
        file_name = "foo"
        stripped  = Namings::strip_extension file_name
        expect(stripped).to eq "foo"
      end
    end
  end

  describe "#escape_special_symbols" do
    it "makes a filename valid for latex" do
      name = "foo_bar"
      escaped = Namings::escape_special_symbols name
      expect(escaped).to eq "foo\\_bar"
    end
  end
end
