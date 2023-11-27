import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/search_page/ViewModel/SearchPageViewModel.dart';

class QuerySuggestionView extends StatelessWidget {

  final String suggestion;
  final SearchPageViewModel viewModel;

  QuerySuggestionView({ Key? key,
                        required this.suggestion,
                        required this.viewModel }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          const Icon(Icons.search),
          SizedBox(width: 6),
          Text(suggestion)
        ],
      ),
    );
  }

}