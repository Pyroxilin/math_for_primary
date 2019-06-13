$(document).ready(function() {
  $(window).keypress(function(e){
    var key = e.keyCode ? e.keyCode : e.which;
    if (key == 83) {// shift+s
      var lorem = document.querySelector('.lorem-ipsum')
      var truth = document.querySelector('.absolute-truth')

      if (lorem) { lorem.classList.toggle('d-none') }
      if (truth) { truth.classList.toggle('d-none') }
    }
  })
})
