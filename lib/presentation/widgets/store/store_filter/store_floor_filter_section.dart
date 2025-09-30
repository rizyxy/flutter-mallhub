import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mallhub/presentation/bloc/floor_bloc/floor_bloc.dart';
import 'package:flutter_mallhub/presentation/bloc/store_filter_cubit/store_filter_cubit.dart';
import 'package:flutter_mallhub/presentation/bloc/store_query_bloc/store_query_bloc.dart';
import 'package:flutter_mallhub/presentation/widgets/shared/item_pill.dart';

class StoreFloorFilterSection extends StatelessWidget {
  const StoreFloorFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FloorBloc, FloorState>(builder: (context, state) {
      if (state is FloorLoading) {
        return Center(
            child: Padding(
          padding: const EdgeInsets.all(30),
          child: CircularProgressIndicator(),
        ));
      }

      if (state is FloorSuccess) {
        return Wrap(
            spacing: 20,
            runSpacing: 20,
            children: state.floors
                .map((floor) =>
                    BlocBuilder<StoreFilterCubit, Map<String, dynamic>>(
                        builder: (context, filterState) {
                      return InkWell(
                        onTap: () {
                          context
                              .read<StoreFilterCubit>()
                              .modifyQuery('floorId', floor.id);

                          context.read<StoreQueryBloc>().add(FetchStoreQuery(
                              query: context.read<StoreFilterCubit>().state));
                        },
                        child: ItemPill(
                            itemName: floor.name,
                            isSelected: filterState['floorId'] == floor.id),
                      );
                    }))
                .toList());
      }

      return SizedBox.shrink();
    });
  }
}
