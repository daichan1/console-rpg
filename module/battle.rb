# バトルで行うことはここに
module Battle
  def empty_battle(player)
    victory_count = 0
    while victory_count <= FIGHT_COUNT do
      empty = empty_list.sample
      puts("#{empty.name}があらわれた")
      is_victory = battle(player, empty)
      is_victory ? victory_count += 1 : game_over()
    end
  end

  def devil_battle(player)
    empty = Devil.new
    puts("#{empty.name}があらわれた")
    is_victory = battle(player, empty)
    game_over() unless is_victory
  end

  module Private
    def battle(player, empty)
      is_victory = false
      while player.hp > 0 && empty.hp > 0 do
        choice_action(player)
        if player.speed > empty.speed
          attack_player(player, empty)
          if empty.hp <= 0
            is_victory = true
            combat_result(player, empty)
            break
          end
          attack_empty(player, empty)
        else
          attack_empty(player, empty)
          if player.hp <= 0
            break
          end
          attack_player(player, empty)
          if empty.hp <= 0
            is_victory = true
            combat_result(player, empty)
          end
        end
      end
      return is_victory
    end

    def choice_action(player)
      puts("#{player.name} HP:#{player.hp}")
      puts("行動を選択して下さい 1:たたかう")
      player_action = gets.chomp
      while player_action != "1" do
        puts("表示されている番号で入力して下さい")
        puts("行動を選択して下さい 1:たたかう")
        player_action = gets.chomp
      end
    end

    def attack_player(player, empty)
      empty_inflict_damage = calc_damage(player.attack, empty.defense)
      empty.hp -= empty_inflict_damage
      battle_log(player.name, empty.name, empty_inflict_damage)
    end

    def attack_empty(player, empty)
      player_inflict_damage = calc_damage(empty.attack, player.defense)
      player.hp -= player_inflict_damage
      battle_log(empty.name, player.name, player_inflict_damage)
    end

    def calc_damage(attack, defense)
      damage = attack - defense
      damage = damage <= 0 ? 1 : damage
      return damage
    end

    def battle_log(attacker, defender, damage)
      puts("#{attacker}のこうげき")
      puts("#{defender}に#{damage}のダメージ")
    end

    def combat_result(player, empty)
      puts("#{empty.name}を倒した")
      player.experience_point += empty.experience_point
      while player.experience_point >= (player.level ** 2) do
        player.level_up()
      end
    end

    def game_over()
      puts("全滅してしまった")
      puts("ゲームオーバー")
      exit
    end
  end
  include Private
end