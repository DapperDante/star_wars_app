import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
    highlightColor: Theme.of(context).colorScheme.primaryContainer,
    child: CarouselSlider(
      options: CarouselOptions(height: 180),
      items: [1, 2, 3]
          .map(
            (i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                ),
              ),
            ),
          )
          .toList(),
    ),
  );
}

class ListShimmer extends StatelessWidget {
  const ListShimmer({super.key});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
    highlightColor: Theme.of(context).colorScheme.primaryContainer,
    child: Column(
      children: [1, 2, 3]
          .map(
            (i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 120,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                ),
              ),
            ),
          )
          .toList(),  
    )
  );
}