# frozen_string_literal: true

# 読み込むクラス
require_relative '../items/card'
require_relative '../items/mark'
require_relative '../items/number'
# 読み込む例外処理クラス
require_relative '../errors/pictorial_pattern_error'
require_relative '../errors/different_instance_error'
require 'debug'

# ブラックジャックに参加する人が持つべきメソッドや情報を継承したdealerクラス。ponder_messageのオーバーライドで2枚目のカードを隠す
class Dealer < BlackJackCardGamer
  attr_reader :second_card

  def initialize(name = 'ディーラー')
    super(name)
  end

  # 引いたカードを頭の中で反復するメソッド
  def ponder_message(card)
    mark = card[1]
    number = change_to_s(card[0])
    change_to_s(number)
    if second_draw?
      @second_card = number
      hide_second_draw_message
    else
      p "#{name}の引いたカードは#{mark}の#{number}です"
    end
  end

  def second_draw?
    hand.length == 2
  end

  def hide_second_draw_message
    p "#{name}の2枚目に引いたカードは分からない"
  end

  def open_second_draw_message
    p "#{name}が2枚目に引いたカードは#{@second_card}でした"
  end
end
