# require 'spec_helper'
require_relative '../exercises.rb'

describe 'Exercises' do
  describe '.ex0' do

    it "triples the length of a string" do
      result = Exercises.ex0("ha")
      expect(result).to eq("hahaha")
    end
  end
end
