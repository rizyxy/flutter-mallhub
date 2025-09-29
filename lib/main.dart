import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mallhub/presentation/screens/store_page.dart';

void main(List<String> args) async {
  await dotenv.load(fileName: '.env');

  runApp(const MallHub());
}

class MallHub extends StatelessWidget {
  const MallHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StorePage(),
    );
  }
}
