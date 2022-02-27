class AddArchivedToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :archived, :boolean
  end
end
