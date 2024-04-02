import 'package:alquran_kareem/theme/theme_color.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 20.0), // Atur margin bottom sebesar 10
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Color.fromRGBO(206, 203, 203, 1),
            size: 25,
          ),
          suffixIcon: const Icon(
            Icons.mic,
            color: kPrimaryColor,
            size: 25,
          ),
          // helperText: "Search your surah",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Search Surah ...",
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none
          ),
          isDense: true,
        ),
      ),
    );
  }
}
