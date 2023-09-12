import 'dart:io' as used;
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jessy_mall/config/theme/color_manager.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/widgets/custom_button.dart';
import 'package:jessy_mall/core/widgets/custom_text_field.dart';
import 'package:jessy_mall/core/widgets/header_page.dart';
import 'package:jessy_mall/featuers/manage_store/models/store_model.dart';
import 'package:jessy_mall/featuers/manage_store/presentation/bloc/edit_store_bloc/edit_store_bloc.dart';
import 'package:jessy_mall/featuers/manage_store/presentation/widgets/time_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jessy_mall/featuers/profile/presentation/bloc/profile_bloc.dart';

import '../../../../core/utils/global_snackbar.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../Auth/presintation/bloc/auth_bloc.dart';

String? openStoreTime;
String? closeStoreTime;

class EditStoreInfoBody extends StatefulWidget {
  const EditStoreInfoBody({super.key});

  @override
  State<EditStoreInfoBody> createState() => _EditStoreInfoBodyState();
}

class _EditStoreInfoBodyState extends State<EditStoreInfoBody> {
  // used.File? imageController;

  // final picker = ImagePicker();
  // File? storeImage;

  // Future takePhotoFromGallery() async {
  //   final selectedImage = await picker.pickImage(
  //     source: ImageSource.gallery,
  //   );

  //   setState(() {
  //     if (selectedImage != null) {
  //       imageController = used.File(selectedImage.path);
  //     }
  //   });
  // }

  final TextEditingController storeNameEnController =
      TextEditingController(text: StringManager.storeName.tr());

  final TextEditingController storeNameArController =
      TextEditingController(text: StringManager.storeName.tr());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  StoreInfoModel? storeInfoModel;
  @override
  void dispose() {
    storeNameEnController.dispose();
    storeNameArController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      child: BlocConsumer<EditStoreBloc, EditStoreState>(
        listener: (context, state) {
          if (state is EditStoreSuccess) {
            // print(state.profileModel.profileDataModel?.email);
            print(state.storeModel);
            print(state.storeModel.storeInfoDataModel);
            print(state.storeModel.storeInfoDataModel?.name);
            storeInfoModel = state.storeModel.storeInfoDataModel;
            storeNameEnController.text =
                storeInfoModel?.name_en ?? "no initial";
            storeNameArController.text =
                storeInfoModel?.name_ar ?? "no initial";
            print(storeInfoModel?.image ?? "dgsfedwhw");
          }
        },
        builder: (context, state) {
          TimeOfDay time = TimeOfDay.now();
          if (state is EditStoreFailed) {
            return FailuerWidget(
              errorMessage: state.faliuer.message,
              onPressed: () {
                //token: context.read<AuthBloc>().token
                context.read<EditStoreBloc>().add(GetEditStoreEvent(
                    token: context.read<AuthBloc>().token ?? ''));
              },
            );
          }
          if (state is EditStoreInitial) {
            context.read<EditStoreBloc>().add(
                GetEditStoreEvent(token: context.read<AuthBloc>().token ?? ''));
          }
          return Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 640.h,
                    color: ColorManager.foregroundL,
                    child: Column(
                      children: [
                        HeaderPage(
                          title: StringManager.editStroeInfo.tr(),
                          left: true,
                          color: ColorManager.backgroundL,
                        ),
                        SizedBox(
                          width: 350.r,
                          height: 350.r,
                          child: Transform.translate(
                            offset: Offset(0, 170.h),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: InkWell(
                                onTap: () async {
                                  // await takePhotoFromGallery();
                                  // Image.file(
                                  //   used.File(imageController!.path),
                                  //   width: double.infinity,
                                  //   fit: BoxFit.fill,
                                  // );

                                  // storeImage = used.File(imageController!.path);
                                },
                                child: CircleAvatar(
                                  //TODO : add image CIRCULAR + loading

                                  radius: 160.r,
                                  backgroundColor: Colors.yellow,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(90.0),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      height: 150,
                                      imageUrl:
                                          "https://i.ytimg.com/vi/5gO0xpY_Y3E/hqdefault.jpg?sqp=-oaymwE2CNACELwBSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhCIFQoZTAP&rs=AOn4CLBdtxYbLyxjQVkn_V7q9JEJDnP0Bg",
                                      // imageUrl: "${storeInfoModel?.image}" ??
                                      //     "https://i.ytimg.com/vi/5gO0xpY_Y3E/hqdefault.jpg?sqp=-oaymwE2CNACELwBSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhCIFQoZTAP&rs=AOn4CLBdtxYbLyxjQVkn_V7q9JEJDnP0Bg",
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 210.h,
                  ),
                  CustomTextField(
                    // initialValue:
                    //     storeInfoModel?.name ?? StringManager.storeName.tr(),
                    width: 900.w,
                    // hintText: StringManager.storeName.tr(),
                    icon: Icons.store,
                    textEditingController: storeNameEnController,
                    keybordType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StringManager.pleaseEnterStoreName.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextField(
                    // initialValue:
                    //     storeInfoModel?.name ?? StringManager.storeName.tr(),
                    width: 900.w,
                    // hintText: StringManager.storeName.tr(),
                    icon: Icons.store,
                    textEditingController: storeNameArController,
                    keybordType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return StringManager.pleaseEnterStoreName.tr();
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                    width: 900.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 400.w,
                          child: TimePickerOptions(
                            themeMode: ThemeMode.dark,
                            useMaterial3: true,
                            textOpenOrClose: StringManager.openTime.tr(),
                            // openOrCloseTime: ,
                            color: ColorManager.green, openOrCloseStoreTime: 1,
                          ),
                        ),
                        SizedBox(
                          width: 400.w,
                          child: TimePickerOptions(
                            themeMode: ThemeMode.dark,
                            useMaterial3: true,
                            textOpenOrClose: StringManager.closeTime.tr(),
                            color: ColorManager.red,
                            openOrCloseStoreTime: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),

                  //Card Other Details
                  SizedBox(
                    width: 900.w,
                    height: 600.h,
                    child: Card(
                      color: ColorManager.backgroundL,
                      surfaceTintColor: ColorManager.backgroundL,
                      elevation: 12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(StringManager.otherDetails.tr()),
                            const Divider(),
                            Text(StringManager.type.tr() +
                                "${storeInfoModel?.type}"),
                            Text(StringManager.storeSpace.tr() +
                                "${storeInfoModel?.store_space} m"),
                            // Text(StringManager.availableStorageSpace.tr() + '25 m'),
                            Text("${StringManager.openTime.tr()}: " +
                                '${storeInfoModel?.openTime}'),
                            Text("${StringManager.closeTime.tr()}: " +
                                '${storeInfoModel?.closeTime}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ////

                  const Expanded(
                    child: SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                        width: 900.w,
                        child: CustomButton(
                            onPressed: () {
                              //for open
                              String FinalOpenTimeFromBack =
                                  storeInfoModel!.openTime.toString();
                              String openTimeFromBack =
                                  storeInfoModel!.openTime.toString();
                              if (openTimeFromBack.length < 3) {
                                if (storeInfoModel!.openTime
                                        .toString()
                                        .length ==
                                    1) {
                                  FinalOpenTimeFromBack =
                                      "0${storeInfoModel!.openTime.toString()}";
                                }
                                openTimeFromBack =
                                    "$FinalOpenTimeFromBack:00:00";
                              }
                              //for close
                              String FinalCloseTimeFromBack =
                                  storeInfoModel!.closeTime.toString();
                              String closeTimeFromBack =
                                  storeInfoModel!.closeTime.toString();
                              if (closeTimeFromBack.length < 3) {
                                if (storeInfoModel!.closeTime
                                        .toString()
                                        .length ==
                                    1) {
                                  FinalCloseTimeFromBack =
                                      "0${storeInfoModel!.closeTime.toString()}";
                                }
                                closeTimeFromBack =
                                    "$FinalCloseTimeFromBack:00:00";
                              }
                              print("samiiiiiiiiiiiiiiiiiiiiiiiiii");
                              print(openTimeFromBack);
                              print(closeTimeFromBack);
                              context.read<EditStoreBloc>().add(
                                  UpdateEditStoreEvent(
                                      id: storeInfoModel!.id!,
                                      token: context.read<AuthBloc>().token!,
                                      name_ar: storeNameArController.text,
                                      name_en: storeNameEnController.text,
                                      openTime:
                                          openStoreTime ?? openTimeFromBack,
                                      closeTime:
                                          closeStoreTime ?? closeTimeFromBack));

                              //TODO get time and names, add snackbar and pop
                              gShowSuccessSnackBar(
                                  context: context,
                                  message:
                                      StringManager.storeDetailsUpdated.tr());
                              Navigator.pop(context);
                            },
                            text: StringManager.update.tr())),
                  ),
                ],
              ),
              if (state is EditStoreloading)
                const LoadingWidget(
                  fullScreen: true,
                )
            ],
          );
        },
      ),
    );
  }
}
