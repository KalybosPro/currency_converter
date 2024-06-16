import 'package:currency_converter/src/api/converter/converter_api.dart';
import 'package:get/get.dart';

class ConverterRepo extends GetxService{
  final ConverterApi api;
  ConverterRepo({required this.api});

  Future<Response> convertCurrency(String fromCurrency)async{
    return await api.convertCurrency(fromCurrency);
  }
}