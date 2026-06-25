import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_wars/core/router/routes.dart';
import 'package:star_wars/ui/components/film.comp.dart';
import 'package:star_wars/ui/components/planet.comp.dart';
import 'package:star_wars/ui/components/vehicle.comp.dart';
import 'package:star_wars/ui/home/home/home_tutorial.dart';
import 'package:star_wars/ui/home/home/home_view_model.dart';
import 'package:star_wars/ui/components/shimmer.comp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});
  final HomeViewModel viewModel;
  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late HomeTutorial _homeTutorial;
  @override
  void initState() {
    super.initState();
    _homeTutorial = HomeTutorial(
      completeTutorial: completeTutorial,
      target1: () {
        scrollToTarget(_homeTutorial.keys[1]);
      },
      target2: () {
        scrollToTarget(_homeTutorial.keys[2]);
      },
      target3: () {
        scrollToTarget(_homeTutorial.keys[0]);
      },
    );
  }

  void scrollToTarget(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
      alignment: 0,
    );
  }

  void showTutorial() async {
    final isCompleted = await widget.viewModel.isTutorialCompleted();
    if (!isCompleted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          _homeTutorial.controller.show(context: context);
        }
      });
    }
  }

  void completeTutorial() async {
    await widget.viewModel.completeTutorial();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: FutureBuilder<Map<String, List<dynamic>>>(
      future: widget.viewModel.fetchAllData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const InterfaceShimmer();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        showTutorial();
        return InterfaceLoaded(
          snapshot: snapshot.data!,
          keys: _homeTutorial.keys,
        );
      },
    ),
  );
}

class InterfaceLoaded extends StatelessWidget {
  const InterfaceLoaded({
    super.key,
    required this.snapshot,
    required this.keys,
  });
  final Map<String, List<dynamic>> snapshot;
  final List<GlobalKey> keys;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      CarouselSlider(
        key: keys[0],
        options: CarouselOptions(height: 180),
        items: snapshot['planets']!
            .map(
              (i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlanetCard(
                  planet: i,
                  onTap: () => context.push('${Routes.planet}/${i.id}'),
                ),
              ),
            )
            .toList(),
      ),
      Column(
        key: keys[1],
        children: snapshot['films']!
            .take(4)
            .map(
              (i) => Padding(
                padding: EdgeInsets.all(8),
                child: FilmCard(
                  film: i,
                  favorite: () {
                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: "Added to Favorites",
                        message: "${i.title} added to favorites",
                        contentType: ContentType.success,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ),
            )
            .toList(),
      ),
      CarouselSlider(
        key: keys[2],
        options: CarouselOptions(height: 170),
        items: snapshot['vehicles']!
            .map(
              (i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: VehicleCard(vehicle: i),
              ),
            )
            .toList(),
      ),
    ],
  );
}

class InterfaceShimmer extends StatelessWidget {
  const InterfaceShimmer({super.key});

  @override
  Widget build(BuildContext context) =>
      Column(children: [CarouselShimmer(), ListShimmer(), CarouselShimmer()]);
}
