class AddCategoryToJobs < ActiveRecord::Migration
  def change    
    add_index :jobs, :category_id
  end
end
