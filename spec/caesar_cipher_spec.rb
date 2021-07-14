require './lib/caesar_cipher'

describe "#ignore_char?" do
    it "Returns true if the given char code is out of range" do
        expect(ignore_char?(3)).to eql(true)
        expect(ignore_char?(4269)).to eql(true)
    end
    it "Returns false if the given char code is within range" do
        expect(ignore_char?(97)).to eql(false)
    end
end

describe "#caesar_cipher" do
    it "Replaces each character in a given string with another specified by an offset" do
        expect(caesar_cipher('What a string!', 5)).to eql('Cmfy f xywnsl!')
    end
end