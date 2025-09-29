import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mallhub/presentation/bloc/store_bloc/store_bloc.dart';
import 'package:flutter_mallhub/presentation/screens/store_page.dart';

void main(List<String> args) async {
  await dotenv.load(fileName: '.env');

  runApp(MultiBlocProvider(providers: [
    BlocProvider<StoreBloc>(
        create: (context) => StoreBloc()..add(FetchStores()))
  ], child: const MallHub()));
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
