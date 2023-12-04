import 'package:eatwise/constants.dart';
import 'package:eatwise/features/dashboard/repository/dashboard_repository.dart';
import 'package:eatwise/features/dashboard/widgets/carousel_widget.dart';
import 'package:eatwise/features/dashboard/widgets/ingredient_card.dart';
import 'package:eatwise/models/entity.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchMaker extends StatefulWidget {
  const MatchMaker({super.key});

  @override
  State<MatchMaker> createState() => _MatchMakerState();
}

class _MatchMakerState extends State<MatchMaker> {
  List<Entity> entities = [];
  bool _isLoading = false;
  final ingredientController = TextEditingController();
  DashboardRepository dashboardRepository = DashboardRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getEntitiesForText(String name) async {
    setState(() {
      _isLoading = true;
    });
    entities = await dashboardRepository.getFoodAnalysis(name);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              v(height: 20.h),
              Text(
                "Ingredient Match Maker",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffe417E45),
                ),
              ),
              v(height: 5.h),
              const Divider(
                color: Color(0xffeD9D9D9),
                thickness: 2,
              ),
              v(height: 18.h),
              ingredientController.text.isEmpty
                  ? Text(
                      "Discover tasty pairings for your ingredient! Search and savor the flavor combo here.",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffe417E45),
                      ),
                    )
                  : const SizedBox(),
              v(height: 20.h),
              SizedBox(
                height: 40.h,
                child: TextField(
                  controller: ingredientController,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: white,
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffe5DBB63),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.r)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.r)),
                      hintText: "Type Ingredient Name",
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: white,
                      )),
                  onChanged: (value) {
                    setState(() {});
                    debugPrint(value);
                  },
                  onSubmitted: (value) {
                    getEntitiesForText(value);
                  },
                ),
              ),
              v(height: 30.sp),
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: black,
                      ),
                    )
                  : entities.isNotEmpty
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, i) {
                            return IngredientCard(entity: entities[i]);
                          },
                          separatorBuilder: (ctx, i) {
                            return v(height: 5.h);
                          },
                          itemCount: entities.length,
                        )
                      : const Center(
                          child: Text("No Matched Ingredients found"),
                        ),
            ],
          ),
        ),
      )),
    );
    ;
  }
}
