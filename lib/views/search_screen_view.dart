import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Search",
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: _searchBarWidget(
                    controller: searchController,
                    hintText: "Search Transactions",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField _searchBarWidget({
    required String hintText,
    required TextEditingController controller,
  }) =>
      TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.blue,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 13.0,
            horizontal: 8,
          ),
          fillColor: const Color(0xffedebeb),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey,
          ),
          filled: true,
        ),
      );
}
