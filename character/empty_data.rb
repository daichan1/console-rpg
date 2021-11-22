class Empty
  attr_accessor :name, :hp, :attack, :defense, :speed, :experience_point
end

class Slime < Empty
  def initialize()
    @name = "スライム"
    @hp = 2
    @attack = 1
    @defense = 1
    @speed = 1
    @experience_point = 1
  end
end

class Drakey < Empty
  def initialize()
    @name = "ドラキー"
    @hp = 5
    @attack = 2
    @defense = 2
    @speed = 2
    @experience_point = 2
  end
end

class Ookizuchi < Empty
  def initialize()
    @name = "おおきづち"
    @hp = 10
    @attack = 5
    @defense = 3
    @speed = 3
    @experience_point = 5
  end
end

class Gargoyle < Empty
  def initialize()
    @name = "ガーゴイル"
    @hp = 15
    @attack = 7
    @defense = 5
    @speed = 6
    @experience_point = 10
  end
end

class KillerMachine < Empty
  def initialize()
    @name = "キラーマシン"
    @hp = 20
    @attack = 15
    @defense = 10
    @speed = 10
    @experience_point = 30
  end
end

class Devil < Empty
  def initialize()
    @name = "魔王"
    @hp = 50
    @attack = 30
    @defense = 20
    @speed = 20
    @experience_point = 100
  end
end

def empty_list()
  data = [Slime.new, Drakey.new, Ookizuchi.new, Gargoyle.new, KillerMachine.new]
  return data
end