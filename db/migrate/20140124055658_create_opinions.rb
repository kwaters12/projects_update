class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.text :body
      t.references :discussion, index: true

      t.timestamps
    end
  end
end
