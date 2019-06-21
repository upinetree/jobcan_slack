require 'slack'

class JobCanSlack
  COMMANDS = {
    touch: '/jobcan_touch',
    worktime: '/jobcan_worktime',
    test: '/shrug'
  }

  WAITING_RESPONSE_SECONDS = 3

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
      raise e.full_message
    end

    wait_response

    last_message&.match?('打刻しました')
  end

  def worktime
    begin
      client.chat_command(channel: @channel, command: COMMANDS[:worktime])
    rescue => e
      client.chat_postMessage(channel: @channel, text: 'Command execution failure')
      raise e.full_message
    end

    wait_response

    last_message
  end

  def last_message
    response = client.conversations_history(channel: @channel, limit: 1)
    case response
    in messages: [*_, { text: text }]
      puts "Last message: #{text}"
    end

    text
  end

  private

  def wait_response
    puts 'waiting for a response...'
    sleep WAITING_RESPONSE_SECONDS
  end
end
