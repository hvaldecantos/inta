require "#{Rails.root}/app/helpers/application_helper.rb"

class AnalisisRsdsDatatable
  include ApplicationHelper
  
  delegate :params, :h, :link_to, :edit_analisis_rsd_path, :l, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: AnalisisRsd.count,
      iTotalDisplayRecords: analisis_rsds.total_entries,
      aaData: data
    }
  end

private

  def data
    data = []
    analisis_rsds.each do |analisis_rsd|
      a = []
      a << analisis_rsd.identificacion
      a << (l(analisis_rsd.fecha_ingreso) unless analisis_rsd.fecha_ingreso.nil?)
      a << (l(analisis_rsd.fecha_analisis) unless analisis_rsd.fecha_analisis.nil?)
      a << (analisis_rsd.cania_variedad.nombre unless analisis_rsd.cania_variedad.nil?)
      a << analisis_rsd.procedencia_id
      a << analisis_rsd.agente.apellido_nombre
      a << analisis_rsd.promotor.apellido_nombre
      a << analisis_rsd.laboratorista.apellido_nombre
      a << analisis_rsd.incidencia
      a << analisis_rsd.analizado
      a << mostrar_editar_borrar_data(@view, analisis_rsd)
      data << a.flatten
    end
    data
  end

  def analisis_rsds
    @analisis_rsds ||= fetch_analisis_rsds
  end

  def fetch_analisis_rsds
    analisis_rsds = AnalisisRsd.includes(:agente, :promotor, :laboratorista, :cania_variedad).
                                mi_vista(@view.current_user.persona.id, @view.cookies[:mi_vista]).
                                where("TO_CHAR(fecha_ingreso, 'DD/MM/YYYY') LIKE :search", search: "%#{params[:filter]}%").
                                order("#{sort_column} #{sort_direction}")

    analisis_rsds = analisis_rsds.page(page).per_page(per_page)
    if params[:sSearch].present?
      analisis_rsds = analisis_rsds.where(
                        "identificacion LIKE :search OR " +
                        "personas.nombre LIKE :search OR personas.apellido LIKE :search OR " +
                        "promotores_analisis_rsds.nombre LIKE :search OR promotores_analisis_rsds.apellido LIKE :search OR " +
                        "laboratorista_analisis_rsds.nombre LIKE :search OR laboratorista_analisis_rsds.apellido LIKE :search OR " +
                        "CAST(analisis_rsds.incidencia AS TEXT) like :search OR " +
                        "CAST(analizado AS TEXT) like :search OR " +
                        "cania_variedades.nombre LIKE :search", search: "%#{params[:sSearch]}%")
    end
    analisis_rsds
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[analisis_rsds.fecha_ingreso 
                 analisis_rsds.fecha_analisis 
                 cania_variedades.nombre 
                 procedencia_id 
                 (personas.nombre,personas.apellido) 
                 (promotores_analisis_rsds.nombre,promotores_analisis_rsds.apellido) 
                 (laboratorista_analisis_rsds.nombre,laboratorista_analisis_rsds.apellido) 
                 incidencia 
                 analizado]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "asc" : "desc"
  end
end

