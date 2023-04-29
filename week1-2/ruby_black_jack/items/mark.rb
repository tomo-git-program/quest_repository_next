# frozen_string_literal: true

require_relative '../errors/pictorial_pattern_error'

# トランプの絵柄を管理するクラス
class Mark
  attr_reader :spade, :heart, :clover, :dia

  # 4つの絵柄を初期化
  def initialize
    @spade = 'spade'
    @heart = 'heart'
    @clover = 'clover'
    @dia = 'dia'
  end

  private

  def mark_judger(bool)
    return raise PictorialPatternError, 'マークが合っていません。代入を取り消します' if bool == false

    puts 'マーク合ってます。大丈夫です'
  end

  def mark_is_true?(enterd_mark)
    find_object =
      mark_array.find do |mark|
        mark.include?(enterd_mark)
      end

    if !find_object.nil?
      true
    else
      false
    end
  end

  def mark_array
    # マークを初期化するためのメソッド
    [spade, heart, clover, dia]
  end
end
