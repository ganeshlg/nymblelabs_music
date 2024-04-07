import '../constants.dart';

class FavoriteRepository {
  Future<void> favoriteChanged(String email, String uniqueID) async {
    Map? favs = await Constants.favoritesBox?.get(email);

    if (favs != null) {
      if (favs["favorites"].contains(uniqueID)) {
        favs["favorites"].remove(uniqueID);
      } else {
        favs["favorites"].add(uniqueID);
      }

      Constants.favoritesBox?.put(email, {"favorites": favs["favorites"]});
    } else {
      Constants.favoritesBox?.put(email, {
        "favorites": [uniqueID]
      });
    }
  }
}
