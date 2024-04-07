import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/models/song_details_model.dart';
import '../bloc/home_page_bloc.dart';
import '../bloc/home_page_event.dart';
import '../bloc/home_page_state.dart';

class MusicGrid extends StatelessWidget {
  const MusicGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
          ),
          padding: const EdgeInsets.all(20.0),
          itemCount: state.searchedSong.isEmpty
              ? state.songDetailsList.length
              : state.searchedSongList.length,
          itemBuilder: (ctx, index) {
            List<SongDetails> songList = state.searchedSong.isEmpty
                ? state.songDetailsList
                : state.searchedSongList;
            return Card(
                elevation: 10,
                color: Colors.white.withOpacity(0.9),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 60,
                            child: Hero(
                                tag: 'dp ${songList[index].songName}',
                                child: Material(
                                    child: InkWell(
                                        onTap: () {
                                          context.read<HomePageBloc>().add(
                                              OnShowDetails(
                                                  songList[index].mainIndex));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  songList[index].songIcon),
                                              fit: BoxFit.fill,
                                            ),
                                            // color: Colors.blue
                                          ),
                                        ))))),
                        Expanded(
                            flex: 40,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 75,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          songList[index].songName,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
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
                                                      mainIndex: songList[index]
                                                          .mainIndex,
                                                      localIndex: index));
                                            },
                                          )
                                        : IconButton(
                                            icon: const Icon(
                                                Icons.favorite_border),
                                            onPressed: () {
                                              context.read<HomePageBloc>().add(
                                                  OnFavoriteChanged(
                                                      mainIndex: songList[index]
                                                          .mainIndex,
                                                      localIndex: index));
                                            },
                                          ))
                              ],
                            ))
                      ],
                    )));
          });
    });
  }
}
