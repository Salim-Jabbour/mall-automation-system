import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/config/theme/color_manager.dart';
import 'package:jessy_mall/core/resource/asset_manager.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/utils/global_snackbar.dart';
import 'package:jessy_mall/core/widgets/header_page.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/products_in_warehouse/presentation/pages/products_in_warehouse_page.dart';
import 'package:jessy_mall/featuers/profile/presentation/bloc/wearhouseInvestorbloc/bloc/wearhouse_investor_bloc.dart';
import 'package:jessy_mall/featuers/profile/presentation/page/show_income&outcome_page.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../products_in_store/presentation/pages/products_in_store_page.dart';
import '../bloc/upload_excel_file/upload_excel_file_bloc.dart';
import '../widget/profile_card_widget.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widget/space_request_number_widget.dart';

import 'package:file_picker/file_picker.dart';

class ManageWearHousePage extends StatelessWidget {
  const ManageWearHousePage({super.key});

  void pickAndUploadExcel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xls', 'xlsx'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      print(
          "SAAAAAAAAAAAAALIIIIIIIIIIIIIIIIIIIIIMMMMMMMMMMMMMMMMMMMMMPPPPPPOOOOOOOOOOOOOO");
      print(file.size);
      print(file.name);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    int selectedNumber = 5;
    void modalBottomSheetMenu({required var onPressed}) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 700.h,
            width: 1000.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  // direction: Axis.horizontal,
                  // crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                          vertical: 50.h, horizontal: 50.w),
                      child: Wrap(
                        spacing: 30.w,
                        direction: Axis.horizontal,
                        children: List.generate(
                          3,
                          (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedNumber = (index + 1) * 5;
                                });
                              },
                              child: InvestorSpaceRequestNumberWidget(
                                index: (index + 1) * 5,
                                color: selectedNumber == (index + 1) * 5
                                    ? ColorManager.black
                                    : ColorManager.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 120.h),
                    CustomButton(
                        text: StringManager.confirm.tr(), onPressed: onPressed),
                  ],
                );
              },
            ),
          );
        },
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I.get<WearhouseInvestorBloc>(),
        ),
        BlocProvider(
          create: (context) => GetIt.I.get<UploadExcelFileBloc>(),
        ),
      ],
      child: Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          color: ColorManager.backgroundL,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderPage(title: StringManager.wearhouse.tr(), left: true),
                SizedBox(
                  height: 100.h,
                ),
                ProfileCardWidget(
                  titleInListTile: StringManager.showProduct.tr(),
                  subtitleInListTile: "",
                  navigatorFunc: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ProductsInWarehousePage()));
                  },
                ),
                ProfileCardWidget(
                  titleInListTile: StringManager.showIncome.tr(),
                  subtitleInListTile: "",
                  navigatorFunc: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const ShowIncomeOutcomePage(isIncome: true)));
                  },
                ),
                ProfileCardWidget(
                  titleInListTile: StringManager.showOutcome.tr(),
                  subtitleInListTile: "",
                  navigatorFunc: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                const ShowIncomeOutcomePage(isIncome: false)));
                  },
                ),
                BlocConsumer<WearhouseInvestorBloc, WearhouseInvestorState>(
                  listener: (context, state) {
                    if (state is WearhouseInvestorRequestExtraSpaceSuccess) {
                      gShowSuccessSnackBar(
                          context: context,
                          message:
                              StringManager.addSuccessWaitingForAccept.tr());
                    }
                    if (state is WearhouseInvestorDeleteProductFailure) {
                      gShowErrorSnackBar(
                          context: context, message: state.failure.message);
                    }
                  },
                  builder: (context, state) {
                    return Stack(
                      children: [
                        ProfileCardWidget(
                          titleInListTile: StringManager.extraSpace.tr(),
                          subtitleInListTile: StringManager.extraSpacedesc.tr(),
                          navigatorFunc: () {
                            print(selectedNumber);
                            modalBottomSheetMenu(onPressed: () {
                              context.read<WearhouseInvestorBloc>().add(
                                  WearhouseInvestorRequestExtraSpace(
                                      token:
                                          context.read<AuthBloc>().token ?? '',
                                      space: selectedNumber));
                              Navigator.pop(context);
                            });
                          },
                        ),
                        if (state is WearhouseInvestorRequestExtraSpaceLoading)
                          Container(
                            color: Colors.white30,
                            height: 300.h,
                            width: 950.w,
                            child: Lottie.asset(AssetJsonManager.loading),
                          )
                      ],
                    );
                  },
                ),
                // BlocConsumer<UploadExcelFileBloc, UploadExcelFileState>(
                //   listener: (context, state) {
                //     if (state is UploadExcelFileSuccess) {
                //       gShowSuccessSnackBar(
                //         context: context,
                //         message: state.successMessage,
                //       );
                //     }
                //     if (state is UploadExcelFileFailed) {
                //       gShowErrorSnackBar(
                //           context: context,
                //           message: StringManager.sthWrong.tr());
                //     }
                //   },
                //   builder: (context, state) {
                //     return Stack(
                //       children: [
                //         ProfileCardWidget(
                //           titleInListTile: StringManager.uploadExcel.tr(),
                //           subtitleInListTile:
                //               StringManager.uploadExcelDesc.tr(),
                //           navigatorFunc: () async {
                //             FilePickerResult? result =
                //                 await FilePicker.platform.pickFiles(
                //               type: FileType.custom,
                //               allowedExtensions: ['xls', 'xlsx'],
                //             );

                //             if (result != null) {
                  //TODO: try with out 
                //               PlatformFile file = result.files.first;

                //               print(
                //                   "SAAAAAAAAAAAAALIIIIIIIIIIIIIIIIIIIIIMMMMMMMMMMMMMMMMMMMMMPPPPPPOOOOOOOOOOOOOO");
                //               print(file.size);
                //               print(file.name);
                //               context.read<UploadExcelFileBloc>().add(
                //                   UploadExcelEvent(
                //                       context.read<AuthBloc>().token ?? '',
                //                       file));
                //             } else {
                //               gShowErrorSnackBar(
                //                   context: context,
                //                   message: "You Didn't choose any file");
                //             }
                //           },
                //         ),
                //         if (state is UploadExcelFileLoading)
                //           SizedBox(
                //             height: 300.h,
                //             child: Column(
                //               children: [
                //                 SizedBox(
                //                   height: 200.h,
                //                   width: 300.w,
                //                   child: Lottie.asset(AssetJsonManager.loading),
                //                 ),
                //                 SizedBox(
                //                   height: 50.h,
                //                 ),
                //                 Text(
                //                   StringManager.loading.tr(),
                //                   style: TextStyle(
                //                       color: ColorManager.black,
                //                       fontSize: 30.sp,
                //                       fontWeight: FontWeight.w800),
                //                 ),
                //               ],
                //             ),
                //           )
                //       ],
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
