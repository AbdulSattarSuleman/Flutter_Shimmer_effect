import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_overview/controllers/dashboard_controller.dart';

class HomeScreen extends StatelessWidget {
  DashboardController dashboardController = Get.put(DashboardController());
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Shimmer Effect"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => dashboardController.isTimerCompleted.value == false
                  ? const Text(
                      "Shimmer Effect",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )
                  : const MyShimmerDesign()),
            ],
          ),
        ),
      ),
    );
  }
}

class MyShimmerDesign extends StatelessWidget {
  const MyShimmerDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Shimmer.fromColors(
          child: Center(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image Box
                        Container(
                          width: 45,
                          height: 45,
                          color: Colors.purple,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 5,
                                color: Colors.amber,
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5)),
                              Container(
                                width: double.infinity,
                                height: 5,
                                color: Colors.amber,
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5)),
                              Container(
                                width: size.width * 0.25,
                                height: 5,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          baseColor: Colors.grey,
          highlightColor: Colors.black26),
    );
  }
}
