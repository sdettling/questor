jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $("#slider-range").slider
    range: true
    min: 1
    max: 4
    values: [1, 2]
    slide: (event, ui) ->
      $("#amount").val "$" + ui.values[0] + " - $" + ui.values[1]

  $("#amount").val "$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1)

  $("ul.droptrue").sortable
      connectWith: "ul"
 
  $("#sortable1, #sortable2").disableSelection