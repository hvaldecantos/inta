# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->  
  $('#productores').dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#productores').data('source')
    oLanguage: spanish()
    aoColumns: [ null, null, null, null, null, null, null, {bSortable: false, bVisible: true}, {bSortable: false, bVisible: true}, {bSortable: false, bVisible: true} ]
