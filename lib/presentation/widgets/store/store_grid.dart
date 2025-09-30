import 'package:flutter/material.dart';
import 'package:flutter_mallhub/data/model/store.dart';
import 'package:flutter_mallhub/presentation/widgets/shared/item_card.dart';

class StoreGrid extends StatelessWidget {
  const StoreGrid(
      {super.key, required this.stores, required this.isLoadingMore});

  final List<StoreModel> stores;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: stores.length + (isLoadingMore ? 8 : 0),
      itemBuilder: (context, index) {
        if (index >= stores.length) {
          return const Center(child: CircularProgressIndicator());
        }

        return ItemCard(
            itemName: stores[index].name,
            itemInformation: "Lantai ${stores[index].floorName}");
      },
    );
  }
}
