// import 'package:ecommagix/imports.dart';

import 'package:flutter/material.dart';

import '../../config/constraints.dart';
import '../../widgets/text/text_builder.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextBuilder(
        text: 'M A G I X  ',fontWeight: FontWeight.bold,
        color: Constraints.APP_BAR_HOME_TEXT1_COLOR,
        fontSize: 30.0,
      ),
      TextBuilder(
        text: '  S T O R E',fontWeight: FontWeight.bold,
        color: Constraints.APP_BAR_HOME_TEXT2_COLOR,
        fontSize: 30.0,
      ),
    ]);
  }
}
