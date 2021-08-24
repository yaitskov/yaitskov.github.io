// assets/js/post.js
var codeBlocks = document.querySelectorAll('.copiable pre.highlight');

codeBlocks.forEach(function (codeBlock) {
  var copyButton = document.createElement('button');
  copyButton.className = 'copy';
  copyButton.type = 'button';
  copyButton.ariaLabel = 'Copy code to clipboard';
  copyButton.innerText = 'Copy';

  var p = codeBlock.parentNode.parentNode;
  p.parentNode.insertBefore(copyButton, p);

  copyButton.addEventListener('click', function () {
    var code = codeBlock.querySelector('code').innerText.trim();
    window.navigator.clipboard.writeText(code);

    copyButton.innerText = 'Copied';
    copyButton.classList.add('copied');
    var fourSeconds = 4000;

    setTimeout(function () {
      copyButton.innerText = 'Copy';
      copyButton.classList.remove('copied');
    }, fourSeconds);
  });
});
