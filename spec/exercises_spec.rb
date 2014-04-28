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

  describe '.ex2' do
    it "returns the second element of an array" do
      expect(Exercises.ex2([])).to eq(nil)
      expect(Exercises.ex2([1,2])).to eq(2)
      expect(Exercises.ex2([1,5,8,9,0])).to eq(5)
    end
  end

  describe '.ex3' do
    it "returns the sum of a given array of numbers" do
      expect(Exercises.ex3([])).to eq (nil)
      expect(Exercises.ex3([1,2,3,4])).to eq (10)
    end
  end

  describe '.ex4' do
    it "returns the max number of the given array" do
      expect(Exercises.ex4([1,54, 78, 4])).to eq(78)
    end
  end

  describe '.ex5' do
    it "iterates through an array and 'puts' each element" do

      STDOUT.should_receive(:puts).with(1)
      STDOUT.should_receive(:puts).with(2)
      STDOUT.should_receive(:puts).with(3)
      STDOUT.should_receive(:puts).with(4)
      result = [1, 2, 3, 4]
      Exercises.ex5(result)
    end
  end

  describe '.ex6'
end
