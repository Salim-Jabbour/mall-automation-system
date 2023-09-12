import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jessy_mall/core/resource/string_manager.dart';
import 'package:jessy_mall/core/widgets/header_page.dart';
import 'package:jessy_mall/featuers/Favorite/presentation/widgets/favorite_card.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/utils/global_snackbar.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../Auth/presintation/bloc/auth_bloc.dart';
import '../../models/favorite_model.dart';
import '../BLoC/favorite/favorite_bloc.dart';

// ignore: must_be_immutable
class FavoriteBody extends StatelessWidget {
  FavoriteBody({super.key});

  List<FavoriteDataResponse>? favoriteProductsData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
      child: BlocConsumer<FavoriteBloc, FavoriteState>(
        listener: (context, state) {
          if (state is FavoriteGetFavoriteProductFailed) {
            gShowErrorSnackBar(
                context: context, message: StringManager.failed.tr());
          }

          if (state is FavoriteGetFavoriteProductSuccess) {
            favoriteProductsData = state.favoriteModel.data;
            print(favoriteProductsData?.length ?? "errooooooooor");
          }

          if (state is FavoriteRemoveFavoriteProductSuccess) {
            gShowSuccessSnackBar(
                context: context,
                message: StringManager.removedSuccessfully.tr());
          }
        },
        builder: (context, state) {
          if (state is FavoriteInitial) {
            print(context.read<AuthBloc>().token);
            context.read<FavoriteBloc>().add(
                  FavoriteGetFavoriteProductsEvent(
                      token: context.read<AuthBloc>().token ?? ''),
                );
          }
          if (state is FavoriteGetFavoriteProductFailed) {
            return FailuerWidget(
              errorMessage: state.faliuer.message,
              onPressed: () {
                //token: context.read<AuthBloc>().token
                context.read<FavoriteBloc>().add(
                    FavoriteGetFavoriteProductsEvent(
                        token: context.read<AuthBloc>().token ?? ''));
              },
            );
          }
          return Stack(
            children: [
              Column(
                children: [
                  HeaderPage(
                    left: false,
                    title: StringManager.favorite.tr(),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: favoriteProductsData?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 300.h,
                              width: 1000.w,
                              child: FavoriteCard(
                                favoriteDataResponse:
                                    favoriteProductsData![index],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.w),
                              child: const Divider(),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              if (state is FavoriteLoading)
                const LoadingWidget(
                  fullScreen: true,
                )
              else if (state is FavoriteGetFavoriteProductSuccess &&
                  favoriteProductsData!.isEmpty)
                EmptyWidget(height: 1.sh - 0.1.sh),
            ],
          );
        },
      ),
    );
  }
}
