import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';
import 'package:jobsque/features/home/presentation/view_models/saved_cubit/saved_cubit.dart';

import '../consts/style.dart';

class BookmarkWidget extends StatelessWidget {
  const BookmarkWidget({
    super.key,
    required this.job,
    this.color = AppConsts.neutral900,
  });

  final Job job;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () =>
          BlocProvider.of<SavedCubit>(context).onChangeSaved(job: job),
      icon: BlocBuilder<SavedCubit, SavedState>(
        builder: (context, state) {
          bool isSaved =
              BlocProvider.of<SavedCubit>(context).checkSavedOrNot(job: job);
          return Icon(
            FontAwesomeIcons.bookmark,
            color: isSaved ? AppConsts.primary500 : color,
          );
        },
      ),
    );
  }
}
