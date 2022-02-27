ActiveAdmin.register Note do

  permit_params :title, :content, :category_id, :archived

  form title: 'Notes App' do |f|
    f.inputs 'Note' do
      f.input :category
      f.input :title
      f.input :content, as: :quill_editor
      f.input :archived
    end
    f.actions
  end

  show title: 'Your Note' do
    h1 link_to note.title, admin_notes_path
    h4 link_to note.category.name, admin_category_path(note.category)
    div(class: 'note-content') do
      raw note.content
    end
    h5 note.archived? ? 'Archived' : 'Not Archived', admin_notes_path

  end

  index do
    selectable_column
    column :category
    column 'Title' do |note|
      link_to note.title, admin_note_path(note)
    end
    column 'Content' do |note|
      raw note.content.truncate_words(25)
    end
    column :archived do|note|
      note.archived? ? 'Yes' : 'No'
  end
    column :created_at
    column :updated_at
    actions
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :content, :category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :content, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
