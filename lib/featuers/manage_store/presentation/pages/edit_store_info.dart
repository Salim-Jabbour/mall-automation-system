import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/edit_store_bloc/edit_store_bloc.dart';
import '../widgets/edit_store_info_body.dart';

class EditStoreInfo extends StatelessWidget {
  const EditStoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<EditStoreBloc>(),
      child: const Scaffold(
        body: SingleChildScrollView(child: EditStoreInfoBody()),
      ),
    );
  }
}
