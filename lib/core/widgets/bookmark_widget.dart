import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/features/home/presentation/view_models/saved_cubit/saved_cubit.dart';

import '../consts/style.dart';

class BookmarkWidget extends StatefulWidget {
  const BookmarkWidget({
    super.key,
    required this.job,
    this.color = AppConsts.neutral900,
  });
  final Job job;
  final Color color;
  @override
  State<BookmarkWidget> createState() => _BookmarkWidgetState();
}

class _BookmarkWidgetState extends State<BookmarkWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );
    sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(
          tween: Tween(begin: 25, end: 30),
          weight: 50,
        ),
        TweenSequenceItem(
          tween: Tween(begin: 30, end: 25),
          weight: 50,
        ),
      ],
    ).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCubit, SavedState>(
      builder: (context, state) {
        bool isSaved = BlocProvider.of<SavedCubit>(context).checkSavedOrNot(
          job: widget.job,
        );
        return IconButton(
          onPressed: () {
            isSaved ? controller.reverse() : controller.forward();
            BlocProvider.of<SavedCubit>(context).onChangeSaved(job: widget.job);
          },
          icon: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Icon(
                FontAwesomeIcons.bookmark,
                size: sizeAnimation.value,
                color: isSaved ? AppConsts.primary500 : widget.color,
              );
            },
          ),
        );
      },
    );
  }
}
