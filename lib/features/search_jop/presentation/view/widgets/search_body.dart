import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/filtering_search.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/popular_search.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/recent_searchs.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/result_section.dart';

import 'search_section.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  TextEditingController searchControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        SizedBox(height: size.height * .02.h),

        ///section search field
        SectionSearch(
          searchController: searchControll,
        ),
        SizedBox(height: size.height * .015.h),

        ///section filtering
        searchControll.text.isEmpty ? Container() : SectionFiltering(),
        SizedBox(height: size.height * .015.h),

        ///section result
        searchControll.text.isEmpty
            ? Column(
                children: [
                  RecentSearch(),
                  SizedBox(height: size.height * .015.h),
                  PopularSearch(),
                ],
              )
            : SectionResult(),
      ],
    );
  }
}
