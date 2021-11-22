# オープニングで行うことはここに
module Opening
  def first_message
    puts("サンプルRPGの世界へようこそ")
  end

  def before_the_start_message(player)
    puts("名前:#{player.name}, 職業:#{player.job_name}で始めます")
    puts("10回連続で勝利すると、魔王と戦うことができます")
    puts("魔王を倒したらゲームクリアです")
    puts("では、頑張って下さい")
  end

  def decide_player_name()
    puts("あなたの名前を教えてください")
    name = gets.chomp
    while name.length <= MIN_PLAYER_NAME || name.length > MAX_PLAYER_NAME do
      puts("名前は10文字以下に設定して下さい")
      puts("もう一度名前を入力して下さい")
      name = gets.chomp
    end
    return name
  end

  def decide_job()
    include Private
    job_number = select_job_number()
    until is_decide_job(job_number) do
      puts("選択した職業をキャンセルしました")
      job_number = select_job_number()
    end
    return job_number
  end

  def create_player(num)
    case num
    when SELECT_JOB_HERO then
      return Hero.new
    when SELECT_JOB_WARRIOR then
      return Warrior.new
    when SELECT_JOB_THIEF then
      return Thief.new
    else
      puts("意図していない値を検知しました(method:create_player, value:#{num})")
      exit
    end
  end

  module Private
    def select_job_number()
      puts("職業を番号で選択して下さい(1:勇者, 2:戦士, 3:盗賊)")
      num = gets.chomp.to_i
      until num == SELECT_JOB_HERO || num == SELECT_JOB_WARRIOR || num == SELECT_JOB_THIEF do
        puts("職業は1,2,3の中から選択して下さい")
        puts("もう一度職業を選択して下さい")
        num = gets.chomp.to_i
      end
      return num
    end
  
    def is_decide_job(num)
      job_decision = comfim_job(num)
      return job_decision == "y" ? true : false
    end
  
    def comfim_job(num)
      case num
      when SELECT_JOB_HERO then
        puts("「勇者」でよろしいですか？(y/n)")
      when SELECT_JOB_WARRIOR then
        puts("「戦士」でよろしいですか？(y/n)")
      when SELECT_JOB_THIEF then
        puts("「盗賊」でよろしいですか？(y/n)")
      else
        puts("意図していない値を検知しました")
        return "n"
      end
      decision = gets.chomp
      return decision
    end
  end
end