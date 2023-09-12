import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jessy_mall/featuers/Favorite/presentation/widgets/favorite_body.dart';


import '../BLoC/favorite/favorite_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<FavoriteBloc>(),
      child: Scaffold(
        body: FavoriteBody(),
      ),
    );
  }
}
