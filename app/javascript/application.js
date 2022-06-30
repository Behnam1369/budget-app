// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
(function () {
  var file = document.querySelector('.file');

  group_icon.onchange = evt => {
    const [file] = group_icon.files
    if (file) {
      preview.src = URL.createObjectURL(file)
    }
  }

  document.querySelector('.btn_file').addEventListener('click', () => {
    file.click();
  });
})();