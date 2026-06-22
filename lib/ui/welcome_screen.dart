import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:star_wars/services/auth.service.dart';

class IntroScreenDefault extends StatefulWidget {
  const IntroScreenDefault({super.key, required this.authService});
  final AuthService authService;

  @override
  State<IntroScreenDefault> createState() => IntroScreenDefaultState();
}

class IntroScreenDefaultState extends State<IntroScreenDefault> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();
    listContentConfig.add(
      const ContentConfig(
        title: "Welcome to the force",
        description:
            "The Force is an energy field created by all living things. It surrounds us and penetrates us; it binds the galaxy together.",
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "About it",
        description:
            "The Force is what gives a Jedi his power. It’s an energy field created by all living things. It surrounds us and penetrates us; it binds the galaxy together.",
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        title: "Enjoy it",
        description: "May the Force be with you.",
      ),
    );
  }

  void onDonePress(BuildContext context) async {
    await widget.authService.setFirstTime(false);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      listContentConfig: listContentConfig,
      onDonePress: () => onDonePress(context),
    );
  }
}
