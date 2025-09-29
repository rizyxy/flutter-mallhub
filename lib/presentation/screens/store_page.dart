import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mallhub/presentation/bloc/store_bloc/store_bloc.dart';
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
                children: <Widget>[
                  BlocBuilder<StoreBloc, StoreState>(builder: (context, state) {
                    if (state is StoreLoading) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (state is StoreSuccess) {
                      return StoreGrid();
                    }

                    return SizedBox.shrink();
                  })
                ],
              ))),
    );
  }
}
