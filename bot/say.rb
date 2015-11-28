class Say < SlackRubyBot::Commands::Base
  command 'say' do |client, data, match|
    send_message client, data.channel, match['expression']
  end
end
