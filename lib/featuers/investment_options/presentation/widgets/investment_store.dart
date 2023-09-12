import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/featuers/investment_options/models/investment_store_model.dart';
import 'package:jessy_mall/featuers/investment_options/presentation/bloc/invest_option_bloc/invest_option_bloc.dart';
import 'package:jessy_mall/featuers/investment_options/presentation/page/invest_store_ui.dart';
import 'package:jessy_mall/featuers/investment_options/presentation/page/invest_store_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jessy_mall/featuers/investment_options/presentation/widgets/card_store.dart';
import '../../../../core/utils/global_snackbar.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../Auth/presintation/bloc/auth_bloc.dart';

class InvestmentStoreUI extends StatelessWidget {
  /* final List<Listing> listings = [
    Listing(
      photoUrl:
          'https://image.cnbcfm.com/api/v1/image/103448059-GettyImages-492843021.jpg?v=1675861201&w=740&h=416&ffmt=webp&vtcrop=y',
      floor: '3rd floor',
      space: '120 sq. ft.',
      type: 'Snack',
      price: '\$500/year',
    ),
    Listing(
      photoUrl:
          'https://image.cnbcfm.com/api/v1/image/103448059-GettyImages-492843021.jpg?v=1675861201&w=740&h=416&ffmt=webp&vtcrop=y',
      floor: '1st floor',
      space: '80 sq. ft.',
      type: 'Caffe',
      price: '\$400/year',
    ),
    // Add more listings as needed
  ];*/

  List<InvestStoreDataModel>? investStoreModel;

  InvestmentStoreUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InvestOptionBloc, InvestOptionState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is InvestStoreOptionFailed) {
          gShowErrorSnackBar(
              context: context, message: StringManager.sthWrong.tr());
        }
        if (state is InvestStoreOptionSuccessd) {
          // print(state.profileModel.profileDataModel?.email);
          investStoreModel = state.investStoreModel.allStores;
        }
        if (state is InvestOptionInitial) {
          print('dasdasdasasdxxxxxxxxxxxxxxxxxxx');

          context.read<InvestOptionBloc>().add(GetInvestStoreOption(
              token: context.read<AuthBloc>().token ?? ''));
        }
      },
      builder: (context, state) {
        if (state is InvestOptionInitial) {
          print('dasdasdasasd');
          context.read<InvestOptionBloc>().add(GetInvestStoreOption(
              token: context.read<AuthBloc>().token ?? ''));
        }

        return Stack(
          children: [
            ListView.builder(
              itemCount: investStoreModel?.length ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(30.w),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => InvestStorePage(
                                      investStoreDataModel:
                                          investStoreModel![index],
                                    )));
                      },
                      child:
                          CardStore(listings: investStoreModel!, index: index)),
                );
              },
            ),
            if (state is InvestOptionLoading)
              const LoadingWidget(
                fullScreen: true,
              ),
          ],
        );
      },
    );
  }
}
