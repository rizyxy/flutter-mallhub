import 'package:flutter/material.dart';

class ItemPill extends StatelessWidget {
  const ItemPill({super.key, required this.itemName, required this.isSelected});

  final String itemName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: isSelected ? Colors.red.shade700 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        itemName,
        style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.white : Colors.black),
      ),
    );
  }
}
