import 'package:bloc/bloc.dart';
import 'package:nymblelabs_music/data/details_repository.dart';
import 'package:nymblelabs_music/models/song_details_model.dart';
import '../../status.dart';
import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({
    required DetailsRepository detailsRepository,
  })  : _detailsRepository = detailsRepository,
        super(const HomePageState(songDetailsList: [])) {
    on<OnShowDetails>(_showDetailsPage);
    on<OnMusicSearched>(_onMusicSearched);
    on<OnLoadSongs>(_onLoadSongs);
  }

  final DetailsRepository _detailsRepository;

  void _showDetailsPage(OnShowDetails event, Emitter<HomePageState> emit) {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    try {
      _detailsRepository.showDetails(event.songDetails);

      emit(state.copyWith(status: Status.success));
      emit(state.copyWith(
        index: event.songDetails.name,
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
      state.copyWith(
        status: Status.loading,
      ),
    );
    List<SongDetails> songDetailsList = [];
    List<int> items = [1, 2, 3, 4, 5, 6];
    for (int i in items) {
      songDetailsList.add(SongDetails(
          name: i.toString(),
          artistsName: i.toString(),
          description: i.toString(),
          isFavorite: false,
          icon: "icon/logo.png",
          bgIcon: "music_background/${i.toString()}.jpg"));
    }
    emit(
      state.copyWith(
          status: Status.success,
          searchedSong: event.searchedSong,
          songDetailsList: songDetailsList),
    );
  }

  void _onLoadSongs(OnLoadSongs event, Emitter<HomePageState> emit) {
    if (state.searchedSong.isEmpty) {
      emit(
        state.copyWith(
          status: Status.loading,
        ),
      );
      List<SongDetails> songDetailsList = [];
      List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
      for (int i in items) {
        songDetailsList.add(SongDetails(
            name: i.toString(),
            artistsName: i.toString(),
            description: i.toString(),
            isFavorite: false,
            icon: "icon/logo.png",
            bgIcon: "music_background/${i.toString()}.jpg"));
      }
      emit(
        state.copyWith(
            status: Status.success, songDetailsList: songDetailsList),
      );
    }
  }
}
