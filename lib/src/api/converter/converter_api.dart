import 'package:get/get.dart';

class ConverterApi extends GetConnect implements GetxService {
  final String appBaseUrl;
  ConverterApi({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
  }

  Future<Response> convertCurrency(String url)async{
    try {
      final response = await get(url);
      return response;
    }on Response catch (e) {
      return e;
    }
  }
}
