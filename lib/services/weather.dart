import 'location.dart';
import 'networking.dart';

const String apiKey = 'c5d489770d5e46911859d8820aea6f01';
const String openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather?';


class WeatherModel {

  Future<dynamic> getLocationWeather() async{
    Location myLocation = Location();
    await myLocation.getCurrentLocation();

    Networker networker = Networker(uri: '${openWeatherMapUrl}lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networker.getData();

    return weatherData;
  }

  Future<dynamic> getCityWeather(String city) async {
    Networker networker = Networker(uri: '${openWeatherMapUrl}q=$city&appid=$apiKey&units=metric');
    var weatherData = await networker.getData();
    return weatherData;
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
