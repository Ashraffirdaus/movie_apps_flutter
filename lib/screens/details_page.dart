// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
   const DetailsPage({super.key, required this.imdbID});

 final String imdbID;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DetailsPage"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // we need to put widget if we use stateful.
          Text("This is the page for ${widget.imdbID}"),
          
        ],
      ),
    );
  }
}
