import 'package:flutter/material.dart';
import 'package:flutter_mallhub/presentation/widgets/shared/item_card.dart';

class StoreGrid extends StatelessWidget {
  const StoreGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: <Widget>[
        ItemCard(
          itemName: "Pull and Bear",
          itemInformation: "Lantai 1",
        ),
        ItemCard(
          itemName: "Pull and Bear",
          itemInformation: "Lantai 1",
        ),
        ItemCard(
          itemName: "Pull and Bear",
          itemInformation: "Lantai 1",
        ),
        ItemCard(
          itemName: "Pull and Bear",
          itemInformation: "Lantai 1",
        ),
      ],
    );
  }
}
