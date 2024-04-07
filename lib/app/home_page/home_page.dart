import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/home_page/Web/home_page_web.dart';
import 'package:nymblelabs_music/data/favorite_changed_repository.dart';
import 'package:nymblelabs_music/data/songs_repository.dart';
import '../../constants.dart';
import 'Mobile/home_page_mobile.dart';
import 'bloc/home_page_bloc.dart';
import 'bloc/home_page_event.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.email});

  final String email;

  final SongsRepository songsRepository = SongsRepository();
  final FavoriteRepository favoriteRepository = FavoriteRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HomePageBloc(
            songsRepository: songsRepository,
            email: email,
            favoriteRepository: favoriteRepository)
          ..add(const OnLoadSongs()),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > Constants.mobileWidth) {
                  return HomePageWeb(email: email);
                } else {
                  return HomePageMobile(
                    email: email,
                  );
                }
              },
            )));
  }
}
