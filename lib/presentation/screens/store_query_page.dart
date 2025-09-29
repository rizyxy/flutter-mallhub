import 'package:flutter/material.dart';
import 'package:flutter_mallhub/presentation/widgets/store/store_query_bar.dart';

class StoreQueryPage extends StatelessWidget {
  const StoreQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StoreQueryBar(),
          ],
        ),
      )),
    );
  }
}
