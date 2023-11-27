

import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/search_page/view/search_page.dart';
import 'package:project_flutter_app_delivery/src/utils/helpers/ScreenSize/ScreenSizeHelper.dart';

class SearchTopBar extends StatelessWidget {

  const SearchTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showSearch(context: context, delegate:  SearchPage());
          },
          child: Container(
            width: getScreenWidth(context: context, multiplier: 0.93),
            padding: const EdgeInsets.only( top: 10.0, bottom: 10.0, left: 10.0),
            margin: const EdgeInsets.only(left: 0, top: 20),
            decoration: BoxDecoration(
                border: Border.all(color: const Color.fromRGBO(234, 236, 239, 1.0)),
                borderRadius: BorderRadius.circular(20.0)),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  size: 20.0,
                  color: Colors.grey,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: const Text('Search',
                      style: TextStyle(color: Colors.grey, fontSize: 18.0)),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
