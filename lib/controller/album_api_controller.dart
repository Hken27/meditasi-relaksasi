// import 'package:get/get.dart';
// import 'dart:convert';

// class AlbumController extends GetxController {
//   var albums = <AlbumElement>[].obs; // observable list of albums
//   var isLoading = true.obs; // observable for loading state

//   @override
//   void onInit() {
//     super.onInit();
//     fetchAlbums();
//   }

//   // Simulate fetching data (replace this with actual API calls if necessary)
//   void fetchAlbums() {
//     final jsonString = '''
//     {
//       "albums": [
//         {
//           "album_type": "single",
//           "artists": ["Artist 1"],
//           "available_markets": ["US", "UK"],
//           "copyrights": ["Copyright Info"],
//           "external_ids": {},
//           "external_urls": {},
//           "genres": ["Pop"],
//           "href": "http://example.com",
//           "id": "1",
//           "images": ["http://image.com/1.jpg"],
//           "name": "Album 1",
//           "popularity": 80,
//           "release_date": "2024-01-01",
//           "release_date_precision": "day",
//           "tracks": {},
//           "type": "album",
//           "uri": "spotify:album:1"
//         },
//         {
//           "album_type": "album",
//           "artists": ["Artist 2"],
//           "available_markets": ["CA"],
//           "copyrights": ["Copyright Info 2"],
//           "external_ids": {},
//           "external_urls": {},
//           "genres": ["Rock"],
//           "href": "http://example.com",
//           "id": "2",
//           "images": ["http://image.com/2.jpg"],
//           "name": "Album 2",
//           "popularity": 90,
//           "release_date": "2023-12-25",
//           "release_date_precision": "day",
//           "tracks": {},
//           "type": "album",
//           "uri": "spotify:album:2"
//         }
//       ]
//     }
//     ''';

//     final albumData = albumFromJson(jsonString);
//     albums.assignAll(albumData.albums); // update the observable list
//     isLoading(false); // stop loading
//   }
// }
