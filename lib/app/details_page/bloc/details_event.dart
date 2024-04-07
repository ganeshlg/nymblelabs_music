import 'package:equatable/equatable.dart';
import 'package:nymblelabs_music/models/song_details_model.dart';

sealed class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class OnPlayEvent extends DetailsEvent {
  const OnPlayEvent(this.songDetails);

  final SongDetails songDetails;

  List<Object> get props => [songDetails];
}

class OnStopPlayEvent extends DetailsEvent{
  const OnStopPlayEvent();
}

class OnFavoriteChangedEvent extends DetailsEvent{
  const OnFavoriteChangedEvent(this.songDetails);

  final SongDetails songDetails;

  List<Object> get props => [songDetails];
}
