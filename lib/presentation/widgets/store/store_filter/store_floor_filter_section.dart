import 'package:flutter/material.dart';
import 'package:flutter_mallhub/presentation/widgets/shared/item_pill.dart';

class StoreFloorFilterSection extends StatelessWidget {
  const StoreFloorFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        InkWell(
          child: ItemPill(
            itemName: "Lantai 1",
            isSelected: true,
          ),
        )
      ],
    );
  }
}
