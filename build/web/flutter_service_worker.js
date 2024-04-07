'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "c9b8ce40fb412088e51a78b7851122c9",
"index.html": "9f5a7f57ea09fde1828f86c3ed3088b0",
"/": "9f5a7f57ea09fde1828f86c3ed3088b0",
"main.dart.js": "307744c8f1ac898c0a639b770d5418f1",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "3e0e32465565c1d9e15ddd2357b3a334",
"assets/AssetManifest.json": "d52742c0eb41d070cc65f1268d592695",
"assets/NOTICES": "e6d7b9a006cbe5e0e5e0f22705b1ce7a",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "c60020fee8a78e43084b225c7406f4a8",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "1b54d1ff5a9b24ad11befa135bbec1d3",
"assets/fonts/MaterialIcons-Regular.otf": "ac57617271f22d9968464dc06a71bb2a",
"assets/assets/songs/beautiful.mp3": "379e1c993b3ebcbbf9dd5b6f3a856573",
"assets/assets/songs/whistle_joyride.mp3": "77193f3138a5b9fd75fad39c7a8bc8b2",
"assets/assets/songs/enchanted_chimes.mp3": "d1b49c5864f3443089305ea9a1f03901",
"assets/assets/songs/good_night.mp3": "6736b1f7f0aadf3368634c7d4a695d65",
"assets/assets/songs/sunshine_bliss.mp3": "2aaafac4ead47cd693a4d7f562acac8a",
"assets/assets/songs/futuristic_beat.mp3": "290523affa1536d5bd57f2cd48ab1c8c",
"assets/assets/songs/drive_breakbeat.mp3": "f20026f53d0c27d09845bd7cd8cec9c4",
"assets/assets/songs/better_day.mp3": "d8ef2e79f06d93f596693e2264be578d",
"assets/assets/songs/solitude_dark_ambient_electronic.mp3": "8bf9d6f0af888b6df6878745058eef88",
"assets/assets/songs/science_documentary.mp3": "a811d6804f99dca61e6733fa12839eed",
"assets/assets/songs/titanium.mp3": "24ab41bce2ede6d45831f25817c3d47f",
"assets/assets/songs/once_in_paris.mp3": "8607c3421dc98639891737a74c3535ad",
"assets/assets/songs/sunrise_groove.mp3": "a2e1d24edb10110b1816e5b3d6cb6977",
"assets/assets/songs/leva_eternity.mp3": "6d7973e45999ac48733cfe178ad674c4",
"assets/assets/songs_icon/8.jpg": "042bae9329ac064af6de0faf4243e30d",
"assets/assets/songs_icon/9.jpg": "c2548b5929cfc129b08178dad97015b7",
"assets/assets/songs_icon/14.jpg": "f72ab58390ede45082a01cde7736d63b",
"assets/assets/songs_icon/12.jpg": "42204b1603f6c25a79f8468b2b477676",
"assets/assets/songs_icon/13.jpg": "65ce0cdc91e1b4ece99d49d5b3b0f493",
"assets/assets/songs_icon/11.jpg": "a145e217d16a52a9738872a867b5ad4e",
"assets/assets/songs_icon/10.jpg": "cab5387b1f618703acf882cf080faf68",
"assets/assets/songs_icon/4.jpg": "fa325d7d4cb4e1c9d62608d005568397",
"assets/assets/songs_icon/5.jpg": "08fc23ffc23cf651fc443a489966f2c4",
"assets/assets/songs_icon/7.jpg": "337a62186c66f6f5bf0c1b5a4016e72d",
"assets/assets/songs_icon/6.jpg": "0b98de939cc80fecf572897ca6ef93c6",
"assets/assets/songs_icon/2.jpg": "ff686978f0da3b00a9ff447175c58fd6",
"assets/assets/songs_icon/3.jpg": "3dbed242feffc1360e271456d3468dfb",
"assets/assets/songs_icon/1.jpg": "9c195f98d2e4615d0a35669bc95cc3e8",
"assets/assets/json/songs_list.json": "77c0af6a1dcb8d1cf23b68912093ab52",
"assets/assets/icon/logo.png": "78613c8297d3c3cc6ef496b47894756f",
"assets/assets/icon/love.png": "939fc45190141ad0979665acf2591d36",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
