import 'package:currency_converter/src/api/currency_code/currency_api.dart';
import 'package:get/get.dart';

class CurrencyRepo extends GetxService{
  final CurrencyApi api;
  CurrencyRepo({required this.api});

  Future<Response> currencyCode(String country)async{
    return await api.currencyCode(country);
  }
}