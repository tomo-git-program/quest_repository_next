# frozen_string_literal: true

# 読み込むクラス
require_relative '../items/mark'
require_relative '../items/number'
# 読み込む例外処理クラス
require_relative '../errors/pictorial_pattern_error'
require_relative '../errors/different_instance_error'

# デバッガー
require 'debug'

# mark(絵柄) number(1~13の数字)をインスタンス変数として持たせてそれから1枚のカードを生成できるクラスです
class Card
  attr_reader :mark, :number, :card, :extracted_numbers

  def initialize
    raise DifferentInstanceError, '引数に正しいインスタンスが入っていません' unless instance?(mark_ins, number_ins)

    @mark = mark_ins
    @number = number_ins
    # (抽出されてもう使えない数字が入る配列)
    @extracted_numbers = []
  end

  def make_card(mark)
    tramp_card = []
    tramp_card << number_print
    tramp_card << mark_print(mark)
    @card = tramp_card
  end

  private
  
  def number_print
    extract_number.last
  end

  def extract_number
    numbers = @number.array.map{ |n| n }
    if @extracted_numbers.sort == numbers.sort
      # 完全に重複してたら空にする
      @extracted_numbers = []
    end
    # 重複していない配列から一個サンプリング
    pick_number = (numbers - @extracted_numbers).sample
    # 抽出されたのでもう使えない要素を格納
    @extracted_numbers << pick_number
  end

  def mark_print(mark)
    mark
  end

  private

  def mark_ins
    Mark.new
  end

  def number_ins
    Number.new
  end

  def instance?(mark, number)
    mark.is_a?(Mark) && number.is_a?(Number)
  end
end
