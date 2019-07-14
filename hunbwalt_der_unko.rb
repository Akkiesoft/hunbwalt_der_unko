# -*- coding: utf-8 -*-

Plugin.create(:hunbwalt_der_unko) do
  command(
          :hunbwalt_der_unko,
          name: 'イッヒフンバルトデルウンコ',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    opt.messages.each do |message|
      Plugin.call(:der_unko, message)
    end
  end

  on_der_unko do | message |
    greets = ["イッヒフンバルト", "デル", "ウンコ", "ハイル！", "フンデルベン！", "ミーデルベン！", "ヘーヒルト", "ベンデル！", "フンバルト", "ヘーデル！", "ベンダシタイナー！フンデルト", "モレル", "ケッツカラデルド！", "フンベン", "モルゲン！", "モーデルワ", "イッヒ", "アーデル", "ゲーベン！", "ワーデル！"]
    n_msg = ""
    msg = "@"+ message.user.idname + " "
    while TRUE do
      n_msg = greets.sample
      break if msg.split(//).size + n_msg.split(//).size >= 140
      msg += n_msg + " "
    end
    world, = Plugin.filtering(:world_current, nil)
    compose(world, message, body: msg)
  end
end
