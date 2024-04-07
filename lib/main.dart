import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'app.dart';
import 'constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final collection = await BoxCollection.open(
    'NymbleMusic', // Name of your database
    {'login_credentials', 'songs', 'favorites'}, // Names of your boxes
    key: HiveAesCipher([
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1,
      1
    ]), // Key to encrypt your boxes (Only used in Flutter / Dart IO)
  );

  Constants.loginCredentialsBox =
      await collection.openBox<Map>('login_credentials');

  await Constants.loginCredentialsBox
      ?.put("username@gmail.com", {"password": "password"});


  final String songListJSON =
      await rootBundle.loadString('json/songs_list.json');
  final List<dynamic> songList = await json.decode(songListJSON);

  Constants.songsBox = await collection.openBox<Map>('songs');

  songList.forEach((map) async {
    await Constants.songsBox?.put(map["unique_id"], {
      "song_name": map["song_name"],
      "artist_name": map["artist_name"],
      "image": map["image"],
      "description": map["description"]
    });
  });

  Constants.favoritesBox = await collection.openBox<Map>('favorites');

  await Constants.favoritesBox?.clear();

  Constants.favoritesBox?.put("username@gmail.com", {"favorites":["1","3","5","7"]});


  runApp(const App());
}
