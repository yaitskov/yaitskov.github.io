self.addEventListener("fetch", (event) => {
  console.log("Service Worker Fetch event " + event.request.url);
  event.respondWith(
    caches.open("cache1").then(
      cache => cache.match(event.request, {ignoreSearch: true}).then(
        response => {
          if (response) {
            console.log("Found in cache: " + event.request.url);
            return response;
          } else {
            console.log("Network request: " + event.request.url);
            return fetch(event.request).then(
              ok => ok,
              (e) => {
                console.log("Offline fallback with 404", e);
                return cache.match("/404.html");
              });
          }
        }))
  );
});

self.addEventListener('install', (event) => {
  console.log("Start install worker " + new Date());
  event.waitUntil(
    caches.delete("cache1")
      .then(ok => {
        console.log("Previous cache is cleaned: " + ok);
        caches.open("cache1").then(cache => {
          return cache.addAll(
            [ /* site.pages enumerates css and html */'/404.html','/getting-started/index.html',
              '/getting-started/','/google-search/index.html',
              '/google-search/','/haddock/index.html',
              '/haddock/','/index.html',
              '/','/assets/css/just-the-docs-dark.css','/assets/css/just-the-docs-default.css','/assets/css/just-the-docs-light.css','/assets/js/just-the-docs.js','/manifest.json','/offline-service-worker.js','/assets/css/style.css','/tutorial/index.html',
              '/tutorial/','/user-manual/index.html',
              '/user-manual/','/assets/js/search-data.json','/robots.txt',/* site.static_files enumerates images and js */'/assets/images/dark-background-waves.jpg','/assets/images/just-the-docs.png','/assets/images/logo-and-name.svg','/assets/images/logo-gem-100.png','/assets/images/search.svg','/assets/images/touch-icon/logo-120.png','/assets/images/touch-icon/logo-150.png','/assets/images/touch-icon/logo-152.png','/assets/images/touch-icon/logo-180.png','/assets/images/touch-icon/logo-196.png','/assets/images/touch-icon/logo-310.png','/assets/images/touch-icon/logo-70.png','/assets/images/touch-icon/logo-76.png','/assets/js/copy.js','/assets/js/vendor/lunr.min.js','/base.scss','/buttons.scss','/code.scss','/favicon.ico' /* fix trailing comma */
            ]
          );
        });
      })
  );
});
