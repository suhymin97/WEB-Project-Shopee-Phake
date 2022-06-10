const shopcheckbox = document.getElementById('shopcheckbox');
shopcheckbox.addEventListener('change', (event) => {
    var mid = $('.shopcheckbox:checked').val();
    var checkboxes = document.getElementsByName('mid');
    if (event.currentTarget.checked) {
        for (var i = 0; i < checkboxes.length; i++){
            checkboxes[i].checked = true;
        }
      } else {
        for (var i = 0; i < checkboxes.length; i++){
            checkboxes[i].checked = false;
        }
      }
});