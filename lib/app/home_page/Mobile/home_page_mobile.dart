import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/home_page/bloc/home_page_bloc.dart';
import 'package:nymblelabs_music/app/home_page/bloc/home_page_state.dart';
import 'package:nymblelabs_music/app/status.dart';

import '../../../constants.dart';
import '../../login_page/bloc/login_bloc.dart';
import '../../login_page/bloc/login_state.dart';
import '../../navigator.dart';
import '../bloc/home_page_event.dart';
import '../components/music_list.dart';
import '../components/music_search_bar.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageMobileState();
  }
}

class _HomePageMobileState extends State<HomePageMobile> {
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
          const Expanded(child: MusicList())
        ],
      ),
    );
  }
}
