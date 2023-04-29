# frozen_string_literal: true

# cardで使う1~13までの数字を持っているクラスです
class Number
  attr_reader :array

  # [1,2,3,4,...,number]の配列が@array変数に入る
  def initialize
    instance_number_present
  end

  # 1~13までの数値が
  private

  def instance_number_present
    number_array = []
    (1..13).to_a.each do |n|
      number_array << n
      @array = number_array
      # [1,2,3,4...,number]までの配列をインスタンス変数に格納
    end
  end
end
