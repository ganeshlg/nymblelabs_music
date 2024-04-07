import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/details_page/Mobile/details_page_mobile.dart';
import 'package:nymblelabs_music/app/details_page/Web/details_page_web.dart';
import 'package:nymblelabs_music/data/favorite_changed_repository.dart';
import '../../constants.dart';
import '../../models/song_details_model.dart';
import 'bloc/details_bloc.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, required this.songDetails, required this.email});

  final SongDetails songDetails;
  final String email;
  final FavoriteRepository favoriteRepository = FavoriteRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) =>
            DetailsBloc(email: email, favoriteRepository: favoriteRepository),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    if (constraints.maxWidth > Constants.mobileWidth) {
                      return DetailsPageWeb(songDetails: songDetails);
                    } else {
                      return DetailsPageMobile(songDetails: songDetails);
                    }
                  },
                ))));
  }
}
