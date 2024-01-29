import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/consts/routesPage.dart';
import '../../../../../core/models/job_model/job_model.dart';
import 'item_suggested_jop.dart';

class JobsList extends StatefulWidget {
  const JobsList({
    super.key,
    required this.jobs,
  });

  final List<Job> jobs;

  @override
  State<JobsList> createState() => _JobsListState();
}

class _JobsListState extends State<JobsList> {
  final GlobalKey<AnimatedListState> keyList = GlobalKey<AnimatedListState>();
  List<ItemSuggestedJop> jobsWidget = [];
  List<Job> jobs = [];

  @override
  void initState() {
    //waiting & scheduling
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => addJobs());
    super.initState();
  }

  //add jobs
  addJobs() {
    jobs.addAll(widget.jobs);
    Future future = Future(() {});
    for (var job in jobs) {
      future = future.then(
        (value) => Future.delayed(const Duration(milliseconds: 100)).then(
          (value) {
            jobsWidget.add(_buildWidget(job));
            keyList.currentState!.insertItem(jobsWidget.length - 1);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: keyList,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index, animation) {
        Tween<double> opacity = Tween(begin: 0.0, end: 1.0);
        //get item from left
        Tween<Offset> offsetOdd = Tween(
          begin: const Offset(-1, -1),
          end: const Offset(0, 0),
        );
        //get item from right
        Tween<Offset> offsetEven = Tween(
          begin: const Offset(1, 1),
          end: const Offset(0, 0),
        );
        return FadeTransition(
          opacity: animation.drive(opacity),
          child: SlideTransition(
            position: animation.drive(
              index % 2 == 0 ? offsetEven : offsetOdd,
            ),
            child: jobsWidget[index],
          ),
        );
      },
      initialItemCount: jobsWidget.length,
    );
  }

//build widget
  ItemSuggestedJop _buildWidget(Job job) {
    return ItemSuggestedJop(
      onTap: () => GoRouter.of(context).push(jopDetailPath, extra: job),
      job: job,
    );
  }
}
