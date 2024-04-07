import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/home_page/bloc/home_page_bloc.dart';
import 'package:nymblelabs_music/app/home_page/bloc/home_page_event.dart';
import 'package:nymblelabs_music/app/home_page/bloc/home_page_state.dart';
import '../../../models/song_details_model.dart';

class MusicList extends StatelessWidget {
  const MusicList({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(child: ListView.builder(
            itemBuilder: (BuildContext ctx, int index) {
              List<SongDetails> songList = state.searchedSong.isEmpty
                  ? state.songDetailsList
                  : state.searchedSongList;
              return SizedBox(
                  height: 70,
                  child: Card(
                    color: Colors.white.withOpacity(0.9),
                    elevation: 10,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 20,
                                child: InkWell(
                                    onTap: () {
                                      context.read<HomePageBloc>().add(
                                          OnShowDetails(
                                              songList[index].mainIndex));
                                    },
                                    child: Hero(
                                        tag: 'dp ${songList[index].songName}',
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/${songList[index].songIcon}"),
                                              fit: BoxFit.fill,
                                            ),
                                            // color: Colors.blue
                                          ),
                                        )))),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                flex: 60,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      songList[index].songName,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Text(songList[index].artistName,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall)
                                  ],
                                )),
                            Expanded(
                                flex: 25,
                                child: songList[index].isFavorite
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          context.read<HomePageBloc>().add(
                                              OnFavoriteChanged(
                                                  mainIndex:
                                                      songList[index].mainIndex,
                                                  localIndex: index));
                                        },
                                      )
                                    : IconButton(
                                        icon: const Icon(Icons.favorite_border),
                                        onPressed: () {
                                          context.read<HomePageBloc>().add(
                                              OnFavoriteChanged(
                                                  mainIndex:
                                                      songList[index].mainIndex,
                                                  localIndex: index));
                                        },
                                      ))
                          ],
                        )),
                  ));
            },
            itemCount: state.searchedSong.isEmpty
                ? state.songDetailsList.length
                : state.searchedSongList.length,
          )));
    });
  }
}
