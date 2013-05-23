class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages, :force => true do |t|
      t.string :message_text, :limit => 2000
    end
  end

  def self.down
    drop_table :messages
  end
end
