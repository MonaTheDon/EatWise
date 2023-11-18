// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eatwise/constants.dart';
import 'package:eatwise/features/dashboard/widgets/carousel_item.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:eatwise/models/recipe.dart';

import '../pages/recipe_detail_screen.dart';

class CarouselWidget extends StatefulWidget {
  final List<Recipe> recipe;
  const CarouselWidget({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.recipe
          .map((e) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RecipeInfoScreen(recipe: e)));
              },
              child: CarouselItem(recipe: e)))
          .toList(),
      carouselController: _controller,
      options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: false,
          aspectRatio: 1.10,
          onPageChanged: ((index, reason) {
            setState(() {
              _current = index;
            });
          })),
    );
  }
}
