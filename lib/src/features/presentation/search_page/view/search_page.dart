import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/BaseView.dart';
import 'package:project_flutter_app_delivery/src/Base/Views/LoadingView.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';
import 'package:project_flutter_app_delivery/src/features/domain/Entities/Places/PlaceList/PlaceListEntity.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/Error/ErrorView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Cards/populares_card.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/Texts/header_double.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/common_widgets/header_text.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/search_page/ViewModel/SearchPageViewModel.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/search_page/view/Components/SearchPageResultsView.dart';
import 'package:project_flutter_app_delivery/src/features/presentation/search_page/view/Components/SearchPageSuggestions.dart';

class SearchPage extends SearchDelegate with BaseView {

  final SearchPageViewModel viewModel;

  SearchPage({ SearchPageViewModel? searchPageViewModel })
   : viewModel = searchPageViewModel ?? DefaultSearchPageViewModel();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: const TextTheme(
        // Use this to change the query's text style
        headline6: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.orange,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        // Use this change the placeholder's text style
        hintStyle: TextStyle(fontSize: 18.0),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: viewModel.fetchPlacesListByQuery(query: query),
        builder: (BuildContext context, AsyncSnapshot<PlaceListEntity> snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingView();
            case ConnectionState.done:
              if (snapshot.hasError || !snapshot.hasData) {
                return ErrorView();
              }
              if (snapshot.data?.placeList?.isEmpty ?? true) {
                return SearchPageSuggestionsView(textHeader: 'No results found',
                                                 textAction: '',
                                                 isRecentSearchSuggestions: false,
                                                 viewModel: viewModel);
              } else {
                return SearchPageBuildResultsView(places: snapshot.data?.placeList ?? []);
              }
            default:
              return LoadingView();
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return SearchPageSuggestionsView(textHeader: 'Recently viewed',
                                       textAction: 'Clear All',
                                       isRecentSearchSuggestions: true,
                                       viewModel: viewModel);
    } else {
      // TODO: Implementar sugerencias de búsqueda en base a la query
      return Container();
    }
  }
}


