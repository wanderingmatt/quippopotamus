class ChangeQuipAuthorToId < ActiveRecord::Migration
  def self.up
    remove_column :quips, :author
    add_column    :quips, :author_id, :integer
  end

  def self.down
    remove_column :quips, :author_id
    add_column    :quips, :author, :string
  end
end
