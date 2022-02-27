ActiveAdmin.register Category do
  permit_params :name, note_ids: []

  show title: "My title" do
    h3 'You have ' + pluralize(category.notes.count, 'note') + ' for this category.'
    category.notes.each do |note|
      div do
        h1 note.title
        h4 link_to "[#{note.id}]: You created this note on #{note.created_at.strftime('%v %r')}", admin_note_path(note)
      end
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
