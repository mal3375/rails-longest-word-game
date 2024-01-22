require 'open-uri'

class GamesController < ApplicationController
  ALPHABET = ('A'..'z').to_a
  VOWELS = %w(A E I O U Y)
  def new
    @letters = ALPHABET.sample(10)
    @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
    @letters.shuffle!
  end

  def score
    @letters = params[:letters].splite
    @word = params[:word]
    @included = included?(@word, @letters)
  end

  private

  def included?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end


end
