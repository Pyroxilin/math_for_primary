$(document).on('turbolinks:load', function() {
  console.log($)
  $(window).keypress(function(e){
    var key = e.keyCode ? e.keyCode : e.which;
    if (key == 83) {// shift+s
      document.querySelector('.lorem-ipsum').classList.toggle('d-none')
      document.querySelector('.absolute-truth').classList.toggle('d-none')
    }
  })
})
