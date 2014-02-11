require "#{Rails.root}/app/helpers/application_helper.rb"

class ProductoresDatatable
  include ApplicationHelper

  delegate :params, :h, :link_to, :edit_productor_path, :l, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Productor.count,
      iTotalDisplayRecords: productores.total_entries,
      aaData: data
    }
  end

private

  def data
    data = []
    productores.map do |productor|
      a = []
      a << productor.nombre
      a << productor.apellido
      a << productor.dni
      a << productor.departamento.nombre
      a << productor.comuna_municipio.nombre
      a << productor.agencia
      a << productor.email_extensionista
      a << mostrar_editar_borrar_data(@view, productor)
      data << a.flatten
    end
    data
  end

  def productores
    @productores ||= fetch_productores
  end

  def fetch_productores
    productores = Productor.joins(:departamento, :comuna_municipio).order("#{sort_column} #{sort_direction}")
    productores = productores.page(page).per_page(per_page)
    if params[:sSearch].present?
      productores = productores.joins(:departamento, :comuna_municipio).
                      where("productores.nombre LIKE :search OR productores.apellido LIKE :search OR " +
                        "productores.dni LIKE :search OR " + 
                        "departamentos.nombre LIKE :search OR " +
                        "comunas_municipios.nombre LIKE :search OR " +
                        "productores.agencia LIKE :search OR " +
                        "productores.email_extensionista LIKE :search", search: "%#{params[:sSearch]}%")
    end
    productores
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[productores.nombre
                 productores.apellido
                 productores.dni
                 departamentos.nombre
                 comunas_municipios.nombre
                 productores.agencia
                 productores.email_extensionista]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end

