import 'package:flutter/material.dart';

import '../../res/components/app_string.dart';
import '../../res/components/modify_text.dart';

class TrainView extends StatefulWidget {
  const TrainView({super.key});

  @override
  State<TrainView> createState() => _TrainViewState();
}

class _TrainViewState extends State<TrainView> {
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
        backgroundColor: Colors.blueAccent[700],
        title: Text(
          "Train",
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
                          "https://images.unsplash.com/photo-1535535112387-56ffe8db21ff?q=80&w=2674&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ModifyText(
                text: "Train",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              Divider(color: Colors.grey, thickness: 1),
              ModifyText(
                text: AppString.trainDescription,
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
