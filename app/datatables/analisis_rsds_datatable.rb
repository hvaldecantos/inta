

class AnalisisRsdsDatatable
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
    analisis_rsds.map do |analisis_rsd|
      [ (l(analisis_rsd.fecha_ingreso) unless analisis_rsd.fecha_ingreso.nil?),
        (l(analisis_rsd.fecha_analisis) unless analisis_rsd.fecha_analisis.nil?),
        (analisis_rsd.cania_variedad.nombre unless analisis_rsd.cania_variedad.nil?),
        analisis_rsd.procedencia_id,
        analisis_rsd.agente.apellido_nombre,
        analisis_rsd.promotor.apellido_nombre,
        analisis_rsd.laboratorista.apellido_nombre,
        analisis_rsd.incidencia,
        analisis_rsd.analizado,
        link_to('Mostrar', analisis_rsd),
        link_to('Editar', edit_analisis_rsd_path(analisis_rsd)),
        link_to('Borrar', analisis_rsd, method: :delete, data: { confirm: 'Esta seguro?' })
      ]
    end
  end

  def analisis_rsds
    @analisis_rsds ||= fetch_analisis_rsds
  end

  def fetch_analisis_rsds
    analisis_rsds = AnalisisRsd.joins(:agente, :promotor, :laboratorista, :cania_variedad).
                                order("#{sort_column} #{sort_direction}")

    analisis_rsds = analisis_rsds.page(page).per_page(per_page)
    if params[:sSearch].present?
      analisis_rsds = analisis_rsds.joins(:agente, :promotor, :laboratorista, :cania_variedad).
                      where("personas.nombre LIKE :search OR personas.apellido LIKE :search OR " +
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
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end

