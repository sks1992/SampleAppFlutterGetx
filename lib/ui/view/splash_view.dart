import 'package:flutter/material.dart';

import '../widgets/dot_progress_indicator.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DotProgressIndicator(),
    );
  }
}
