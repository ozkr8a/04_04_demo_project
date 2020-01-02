class ChattyOutput < ActiveRecord::Migration[5.0]

  def change
    puts "Hello from puts"
    say "Hello from say"
    say "Indented hello", true
    say_with_time 'Long process running' do
      sleep 5
    end

    suppress_messages do
      puts "Hello from puts"
      say "Hello from say"
      say "Indented hello", true
    end

  end

end
