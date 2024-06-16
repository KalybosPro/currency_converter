import 'dart:convert';

import 'package:currency_converter/src/api/currency_code/currency_repo.dart';
import 'package:currency_converter/src/helper/strings.dart';
import 'package:get/get.dart';

class CurrencyController extends GetxController {
  final CurrencyRepo repo;
  CurrencyController({required this.repo});

  Future<String> currencyCode(String country) async {
    try {
      Response response = await repo.currencyCode(country);
      if (response.isOk) {
        var data = response.body;
        return data[0][StringValues.currenciesField].keys.first;
      }else{
        throw Exception('Failed to load currency data');
      }
    } catch (e) {
      throw Exception('Failed to load currency data');
    }
  }

}
