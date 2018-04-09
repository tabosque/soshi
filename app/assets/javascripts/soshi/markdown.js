$(document).ready(function() {
  $('textarea.soshi-markdown').each(function() {
    var $targetTextArea = $(this);
    $targetTextArea.wrap('<div class="soshi-markdown-wrapper" />');
    var buttons = '\
      <div class="btn-group btn-group-sm" role="group" aria-label="...">\
        <button type="button" class="btn btn-default" data-tag="## ">h2</button>\
        <button type="button" class="btn btn-default" data-tag="### ">h3</button>\
        <button type="button" class="btn btn-default" data-tag="**STRPONG**">strong</button>\
        <button type="button" class="btn btn-default" data-tag="> BLOCKQUOTES\n"><i class="fas fa-quote-left"></i></button>\
        <button type="button" class="btn btn-default" data-tag="- \n- \n"><i class="fas fa-list-ul"></i></button>\
        <button type="button" class="btn btn-default" data-tag="1. \n2. \n"><i class="fas fa-list-ol"></i></button>\
        <button type="button" class="btn btn-default" data-tag="[TEXT](URL)"><i class="fas fa-link"></i></button>\
        <button type="button" class="btn btn-default" data-tag="![ALT](URL)"><i class="fas fa-image"></i></button>\
      </div>';
    $targetTextArea.before(buttons);
  });
});

$(document).on('click', '.soshi-markdown-wrapper button', function () {
  var $clickedButton = $(this);
  var $targetTextArea = $('textarea.soshi-markdown');
  insertAtCaret($targetTextArea, $clickedButton.data('tag'));
});

function insertAtCaret(target, tag) {
  var $target = $(target);
  $target.focus();
  if(navigator.userAgent.match(/MSIE/)) {
    var r = document.selection.createRange();
    r.text = tag;
    r.select();
  } else {
    var s = $target.val();
    var p = $target.get(0).selectionStart;
    var np = p + tag.length;
    $target.val(s.substr(0, p) + tag + s.substr(p));
    $target.get(0).setSelectionRange(np, np);
  }
}