import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/manage_store/presentation/pages/edit_store_info.dart';
import 'package:jessy_mall/featuers/products_in_store/presentation/pages/products_in_store_page.dart';
import 'package:jessy_mall/featuers/profile/presentation/widget/profile_card_widget.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/theme/color_manager.dart';
import '../../../../core/resource/asset_manager.dart';
import '../../../../core/utils/global_snackbar.dart';
import '../bloc/upload_excel_file/upload_excel_file_bloc.dart';
import '../page/manage_wearhouse_page.dart';
import '../page/show_bills_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:io' as used;

class ManageMyStoreWidget extends StatelessWidget {
  const ManageMyStoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<UploadExcelFileBloc>(),
      child: Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          color: ColorManager.backgroundL,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileCardWidget(
                      titleInListTile: StringManager.editStroeInfo.tr(),
                      subtitleInListTile: StringManager.editStroeInfoDesc.tr(),
                      width: 500,
                      height: 400,
                      navigatorFunc: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => EditStoreInfo()));
                      },
                    ),

                    //Salim STAARTTT
                    BlocConsumer<UploadExcelFileBloc, UploadExcelFileState>(
                      listener: (context, state) {
                        if (state is UploadExcelFileSuccess) {
                          gShowSuccessSnackBar(
                            context: context,
                            message: state.successMessage,
                          );
                        }
                        if (state is UploadExcelFileFailed) {
                          gShowErrorSnackBar(
                            context: context,
                            message: StringManager.sthWrong.tr(),
                          );
                        }
                      },
                      builder: (context, state) {
                        return Stack(
                          children: [
                            ProfileCardWidget(
                              titleInListTile: StringManager.uploadExcel.tr(),
                              subtitleInListTile:
                                  StringManager.uploadExcelDesc.tr(),
                              width: 500,
                              height: 400,
                              navigatorFunc: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: ['xls', 'xlsx'],
                                );

                                if (result != null) {
                                  used.File file =
                                      used.File(result.files.single.path!);
                                  print(used.File(result.files.single.path!));
                                  print(await file.length());
                                  print(
                                      "SAAAAAAAAAAAAALIIIIIIIIIIIIIIIIIIIIIMMMMMMMMMMMMMMMMMMMMMPPPPPPOOOOOOOOOOOOOO");

                                  context.read<UploadExcelFileBloc>().add(
                                      UploadExcelEvent(
                                          context.read<AuthBloc>().token ?? '',
                                          file));
                                } else {
                                  gShowErrorSnackBar(
                                      context: context,
                                      message: "You Didn't choose any file");
                                }
                              },
                            ),
                            if (state is UploadExcelFileLoading)
                              Container(
                                height: 400.h,
                                color: Colors.white54,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 300.h,
                                      width: 500.w,
                                      child: Lottie.asset(
                                          AssetJsonManager.loading),
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    Text(
                                      StringManager.loading.tr(),
                                      style: TextStyle(
                                          color: ColorManager.black,
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              )
                          ],
                        );
                      },
                    ),

                    //SAlim end
                    // ProfileCardWidget(
                    //   titleInListTile: StringManager.uploadExcel.tr(),
                    //   subtitleInListTile: StringManager.uploadExcelDesc.tr(),
                    //   width: 500,
                    //   height: 400,
                    //   navigatorFunc: () {},
                    // ),
                  ],
                ),
                SizedBox(
                  height: 100.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileCardWidget(
                      titleInListTile: StringManager.showProduct.tr(),
                      subtitleInListTile: "",
                      width: 500,
                      height: 400,
                      navigatorFunc: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductsInStorePage()));
                      },
                    ),
                    ProfileCardWidget(
                      titleInListTile: StringManager.wearhouse.tr(),
                      subtitleInListTile: "",
                      width: 500,
                      height: 400,
                      navigatorFunc: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ManageWearHousePage()));
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 200.h,
                ),
                ProfileCardWidget(
                  titleInListTile: StringManager.showBills.tr(),
                  subtitleInListTile: "",
                  navigatorFunc: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ShowBillsPage()));
                  },
                  cardColor: const Color(0xdd333333),
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
