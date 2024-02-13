import 'package:flutter/material.dart';

class FadingListView extends StatelessWidget {
  const FadingListView({
    super.key,
    required this.scrollDirc,
    required this.widget,
    this.isNeverScroll = false,
  });

  final Widget widget;

  final Axis scrollDirc;
  final bool isNeverScroll;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      shrinkWrap: true,
      scrollDirection: scrollDirc,
      physics: isNeverScroll
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget,
        );
      },
    );
  }
}
