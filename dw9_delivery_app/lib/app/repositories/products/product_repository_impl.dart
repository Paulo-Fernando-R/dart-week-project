import 'dart:math';
import 'package:dw9_delivery_app/app/core/exceptions/repository_exception.dart';
import 'package:logging/logging.dart';
import 'package:dio/dio.dart';
import 'package:dw9_delivery_app/app/core/rest_client/custom_dio.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';

import './product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final CustomDio dio;

  ProductRepositoryImpl({required this.dio});

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      //log('Erro ao buscar produtos', 'error:', e, 'StackTrace:' s);
      throw RepositoryException(message: 'Erro ao buscar produtos');
    }
  }
}
