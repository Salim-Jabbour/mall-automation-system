import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../../config/theme/color_manager.dart';
import '../../../../core/resource/string_manager.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../Auth/presintation/bloc/auth_bloc.dart';
import '../../models/home_search_model.dart';
import '../bloc/home_search_bloc.dart';
import '../widgets/searched_product_card_widget.dart';

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({super.key});

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController searchInputs = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    searchInputs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<HomeSearchDataModel>? searchedData;
    return BlocProvider(
      create: (context) => GetIt.I.get<HomeSearchBloc>(),
      child: BlocConsumer<HomeSearchBloc, HomeSearchState>(
        listener: (context, state) {
          if (state is HomeSearchSuccess) {
            searchedData = state.homeSearchModel.data;
          }
        },
        builder: (context, state) {
          if (state is HomeSearchFailed) {
            return Scaffold(
              body: FailuerWidget(
                errorMessage: state.failure.message,
                onPressed: () {
                  //token: context.read<AuthBloc>().token
                  context
                      .read<HomeSearchBloc>()
                      .add(GetHomeSearchedProductEvent(
                        context.read<AuthBloc>().token ?? '',
                        "",
                      ));
                },
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Container(
                  width: 980.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: ColorManager.textFieldFill,
                  ),
                  child: TextFormField(
                    focusNode: _searchFocusNode,
                    controller: searchInputs,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      hintText: StringManager.search.tr(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorManager.foregroundL,
                        size: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ),
                    onFieldSubmitted: (inputs) {
                      print("im in button");
                      String search = inputs.replaceAll(RegExp(r'^\s+'), '');

                      context.read<HomeSearchBloc>().add(
                            GetHomeSearchedProductEvent(
                              context.read<AuthBloc>().token ?? '',
                              search,
                            ),
                          );
                    },
                    textInputAction: TextInputAction.search,
                  ),
                ),
              ),
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding:
                            EdgeInsetsDirectional.only(top: 30.h, bottom: 30.h),
                        itemCount: searchedData?.length ?? 0,
                        itemBuilder: (context, index) {
                          return SearchedProductCardWidget(
                            id: searchedData?[index].id.toString() ?? "0",
                            imageNetworkSource: searchedData?[index].image ??
                                "https://i.pinimg.com/736x/f5/41/9a/f5419ac68c0811f0e48b98ea128080a9.jpg",
                            productName:
                                searchedData?[index].name ?? "product X",
                            quantity:
                                searchedData?[index].quantity.toString() ??
                                    "00",
                            price: searchedData?[index].price ?? 0.0,
                            category: searchedData?[index].category ?? "table",
                          );
                        },
                      ),
                    ),
                  ],
                ),
                if (state is HomeSearchLoading)
                  const LoadingWidget(fullScreen: true)
                else if (state is HomeSearchSuccess && searchedData!.isEmpty)
                  EmptyWidget(height: 1.sh - 0.2.sh)
              ],
            ),
          );
        },
      ),
    );
  }
}
