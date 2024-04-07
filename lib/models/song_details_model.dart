class SongDetails {

  const SongDetails({
    required this.mainIndex,
    required this.uniqueID,
    required this.songName,
    required this.artistName,
    required this.description,
    required this.isFavorite,
    required this.songIcon
  });

  final int mainIndex;
  final String uniqueID;
  final String songName;
  final String artistName;
  final String description;
  final bool isFavorite;
  final String songIcon;
}