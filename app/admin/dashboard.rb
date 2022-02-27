# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # columns do
    #   column do
    #     panel 'Recent Notes' do
    #       ul do
    #         Note.order(created_at: :desc).first(5).map do |note|
    #           li link_to(note.title, admin_note_path(note))
    #         end
    #       end
    #     end
    #   end
    #   column do
    #     panel 'Info' do
    #       para 'Welcome to your notes application. It is powered by Ruby on Rails and ActiveAdmin.'
    #     end
    #   end
    # end

    # columns do
    #   column do
    #     panel 'Your Categories' do
    #       ul do
    #         Category.order(name: :asc).map do |category|
    #           li link_to(category.name, admin_category_path(category))
    #         end
    #       end
    #     end
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Your Notes" do
          ul do
            Note.order(created_at: :desc).first(5).map do |note|
              li link_to(note.title, admin_note_path(note))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end

  end
end
