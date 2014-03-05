function spanish(){
  return {
      sProcessing:     "Procesando...",
      sLengthMenu:     "Mostrar _MENU_ registros",
      sZeroRecords:    "No se encontraron resultados",
      sEmptyTable:     "Ningún dato disponible en esta tabla",
      sInfo:           "Registros del _START_ al _END_ de un total de _TOTAL_",
      sInfoEmpty:      "Registros del 0 al 0 de un total de 0",
      sInfoFiltered:   "(filtrado de un total de _MAX_ registros)",
      sInfoPostFix:    "",
      sSearch:         "Buscar:",
      sUrl:            "",
      sInfoThousands:  ",",
      sLoadingRecords: "Cargando...",
      oPaginate: {
          sFirst:    "Primero",
          sLast:     "Último",
          sNext:     "Siguiente",
          sPrevious: "Anterior"
      },
      oAria: {
          sSortAscending:  ": Activar para ordenar la columna de manera ascendente",
          sSortDescending: ": Activar para ordenar la columna de manera descendente"
      }
    };
  }

function add_mostrar_editar_borrar_to(columns_properties){
  if($('#can_read').val()=='true')
    columns_properties.push({bSortable: false, bVisible: true});
  if($('#can_update').val()=='true')
    columns_properties.push({bSortable: false, bVisible: true});
  if($('#can_destroy').val()=='true')
    columns_properties.push({bSortable: false, bVisible: true});
    
  return columns_properties;
}
