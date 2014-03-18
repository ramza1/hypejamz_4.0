# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->
  if $('.pager').length
    $(window).scroll ->
      url = $('.pager .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pager').text("Loading...")
        $.getScript(url)
    $(window).scroll()

  $('.best_in_place').best_in_place()


jQuery ->
  Morris.Line
    element: 'downloads_chart'
    data: $('#downloads_chart').data('downloads')
    xkey: 'downloaded_at'
    ykeys: ['downloads']
    labels: ['Downloads']




