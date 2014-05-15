class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :project_id
      t.string :title
      t.string :subtitle
      t.string :description
      t.decimal :goal
      t.date :end

      t.timestamps
    end
  end
end
