import 'package:flutter/material.dart';
import 'package:flutter_mallhub/presentation/widgets/store/store_grid.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[StoreGrid()],
              ))),
    );
  }
}
