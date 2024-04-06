import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/home_page/bloc/home_page_bloc.dart';
import 'package:nymblelabs_music/app/home_page/bloc/home_page_event.dart';
import 'package:nymblelabs_music/app/home_page/bloc/home_page_state.dart';

class MusicList extends StatelessWidget {
  const MusicList({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      context.read<HomePageBloc>().add(const OnLoadSongs());
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemBuilder: (BuildContext ctx, int index) {
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
                                              state.songDetailsList[index]));
                                    },
                                    child: Hero(
                                        tag:
                                            'dp ${state.songDetailsList[index].name}',
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(state
                                                  .songDetailsList[index]
                                                  .bgIcon),
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
                                      "Song Name",
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Text("Album Name",
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.bodySmall)
                                  ],
                                )),
                            const Expanded(
                                flex: 20, child: Icon(Icons.favorite_border))
                          ],
                        )),
                  ));
            },
            itemCount: state.songDetailsList.length,
          ));
    });
  }
}
