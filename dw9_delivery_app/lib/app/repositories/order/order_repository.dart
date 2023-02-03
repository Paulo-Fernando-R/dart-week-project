import 'package:dw9_delivery_app/app/repositories/order/payment_type_model.dart';

abstract class OrderRepository {
  Future<List<PaymentTypeModel>> getAllPaymentsTypes();
}
