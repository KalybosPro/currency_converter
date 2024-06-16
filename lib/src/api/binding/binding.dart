import 'package:currency_converter/src/api/converter/converter_api.dart';
import 'package:currency_converter/src/api/converter/converter_controller.dart';
import 'package:currency_converter/src/api/converter/converter_repo.dart';
import 'package:currency_converter/src/api/currency_code/currency_api.dart';
import 'package:currency_converter/src/api/currency_code/currency_controller.dart';
import 'package:currency_converter/src/api/currency_code/currency_repo.dart';
import 'package:currency_converter/src/helper/strings.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    /// Converter dependence settings
    Get.lazyPut<ConverterApi>(()=> ConverterApi(appBaseUrl: StringValues.converterBaseUrl));
    Get.lazyPut<ConverterRepo>(()=> ConverterRepo(api: Get.find()));
    Get.lazyPut<ConverterController>(()=> ConverterController(repo: Get.find()));
    /// currency dependence settings
    Get.lazyPut<CurrencyApi>(()=> CurrencyApi(appBaseUrl: StringValues.currencyBaseUrl));
    Get.lazyPut<CurrencyRepo>(()=>CurrencyRepo(api: Get.find()));
    Get.lazyPut<CurrencyController>(()=> CurrencyController(repo: Get.find()));
  }

}