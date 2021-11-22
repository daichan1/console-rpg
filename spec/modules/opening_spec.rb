require './spec/spec_helper'
require './constant'
require './module/opening'
require './character/player_data'

describe "#opening" do
  include Opening
  it "職業:勇者でプレイヤーを作成" do
    expect(create_player(SELECT_JOB_HERO).job_name).to eq Hero.new.job_name
  end

  it "職業:戦士でプレイヤーを作成" do
    expect(create_player(SELECT_JOB_WARRIOR).job_name).to eq Warrior.new.job_name
  end

  it "職業:盗賊でプレイヤーを作成" do
    expect(create_player(SELECT_JOB_THIEF).job_name).to eq Thief.new.job_name
  end

  it "職業選択で意図しない値が渡された時は強制終了" do
    expect { create_player(4) }.to raise_error SystemExit
  end
end