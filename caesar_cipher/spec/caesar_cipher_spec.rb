require './lib/caesar_cipher'

describe '#caesar_cipher' do
  it 'replaces single letters' do
  expect(caesar_cipher("A", 2)).to eq("C")
  end

  it 'replaces lowercase letters' do
    expect(caesar_cipher("ab", 2)).to eq("cd")
  end

  it 'does not change spaces' do
    expect(caesar_cipher("a b", 2)).to eq("c d")
  end

  it 'replaces uppercase and lowercase in one string' do
    expect(caesar_cipher("ADda", 3)).to eq("DGgd")
    end

  it 'wraps around the alphabet' do
    expect(caesar_cipher("Z", 2)).to eq("B")
  end

  it 'does not change punctuation' do
    expect(caesar_cipher("abc!?", 2)).to eq("cde!?")
  end
end