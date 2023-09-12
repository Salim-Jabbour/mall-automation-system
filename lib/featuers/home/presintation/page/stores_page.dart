import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/home/models/home_model.dart';
import 'package:jessy_mall/featuers/home/presintation/manager/store_bloc/store_bloc.dart';
import 'package:jessy_mall/featuers/profile/models/profile_model.dart';

import '../../../../config/theme/color_manager.dart';
import '../../../../core/resource/string_manager.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/header_page.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../widget/custom_stores_widget.dart';
import 'product_page.dart';
import 'package:easy_localization/easy_localization.dart';

class StoresPage extends StatefulWidget {
  const StoresPage({
    required this.categoryName,
    super.key,
  });

  final String categoryName;

  @override
  State<StoresPage> createState() => _StoresPageState();
}

class _StoresPageState extends State<StoresPage> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  //TODO: get products

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<StoreBloc>(),
      child: Scaffold(
        backgroundColor: ColorManager.backgroundL,
        body: Form(
          key: _formKey,
          child: BlocConsumer<StoreBloc, StoreState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is StoreInitial) {
                context.read<StoreBloc>().add(StoreRequested(
                    token: context.read<AuthBloc>().token ?? '',
                    type: widget.categoryName,
                    search: searchController.text));
              }

              return Stack(
                children: [
                  Column(
                    children: [
                      HeaderPage(
                        left: true,
                        title: widget.categoryName.tr(),
                      ),
                      SizedBox(height: 30.h),
                      Center(
                        child: CustomTextField(
                          icon: Icons.search_rounded,
                          hintText: StringManager.search.tr(),
                          textEditingController: searchController,
                          keybordType: TextInputType.name,
                          width: 980.w,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Store Name";
                            }
                            return null;
                          },
                          visibility: false,
                          onFieldSubmittedFunc: (value) {
                            context.read<StoreBloc>().add(StoreRequested(
                                token: context.read<AuthBloc>().token ?? '',
                                type: widget.categoryName,
                                search: value));

                            //TODO: search for stores and put it `storesList` variable
                          },
                        ),
                      ),
                      if (state is StoreGetInfoSuccess)
                        state.storeModel.storeDataModel!.isEmpty
                            ? EmptyWidget(
                                height: 0.5.sh,
                              )
                            : Expanded(
                                child: ListView.builder(
                                    itemCount: state
                                        .storeModel?.storeDataModel?.length,
                                    padding: EdgeInsetsDirectional.only(
                                        top: 30.h, bottom: 30.h),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => ProductPage(
                                                storeId: state
                                                        .storeModel
                                                        .storeDataModel?[index]
                                                        .id ??
                                                    0,
                                                categoryName:
                                                    widget.categoryName,
                                              ),
                                            ),
                                          );
                                        },
                                        child: SizedBox(
                                          height: 300.h,
                                          // width: 500.w,
                                          child: CustomListTileWidget(
                                            imageNetworkSource:
                                                '${state.storeModel?.storeDataModel?[index].image}',
                                            storeName: state
                                                    .storeModel
                                                    .storeDataModel?[index]
                                                    .name ??
                                                '',
                                            openAndCloseTime:
                                                "from ${state.storeModel.storeDataModel?[index].openTime ?? '9'} to ${state.storeModel.storeDataModel?[index].closeTime ?? '11'}",
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                    ],
                  ),
                  if (state is StoreLoading)
                    const LoadingWidget(
                      fullScreen: true,
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
