'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "94dfc90d948ecdd9987e4ff67e219d11",
"assets/AssetManifest.bin.json": "b4b02ccc0b08eff92e90dfdbe6cfc223",
"assets/AssetManifest.json": "384a2f848654f7f29f15fe35c32e4825",
"assets/assets/animations/DOD_Hero_Animation.json": "521911d10b05d9045056afb437378234",
"assets/assets/animations/DOD_Hero_Animation.lottie": "02918ed3e4a56c6a04b618f8a7746cef",
"assets/assets/images/24_7support.svg": "99cbd1f604eb3a5576fd57dd18b60502",
"assets/assets/images/affordable_Rates.svg": "16d58e533dcf9655f8e1cd1a26f74536",
"assets/assets/images/bachelor_party.svg": "30b53cba03540a7ff78b9c3ecdc3269e",
"assets/assets/images/backgrlogo.png": "4bddc4a776a208a4334aae03324664b4",
"assets/assets/images/car_rental.svg": "c33487bde004f209069ffa4732378748",
"assets/assets/images/cityrider.svg": "e0d26ec28bfb094f3c0c68198bf4831b",
"assets/assets/images/convinient_booking.svg": "3ac02170e070087b3349a283254c1cc9",
"assets/assets/images/dialogue_image.svg": "81f07d91f12207054ce27f97d660c8cb",
"assets/assets/images/DOD_Blue.png": "2df989e0b7aaaffcb73d96f2aea06960",
"assets/assets/images/DOD_orange.png": "ba15310122f08d3839f8d457c50c3565",
"assets/assets/images/DOD_svg.png": "64d2b4dafd3051c84260e30ca0f5a979",
"assets/assets/images/fb.png": "b0967c162fa095a145356280793f1ad4",
"assets/assets/images/getintouch.png": "763e6694884951680f4fb90369302d4e",
"assets/assets/images/Group8.svg": "cae1fd98798a22145bb81a66faf68c50",
"assets/assets/images/homescreen_stk1.png": "af8b22ff6f495bcce3a3abb25b25be8f",
"assets/assets/images/homescreen_stk2.png": "f811725cf73b62ae7de2d4700cc8841a",
"assets/assets/images/homescreen_stk3.png": "93c47f9788ca567eeed9938a9ab269cb",
"assets/assets/images/Hospital_Assistance.svg": "e02fd4b188d4f76b356fdccaa613f9b2",
"assets/assets/images/insta.png": "fd511e724dd0e0f78d1e7567f82b465d",
"assets/assets/images/linkedin.png": "0edd89b78b378b0f1c153979ed1000c7",
"assets/assets/images/Logo.png": "99fc0d024108770bdabc8588d5f7bd3f",
"assets/assets/images/Logoupdated.svg": "535aa721603242b2cc1472e58af10513",
"assets/assets/images/Lora_mattresses.png": "cdd9f9ac36d03af0f801f3241efcfaab",
"assets/assets/images/popular_hyundai.png": "15c51784d5011db4bcb9c01d61dd195e",
"assets/assets/images/prodrivers.svg": "c1f2e6ce9a27e2f1ea3ba3971fde8d39",
"assets/assets/images/review_lora.jpg": "e4599a5e01d1de3af3d924b88a1b15e9",
"assets/assets/images/review_mathews.jpg": "861e84c4075e8dec81cabfdb43d92b3f",
"assets/assets/images/review_syed.jpg": "51c0a3ba48d572964981fc5f88331ad5",
"assets/assets/images/review_tom.jpg": "7d2e9575e4f0d36c6eb2752971b8d62a",
"assets/assets/images/utube.png": "a9f32bb5a4db0ffcf551d22559c8c60f",
"assets/assets/images/whatsapp.png": "e1bb6c5177a2d3d537f8177700aed439",
"assets/assets/images/what_our_client_say.png": "d13fec465734ddcd67c6257b6422b21b",
"assets/assets/images/wheel_blue.png": "89b452096503ccd045f95f7c4a997c03",
"assets/assets/images/wheel_orange.png": "e2959c46349233c9eb11c4c4ebc5f4aa",
"assets/assets/images/whyDOD.png": "9e388b1a1fc1db69865a0131cec451f1",
"assets/FontManifest.json": "d8392c03026ca6f703afef0d406e8fc9",
"assets/fonts/MaterialIcons-Regular.otf": "002532a1d3273abf36cac5f4d36d4e6f",
"assets/NOTICES": "26fb6bc154b26f4a073572538960f5c7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/hugeicons/lib/fonts/hugeicons-stroke-rounded.ttf": "ed1746fbad500fea94f6e5c5eb97ed7d",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "7ee5daa7187c1af9e672565f85d22b7b",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "79b484b8c9e6c14a495143611be4303a",
"icons/Icon-192.png": "7ee5daa7187c1af9e672565f85d22b7b",
"icons/Icon-512.png": "7ee5daa7187c1af9e672565f85d22b7b",
"icons/Icon-maskable-192.png": "7ee5daa7187c1af9e672565f85d22b7b",
"icons/Icon-maskable-512.png": "7ee5daa7187c1af9e672565f85d22b7b",
"index.html": "5f96271303f8afc233702e6dfb0549a9",
"/": "5f96271303f8afc233702e6dfb0549a9",
"main.dart.js": "a885fca62f4ab23153bdd86e06d43fce",
"manifest.json": "4d94d8fd9a59610a9271c76f88e642af",
"version.json": "56681c925009bb6595334a89c8da9ecb"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
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
