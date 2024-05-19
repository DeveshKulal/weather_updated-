// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: 920,
        width: 408,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff2E335A),
          Color(0xff45278B),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  //Air Quality Container
                  CustomContainer(
                    height: 168,
                    width: 348,
                    path: 'assets/images/aq.png',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //uv_index and sun rise
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomContainer(
                          height: 164,
                          width: 164,
                          path: 'assets/images/uv_index.png'),
                      CustomContainer(
                          height: 164,
                          width: 164,
                          path: 'assets/images/sunrise.png')
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //wind and rainfall
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomContainer(
                          height: 164,
                          width: 164,
                          path: 'assets/images/wind.png'),
                      CustomContainer(
                          height: 164,
                          width: 164,
                          path: 'assets/images/rainfall.png')
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //feels like and humidity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomContainer(
                          height: 164,
                          width: 164,
                          path: 'assets/images/feelslike.png'),
                      CustomContainer(
                          height: 164,
                          width: 164,
                          path: 'assets/images/humidity.png')
                    ],
                  ),
                  SizedBox(height: 10),
                  //visibility and Pressure
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomContainer(
                          height: 164,
                          width: 164,
                          path: 'assets/images/visibility.png'),
                      CustomContainer(
                          height: 164,
                          width: 164,
                          path: 'assets/images/pressure.png')
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final String path;

  const CustomContainer({
    super.key,
    required this.height,
    required this.width,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: const Color(0xff1F1D47),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1.5, color: const Color(0xff48319D)),
          image: DecorationImage(image: AssetImage(path))),
    );
  }
}
