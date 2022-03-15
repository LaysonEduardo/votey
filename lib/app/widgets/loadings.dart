// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SimpleLoading extends StatefulWidget {
  double height;
  SimpleLoading({Key? key, required this.height}) : super(key: key);

  @override
  State<SimpleLoading> createState() => _SimpleLoadingState();
}

class _SimpleLoadingState extends State<SimpleLoading> {
  Artboard? artboard;

  @override
  void initState() {
    loadRiveFile();
    super.initState();
  }

  loadRiveFile() async {
    final bytes = await rootBundle.load(
      'assets/loadings/loading.riv',
    );
    setState(() {
      final file = RiveFile.import(bytes);
      artboard = file.mainArtboard;
      artboard!.addController(SimpleAnimation(
        'loading',
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return artboard == null
        ? Container()
        : ConstrainedBox(
            constraints: BoxConstraints(maxHeight: widget.height),
            child: Rive(
              artboard: artboard!,
              antialiasing: true,
            ),
          );
  }
}
