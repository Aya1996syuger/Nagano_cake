class RemoveOntroductionFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :ontroduction, :text
  end
end
