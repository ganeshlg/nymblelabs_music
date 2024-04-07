import 'package:equatable/equatable.dart';
import 'package:nymblelabs_music/models/song_details_model.dart';
import '../../status.dart';

final class HomePageState extends Equatable {
  const HomePageState({
    this.status = Status.initial,
    this.index = 0,
    this.searchedSong = "",
    this.songDetailsList = const [],
    this.searchedSongList = const [],
  });

  final String status;
  final int index;
  final String searchedSong;
  final List<SongDetails> songDetailsList;
  final List<SongDetails> searchedSongList;

  HomePageState copyWith(
      {String? status,
      int? index,
      String? searchedSong,
      List<SongDetails>? songDetailsList,
      List<SongDetails>? searchedSongList}) {
    return HomePageState(
        status: status ?? this.status,
        index: index ?? this.index,
        songDetailsList: songDetailsList ?? this.songDetailsList,
        searchedSong: searchedSong ?? this.searchedSong,
        searchedSongList: searchedSongList ?? this.searchedSongList);
  }

  @override
  List<Object> get props =>
      [status, index, searchedSong, songDetailsList, searchedSongList];
}
