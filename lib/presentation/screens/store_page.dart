import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mallhub/presentation/bloc/store_bloc/store_bloc.dart';
import 'package:flutter_mallhub/presentation/screens/store_query_page.dart';
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
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    "All Stores",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StoreQueryPage()));
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Text("Search Store..."),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: BlocConsumer<StoreBloc, StoreState>(
                        listener: (context, state) async {
                      if (state is StoreLoadMoreError) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                state.errorMessage ?? "An error has occured")));

                        await Future.delayed(Duration(seconds: 2));

                        if (context.mounted) {
                          context.read<StoreBloc>().add(FetchMoreStores());
                        }
                      }

                      if (state is StoreError) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(state.errorMessage ??
                                  "An error has occured")));
                        }

                        await Future.delayed(Duration(seconds: 2));

                        if (context.mounted) {
                          context.read<StoreBloc>().add(FetchStores());
                        }
                      }
                    }, builder: (context, state) {
                      if (state is StoreLoading || state is StoreError) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (state is StoreLoadingMore) {
                        return StoreGrid(
                          key: const PageStorageKey<String>(
                              'storeGridScrollPosition'),
                          stores: state.stores,
                          isLoadingMore: true,
                        );
                      }

                      if (state is StoreLoadMoreError) {
                        return StoreGrid(
                          key: const PageStorageKey<String>(
                              'storeGridScrollPosition'),
                          stores: state.storePaginated.stores,
                          isLoadingMore: true,
                        );
                      }

                      if (state is StoreSuccess) {
                        return NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              _onScrollMax(context, notification);
                              return false;
                            },
                            child: StoreGrid(
                              key: const PageStorageKey<String>(
                                  'storeGridScrollPosition'),
                              stores: state.storePaginated.stores,
                              isLoadingMore: false,
                            ));
                      }

                      return const SizedBox.shrink();
                    }),
                  )
                ],
              ))),
    );
  }
}
