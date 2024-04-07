import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/details_page/bloc/details_event.dart';
import 'package:nymblelabs_music/app/status.dart';
import 'package:nymblelabs_music/models/song_details_model.dart';
import '../bloc/details_bloc.dart';
import 'wave_animation.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget(
      {super.key, required this.songDetails, required this.state});

  final state;

  final SongDetails songDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 50,
            child: Hero(
                tag: 'dp ${songDetails.songName}',
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/${songDetails.songIcon}"),
                      fit: BoxFit.fill,
                    ),
                    // color: Colors.blue
                  ),
                ))),
        Expanded(
            flex: 20,
            child: Row(children: [
              const Expanded(flex: 5, child: SizedBox()),
              Expanded(
                  flex: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        songDetails.songName,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(songDetails.artistName,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall)
                    ],
                  )),
              Expanded(
                  flex: 25,
                  child: songDetails.isFavorite
                      ? IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            context
                                .read<DetailsBloc>()
                                .add(OnFavoriteChangedEvent(songDetails));
                          },
                        )
                      : IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {
                            context
                                .read<DetailsBloc>()
                                .add(OnFavoriteChangedEvent(songDetails));
                          },
                        ))
            ])),
        Expanded(
            flex: 10,
            child: state.status == Status.success
                ? WaveAnimation(
                    status: state.status,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(children: [
                        Expanded(
                            child: Container(
                          color: Colors.black,
                          height: 2,
                        ))
                      ])
                    ],
                  )),
        Expanded(
            flex: 20,
            child: IconButton(
              icon: state.status == Status.initial
                  ? const Icon(Icons.play_arrow_outlined)
                  : state.status == Status.success
                      ? const Icon(Icons.pause_circle_outline_outlined)
                      : const Icon(Icons.error_outline_outlined),
              onPressed: () {
                context.read<DetailsBloc>().add(OnPlayEvent(songDetails));
              },
            ))
      ],
    );
  }
}
