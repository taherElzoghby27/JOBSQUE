import 'package:flutter/material.dart';
import 'package:jobsque/features/auth/presentation/view/widgets/create_new_pass_body.dart';

class CreatePassView extends StatelessWidget {
  const CreatePassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CreatePassBody(),
    );
  }
}
