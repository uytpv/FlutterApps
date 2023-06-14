import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  final initExchangeRate;

  PriceScreen({this.initExchangeRate});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  String selectedCrypto = 'BTC';
  Map<String, String> coinValues = {};

  @override
  initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var exchangeRateData = await CoinData().getCoinData(selectedCurrency);
    setState(() {
      coinValues = exchangeRateData;
    });
  }

  List<Text> getPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return pickerItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          makeCard(),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlue,
              itemExtent: 32.0,
              onSelectedItemChanged: (selectedIndex) {
                setState(() {
                  selectedCurrency = currenciesList[selectedIndex];
                  getData();
                });
              },
              scrollController: FixedExtentScrollController(
                initialItem: 19,
              ),
              children: getPicker(),
            ),
          ),
        ],
      ),
    );
  }

  Column makeCard() {
    List<CryptoCard> cardList = [];
    for (String crypto in cryptoList) {
      cardList.add(
        CryptoCard(
          cryptoCurrency: crypto,
          value: coinValues[crypto] != null ? coinValues[crypto]! : '?',
          selectedCurrency: selectedCurrency,
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cardList,
    );
  }
}

class CryptoCard extends StatelessWidget {
  CryptoCard({
    required this.value,
    required this.cryptoCurrency,
    required this.selectedCurrency,
  });

  final String value;
  final String cryptoCurrency;
  final String selectedCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
// DropdownButton<String>(
// value: selectedCurrency,
// items: getDropdownItems(),
// onChanged: (value) {
// setState(() {
// selectedCurrency = value!;
// });
// },
// ),
