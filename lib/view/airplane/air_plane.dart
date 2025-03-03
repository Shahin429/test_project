import 'package:flutter/material.dart';

import '../../res/components/app_string.dart';
import '../../res/components/modify_text.dart';

class AirPlane extends StatefulWidget {
  const AirPlane({super.key});

  @override
  State<AirPlane> createState() => _AirPlaneState();
}

class _AirPlaneState extends State<AirPlane> {
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
        backgroundColor: Colors.blue,
        title: Text(
          "Airplane",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
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
                        "https://images.pexels.com/photos/46148/aircraft-jet-landing-cloud-46148.jpeg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ModifyText(
              text: "Airplane",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            Divider(color: Colors.grey, thickness: 1),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  textAlign: TextAlign.start,
                  AppString.airPlaneDescription,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
