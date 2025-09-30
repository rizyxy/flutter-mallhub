import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mallhub/presentation/bloc/floor_bloc/floor_bloc.dart';
import 'package:flutter_mallhub/presentation/widgets/shared/item_pill.dart';

class StoreFloorFilterSection extends StatelessWidget {
  const StoreFloorFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FloorBloc>(
      create: (context) => FloorBloc()..add(FetchFloors()),
      child: BlocBuilder<FloorBloc, FloorState>(builder: (context, state) {
        if (state is FloorLoading) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(30),
            child: CircularProgressIndicator(),
          ));
        }

        if (state is FloorSuccess) {
          return Wrap(
            children: <Widget>[
              ItemPill(itemName: "Lantai 1", isSelected: true)
            ],
          );
        }

        return SizedBox.shrink();
      }),
    );
  }
}
