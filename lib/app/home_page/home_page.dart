import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/home_page/Web/home_page_web.dart';
import 'package:nymblelabs_music/data/details_repository.dart';
import '../../constants.dart';
import 'Mobile/home_page_mobile.dart';
import 'bloc/home_page_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final DetailsRepository detailsRepository = DetailsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HomePageBloc(detailsRepository: detailsRepository),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > Constants.mobileWidth) {
                  return const HomePageWeb();
                } else {
                  return const HomePageMobile();
                }
              },
            )));
  }
}
