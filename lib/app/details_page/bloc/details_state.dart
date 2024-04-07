import 'package:equatable/equatable.dart';
import 'package:nymblelabs_music/models/song_details_model.dart';
import '../../status.dart';

class DetailsState extends Equatable{
  const DetailsState(
      {this.status = Status.initial,
      this.currentSong = "",
      this.songDetails = const SongDetails(
          mainIndex: 0,
          uniqueID: "",
          songName: "",
          artistName: "",
          description: "",
          isFavorite: false,
          songIcon: "")});

  final String status;
  final String currentSong;
  final SongDetails songDetails;

  DetailsState copyWith(
      {String? status, String? currentSong, SongDetails? songDetails}) {
    return DetailsState(
        status: status ?? this.status,
        currentSong: currentSong ?? this.currentSong,
        songDetails: songDetails ?? this.songDetails);
  }

  @override
  List<Object?> get props => [status,currentSong,songDetails];
}
