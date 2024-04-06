import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/home_page/bloc/home_page_event.dart';
import '../bloc/home_page_bloc.dart';
import '../bloc/home_page_state.dart';

class MusicSearchBar extends StatelessWidget {
  const MusicSearchBar({super.key, required this.textController});

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
      return Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
              elevation: 10,
              child: TextField(
                controller: textController,
                autocorrect: false,
                onChanged: (text) {
                  context.read<HomePageBloc>().add(OnMusicSearched(text));
                },
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Theme.of(context).primaryColor,),
                  suffixIcon: InkWell(
                    onTap: () {
                      context
                          .read<HomePageBloc>()
                          .add(const OnMusicSearched(""));
                      _onClearTapped();
                    },
                    child: Icon(Icons.cancel, color: Theme.of(context).primaryColor),
                  ),
                  border: InputBorder.none,
                  hintText: 'Enter a search term',
                ),
              )));
    });
  }

  void _onClearTapped() {
    textController.text = '';
  }
}
