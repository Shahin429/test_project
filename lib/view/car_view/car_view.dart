import 'package:flutter/material.dart';

import '../../res/components/app_string.dart';
import '../../res/components/modify_text.dart';

class CarView extends StatefulWidget {
  const CarView({super.key});

  @override
  State<CarView> createState() => _CarViewState();
}

class _CarViewState extends State<CarView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 3)); // Simulating a delay
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_outlined, size: 20, color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.greenAccent[700],
        title: Text(
          "Car",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              isLoading
                  ? Container(
                    height: 200,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  )
                  : Container(
                    height: 200,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ModifyText(
                text: "Car",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              Divider(color: Colors.grey, thickness: 1),
              ModifyText(
                text: AppString.carDescription,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
