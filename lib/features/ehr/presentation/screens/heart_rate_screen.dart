import 'package:bebop/core/utils/constants.dart';
import 'package:bebop/core/widgets/appbar_back_button.dart';
import 'package:flutter/material.dart';

class HeartRateScreen extends StatelessWidget {
  const HeartRateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBackButton(),
        title: Text(Constants().todayDate),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
