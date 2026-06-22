import 'package:flutter/material.dart';
import 'package:star_wars/ui/components/model/ui.model.dart';

class CardItems extends StatelessWidget {
  const CardItems({super.key, required this.items});
  final List<Item> items;
  @override
  Widget build(BuildContext context) {
    final widgets = items
        .expand(
          (item) => [
            Column(
              children: [
                Icon(
                  item.icon,
                  size: 40,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                Text(
                  item.value,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            VerticalDivider(color: Theme.of(context).colorScheme.onPrimary),
          ],
        )
        .toList();
    widgets.removeLast();
    return Container(
      height: 100,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widgets,
        ),
      ),
    );
  }
}
