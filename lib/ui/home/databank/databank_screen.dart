import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:star_wars/core/api/databank/models/character.model.dart';
import 'package:star_wars/core/models/object.model.dart';
import 'package:star_wars/ui/components/character.comp.dart';
import 'package:star_wars/ui/components/shimmer.comp.dart';
import 'package:star_wars/ui/components/ui.comp.dart';
import 'package:star_wars/ui/home/databank/databank_view_model.dart';

class DatabankScreen extends StatefulWidget {
  const DatabankScreen({super.key, required this.viewModel});
  final DatabankViewModel viewModel;
  @override
  State<DatabankScreen> createState() => _DatabankScreenState();
}

class _DatabankScreenState extends State<DatabankScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: FutureBuilder<Map<String, List<ObjectModel>>>(
      future: widget.viewModel.fetchAllData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return InterfaceShimmer();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final data = snapshot.data!;
        return InterfaceLoaded(snapshot: data);
      },
    ),
  );
}

class InterfaceLoaded extends StatelessWidget {
  const InterfaceLoaded({super.key, required this.snapshot});
  final Map<String, List<ObjectModel>> snapshot;

  @override
  Widget build(BuildContext context) {
    final data = snapshot;
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(),
          items: data['characters']!
              .map(
                (i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CharacterCard(character: i as CharacterModel),
                ),
              )
              .toList(),
        ),
        CarouselSlider(
          options: CarouselOptions(),
          items: data['droids']!
              .map(
                (i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardCustom(item: i.toItem())
                ),
              )
              .toList(),
        ),
        CarouselSlider(
          options: CarouselOptions(),
          items: data['species']!
              .map(
                (i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardCustom(item: i.toItem())
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class InterfaceShimmer extends StatelessWidget {
  const InterfaceShimmer({super.key});

  @override
  Widget build(BuildContext context) => Column(children: [CarouselShimmer(), CarouselShimmer(), CarouselShimmer()]);
}
