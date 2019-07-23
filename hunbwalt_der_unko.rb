# frozen_string_literal: true

Plugin.create(:hunbwalt_der_unko) do
  greets = %w[
    イッヒフンバルト
    デル
    ウンコ
    ハイル！
    フンデルベン！
    ミーデルベン！
    ヘーヒルト
    ベンデル！
    フンバルト
    ヘーデル！
    ベンダシタイナー！フンデルト
    モレル
    ケッツカラデルド！
    フンベン
    モルゲン！
    モーデルワ
    イッヒ
    アーデル
    ゲーベン！
    ワーデル！
  ].freeze

  greets_de = %w[
    Ichiehunwalt
    der
    Unko
    Heil!
    Hunderben!
    Miederben!
    hähild
    Wendel!
    hunwalt
    Hödel!
    Bendaschteiner! hundert
    Morrel
    Ketzkerdeld
    hunwen
    Morgen!
    Modelwar
    ich
    adel
    Geben!
    Wadel!
  ].freeze

  command(:hunbwalt_der_unko,
          name: 'イッヒフンバルトデルウンコ',
          condition: ->(_opt) { true },
          visible: true,
          role: :timeline) do |opt|
    opt.messages.each do |message|
      Plugin.call(:der_unko, message)
    end
  end

  on_der_unko do |message|
    msg = '@' + message.user.idname
    loop do
      n_msg =  ' ' + greets.sample
      break if msg.size + n_msg.size >= 140
      msg += n_msg
    end
    world, = Plugin.filtering(:world_current, nil)
    compose(world, message, body: msg)
  end

  command(:hunbwalt_der_unko_de,
          name: 'Ich hunwalte der Unko.',
          condition: ->(_opt) { true },
          visible: true,
          role: :timeline) do |opt|
    opt.messages.each do |message|
      Plugin.call(:der_unko_de, message)
    end
  end

  on_der_unko_de do |message|
    msg = '@' + message.user.idname
    loop do
      n_msg =  ' ' + greets_de.sample
      break if msg.size + n_msg.size >= 140
      msg += n_msg
    end
    world, = Plugin.filtering(:world_current, nil)
    compose(world, message, body: msg)
  end
end
