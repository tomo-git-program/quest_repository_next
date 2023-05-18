# frozen_string_literal: true

# 読み込むクラス
require_relative '../items/mark'
require_relative '../items/number'
require_relative '../items/card'
require_relative '../items/deck'
require_relative '../humans/black_jack_card_gamer'
require_relative '../humans/player'
require_relative '../humans/dealer'
# 読み込む例外処理クラス
require_relative '../errors/pictorial_pattern_error'
require_relative '../errors/different_instance_error'

# 試合全体の流れを管理するクラス。
class MatchProgression
  attr_reader :player, :dealer

  def initialize(player_name, dealer_name)
    @player = player_initializer(player_name)
    @dealer = dealer_initializer(dealer_name)
  end

  def game_execute
    # ゲーム開始時のオート処理
    call_game_start
    player_first_action(@player)
    dealer_first_action(@dealer)
    check_draw_card(@player)
    hit_or_stand
    defeat_judge(@player)
  end

  def check_draw_card(guest)
    guest.print_sum_hands
  end

  def hit_or_stand
    while @player.sum_hand < 22
      p 'カードを引きますか?(Y/n)'
      answer = gets.chomp
      if answer == 'y'
        draw_and_ponder(@player)
        check_draw_card(@player)
      elsif answer == 'n'
        auto_play_dealer
        break
      else
        'Y/nで答えてください'
      end
    end
  end

  private

  def auto_play_dealer
    @dealer.open_second_draw_message
    while @dealer.sum_hand < 17
      draw_and_ponder(@dealer)
      check_draw_card(@dealer)
    end
    if @dealer.over_21?
      @dealer.defeat
    else
      contest
    end
  end

  def defeat_judge(guest)
    guest.defeat if guest.over_21?
    end_game
  end

  def contest
    p 'いざ、尋常に勝負！'
    p "#{@player.name}: => #{@player.sum_hand}点！"
    p "#{@dealer.name}: => #{@dealer.sum_hand}点！"

    winner = @player.name if @dealer.sum_hand > 21
    winner = @player.name if @player.sum_hand > @dealer.sum_hand
    winner = @dealer.name if @player.sum_hand < @dealer.sum_hand
    winner = '引き分け！' if @player.sum_hand == @dealer.sum_hand

    if @player.sum_hand == dealer.sum_hand
      p winner
    else
      p "#{winner}の勝ち！"
    end
    end_game
  end

  def call_game_start
    'ブラックジャックを開始します！'
  end

  def end_game
    'ブラックジャックを終了します'
  end

  def player_first_action(player)
    draw_and_ponder(player)
    draw_and_ponder(player)
  end

  def dealer_first_action(dealer)
    draw_and_ponder(dealer)
    draw_and_ponder(dealer)
  end

  def draw_and_ponder(guest)
    guest.draw_card
    guest.ponder_message(guest.deck_top)
  end

  def player_initializer(player_name)
    Player.new(player_name)
  end

  def dealer_initializer(dealer_name)
    Dealer.new(dealer_name)
  end
end
