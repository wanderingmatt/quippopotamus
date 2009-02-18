class ChangeQuipsToTextarea < ActiveRecord::Migration
  def self.up
    change_column :quips, :body, :text
  end

  def self.down
    change_column :quips, :body, :string
  end
end
