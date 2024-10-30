class TelegramWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def callback
    token = ENV["TELEGRAM_API_TOKEN"]
    bot = Telegram::Bot::Client.new(token)

    if params[:message]
      chat_id = params[:message][:chat][:id]
      text = params[:message][:text]

      response_text = handle_message(text)
      bot.api.send_message(chat_id: chat_id, text: response_text)
    end

    head :ok
  end

  private

  def handle_message(text)
    case text
    when "/start"
      "Hello! I can help you set reminders."
    else
      "Command not recognized."
    end
  end
end