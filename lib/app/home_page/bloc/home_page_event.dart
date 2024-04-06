import 'package:equatable/equatable.dart';
import 'package:nymblelabs_music/models/song_details_model.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

final class OnShowDetails extends HomePageEvent {
  const OnShowDetails(this.songDetails);

  final SongDetails songDetails;

  @override
  List<Object> get props => [songDetails];
}

final class OnMusicSearched extends HomePageEvent{
  const OnMusicSearched(this.searchedSong);

  final String searchedSong;

  @override
  List<Object> get props => [searchedSong];
}

final class OnLoadSongs extends HomePageEvent{
  const OnLoadSongs();
}