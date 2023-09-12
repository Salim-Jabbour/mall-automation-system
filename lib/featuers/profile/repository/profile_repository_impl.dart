import 'dart:io' as used;

import 'package:dartz/dartz.dart';
import 'package:file_picker/src/platform_file.dart';

import 'package:jessy_mall/core/errors/base_error.dart';
import 'package:jessy_mall/featuers/profile/models/investor_model.dart';

import 'package:jessy_mall/featuers/profile/models/profile_model.dart';
import 'package:jessy_mall/featuers/profile/models/wearhouse_investor_product.dart';

import '../../../core/errors/execption.dart';
import '../../../core/network/network_info.dart';
import '../data/datasource/remote/profile_remote_data_source.dart';
import 'profile_repository.dart';
import 'dart:io' as used;

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  final NetworkInfo _networkInfo;

  ProfileRepositoryImpl(this._profileRemoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, ProfileModel>> getProfileInfo(String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _profileRemoteDataSource.getProfileInfo(token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (getProfileInfo) {
            return right(getProfileInfo);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, WearhouseInvestorProductModel>>
      getProductFromWearhouse(String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _profileRemoteDataSource.getProductFromWearhouse(token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (product) {
            return right(product);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProductFromWearhouse(
      {required String token, required String productId}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _profileRemoteDataSource
            .deleteProductFromWearhouse(token: token, productId: productId);
        return addSuccess.fold(
          (failure) => Left(failure),
          (product) {
            return right(product);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> requestExtraSpace(
      {required String token, required int space}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _profileRemoteDataSource.requestExtraSpace(
            token: token, space: space);
        return addSuccess.fold(
          (failure) => Left(failure),
          (t) {
            return right(t);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, InvestorProductModel>> getMyStoreProduct(
      String token) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _profileRemoteDataSource.getMyStoreProduct(token);
        return addSuccess.fold(
          (failure) => Left(failure),
          (product) {
            return right(product);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProductFromStore(
      {required String token, required String productId}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _profileRemoteDataSource
            .deleteProductFromStore(token: token, productId: productId);
        return addSuccess.fold(
          (failure) => Left(failure),
          (product) {
            return right(product);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, WearhouseInvestorIncomModel>> getIncoms(
      {required String token, String? fromDate, String? toDate}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _profileRemoteDataSource.getIncoms(
            token: token, fromDate: fromDate, toDate: toDate);
        return addSuccess.fold(
          (failure) => Left(failure),
          (product) {
            return right(product);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failure, WearhouseInvestorOutcomModel>> getOutcomes(
      {required String token, String? fromDate, String? toDate}) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _profileRemoteDataSource.getOutcoms(
            token: token, fromDate: fromDate, toDate: toDate);
        return addSuccess.fold(
          (failure) => Left(failure),
          (outComes) {
            return right(outComes);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
  
  @override
  Future<Either<Failure, investorBillsModel>> getBills({required String token, String? fromDate, String? toDate})async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess = await _profileRemoteDataSource.getBills(
            token: token, fromDate: fromDate, toDate: toDate);
        return addSuccess.fold(
          (failure) => Left(failure),
          (bills) {
            return right(bills);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  //SALIM
  @override
  Future<Either<Failure, String>> uploadExcelFile(
      String token, used.File file) async {
    if (await _networkInfo.isConnected) {
      try {
        final addSuccess =
            await _profileRemoteDataSource.uploadExcelFile(token, file);
        return addSuccess.fold(
          (failure) => Left(failure),
          (state) {
            return right(state);
          },
        );
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
  
}
