import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/base_error.dart';
import '../../models/profile_model.dart';
import '../../repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileBloc(this._profileRepository) : super(ProfileInitial()) {
    on<ProfileGetProfileInfoEvent>((event, emit) async {
      emit(ProfileLoading());
      final successOrFailuer = await _profileRepository.getProfileInfo(event.token);
      successOrFailuer.fold((error) {
        emit(ProfileGetInfoFailed(faliuer: error));
      }, (profileModel) {
        emit(ProfileGetInfoSuccess(profileModel: profileModel));
      });
    });
  }
}
