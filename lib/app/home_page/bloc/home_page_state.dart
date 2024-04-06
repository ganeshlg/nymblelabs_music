import 'package:equatable/equatable.dart';
import 'package:nymblelabs_music/models/song_details_model.dart';

import '../../status.dart';

final class HomePageState extends Equatable {
  const HomePageState(
      {this.status = Status.initial,
      this.index = "",
      this.searchedSong = "",
      required this.songDetailsList});

  final String status;
  final String index;
  final String searchedSong;
  final List<SongDetails> songDetailsList;

  HomePageState copyWith(
      {String? status,
      String? index,
      String? searchedSong,
      List<SongDetails>? songDetailsList}) {
    return HomePageState(
        status: status ?? this.status,
        index: index ?? this.index,
        songDetailsList: songDetailsList ?? this.songDetailsList,
        searchedSong: searchedSong ?? this.searchedSong);
  }

  @override
  List<Object> get props => [status, index, searchedSong, songDetailsList];
}
