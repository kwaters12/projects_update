class AddHitCountToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :hit_count, :integer, default: 0
  end
end
