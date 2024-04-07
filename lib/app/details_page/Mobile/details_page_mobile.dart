import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/song_details_model.dart';
import '../bloc/details_bloc.dart';
import '../bloc/details_event.dart';
import '../bloc/details_state.dart';
import '../components/details_widget.dart';

class DetailsPageMobile extends StatefulWidget {
  const DetailsPageMobile({super.key, required this.songDetails});

  final SongDetails songDetails;

  @override
  State<StatefulWidget> createState() {
    return _DetailsPageMobileState();
  }
}

class _DetailsPageMobileState extends State<DetailsPageMobile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
      return Card(
          color: Colors.white.withOpacity(0.9),
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Stack(children: [
            DetailsWidget(
              songDetails: state.songDetails.songName.isEmpty
                  ? widget.songDetails
                  : state.songDetails,
              state: state,
            ),
            Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                    onTap: () {
                      context.read<DetailsBloc>().add(const OnStopPlayEvent());

                      Navigator.of(context).pop();
                    },
                    child: const Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Icon(Icons.cancel))))
          ]));
    });
  }
}
