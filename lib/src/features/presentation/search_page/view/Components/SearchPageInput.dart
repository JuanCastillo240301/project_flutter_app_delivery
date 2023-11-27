import 'package:flutter/material.dart';
import 'package:project_flutter_app_delivery/src/colors.dart';

class SearchPageInput extends StatelessWidget {

  SearchPageInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 5.0),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(142, 142, 147, 1.2),
          borderRadius: BorderRadius.circular(20.0)),
      child: const TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 5.0),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            hintText: 'Search',
            border: OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
