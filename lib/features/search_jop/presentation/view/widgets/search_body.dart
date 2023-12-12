import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/models/job_model.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/filtering_search.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/popular_search.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/recent_searchs.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/result_section.dart';
import 'package:jobsque/features/search_jop/presentation/view_model/search_bloc/search_bloc.dart';

import 'search_section.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        bool initial = false;
        if (state is SearchInitial) {
          initial = true;
        }
        return ListView(
          children: [
            SizedBox(height: size.height * .02.h),

            ///section search field
            SectionSearch(
              onChanged: (String value) =>
                  BlocProvider.of<SearchBloc>(context).add(
                SearchingEvent(searchText: value),
              ),
            ),
            SizedBox(height: size.height * .015.h),

            ///section filtering
            initial ? Container() : SectionFiltering(),
            SizedBox(height: size.height * .015.h),

            ///section result
            initial
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
      },
    );
  }
}
