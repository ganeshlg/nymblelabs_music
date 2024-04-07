import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/home_page/bloc/home_page_bloc.dart';
import 'package:nymblelabs_music/app/home_page/bloc/home_page_state.dart';
import 'package:nymblelabs_music/app/status.dart';
import '../../../constants.dart';
import '../../navigator.dart';
import '../components/music_list.dart';
import '../components/music_search_bar.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key, required this.email});

  final String email;

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
              songDetails: state.songDetailsList[state.index],
              email: widget.email);
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
