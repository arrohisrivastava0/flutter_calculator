import 'package:flutter/material.dart';

class Intro extends StatelessWidget{
  const Intro({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      appBar: AppBar(
        title: const Center(child: Text('Awesome AppBar')),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 245, 129, 167),
                  Color.fromARGB(255, 240, 203, 215),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
    )
    );
  }
}