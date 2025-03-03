import 'package:flutter/material.dart';

import '../../res/components/app_string.dart';
import '../../res/components/modify_text.dart';

class BusView extends StatefulWidget {
  const BusView({super.key});

  @override
  State<BusView> createState() => _BusViewState();
}

class _BusViewState extends State<BusView> {
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
        backgroundColor: Colors.orange,
        title: Text(
          "Bus",
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
                          "https://cdn.pixabay.com/photo/2018/03/07/16/07/coach-3206326_1280.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ModifyText(
                text: "Bus",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              Divider(color: Colors.grey, thickness: 1),
              ModifyText(
                text: AppString.busDescription,
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
