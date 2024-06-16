import 'package:currency_converter/currency_converter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Currency Converter Demo'),
      initialBinding: Binding(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController amountController = TextEditingController(),
      currencyController = TextEditingController(),
      countryController = TextEditingController();
  double sourceAmount = 0, convertedAmount = 0;
  String currency = '', sourceCurrency = '';
  final currenxcontroller = Get.find<CurrencyController>();
  final converterController = Get.find<ConverterController>();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              TextField(
                controller: amountController,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      sourceAmount = double.parse(value);
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: "Source Amount",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const Spacer(),
              TextField(
                controller: currencyController,
                onChanged: (value) {
                  setState(() {
                    sourceCurrency = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Source Currency (ex: XOF, exclude CFA)",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const Spacer(),
              TextField(
                controller: countryController,
                decoration: InputDecoration(
                  hintText: "Country (ex: Togo)",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: [
                  Text("Source Amount: $sourceAmount $sourceCurrency"),
                  const SizedBox(height: 15),
                  Text("Converted Amount: $convertedAmount $currency"),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: size.width,
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                    side: WidgetStateProperty.all(
                        const BorderSide(color: Colors.transparent)),
                  ),
                  onPressed: () {
                    currenxcontroller
                        .currencyCode(countryController.text)
                        .then((code) {
                      setState(() {
                        currency = code;
                      });
                      converterController
                          .convertCurrency(
                              currencyController.text, code, sourceAmount)
                          .then((amount) {
                        setState(() {
                          convertedAmount = amount;
                        });
                      });
                    });
                  },
                  child: const Text(
                    "Convert",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
