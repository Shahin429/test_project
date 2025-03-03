import 'package:flutter/material.dart';
import 'package:test_project/view/airplane/air_plane.dart';
import 'package:test_project/view/bus_view/bus_view.dart';
import 'package:test_project/view/home_view/widget/custom_container.dart';
import 'package:test_project/view/train_view/train_view.dart';

import '../car_view/car_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 60,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/image/travel_guide.jpg",
                width: MediaQuery.sizeOf(context).width,
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  children: [
                    Text(
                      "TRAVEL",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    Text(
                      "GUIDE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              spacing: 30,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                      icon: Icons.flight,
                      text: "Airplane",
                      color: Colors.blue,
                      height: 180,
                      width: 165,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AirPlane()),
                        );
                      },
                    ),
                    CustomContainer(
                      icon: Icons.train_outlined,
                      text: "Train",
                      color: Colors.blueAccent.shade700,
                      height: 180,
                      width: 165,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TrainView()),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                      icon: Icons.directions_bus_outlined,
                      text: "Bus",
                      color: Colors.orange,
                      height: 180,
                      width: 165,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BusView()),
                        );
                      },
                    ),
                    CustomContainer(
                      icon: Icons.directions_car_outlined,
                      text: "Car",
                      color: Colors.greenAccent.shade700,
                      height: 180,
                      width: 165,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CarView()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
