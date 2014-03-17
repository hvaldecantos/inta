# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#analisis_rsds').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sDom: 'l<"#date_filter">frtip'
    sAjaxSource: $('#analisis_rsds').data('source')
    oLanguage: spanish()
    aoColumns: add_mostrar_editar_borrar_to([ null, null, null, null, null, null, null, null, null])
    fnServerParams: (aoData) ->
      aoData.push
        name: $('#filter').attr('name')
        value: $('#filter').val()
  
  $('<label class="dataTables_length" style="margin-left:50px">Fecha ingreso: <input id="filter" type="text" style="width: 100px" name="filter"></label>').appendTo($('#date_filter'))

  $('#filter').change -> 
    $('#analisis_rsds').dataTable().fnDraw()

  $('#filter').keypress (e) ->
    if(e.which == 13)
      $('#analisis_rsds').dataTable().fnDraw()

  $('.datepicker').datepicker({
    dateFormat: 'dd/mm/yy'
  });

  $('.edit_analisis_rsd').submit ->
    $('#analisis_rsd_departamento_id').attr('disabled', false)

  $('.new_analisis_rsd').submit ->
    $('#analisis_rsd_departamento_id').attr('disabled', false)

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
    comuna_municipio = $('#analisis_rsd_comuna_municipio_id :selected').text()
    paraje_options = $(parajes).filter("optgroup[label='#{comuna_municipio}']").html()
    
    if localidad_options
      $('#analisis_rsd_localidad_id').html(localidad_options)
    else
      $('#analisis_rsd_localidad_id').empty()

    if paraje_options
      $('#analisis_rsd_paraje_id').html(paraje_options)
    else
      $('#analisis_rsd_paraje_id').empty()

  controlar_analizado = () ->
    if $('#analisis_rsd_analizado').is(':checked')
      $("#analisis_rsd_fecha_analisis").attr('disabled', false)
      $("#analisis_rsd_incidencia").attr('disabled', false)
    else
      $("#analisis_rsd_fecha_analisis").attr('disabled', true)
      $("#analisis_rsd_fecha_analisis").val("")
      $("#analisis_rsd_incidencia").attr('disabled', true)
      $("#analisis_rsd_incidencia").val("")

  selecionar_departamento = (id) ->
    id = Math.floor(id/10000)
    $('#analisis_rsd_departamento_id').val(id)

  cargar_dept_loc_com_par()
  cargar_promotores()
  controlar_analizado()

  $('#analisis_rsd_comuna_municipio_id').change ->
    selecionar_departamento($('#analisis_rsd_comuna_municipio_id').val())
    cargar_dept_loc_com_par()

  $('#analisis_rsd_agente_id').change -> 
    cargar_promotores()

  $('#analisis_rsd_analizado').change -> 
    controlar_analizado()
