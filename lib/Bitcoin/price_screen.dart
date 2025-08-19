import 'package:challenge1/Bitcoin/coin_data.dart';
import 'package:challenge1/Bitcoin/coin_networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;


class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD';
  int ? rate;

  DropdownButton<String> androidDropdownButton() {
    return DropdownButton<String>(
      value: selectedCurrency,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value.toString();
        });
        print(value);
      },
      items: getCurrencyItemsForAndroid(),
    );
  }

  List<DropdownMenuItem<String>> getCurrencyItemsForAndroid() {
    List<DropdownMenuItem<String>> dropdownitems = [];
    for (String currency in currenciesList) {
      dropdownitems.add(
        DropdownMenuItem(child: Text(currency), value: currency),
      );
    }
    return dropdownitems;
  }

  CupertinoPicker iOSPicker(){
    return  CupertinoPicker(
      itemExtent:32.0,
      onSelectedItemChanged:(selectedIndex){
        print(selectedIndex);
      },
      children:getPickerItems(),
    );
  }

  List<Text> getPickerItems(){
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    return pickerItems;
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData();
  // }

  bool isWaiting=false;

  Map<String,String>coinValues={};
  void getData()async{
    try{
    CoinNetworkHelper coinNetworkHelper=CoinNetworkHelper();
    var rateOfCoin =await  coinNetworkHelper.getData(selectedCurrency);
    isWaiting= true;
    setState(() {
      coinValues = rateOfCoin; //changing var rateOfCoin into integer
    });
    } catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();  // whenever my context build this getData will call
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NewWidget(memeCoin:'BTC',rate:isWaiting ? coinValues['BTC'] : '?', selectedCurrency: selectedCurrency),
          NewWidget(memeCoin:'ETH',rate:isWaiting ? coinValues['ETH'] : '?', selectedCurrency: selectedCurrency),
          NewWidget(memeCoin:'LTC',rate:isWaiting ? coinValues['LTC'] : '?', selectedCurrency: selectedCurrency),

          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child:androidDropdownButton(),
          ),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  NewWidget({required this.memeCoin,required this.rate, required this.selectedCurrency,});

  final String ? rate;
  final String selectedCurrency;
  final String memeCoin;
  
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
            child:Text(
      '1 $memeCoin = $rate $selectedCurrency',
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
