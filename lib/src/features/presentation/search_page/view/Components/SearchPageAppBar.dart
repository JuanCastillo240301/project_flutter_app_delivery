import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Components/BackButtons/BackButtonView/View/BackButtonView.dart';

class SearchPageAppBar extends StatelessWidget {
  const SearchPageAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.white,
      leading: BackButtonView(),
    );
  }
}
/*
actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: IconButton(
              icon: const Icon(
                Icons.filter_list,
                size: 36,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'filter');
              }
          ),
        )
      ]
 */