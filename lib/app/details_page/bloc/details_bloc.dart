import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nymblelabs_music/app/status.dart';
import 'package:nymblelabs_music/models/song_details_model.dart';
import '../../../data/favorite_changed_repository.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc({
    required FavoriteRepository favoriteRepository,
    required String email
  })  : _favoriteRepository = favoriteRepository,
        _email = email,
        super(const DetailsState()) {
    on<OnPlayEvent>(_onPlay);
    on<OnStopPlayEvent>(_stopPlaying);
    on<OnFavoriteChangedEvent>(_onFavChanged);
  }

  final FavoriteRepository _favoriteRepository;
  final _email;

  final AudioPlayer player = AudioPlayer();

  Future<void> _onPlay(OnPlayEvent event, Emitter<DetailsState> emit) async {
    try {
      if (player.playing) {
      } else {
        if (event.songDetails.songName != state.currentSong) {
          player.setAsset("assets/songs/${event.songDetails.songName}.mp3");
        }
      }

      if (state.status != Status.success) {
        player.play();

        player.setLoopMode(LoopMode.all);
        emit(
          state.copyWith(
            status: Status.success,
            currentSong: event.songDetails.songName,
          ),
        );
      } else {
        player.pause();
        emit(
          state.copyWith(
              status: Status.initial, currentSong: event.songDetails.songName),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(status: Status.error),
      );
    }
  }

  _stopPlaying(OnStopPlayEvent event, Emitter<DetailsState> emit) async {
    if (player.playing) {
      await player.stop();
    }
  }

  _onFavChanged(OnFavoriteChangedEvent event, Emitter<DetailsState> emit) async {
    await _favoriteRepository.favoriteChanged(
        _email, event.songDetails.uniqueID);

    SongDetails songDetails = SongDetails(
        mainIndex: event.songDetails.mainIndex,
        uniqueID: event.songDetails.uniqueID,
        songName: event.songDetails.songName,
        artistName: event.songDetails.artistName,
        description: event.songDetails.description,
        isFavorite: event.songDetails.isFavorite ? false : true,
        songIcon: event.songDetails.songIcon);

    emit(state.copyWith(songDetails: songDetails));
  }
}
