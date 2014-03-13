require "#{Rails.root}/app/helpers/application_helper.rb"

class AnalisisPrezafrasDatatable
  include ApplicationHelper
  
  delegate :params, :h, :link_to, :edit_analisis_rsd_path, :l, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: AnalisisPrezafra.count,
      iTotalDisplayRecords: analisis_prezafras.total_entries,
      aaData: data
    }
  end

private

  def data
    data = []
    analisis_prezafras.each do |analisis_prezafra|
      a = []
      a << ("<span class='glyphicon icon-ok'></span>".html_safe unless analisis_prezafra.datos_completos? @view.current_user)
      a << analisis_prezafra.identificacion
      a << l(analisis_prezafra.fecha_inicio)
      a << (l(analisis_prezafra.fecha_extraccion) unless analisis_prezafra.fecha_extraccion.nil?)
      a << (l(analisis_prezafra.fecha_ingreso) unless analisis_prezafra.fecha_ingreso.nil?)
      a << (l(analisis_prezafra.fecha_analisis) unless analisis_prezafra.fecha_analisis.nil?)
      a << if analisis_prezafra.productor_id.nil? then " " else analisis_prezafra.productor.apellido_nombre end
      a << if analisis_prezafra.agente_id.nil? then " " else analisis_prezafra.agente.apellido_nombre end
      a << if analisis_prezafra.promotor_id.nil? then " " else analisis_prezafra.promotor.apellido_nombre end
      a << if analisis_prezafra.laboratorista_id.nil? then " " else analisis_prezafra.laboratorista.apellido_nombre end
      a << if analisis_prezafra.cania_variedad.nil? then " " else analisis_prezafra.cania_variedad.nombre end
      a << analisis_prezafra.brix_pct
      a << analisis_prezafra.lectura_polar
      a << analisis_prezafra.rto_pct
      a << analisis_prezafra.estado
      a << mostrar_editar_borrar_data(@view, analisis_prezafra)
      data << a.flatten
    end
    data
  end

  def analisis_prezafras
    @analisis_prezafras ||= fetch_analisis_rsds
  end

  def fetch_analisis_rsds                # use .includes for Left OUTER JOIN
    analisis_prezafras = AnalisisPrezafra.includes(:productor, :agente, :promotor, :laboratorista, :cania_variedad).
                                order("#{sort_column} #{sort_direction}")

    analisis_prezafras = analisis_prezafras.page(page).per_page(per_page)
    if params[:sSearch].present?
      analisis_prezafras = analisis_prezafras.where(
                        "identificacion LIKE :search OR " +
                        "personas.nombre LIKE :search OR personas.apellido LIKE :search OR " +
                        "productores.nombre LIKE :search OR productores.apellido LIKE :search OR " +
                        "promotores_analisis_prezafras.nombre LIKE :search OR promotores_analisis_prezafras.apellido LIKE :search OR " +
                        "laboratorista_analisis_prezafras.nombre LIKE :search OR laboratorista_analisis_prezafras.apellido LIKE :search OR " +
                        "cania_variedades.nombre LIKE :search OR " +
                        "CAST(brix_pct AS TEXT) like :search OR " +
                        "CAST(lectura_polar AS TEXT) like :search OR " +
                        "CAST(rto_pct AS TEXT) like :search OR " +
                        "estado like :search", search: "%#{params[:sSearch]}%")
    end
    analisis_prezafras
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = ["((analisis_prezafras.fecha_extraccion is null) or (analisis_prezafras.productor_id is null) or " +
               "(analisis_prezafras.promotor_id is null) or (analisis_prezafras.lonlat is null))",
               "analisis_prezafras.identificacion",
               "analisis_prezafras.fecha_inicio",
               "analisis_prezafras.fecha_extraccion",
               "analisis_prezafras.fecha_ingreso",
               "analisis_prezafras.fecha_analisis",
               "(productores.nombre,productores.apellido)",
               "(personas.nombre,personas.apellido)",
               "(promotores_analisis_prezafras.nombre,promotores_analisis_prezafras.apellido)",
               "(laboratorista_analisis_prezafras.nombre,laboratorista_analisis_prezafras.apellido)",
               "cania_variedades.nombre",
               "analisis_prezafras.brix_pct",
               "analisis_prezafras.lectura_polar",
               "analisis_prezafras.rto_pct",
               "analisis_prezafras.estado"
              ]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end

