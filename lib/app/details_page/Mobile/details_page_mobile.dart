import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/details_widget.dart';

class DetailsPageMobile extends StatefulWidget {
  const DetailsPageMobile({super.key, required this.index});

  final String index;

  @override
  State<StatefulWidget> createState() {
    return _DetailsPageMobileState();
  }
}

class _DetailsPageMobileState extends State<DetailsPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Stack(children:[DetailsWidget(index: widget.index),
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

      ])
    );
  }
}
