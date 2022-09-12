class FixColumnName < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :comments, :author_id, :user_id
  end
end
