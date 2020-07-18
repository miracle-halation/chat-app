require 'rails_helper'

RSpec.describe "Rooms", type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  it "チャットルームを削除すると、関連するメッセージが全て削除されていること" do
    # サインインする
    sign_in(@room_user.user)
    # 作成したチャットルームへ遷移する
    click_on(@room_user.room.name)
    # メッセージ情報を5つDBに追加する
    FactoryBot.create_list(:message, 5, room: @room_user.room)
    # 「チャットを終了する」ボタンをクリックすることで作成した５つのメッセージが削除されていることを期待する
    expect{
      find_link("チャットを終了する", href: room_path(@room_user.room)).click
    }.to change {Message.count}.by(-5)
    # ルートページに遷移されることを期待する
    expect(current_path).to eq root_path
  end
end
