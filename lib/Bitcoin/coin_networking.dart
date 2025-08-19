import 'package:challenge1/Bitcoin/coin_data.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class CoinNetworkHelper {


  Future getData(String selectedCurrency) async {
    Map<String, String>crtptoPrices = {};

    for (String crypto in cryptoList) {
      http.Response response = await http.get(Uri.parse(
          'https://api-realtime.exrates.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency?apikey=c5fde8b1-bcf1-41c5-aebf-3ea6541d5826'));
      if (response.statusCode == 200) {
        String data = response.body;
        print('ok');
        var lastPrice = jsonDecode(data)['rate'];
        crtptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return crtptoPrices;
  }
}