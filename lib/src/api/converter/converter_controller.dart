import 'package:currency_converter/src/api/converter/converter_repo.dart';
import 'package:get/get.dart';

class ConverterController extends GetxController {
  final ConverterRepo repo;
  ConverterController({required this.repo});

  Future<double> convertCurrency(
      String fromCurrency, String toCurrency, double amount) async {
    try {
      Response response = await repo.convertCurrency(fromCurrency);
      if (response.isOk) {
        final data = response.body;
        double rate = double.parse(data['rates'][toCurrency].toString());
        return amount * rate;
      } else {
        return 0.0;
      }
    } on double catch (e) {
      return e;
    }
  }
}
