import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';
import 'package:jobsque/features/search_jop/presentation/view/widgets/custom_popular_recent_search.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TileWidget(
          label: StringsEn.recentSearches,
        ),

        ///recent searches
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CustomRecentOrPopularWidget(
              leading: FontAwesomeIcons.clock,
              jop: 'Junior Software Engineer',
              trailingOnTap: () {},
              trailing: FontAwesomeIcons.circleXmark,
            );
          },
          itemCount: 5,
        ),
      ],
    );
  }
}
