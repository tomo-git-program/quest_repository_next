
#人間クラス
require_relative "humans/black_jack_card_gamer.rb"
require_relative "humans/player.rb"
require_relative "humans/dealer.rb"
#例外クラス
require_relative "errors/pictorial_pattern_error.rb"
require_relative "errors/different_instance_error.rb"
#モノクラス
require_relative "items/deck.rb"
require_relative "items/card.rb"
require_relative "items/mark.rb"
require_relative "items/number.rb"
#実行クラス
require_relative "exe/match_progression.rb"


game = MatchProgression.new("ishiyama", "dealer")
game.game_execute






