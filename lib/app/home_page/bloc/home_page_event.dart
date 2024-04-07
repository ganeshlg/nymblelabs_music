import 'package:equatable/equatable.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

final class OnShowDetails extends HomePageEvent {
  const OnShowDetails(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

final class OnMusicSearched extends HomePageEvent {
  const OnMusicSearched(this.searchedSong);

  final String searchedSong;

  @override
  List<Object> get props => [searchedSong];
}

final class OnFavoriteChanged extends HomePageEvent {
  const OnFavoriteChanged({required this.mainIndex, required this.localIndex});

  final int mainIndex;
  final int localIndex;

  @override
  List<Object> get props => [mainIndex, localIndex];
}

final class OnLoadSongs extends HomePageEvent {
  const OnLoadSongs();
}
