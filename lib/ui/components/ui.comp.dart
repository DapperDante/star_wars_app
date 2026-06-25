import 'package:flutter/material.dart';
import 'package:star_wars/ui/components/model/ui.model.dart';

class CardItems extends StatelessWidget {
  const CardItems({super.key, required this.items});
  final List<ItemModel> items;
  @override
  Widget build(BuildContext context) {
    final widgets = items
        .expand(
          (item) => [
            Column(
              children: [
                item.icon!,
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
class CardCustom extends StatelessWidget {
  const CardCustom({super.key, required this.item, this.onTap});
  final ItemModel item;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(12),
    ),
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Column(
            spacing: 5,
            children: [(item.image ?? item.icon)!, Text(item.value)],
          ),
        ),
      ),
    ),
  );
}