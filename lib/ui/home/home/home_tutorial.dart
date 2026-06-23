import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomeTutorial {
  late TutorialCoachMark tutorialCoachMark;
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  final GlobalKey _key3 = GlobalKey();

  HomeTutorial({Function? completeTutorial, Function? target1, Function? target2, Function? target3}) {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      onClickTarget: (target) {
        if (target.identify == "Film") {
          target2?.call();
        }
        if (target.identify == "Vehicle") {
          target3?.call();
        }
      },
      paddingFocus: 0,
      opacityShadow: 0.9,
      onFinish: () => completeTutorial?.call(),
      onSkip: () {
        completeTutorial?.call();
        return true;
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        identify: "Planet",
        keyTarget: _key1,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Padding(
              padding: EdgeInsets.only(top: 120),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "See the planets",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Explore the different planets in the Star Wars universe.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Film",
        keyTarget: _key2,
        paddingFocus: 0,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "See the films",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  "Explore the different films in the Star Wars universe.",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Vehicle",
        keyTarget: _key3,
        paddingFocus: 0,
        shape: ShapeLightFocus.RRect,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "See the vehicles",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  "Explore the different vehicles in the Star Wars universe.",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return targets;
  }
  TutorialCoachMark get controller {
    return tutorialCoachMark;
  }
  List<GlobalKey> get keys => [_key1, _key2, _key3];
}
