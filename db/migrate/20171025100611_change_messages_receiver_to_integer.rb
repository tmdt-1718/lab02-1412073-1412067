class ChangeMessagesReceiverToInteger < ActiveRecord::Migration[5.1]
	def self.up
		change_column :messages, :receiver, 'integer USING CAST(receiver AS integer)' 
	end
	 
	def self.down
		change_column :messages, :receiver, :string
	end
end
