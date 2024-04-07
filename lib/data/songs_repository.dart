import 'package:flutter/widgets.dart';

import '../constants.dart';
import '../models/song_details_model.dart';

class SongsRepository {
  Future<List<SongDetails>> loadSongs(String email) async {
    var emailFavorites = await Constants.favoritesBox?.get(email);

    List<String>? songs = await Constants.songsBox?.getAllKeys();

    List<SongDetails> songDetailsList = [];

    int i = 0;
    songs?.forEach((song) async {
      var songData = await Constants.songsBox?.get(song);
      songDetailsList.add(SongDetails(
          mainIndex: i,
          uniqueID: song,
          songName: songData["song_name"],
          artistName: songData["artist_name"],
          description: songData["description"],
          isFavorite: emailFavorites == null
              ? false
              : emailFavorites["favorites"].contains(song)
                  ? true
                  : false,
          songIcon: songData["image"]));
      i++;
    });

    return songDetailsList;
  }
}
