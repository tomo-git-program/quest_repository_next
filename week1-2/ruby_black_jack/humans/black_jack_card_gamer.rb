# frozen_string_literal: true

# 読み込むクラス
require_relative '../items/card'
require_relative '../items/mark'
require_relative '../items/number'
# 読み込む例外処理クラス
require_relative '../errors/pictorial_pattern_error'
require_relative '../errors/different_instance_error'
require 'debug'

# ブラックジャックに参加する人なら持っているべきメソッドとフィールドを持っているsuperクラス
class BlackJackCardGamer
  attr_reader :hand, :name, :deck_top

  def initialize(name)
    @@deck = deck_initializer
    shuffle_deck!
    @hand = []
    @name = name
  end

  def draw_card
    @deck_top = @@deck.cards.first
    # =>irst…先頭の1つの要素を配列でもらってくる
    decrease_deck(@deck_top)
    add_to_hand(@deck_top)
  end

  def decks_remaining
    "現在のデッキ枚数#{@@deck.cards.length}枚"
  end

  def ponder_message(card)
    mark = card[1]
    number = change_to_s(card[0])
    p "#{name}の引いたカードは#{mark}の#{number}です。"
  end

  def over_21?
    sum_hand > 21
  end

  def print_sum_hands
    p "#{name}の現在の合計得点は#{sum_hand}点"
  end

  def sum_hand
    scores = 0
    @hand.each do |card|
      scores += special_scores(card[0], scores)
    end
    scores
  end

  def defeat
    p "合計点が21を超えました#{name}の負けです"
  end

  protected

  def add_to_hand(card)
    @hand << card
    #=>先頭のカードをハンドに加える
  end

  private

  def change_to_s(number)
    case number
    when 1
      'A'
    when 11
      'J'
    when 12
      'Q'
    when 13
      'K'
    else
      number
    end
  end

  def special_scores(number, scores)
    alphabet_array = [11, 12, 13]
    a_array = [1, scores + 11]
    if alphabet_array.include?(number)
      10
    elsif a_array.include?(number)
      11
    else
      number
    end
  end

  def warning_input
    'y/nから選んでください'
  end

  def decrease_deck(card)
    @@deck.cards.delete(card)
  end

  def shuffle_deck!
    @@deck.cards.shuffle!
  end

  def deck_initializer
    Deck.new
  end
end
