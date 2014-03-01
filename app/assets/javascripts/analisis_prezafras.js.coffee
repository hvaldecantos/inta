# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#analisis_prezafras').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#analisis_prezafras').data('source')
    oLanguage: spanish()
    aoColumns: [ null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, {bSortable: false, bVisible: true}, {bSortable: false, bVisible: true}, {bSortable: false, bVisible: true} ]

  $('#analisis_prezafras_laboratoristas').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#analisis_prezafras').data('source')
    oLanguage: spanish()
    aoColumns: [ null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, {bSortable: false, bVisible: true}, {bSortable: false, bVisible: true}, {bSortable: false, bVisible: true} ]

  $('.datepicker').datepicker({
    dateFormat: 'dd/mm/yy'
  });

  $('#analisis_prezafra_brix_pct').change -> 
    autocompletar_analisis()

  $('#analisis_prezafra_lectura_polar').change -> 
    autocompletar_analisis()

  autocompletar_analisis = () ->
    brix      = $('#analisis_prezafra_brix_pct').val()
    lect_pol  = $('#analisis_prezafra_lectura_polar').val()
    pol_jugo  = ((lect_pol) * 26) / (99.718 * (1 + 0.004 * brix))
    pureza    = (pol_jugo / brix) * 100
    pol_cania = (pol_jugo * 0.81)
    rto       = (1.4 - (40 / pureza)) * pol_jugo * 0.657
    $("#analisis_prezafra_pol_pct_jugo").val(pol_jugo.toFixed(2))
    $("#analisis_prezafra_pureza_pct").val(pureza.toFixed(2))
    $("#analisis_prezafra_pol_pct_cania").val(pol_cania.toFixed(2))
    $("#analisis_prezafra_rto_pct").val(rto.toFixed(2))
