import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/features/saved/presentation/view/widgets/saved_body.dart';
import 'package:jobsque/features/saved/presentation/view_models/saved_cubit/saved_cubit.dart';

class SavedView extends StatefulWidget {
  const SavedView({super.key});

  @override
  State<SavedView> createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> {
  @override
  void initState() {
    //init saved jobs
    BlocProvider.of<SavedCubit>(context).getSavedJobs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SavedBody(),
      ),
    );
  }
}
