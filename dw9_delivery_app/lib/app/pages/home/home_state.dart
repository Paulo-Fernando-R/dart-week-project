// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStateStatus status;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<OrderProductDto> shoppinBag;

  const HomeState(
      {required this.status,
      required this.products,
      required this.errorMessage,
      required this.shoppinBag});

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        shoppinBag = const [],
        errorMessage = null;
  @override
  List<Object?> get props => [status, products, errorMessage, shoppinBag];

  HomeState copyWith({
    HomeStateStatus? status,
    List<ProductModel>? products,
    String? errorMessage,
    List<OrderProductDto>? shoppinBag,
  }) {
    return HomeState(
      status: status ?? this.status,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      shoppinBag: shoppinBag ?? this.shoppinBag,
    );
  }
}
