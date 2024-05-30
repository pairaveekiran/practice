import 'package:flutter/material.dart';
import 'package:practice/model/postmodel.dart';

class Postdetails extends StatelessWidget {
  final Autogenerated posts;
  const Postdetails({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Text(posts.body.toString())],
        ),
      ),
    );
  }
}
