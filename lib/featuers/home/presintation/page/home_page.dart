import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/config/theme/color_manager.dart';
import 'package:jessy_mall/core/resource/asset_manager.dart';
import 'package:jessy_mall/core/resource/const_manager.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/widgets/custom_text_field.dart';
import 'package:jessy_mall/featuers/Auth/presintation/bloc/auth_bloc.dart';
import 'package:jessy_mall/featuers/home/presintation/page/product_details_page.dart';
import 'package:jessy_mall/featuers/home/presintation/page/product_page.dart';
import 'package:jessy_mall/featuers/home/presintation/page/stores_page.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../home_search/presentation/pages/home_search_page.dart';
import '../widget/category_home_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  List<String> sliderImagesList = [
    AssetImageManager.homeSlider1,
    AssetImageManager.homeSlider2,
    AssetImageManager.homeSlider3
  ];

  @override
  Widget build(BuildContext context) {
    print(context.read<AuthBloc>().userName);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 50.w, top: 60.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.read<AuthBloc>().userName ?? '',
                              style: TextStyle(
                                  color: ColorManager.black,
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Padding(
                    //   padding: EdgeInsetsDirectional.only(end: 50.w),
                    //   child: GestureDetector(
                    //       onTap: () {
                    //         context.setLocale(Locale('en', 'US'));
                    //       },
                    //       child: const Icon(Icons.notifications_active)),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HomeSearchPage()));
                },
                child: CustomTextField(
                  enabled: false,
                  keybordType: TextInputType.name,
                  width: 800.w,
                  hintText: StringManager.search.tr(),
                  icon: Icons.search,
                  textEditingController: searchController,
                  validator: (v) {
                    return null;
                  },
                  textFieldColor: ColorManager.grey.withOpacity(0.5),
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              CarouselSlider.builder(
                itemCount: 3,
                options: CarouselOptions(
                  height: 400.h,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  enlargeFactor: 10,
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: SizedBox(
                      width: 800.w,
                      child: Image.asset(
                        sliderImagesList[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 120.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 700.w),
                child: Text(
                  StringManager.categories.tr(),
                  style: TextStyle(
                      color: ColorManager.black,
                      fontSize: 55.sp,
                      fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProductPage(
                                    storeId: 1,
                                    categoryName: ConstManager.marketCategory,
                                  )));
                    },
                    child: CategoryHomeCardWidget(
                      imgUrl: AssetImageManager.market,
                      categryName: StringManager.market.tr(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => StoresPage(
                                    categoryName: StringManager.clothes,
                                  )));
                    },
                    child: CategoryHomeCardWidget(
                      imgUrl: AssetImageManager.clothes,
                      categryName: StringManager.clothes.tr(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => StoresPage(
                                    categoryName: StringManager.furniture,
                                  )));
                    },
                    child: CategoryHomeCardWidget(
                      imgUrl: AssetImageManager.furniture,
                      categryName: StringManager.furniture.tr(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => StoresPage(
                                    categoryName: StringManager.makeup,
                                  )));
                    },
                    child: CategoryHomeCardWidget(
                      imgUrl: AssetImageManager.makeup,
                      categryName: StringManager.makeup.tr(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
