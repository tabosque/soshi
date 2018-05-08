$(function() {
  $("#post_image").change(function(){
    var image = $(this).prop('files')[0];
    var reader = new FileReader();
    reader.onload = function() {
      $('#image-preview img').attr('src', reader.result);
    }
    reader.readAsDataURL(image);
  });
});