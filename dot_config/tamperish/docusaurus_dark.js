  if (document.getElementById('__docusaurus')) {
    console.log('docusaurus found');

    if (localStorage.getItem('theme') != 'dark') {
      console.log('overriding theme and reloading the page');
      localStorage.setItem('theme', 'dark');
      location.reload();
    }
  }
