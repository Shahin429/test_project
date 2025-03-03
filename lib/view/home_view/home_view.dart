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
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        spacing: 50,
        children: [
          Stack(
            children: [
              Container(
                height: 230,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://plus.unsplash.com/premium_photo-1683306661472-d7bd9497c82a?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),fit: BoxFit.cover),
                ),
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
                        color: Colors.orange,
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
                      height: size.height * 0.2,
                      width: size.width * 0.41,
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
                      height: size.height * 0.2,
                      width: size.width * 0.41,
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
                      height: size.height * 0.2,
                      width: size.width * 0.41,
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
                      height: size.height * 0.2,
                      width: size.width * 0.41,
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
