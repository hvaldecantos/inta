module ApplicationHelper
  def full_title(page_title)
    base_title = "Sitio Web INTA Famaillá"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def mostrar_editar_borrar_headers(a_model)
    html = ""
    html += "<th></th>" unless cannot? :read, a_model
    html += "<th></th>" unless cannot? :update, a_model
    html += "<th></th>" unless cannot? :destroy, a_model
    html.html_safe
  end
  
  def mostrar_editar_borrar_data(a_view, an_object)
    icon = "<span class='glyphicon :glyphicon'></span>"
    data = []
    data << a_view.link_to(icon.gsub(/:glyphicon/, "icon-zoom-in").html_safe, an_object)
    data << a_view.link_to(icon.gsub(/:glyphicon/, "icon-edit").html_safe, eval("a_view.edit_#{an_object.class.to_s.underscore}_path(an_object)")) unless @view.cannot?(:update, an_object)
    data << a_view.link_to(icon.gsub(/:glyphicon/, "icon-remove").html_safe, an_object, method: :delete, data: { confirm: 'Esta seguro?' }) unless @view.cannot?(:destroy, an_object)
    data
  end
end
