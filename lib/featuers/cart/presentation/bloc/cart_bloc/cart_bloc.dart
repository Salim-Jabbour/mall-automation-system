import 'package:bloc/bloc.dart';
import 'package:jessy_mall/featuers/cart/models/cart_model.dart';
import 'package:jessy_mall/featuers/cart/repository/cart_repository.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/base_error.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;
  CartBloc(this._cartRepository) : super(CartInitial()) {
    on<CartGetAllOrderEvent>((event, emit) async {
      emit(CartLoading());
      final successOrFailuer =
          await _cartRepository.getAllCartOrder(event.token);
      successOrFailuer.fold((error) {
        emit(CartGetAllOrderFailed(faliuer: error));
      }, (cartModel) {
        emit(CartGetAllOrderSuccess(cartModel: cartModel));
      });
    });

    on<CartRemoveOrderFromCartEvent>((event, emit) async {
      emit(CartLoading());
      final successOrFailuer =
          await _cartRepository.removeCartOrderById(event.token, event.id);
      successOrFailuer.fold((error) {
        emit(CartRemoveOrderFailed(error));
      }, (_) {
        emit(CartRemoveOrderSuccess());
        emit(CartInitial());
      });
    });

    on<CartPostBuyAllOrderEvent>((event, emit) async {
      emit(CartLoading());
      final successOrFailuer = await _cartRepository.postBuyCartOrder(
          event.token, event.cartOrderIds, event.addressLocation);
      successOrFailuer.fold((error) {
        emit(CartBuyAllOrderFailed(error));
      }, (_) {
        emit(CartBuyAllOrderSuccess());
        emit(CartInitial());
      });
    });
  }
}
