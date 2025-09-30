import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mallhub/presentation/bloc/store_filter_cubit/store_filter_cubit.dart';
import 'package:flutter_mallhub/presentation/bloc/store_query_bloc/store_query_bloc.dart';

class StoreQueryBar extends StatefulWidget {
  const StoreQueryBar({super.key, required this.parentScaffoldKey});

  final GlobalKey<ScaffoldState> parentScaffoldKey;

  @override
  State<StoreQueryBar> createState() => _StoreQueryBarState();
}

class _StoreQueryBarState extends State<StoreQueryBar> {
  late final TextEditingController _storeNameController;

  bool _isStoreNameEmpty = true;

  @override
  void initState() {
    super.initState();
    _storeNameController = TextEditingController();
    _storeNameController.addListener(() {
      if (_storeNameController.text.isEmpty) {
        setState(() {
          _isStoreNameEmpty = true;
        });
      } else if (_storeNameController.text.isNotEmpty) {
        setState(() {
          _isStoreNameEmpty = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _storeNameController,
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: "Search Store",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      context
                          .read<StoreFilterCubit>()
                          .modifyQuery('storeName', _storeNameController.text);

                      context.read<StoreQueryBloc>().add(FetchStoreQuery(
                          query: context.read<StoreFilterCubit>().state));
                    },
                    child: const Icon(Icons.search))
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            widget.parentScaffoldKey.currentState!.openDrawer();
          },
          borderRadius: BorderRadius.circular(15),
          child: Ink(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15)),
            child: const Icon(Icons.filter_alt),
          ),
        )
      ],
    );
  }
}
