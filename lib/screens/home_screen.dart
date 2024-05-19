import 'dart:ui';

import 'package:appwtrs/bloc/weather_bloc_bloc.dart';
import 'package:appwtrs/screens/control_screen.dart';
import 'package:appwtrs/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/images/1.png');
      case >= 300 && < 400:
        return Image.asset('assets/images/2.png');
      case >= 500 && < 600:
        return Image.asset('assets/images/3.png');
      case >= 600 && < 700:
        return Image.asset('assets/images/4.png');
      case >= 700 && < 800:
        return Image.asset('assets/images/5.png');
      case == 800:
        return Image.asset('assets/images/6.png');
      case > 800 && <= 804:
        return Image.asset('assets/images/7.png');
      default:
        return Image.asset('assets/images/7.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 1.2 * kToolbarHeight, 0, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      40, 1.2 * kToolbarHeight, 40, 20),
                  child: Align(
                      alignment: const AlignmentDirectional(22, -0.85),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepPurple),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      40, 1.2 * kToolbarHeight, 40, 20),
                  child: Align(
                      alignment: const AlignmentDirectional(-22, -0.85),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.deepPurple),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      40, 1.2 * kToolbarHeight, 40, 20),
                  child: Align(
                      alignment: const AlignmentDirectional(0, -1.85),
                      child: Container(
                        height: 300,
                        width: 700,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 254, 158, 33),
                            shape: BoxShape.circle),
                      )),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      40, 1.2 * kToolbarHeight, 40, 20),
                  child: Align(
                    alignment: const AlignmentDirectional(0, 1.2),
                    child: SizedBox(
                        height: 270,
                        width: 270,
                        child: Image.asset(
                          'assets/images/house.png',
                        )),
                  ),
                ),
                BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                  builder: (context, state) {
                    if (state is WeatherBlocSuccess) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Text(
                                '${state.weather.areaName}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 40,
                              ),
                              child: Text(
                                'Good Morning',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            //WEATHER CONDITION IMAGE
                            Center(
                              child: SizedBox(
                                height: 250,
                                width: 250,
                                child: getWeatherIcon(
                                    state.weather.weatherConditionCode!),
                              ),
                            ),
                            Center(
                              child: Text(
                                //TEMPERATURE TEXT
                                '${state.weather.temperature!.celsius!.round()}°C',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 55,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Center(
                                child: Text(
                              //WEATHER CONDITION
                              state.weather.weatherMain!.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            )),
                            Center(
                                child: Text(
                              //DAY AND TIME
                              DateFormat('EEEE dd •')
                                  .add_jm()
                                  .format(state.weather.date!),

                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            )),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                Stack(children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 1.1),
                    child: ClipPath(
                      clipper: Clip1Clipper(),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
                        child: Container(
                            height: 88,
                            decoration: BoxDecoration(
                              color: const Color(0xff48319D).withOpacity(0.3),
                              border: Border.all(
                                  width: 2, color: const Color(0xff3A3A6A)),
                            )),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 1.1),
                    child: ClipPath(
                      clipper: Clip1Clipper(),
                      child: Container(
                          height: 88,
                          decoration: BoxDecoration(
                            color: const Color(0xff48319D).withOpacity(0.3),
                            border: Border.all(
                                width: 2, color: const Color(0xff3A3A6A)),
                          )),
                    ),
                  ),

                  Align(
                    alignment: const AlignmentDirectional(0, 1.1),
                    child: SizedBox(
                      height: 100,
                      width: 258,
                      child: SvgPicture.asset(
                        'assets/images/bottombar.svg',
                      ),
                    ),
                  ),

                  //left button
                  Align(
                    alignment: const AlignmentDirectional(-0.8, 1.03),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ControlScreen()));
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/Hover.svg',
                        height: 35,
                        width: 35,
                      ),
                    ),
                  ),
                  //middle button
                  Align(
                    alignment: const Alignment(0, 1.09),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/add_button1.svg',
                        height: 85,
                        width: 85,
                      ),
                    ),
                  ),
                  // right button
                  Align(
                    alignment: const AlignmentDirectional(0.83, 1.035),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MenuScreen()));
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/menu.svg',
                        height: 17,
                        width: 17,
                      ),
                    ),
                  )
                ]),
              ],
            ),
          )),
    );
  }
}

class Clip1Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width / 2, size.height / 2, 0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
