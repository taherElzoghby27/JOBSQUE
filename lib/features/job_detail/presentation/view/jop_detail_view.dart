import 'package:flutter/material.dart';
import 'package:jobsque/core/models/job_model/job_model.dart';

import 'widgets/jop_detail_body.dart';

class JopDetailView extends StatelessWidget {
  const JopDetailView({super.key, required this.job});

  final Job job;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: JopDetailBody(job: job),
      ),
    );
  }
}
