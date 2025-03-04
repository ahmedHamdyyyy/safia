import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safiaa/features/home/data/models/panner/panner.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key, required this.imagePaths});

  final List<PannersModel> imagePaths;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: height * .27,

          viewportFraction: 1,

          autoPlay: true,
          //الصوره بتصغر وتروح مسافه قد اي لما اجي اسكرول
          enlargeCenterPage: true,
          enlargeFactor: 0.5,
          scrollDirection: Axis.vertical,
        ),
        itemCount:
            imagePaths.length, // Updated to reflect actual number of images
        itemBuilder: (BuildContext context, int index, int realIndex) =>
            ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            imagePaths[index].image.toString(), // Use the correct image path
            fit: BoxFit.fill,
            width: double.infinity,
            height: height * .24,
          ),
        ),
      ),
    );
  }
}
