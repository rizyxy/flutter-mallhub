import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mallhub/presentation/bloc/floor_bloc/floor_bloc.dart';
import 'package:flutter_mallhub/presentation/bloc/store_filter_cubit/store_filter_cubit.dart';
import 'package:flutter_mallhub/presentation/bloc/store_query_bloc/store_query_bloc.dart';
import 'package:flutter_mallhub/presentation/widgets/store/store_filter/store_floor_filter_section.dart';
import 'package:flutter_mallhub/presentation/widgets/store/store_grid.dart';
import 'package:flutter_mallhub/presentation/widgets/store/store_query_bar.dart';

class StoreQueryPage extends StatelessWidget {
  StoreQueryPage({super.key});

  final GlobalKey<ScaffoldState> _storeQueryScaffoldKey =
      GlobalKey<ScaffoldState>();

  void _onScrollMax(BuildContext context, ScrollNotification notification) {
    if (notification.metrics.pixels >= notification.metrics.maxScrollExtent) {
      context.read<StoreQueryBloc>().add(
          FetchMoreStoreQuery(query: context.read<StoreFilterCubit>().state));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<StoreFilterCubit>(create: (context) => StoreFilterCubit()),
        BlocProvider<StoreQueryBloc>(create: (context) => StoreQueryBloc()),
        BlocProvider<FloorBloc>(
            create: (context) => FloorBloc()..add(FetchFloors()))
      ],
      child: Scaffold(
        key: _storeQueryScaffoldKey,
        drawer: const Drawer(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Floor",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  StoreFloorFilterSection()
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                "Search Stores",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              StoreQueryBar(
                parentScaffoldKey: _storeQueryScaffoldKey,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: BlocBuilder<StoreQueryBloc, StoreQueryState>(
                    builder: (context, state) {
                  if (state is StoreQueryLoading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state is StoreQueryLoadingMore) {
                    return StoreGrid(
                        key: const PageStorageKey<String>(
                            'storeQueryGridScrollPosition'),
                        stores: state.stores,
                        isLoadingMore: true);
                  }

                  if (state is StoreQuerySuccess) {
                    return NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        _onScrollMax(context, notification);
                        return false;
                      },
                      child: StoreGrid(
                          key: const PageStorageKey<String>(
                              'storeQueryGridScrollPosition'),
                          stores: state.stores,
                          isLoadingMore: false),
                    );
                  }

                  return const SizedBox.shrink();
                }),
              )
            ],
          ),
        )),
      ),
    );
  }
}
