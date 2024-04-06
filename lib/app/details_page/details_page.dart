import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nymblelabs_music/app/details_page/Mobile/details_page_mobile.dart';
import 'package:nymblelabs_music/app/details_page/Web/details_page_web.dart';
import '../../constants.dart';
import 'bloc/details_bloc.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.index});

  final String index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => DetailsBloc(),
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
                      return DetailsPageWeb(index: index);
                    } else {
                      return DetailsPageMobile(index: index);
                    }
                  },
                ))));
  }
}
