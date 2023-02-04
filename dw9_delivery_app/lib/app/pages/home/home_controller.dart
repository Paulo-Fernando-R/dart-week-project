// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';

import 'package:dw9_delivery_app/app/pages/home/home_state.dart';
import 'package:dw9_delivery_app/app/repositories/products/product_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductRepository _productRepository;

  HomeController(
    this._productRepository,
  ) : super(const HomeState.initial());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      final products = await _productRepository.findAllProducts();
      emit(state.copyWith(status: HomeStateStatus.loaded, products: products));
    } catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(state.copyWith(
          status: HomeStateStatus.error,
          errorMessage: 'Erro ao buscar produtos'));
    }
  }

  void addOrUpdateBag(OrderProductDto orderProduct) {
    final shoppingBag = [...state.shoppinBag];
    final orderIndex = shoppingBag
        .indexWhere((orderP) => orderP.product == orderProduct.product);

    if (orderIndex > -1) {
      if (orderProduct.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProduct;
      }
    } else {
      shoppingBag.add(orderProduct);
    }
    emit(state.copyWith(shoppinBag: shoppingBag));
  }

  void updateBag(List<OrderProductDto> updateBag){
    emit(state.copyWith(shoppinBag: updateBag));
  }
}
