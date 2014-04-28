# require 'spec_helper'
require_relative '../exercises.rb'

describe 'Exercises' do
  describe '.ex0' do

    it "triples the length of a string" do
      result = Exercises.ex0("ha")
      expect(result).to eq("hahaha")
    end

    it "returns 'nope' if 'str' is 'wishes'" do
      result = Exercises.ex0('wishes')
      expect(result).to eq('nope')
    end
  end

  describe '.ex1' do
    it "returns the number of elements in the array" do
      expect(Exercises.ex1([])).to eq(0)
      expect(Exercises.ex1([1,2,3])).to eq(3)
    end
  end
end
