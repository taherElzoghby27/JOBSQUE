import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/consts/style.dart';
import 'package:jobsque/core/widgets/tile_widget.dart';

import '../../../../../core/consts/strings.dart';
import 'custom_popular_recent_search.dart';

class PopularSearch extends StatelessWidget {
  const PopularSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TileWidget(
          label: StringsEn.popularSearches,
        ),

        ///popular searches
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CustomRecentOrPopularWidget(
              leading: FontAwesomeIcons.magnifyingGlass,
              jop: 'Junior Software Engineer',
              trailingOnTap: () {},
              trailing: FontAwesomeIcons.arrowRight,
              trailingColor: AppConsts.primary500,
            );
          },
          itemCount: 5,
        ),
      ],
    );
  }
}
