# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->


  empty_option       = $('<option />').attr('value', '')
  localidades        = $('#analisis_rsd_localidad_id').html()
  comunas_municipios = $('#analisis_rsd_comuna_municipio_id').html()
  parajes            = $('#analisis_rsd_paraje_id').html()
  promotores         = $('#analisis_rsd_promotor_id').html()


  cargar_promotores = () ->
    agente = $('#analisis_rsd_agente_id :selected').text()
    promotor_options = $(promotores).filter("optgroup[label='#{agente}']").html()
    
    if promotor_options
      $('#analisis_rsd_promotor_id').html(promotor_options)
    else
      $('#analisis_rsd_promotor_id').html(empty_option)

  cargar_dept_loc_com_par = () ->
    departamento = $('#analisis_rsd_departamento_id :selected').text()
    localidad_options = $(localidades).filter("optgroup[label='#{departamento}']").html()
    comunamunicipio_options = $(comunas_municipios).filter("optgroup[label='#{departamento}']").html()
    paraje_options = $(parajes).filter("optgroup[label='#{departamento}']").html()
    
    if localidad_options
      $('#analisis_rsd_localidad_id').html(localidad_options)
    else
      $('#analisis_rsd_localidad_id').empty()

    if comunamunicipio_options
      $('#analisis_rsd_comuna_municipio_id').html(comunamunicipio_options)
    else
      $('#analisis_rsd_comuna_municipio_id').empty()

    if paraje_options
      $('#analisis_rsd_paraje_id').html(paraje_options)
    else
      $('#analisis_rsd_paraje_id').empty()


  cargar_dept_loc_com_par()
  cargar_promotores()


  $('#analisis_rsd_departamento_id').change -> 
    cargar_dept_loc_com_par()    

  $('#analisis_rsd_agente_id').change -> 
    cargar_promotores()
