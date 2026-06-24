import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:star_wars/ui/welcome/welcome_view_model.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.viewModel});
  final WelcomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    List<ContentConfig> listContentConfig = [];
    listContentConfig.add(
      ContentConfig(
        title: 'Welcome',
        description:
            "The Force is an energy field created by all living things. It surrounds us and penetrates us; it binds the galaxy together.",
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        pathImage: viewModel.getLogoPath(context),
      ),
    );
    listContentConfig.add(
      ContentConfig(
        title: "About it",
        description:
            "The Force is what gives a Jedi his power. It’s an energy field created by all living things. It surrounds us and penetrates us; it binds the galaxy together.",
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        title: "Enjoy it",
        description: "May the Force be with you.",
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      ),
    );
    return IntroSlider(
      listContentConfig: listContentConfig,
      onDonePress: () => viewModel.completeWelcome(),
      skipButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      nextButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      doneButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
