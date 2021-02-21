require 'telegram/bot'
require_relative '../token'
require_relative 'quotes'
require_relative 'jokes'
class Bot
  def initilize
    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        case message.text
        when /hi/i
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hello, #{message.from.first_name}, I am Ari's Chatbot! and i speak on behalf of him right now im expermintal and new")
        when /info/i
          bot.api.send_message(chat_id: message.chat.id,
                               text: 'I am is 22 years old, Ihave bachelor degree in Nursing and after University i desided to join Microverse, Right now i am so happy of studying and learning')
        when /quote/i
          quote = Quotes.new.random_quote
          bot.api.send_message(chat_id: message.chat.id, text: (quote['text']).to_s, date: message.date)
        when /joke/i
          bot.api.send_message(chat_id: message.chat.id, text: JOKE.read_body[82..-4], date: message.date)
        else
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Sorry, I don't understand '#{message.text}'. I only understand `Hi` `info` `quote` and `joke`")
        end
      end
    end
  end
end
