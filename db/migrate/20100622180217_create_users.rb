class CreateUsers < ActiveRecord::Migration
 # using(:master, :slave1, :slave2, :slave3, :slave4)
  
  def self.up
    create_table :users do |t|
      t.string :name
      t.date :birthday

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
