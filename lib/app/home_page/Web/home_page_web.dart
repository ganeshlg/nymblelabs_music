import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/home_page/components/music_grid.dart';
import '../../../constants.dart';
import '../../navigator.dart';
import '../../status.dart';
import '../bloc/home_page_bloc.dart';
import '../bloc/home_page_state.dart';
import '../components/music_search_bar.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageWebState();
  }
}

class _HomePageWebState extends State<HomePageWeb> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageBloc, HomePageState>(
      listener: (context, state) {
        if (state.status == Status.nextPage) {
          Navigation.navigate(
              route: Constants.detailsScreen,
              context: context,
              index: state.index);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MusicSearchBar(
            textController: TextEditingController(),
          ),
          const Expanded(child: MusicGrid())
        ],
      ),
    );
  }
}
