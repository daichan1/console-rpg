## 魔王を倒すRPG
require './constant'
require './character/player_data'
require './character/empty_data'
require './module/opening'
require './module/battle'
require './module/ending'

include Opening
include Battle
include Ending

def main()
  # オープニング
  first_message()
  player_name = decide_player_name()
  job_number = decide_job()
  player = create_player(job_number)
  player.name = player_name
  before_the_start_message(player)
  # モンスターと10回バトル
  empty_battle(player)
  # 魔王との戦闘
  devil_battle(player)
  # エンディング
  clear_message(player)
end

main()