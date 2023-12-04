// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eatwise/features/dashboard/widgets/ingredients_widget.dart';
import 'package:eatwise/features/dashboard/widgets/procedure_widget.dart';
import 'package:eatwise/features/dashboard/widgets/review_widget.dart';
import 'package:eatwise/features/dashboard/widgets/utensils_widget.dart';
import 'package:eatwise/models/recipe.dart';
import 'package:eatwise/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../repository/dashboard_repository.dart';

class RecipeInfoScreen extends StatefulWidget {
  final Recipe recipe;
  const RecipeInfoScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<RecipeInfoScreen> createState() => _RecipeInfoScreenState();
}

class _RecipeInfoScreenState extends State<RecipeInfoScreen> {
  List<String> ingredientPhrases = [];
  List<String> procedure = [];
  bool _isIngredientPhraseLoading = false;
  bool _isProcedureLoading = false;

  String selectedOption = "ingredients";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadIngredientsWithPhrases(int.parse(widget.recipe.recipeId!));
    loadProcedure(int.parse(widget.recipe.recipeId!));
  }

  void loadIngredientsWithPhrases(int id) async {
    setState(() {
      _isIngredientPhraseLoading = true;
    });
    ingredientPhrases = await DashboardRepository.getIngredientsWithPhrases(id);
    setState(() {
      _isIngredientPhraseLoading = false;
    });
  }

  void loadProcedure(int id) async {
    setState(() {
      _isProcedureLoading = true;
    });
    procedure = await DashboardRepository.getProcedureForARecipe(id);
    setState(() {
      _isProcedureLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // return Scaffold(
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           Text(
    //             widget.recipe.recipeName!,
    //             textAlign: TextAlign.center,
    //             maxLines: 2,
    //             overflow: TextOverflow.ellipsis,
    //             style: TextStyle(
    //               fontSize: 28.sp,
    //               fontWeight: FontWeight.w500,
    //               color: black,
    //             ),
    //           ),
    //           v(height: 8.h),
    //           const Divider(
    //             color: white,
    //             thickness: 1,
    //           ),
    //           v(height: 8.h),
    //           Container(
    //             width: 360.w,
    //             height: 270.h,
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: NetworkImage(widget.recipe.imageUrl!),
    //                   fit: BoxFit.cover),
    //             ),
    //           ),
    //           v(height: 12.h),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               GestureDetector(
    //                 onTap: () {
    //                   setState(() {
    //                     selectedOption = "ingredients";
    //                   });
    //                 },
    //                 child: Container(
    //                   padding:
    //                       EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
    //                   decoration: BoxDecoration(
    //                     color: darkGreen,
    //                     borderRadius: BorderRadius.circular(5.r),
    //                     border: Border.all(
    //                       color: selectedOption == "ingredients"
    //                           ? white
    //                           : darkGreen,
    //                       width: 2,
    //                     ),
    //                   ),
    //                   child: Text(
    //                     "Ingredients",
    //                     style: TextStyle(
    //                       fontSize: 16.sp,
    //                       fontWeight: FontWeight.w500,
    //                       color: white,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               h(width: 8.w),
    //               GestureDetector(
    //                 onTap: () {
    //                   setState(() {
    //                     selectedOption = "reviews";
    //                   });
    //                 },
    //                 child: Container(
    //                   padding:
    //                       EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
    //                   decoration: BoxDecoration(
    //                     color: darkGreen,
    //                     borderRadius: BorderRadius.circular(5.r),
    //                     border: Border.all(
    //                         color:
    //                             selectedOption == "reviews" ? white : darkGreen,
    //                         width: 2),
    //                   ),
    //                   child: Text(
    //                     "Reviews",
    //                     style: TextStyle(
    //                       fontSize: 16.sp,
    //                       fontWeight: FontWeight.w500,
    //                       color: white,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               h(width: 8.w),
    //               GestureDetector(
    //                 onTap: () {
    //                   setState(() {
    //                     selectedOption = "procedure";
    //                   });
    //                 },
    //                 child: Container(
    //                   padding:
    //                       EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
    //                   decoration: BoxDecoration(
    //                     color: darkGreen,
    //                     borderRadius: BorderRadius.circular(5.r),
    //                     border: Border.all(
    //                         color: selectedOption == "procedure"
    //                             ? white
    //                             : darkGreen,
    //                         width: 2),
    //                   ),
    //                   child: Text(
    //                     "Procedure",
    //                     style: TextStyle(
    //                       fontSize: 16.sp,
    //                       fontWeight: FontWeight.w500,
    //                       color: white,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           v(height: 12.h),
    //           selectedOption == "ingredients"
    //               ? _isIngredientPhraseLoading
    //                   ? const CircularProgressIndicator(color: white)
    //                   : IngredientsWidget(ingredientPhrases: ingredientPhrases)
    //               : selectedOption == "procedure"
    //                   ? _isProcedureLoading
    //                       ? const CircularProgressIndicator(color: white)
    //                       : ProcedureWidget(procedure: procedure)
    //                   : selectedOption == "reviews"
    //                       ? ReviewWidget()
    //                       : Container(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.recipe.imageUrl!),
                  fit: BoxFit.cover),
            ),
          ),
          v(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 216.w,
                  child: Text(
                    widget.recipe.recipeName!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w500,
                      color: black,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 32,
                  ),
                )
              ],
            ),
          ),
          v(height: 12.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                "${widget.recipe.cookTime} minutes • Serves ${widget.recipe.servings} • 12 Reviews",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: grey,
                ),
              ),
            ),
          ),
          v(height: 15.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = "cookware";
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: size.width / 3,
                  decoration: BoxDecoration(
                    color:
                        selectedOption == "cookware" ? backgroundGreen : white,
                    border: const Border(
                      bottom: BorderSide(
                        color: backgroundGreen,
                        width: 1,
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      topRight: Radius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    "Cookware",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: selectedOption == "cookware"
                          ? white
                          : backgroundGreen,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = "ingredients";
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: size.width / 3,
                  decoration: BoxDecoration(
                    color: selectedOption == "ingredients"
                        ? backgroundGreen
                        : white,
                    border: const Border(
                      bottom: BorderSide(
                        color: backgroundGreen,
                        width: 1,
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      topRight: Radius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: selectedOption == "ingredients"
                          ? white
                          : backgroundGreen,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = "instructions";
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: size.width / 3,
                  decoration: BoxDecoration(
                    color: selectedOption == "instructions"
                        ? backgroundGreen
                        : white,
                    border: const Border(
                      bottom: BorderSide(
                        color: backgroundGreen,
                        width: 1,
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      topRight: Radius.circular(5.r),
                    ),
                  ),
                  child: Text(
                    "Instructions",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: selectedOption == "instructions"
                          ? white
                          : backgroundGreen,
                    ),
                  ),
                ),
              )
            ],
          ),
          // IngredientsWidget(ingredientPhrases: ingredientPhrases),
          // ProcedureWidget(procedure: procedure),
          // UtensilsWidget(utensils: widget.recipe.utensils ?? []),
          selectedOption == "cookware"
              ? UtensilsWidget(utensils: widget.recipe.utensils ?? [])
              : selectedOption == "ingredients"
                  ? IngredientsWidget(ingredientPhrases: ingredientPhrases)
                  : selectedOption == "instructions"
                      ? ProcedureWidget(procedure: procedure)
                      : Container(),
        ],
      )),
    );
  }
}
