# frozen_string_literal: true

# 読み込むクラス
require_relative '../items/card'
require_relative '../items/mark'
require_relative '../items/number'
# 読み込む例外処理クラス
require_relative '../errors/pictorial_pattern_error'
require_relative '../errors/different_instance_error'
require 'debug'

# ブラックジャックに参加する人のフィールドやメソッドを受け継いだクラス。特に変更は加えずそのまま使う。
class Player < BlackJackCardGamer
end
