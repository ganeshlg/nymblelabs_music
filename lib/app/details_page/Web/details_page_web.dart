import 'package:flutter/material.dart';
import '../components/details_widget.dart';
import '../components/wave_animation.dart';

class DetailsPageWeb extends StatefulWidget {
  const DetailsPageWeb({super.key, required this.index});

  final String index;

  @override
  State<StatefulWidget> createState() {
    return _DetailsPageWebState();
  }
}

class _DetailsPageWebState extends State<DetailsPageWeb> {
  @override
  Widget build(BuildContext context) {
    return Stack(children:[Center(
        child: SizedBox(
            height: 300,
            width: 300,
            child: Card(
              elevation: 10,
              color: Colors.white.withOpacity(0.9),
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: DetailsWidget(index: widget.index),
            ))),
      Positioned(
          top: 20,
          left: 20,
          child: GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: const Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  child: Icon(Icons.cancel))))
    ]);
  }
}
