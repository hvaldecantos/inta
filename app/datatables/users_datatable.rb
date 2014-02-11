require "#{Rails.root}/app/helpers/application_helper.rb"

class UsersDatatable
  include ApplicationHelper

  delegate :params, :h, :link_to, :edit_user_path, :l, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: User.count,
      iTotalDisplayRecords: users.total_entries,
      aaData: data
    }
  end

private

  def data
    data = []
    users.map do |user|
      a = []
      a << user.email
      a << user.persona.nombre
      a << user.last_sign_in_at
      a << user.sign_in_count
      a << mostrar_editar_borrar_data(@view, user)
      data << a.flatten
    end
    data
  end

  def users
    @users ||= fetch_users
  end

  def fetch_users
    users = User.joins(:persona).order("#{sort_column} #{sort_direction}")
    users = users.page(page).per_page(per_page)
    if params[:sSearch].present?
      users = users.joins(:persona).
                      where("users.email LIKE :search OR " +
                        "personas.nombre LIKE :search OR " + 
                        "CAST(users.last_sign_in_at AS TEXT) LIKE :search OR " +
                        "CAST(users.sign_in_count AS TEXT) LIKE :search", search: "%#{params[:sSearch]}%")
    end
    users
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[users.email
                 personas.nombre
                 users.last_sign_in_at
                 users.sign_in_count]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end

