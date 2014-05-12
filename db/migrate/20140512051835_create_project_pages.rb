class CreateProjectPages < ActiveRecord::Migration
  def change
    create_table :project_pages do |t|
      t.string :title
      t.string :subtitle
      t.text :description

      t.timestamps
    end
  end
end
