import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nymblelabs_music/app/status.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState>{
  // DetailsBloc():super(DetailsState());
  DetailsBloc()  :
        super(const DetailsState()) {
    on<OnPlayEvent>(_onPlay);
  }

  final player = AudioPlayer();

  Future<void> _onPlay(OnPlayEvent event, Emitter<DetailsState> emit) async {

    try {

      if(player.playing) {
      debugPrint("It's Playing");
      }else{
        await player.setUrl(
            'https://onlinetestcase.com/wp-content/uploads/2023/06/100-KB-MP3.mp3');
      }

      if(state.status!=Status.success){

          player.play();

        player.setLoopMode(LoopMode.all);
        emit(
          state.copyWith(
              status: Status.success
          ),
        );
      }else{
        player.pause();
        emit(
          state.copyWith(
              status: Status.initial
          ),
        );
      }


    }catch(e){
      emit(
        state.copyWith(
            status: Status.error
        ),
      );
    }
  }

}