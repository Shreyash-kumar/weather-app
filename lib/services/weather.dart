import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/Screens/location_screen.dart';

const AppKey = '6f50c8e00a99e404a714c108690d1ad8#';
late double Latitute ;


class WeatherModel {

  Future<dynamic> getCityweather(String cityName) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$AppKey&units=metric');
    NetworkHelper networkHelper = NetworkHelper(url);
    var WeatherData = await networkHelper.GetData();

    return WeatherData;
  }

   Future<dynamic> getLocationWeather() async{

    Location location = Location();
    await location.getLocation();
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.Latitute}&lon=${location.Longitute}&appid=$AppKey&units=metric');

    NetworkHelper networkHelper = NetworkHelper(url);

    var WeatherData = await networkHelper.GetData();

    return WeatherData;

  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
