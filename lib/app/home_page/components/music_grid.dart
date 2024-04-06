import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_page_bloc.dart';
import '../bloc/home_page_event.dart';
import '../bloc/home_page_state.dart';

class MusicGrid extends StatelessWidget {
  const MusicGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      context.read<HomePageBloc>().add(const OnLoadSongs());

      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // number of items in each row
            mainAxisSpacing: 0.0, // spacing between rows
            crossAxisSpacing: 0.0, // spacing between columns
          ),
          padding: const EdgeInsets.all(20.0), // padding around the grid
          itemCount: state.songDetailsList.length, // total number of items
          itemBuilder: (ctx, index) {
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
                                tag: 'dp ${state.songDetailsList[index].name}',
                                child: Material(
                                    child: InkWell(
                                        onTap: () {
                                          context.read<HomePageBloc>().add(
                                              OnShowDetails(state
                                                  .songDetailsList[index]));
                                        },
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
                                          "Song Name",
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        Text("Album Name",
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall)
                                      ],
                                    )),
                                const Expanded(
                                    flex: 25,
                                    child: Icon(Icons.favorite_border))
                              ],
                            ))
                      ],
                    )));
          });
    });
  }
}
