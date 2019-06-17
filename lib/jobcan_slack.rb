require 'slack'

class JobCanSlack
  COMMANDS = {
    touch: '/jobcan_touch',
    test: '/shrug'
  }

  attr_reader :client

  def initialize(channel)
    @client = Slack::Web::Client.new
    @channel = channel
  end

  def touch
    client.chat_postMessage(channel: @channel, text: 'Start touch command from ruby client')
    begin
      client.chat_command(channel: @channel, command: COMMANDS[:touch])
    rescue => e
      client.chat_postMessage(channel: @channel, text: 'Command execution failure')
      puts e.full_message
      return false
    end

    puts 'waiting for a touch processed...'
    sleep 3

    last_message&.match?('打刻しました')
  end

  def last_message
    response = client.conversations_history(channel: @channel, limit: 1)
    case response
    in messages: [*_, { text: text }]
      puts "Last message: #{text}"
    end

    text
  end
end
