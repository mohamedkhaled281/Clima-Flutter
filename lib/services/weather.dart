import '../services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey='233a8f4069b0f50f3cef0dd15eec365e';
const  openWeatherMapUrl='http://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getLoactionWeather()async{
    Location x=Location() ;
    await x.getCurrentLocation();

    NetworkHelper networkHelper=NetworkHelper(url:'$openWeatherMapUrl?lat=${x.latitude}&lon=${x.longtude}&appid=$apiKey&units=metric');
    var weatherData =  await networkHelper.getData();
    return weatherData ;
  }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
