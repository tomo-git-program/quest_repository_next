# frozen_string_literal: true

# 読み込むクラス
require_relative '../items/card'
require_relative '../items/mark'
require_relative '../items/number'
# 読み込む例外処理クラス
require_relative '../errors/pictorial_pattern_error'
require_relative '../errors/different_instance_error'

# cardクラスをフィールドとして組み込むことでcardクラスの機能を持つことができる
# deckクラスは52枚のトランプカードを管理するクラスである
class Deck
  attr_reader :cards

  def initialize(card = card_instancer)
    @card = card
    @cards = []
    make_deck
  end

  private

  def make_deck
    make_thirteen_cards(@card.mark.spade)
    make_thirteen_cards(@card.mark.dia)
    make_thirteen_cards(@card.mark.clover)
    make_thirteen_cards(@card.mark.heart)
    # =>13 * 4 = 52
  end

  def make_thirteen_cards(mark)
    13.times do
      @cards << @card.make_card(mark)
    end
  end

  def card_instancer
    Card.new
  end
end
