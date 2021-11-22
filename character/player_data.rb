# プレイヤークラス(基底クラス)
class Player
  attr_accessor :name, :job_name, :level, :hp, :max_hp, :attack, :defense, :speed, :experience_point

  def level_up()
    status_up()
    display_status()
  end

  private

  def status_up()
    self.level += 1
    self.max_hp += 2
    self.hp += 2
    self.attack += 2
    self.defense += 2
    self.speed += 2
  end

  def display_status()
    puts("レベルが#{self.level}に上がりました")
    puts("最大HP:#{self.max_hp}")
    puts("HP:#{self.hp}")
    puts("こうげき:#{self.attack}")
    puts("ぼうぎょ:#{self.defense}")
    puts("すばやさ:#{self.speed}")
  end
end

class Hero < Player
  def initialize()
    @name = ""
    @job_name = "勇者"
    @level = 1
    @hp = 10
    @max_hp = 10
    @attack = 5
    @defense = 5
    @speed = 5
    @experience_point = 0
  end
end

class Warrior < Player
  def initialize()
    @name = ""
    @job_name = "戦士"
    @level = 1
    @hp = 13
    @max_hp = 13
    @attack = 10
    @defense = 2
    @speed = 3
    @experience_point = 0
  end
end

class Thief < Player
  def initialize()
    @name = ""
    @job_name = "盗賊"
    @level = 1
    @hp = 8
    @max_hp = 8
    @attack = 2
    @defense = 3
    @speed = 10
    @experience_point = 0
  end
end
