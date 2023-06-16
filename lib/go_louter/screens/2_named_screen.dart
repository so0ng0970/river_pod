import 'package:flutter/material.dart';
import 'package:river_pd/go_louter/layout/default_layout.dart';

class NamedScreen extends StatelessWidget {
  const NamedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        body: Center(
      child: Text('Named screen'),
    ));
  }
}
