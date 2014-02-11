# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#cania_variedades').dataTable
    sPaginationType: "full_numbers"
    oLanguage: spanish()
    aoColumns: [ null, null, {bSortable: false, bVisible: true}, {bSortable: false, bVisible: true}, {bSortable: false, bVisible: true} ]
