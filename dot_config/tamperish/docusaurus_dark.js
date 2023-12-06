// Docusaurus is a constant annoyance that doesn't respect my gd preferences.
if (document.getElementById('__docusaurus')) {
  console.log('docusaurus found');

  var desiredMode = 'dark';
  if (matchMedia('(prefers-color-scheme: light)').matches) {
    desiredMode = 'light';
  }

  var data_theme_is_correct = false;
  document.querySelectorAll('[data-theme^="' + desiredMode + '"').forEach(function(el) {
    data_theme_is_correct = true;
  });

  // Just respect my gd preferences.
  if (!data_theme_is_correct && localStorage.getItem('theme') != desiredMode) {
    console.log('overriding theme and reloading the page');
    localStorage.setItem('theme', desiredMode);
    location.reload();
  }

  // When the color mode changes, respect my gd preferences.
  window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', function(e) {
    console.log('color mode changed. reloading the page.');
    location.reload();
  });

  // The light/dark mode toggle is not necessary. Just respect my gd preferences.
  document.querySelectorAll('[class^="colorModeToggle"],[class*=" colorModeToggle"]').forEach(function(el) {
    el.style.display = 'none';
  });
}
