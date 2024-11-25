import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Location Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, size: size.width * 0.06, color: Colors.white),
                    SizedBox(width: size.width * 0.02),
                    Text(
                      'Medan, Indonesia',
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.10),

                // Main Weather Display
                SizedBox(
                  height: size.width * 0.4,
                  width: size.width * 0.4,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(
                        'assets/images/weather.png',
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Text(
                          '30°',
                          style: TextStyle(
                            fontSize: size.width * 0.08,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  'Berawan',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Sabtu, 23 Nov 02:17 AM',
                  style: TextStyle(
                    fontSize: size.width * 0.035,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(height: size.height * 0.04),

                // Weather Information Card
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: EdgeInsets.all(size.width * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi Cuaca',
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      
                      // Weather Info Grid
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                _buildWeatherInfo(
                                  context,
                                  Icons.thermostat,
                                  'Terasa Seperti',
                                  '27°',
                                  Colors.red,
                                ),
                                SizedBox(height: size.height * 0.02),
                                _buildWeatherInfo(
                                  context,
                                  Icons.water_drop,
                                  'Curah Hujan',
                                  '30%',
                                  Colors.blue,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                _buildWeatherInfo(
                                  context,
                                  Icons.air,
                                  'Kecepatan Angin',
                                  '18 Km/jam',
                                  Colors.blue,
                                ),
                                SizedBox(height: size.height * 0.02),
                                _buildWeatherInfo(
                                  context,
                                  Icons.opacity,
                                  'Kelembaban',
                                  '30%',
                                  Colors.lightBlue,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: size.height * 0.05),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Selengkapnya >',
                          style: TextStyle(
                            fontSize: size.width * 0.035,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      
                      // Hourly Forecast
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildHourlyForecast(context, '2 PM', '30°', Icons.wb_cloudy),
                          _buildHourlyForecast(context, '3 PM', '32°', Icons.wb_sunny),
                          _buildHourlyForecast(context, '4 PM', '27°', Icons.water_drop),
                          _buildHourlyForecast(context, '5 PM', '24°', Icons.water_drop),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherInfo(BuildContext context, IconData icon, String label, String value, Color color) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: size.width * 0.06, color: color),
        SizedBox(width: size.width * 0.02),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: size.width * 0.03,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: size.width * 0.035,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHourlyForecast(BuildContext context, String time, String temp, IconData icon) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          time,
          style: TextStyle(
            fontSize: size.width * 0.03,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Icon(icon, size: size.width * 0.06, color: Colors.black),
        SizedBox(height: size.height * 0.01),
        Text(
          temp,
          style: TextStyle(
            fontSize: size.width * 0.035,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}