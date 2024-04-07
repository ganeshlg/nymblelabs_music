import 'package:bloc/bloc.dart';
import 'package:nymblelabs_music/data/favorite_changed_repository.dart';
import 'package:nymblelabs_music/data/songs_repository.dart';
import 'package:nymblelabs_music/models/song_details_model.dart';
import '../../status.dart';
import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc(
      {required SongsRepository songsRepository,
      required FavoriteRepository favoriteRepository,
      required String email})
      : _songsRepository = songsRepository,
        _favoriteRepository = favoriteRepository,
        _email = email,
        super(const HomePageState()) {
    on<OnShowDetails>(_showDetailsPage);
    on<OnMusicSearched>(_onMusicSearched);
    on<OnLoadSongs>(_onLoadSongs);
    on<OnFavoriteChanged>(_onFavChanged);
  }

  final SongsRepository _songsRepository;
  final FavoriteRepository _favoriteRepository;
  final String _email;

  void _showDetailsPage(OnShowDetails event, Emitter<HomePageState> emit) {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    try {
      emit(state.copyWith(status: Status.success));
      emit(state.copyWith(
        index: event.index,
        status: Status.nextPage,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
      ));
    }
  }

  void _onMusicSearched(OnMusicSearched event, Emitter<HomePageState> emit) {
    emit(
      state.copyWith(status: Status.loading, searchedSong: event.searchedSong),
    );

    List<SongDetails> songDetailsList = [];

    for (var song in state.songDetailsList) {
      if (song.songName.contains(event.searchedSong)) {
        songDetailsList.add(song);
      }
    }

    emit(
      state.copyWith(
        status: Status.success,
        searchedSong: event.searchedSong,
        searchedSongList: songDetailsList,
      ),
    );
  }

  Future<void> _onLoadSongs(
      OnLoadSongs event, Emitter<HomePageState> emit) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );
    List<SongDetails> songDetailsList =
        await _songsRepository.loadSongs(_email);

    emit(
      state.copyWith(
          status: Status.success,
          searchedSong: state.searchedSong,
          songDetailsList: songDetailsList),
    );

    emit(
      state.copyWith(
        status: Status.success,
        searchedSong: "",
        searchedSongList: [],
      ),
    );
  }

  Future<void> _onFavChanged(
      OnFavoriteChanged event, Emitter<HomePageState> emit) async {
    await _favoriteRepository.favoriteChanged(
        _email, state.songDetailsList[event.mainIndex].uniqueID);

    List<SongDetails> searchedSongDetails = [];
    for (var songDeats in state.searchedSongList) {
      if (state.searchedSongList[event.localIndex].uniqueID ==
          songDeats.uniqueID) {
        searchedSongDetails.add(SongDetails(
            mainIndex: songDeats.mainIndex,
            uniqueID: songDeats.uniqueID,
            songName: songDeats.songName,
            artistName: songDeats.artistName,
            description: songDeats.description,
            isFavorite: songDeats.isFavorite ? false : true,
            songIcon: songDeats.songIcon));
      } else {
        searchedSongDetails.add(songDeats);
      }
    }

    List<SongDetails> songDetails = [];
    for (var songDeats in state.songDetailsList) {
      if (state.songDetailsList[event.mainIndex].uniqueID ==
          songDeats.uniqueID) {
        songDetails.add(SongDetails(
            mainIndex: songDeats.mainIndex,
            uniqueID: songDeats.uniqueID,
            songName: songDeats.songName,
            artistName: songDeats.artistName,
            description: songDeats.description,
            isFavorite: songDeats.isFavorite ? false : true,
            songIcon: songDeats.songIcon));
      } else {
        songDetails.add(songDeats);
      }
    }

    emit(
      state.copyWith(
          status: Status.success,
          songDetailsList: songDetails,
          searchedSongList: searchedSongDetails),
    );
  }
}
