class AddLikeToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :like_counter, :integer, default: 0
  end
end
