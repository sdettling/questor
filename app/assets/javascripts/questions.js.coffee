jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    $("#slider-range").slider
      min: 1
      max: $("fieldset").length
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $("#slider-range").slider
      min: 1
      max: $("fieldset").length
    event.preventDefault()

  $("#slider-range").slider
    range: true
    min: 1
    max: 1
    values: [1, 1]
    slide: (event, ui) ->
      $("#question_min_selections").val ui.values[0]
      $("#question_max_selections").val ui.values[1]
  
  $("#question_min_selections").val($("#slider-range").slider("values", 0))
  $("#question_max_selections").val($("#slider-range").slider("values", 1))
