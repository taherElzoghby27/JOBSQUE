import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_tile_info_help_center.dart';

class CustomHelpCenterInfo extends StatelessWidget {
  const CustomHelpCenterInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
        CustomTileInfoHelpCenter(),
      ],
    );
  }
}
