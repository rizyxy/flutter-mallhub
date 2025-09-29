import 'package:flutter/material.dart';

class StoreQueryBar extends StatefulWidget {
  StoreQueryBar({
    super.key,
  });

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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _storeNameController,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: "Search Store",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                Builder(builder: (context) {
                  if (!_isStoreNameEmpty) {
                    return InkWell(onTap: () {}, child: Icon(Icons.search));
                  }

                  return SizedBox.shrink();
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
