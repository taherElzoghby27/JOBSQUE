import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:jobsque/core/models/user_profile_model/portfolio.dart';
import 'package:jobsque/core/widgets/small_loading_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/cv_widget.dart';
import 'package:jobsque/features/job_detail/presentation/view/widgets/initial_cv_widget.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/presentation/view_models/portfolio_cubit/portfolio_cubit.dart';

class Portfolios extends StatelessWidget {
  const Portfolios({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<PortfolioCubit, PortfolioState>(
      builder: (context, state) {
        if (state is GetFilesLoading) {
          return LoadingWidget(height: size.height * .2.h);
        } else if (state is GetFilesSuccess) {
          List<PortfolioModel>? cvs = state.cvs;
          return Center(
            child: cvs!.isEmpty
                ? InitialCvWidget()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => CvWidget(
                      name: cvs[index].cvFile!,
                    ),
                    itemCount: cvs.length,
                  ),
          );
        }
        return Center(child: InitialCvWidget());
      },
      listener: (context, state) {
        if (state is GetFilesFailure) {
          showSnack(context, message: state.message);
        }
      },
    );
  }
}
