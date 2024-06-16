import 'package:get/get.dart';

class CurrencyApi extends GetConnect implements GetxService{
  final String appBaseUrl;
  CurrencyApi({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
  }

  Future<Response> currencyCode(String url)async{
    try {
      final response = await get(url);
      return response;
    }on Response catch (e) {
      return e;
    }
  }
}