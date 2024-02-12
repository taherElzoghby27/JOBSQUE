import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/filtering_search.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/popular_search.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/recent_searchs.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/section_result_listview_bloc_builder.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/features/search_jop/presentation/view_model/search_bloc/search_cubit.dart';
import 'search_section.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        bool initial = false;
        if (state is SearchInitial) {
          initial = true;
        }
        return ListView(
          children: [
            const AspectRatio(aspectRatio: AppConsts.aspect16on1),

            ///section search field
            SectionSearch(
              onChanged: (String value) =>
                  BlocProvider.of<SearchCubit>(context).search(
                searchText: value,
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
                : SectionResultListViewBlocBuilder(),
          ],
        );
      },
    );
  }
}
