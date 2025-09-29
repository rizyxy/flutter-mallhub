import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mallhub/presentation/bloc/store_bloc/store_bloc.dart';
import 'package:flutter_mallhub/presentation/widgets/store/store_grid.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  void _onScrollMax(BuildContext context, ScrollNotification notification) {
    if (notification.metrics.pixels >= notification.metrics.maxScrollExtent) {
      context.read<StoreBloc>().add(FetchMoreStores());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: BlocBuilder<StoreBloc, StoreState>(
                        builder: (context, state) {
                      if (state is StoreLoading) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (state is StoreLoadingMore) {
                        return StoreGrid();
                      }

                      if (state is StoreSuccess) {
                        return NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              _onScrollMax(context, notification);
                              return false;
                            },
                            child: StoreGrid());
                      }

                      return SizedBox.shrink();
                    }),
                  )
                ],
              ))),
    );
  }
}
