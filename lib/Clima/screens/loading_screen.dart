import 'package:challenge1/Clima/screens/location_screen.dart';
import 'package:challenge1/Clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    WeatherModel weatherModel=WeatherModel();
    var weatherData=await weatherModel.getLocationWeather();

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather:weatherData);
    }));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SpinKitDoubleBounce(
        color: Colors.black,
        size:100.0,
      ),
    );
  }
}
