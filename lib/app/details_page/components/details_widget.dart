import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/details_page/bloc/details_event.dart';
import 'package:nymblelabs_music/app/status.dart';
import '../bloc/details_bloc.dart';
import '../bloc/details_state.dart';
import 'wave_animation.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.index});

  final String index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
      return Column(
        children: [
          Expanded(
              flex: 50,
              child: Hero(
                  tag: 'dp $index',
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('music_background/$index.jpg'),
                        fit: BoxFit.fill,
                      ),
                      // color: Colors.blue
                    ),
                  ))),
          Expanded(
              flex: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Song Name",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text("Album Name",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall)
                ],
              )),
          Expanded(
              flex: 10,
              child: WaveAnimation(
                status: state.status,
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
                  context.read<DetailsBloc>().add(const OnPlayEvent());
                },
              ))
        ],
      );
    });
  }
}
