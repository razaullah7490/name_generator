
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_dropdown.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_sliver_appbar.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import '../../../Common/custom_button.dart';
import '../../Dashboard/Home/NameGenerated/name_generated.dart';

class Human extends StatefulWidget {
  const Human({Key? key}) : super(key: key);

  @override
  State<Human> createState() => _HumanState();
}

class _HumanState extends State<Human> {
  List<String> fieldText = [
    'Gender',
    'Religion',
    'Country',
    'First Letter',
    'Personality',
    'DOB',
  ];

  List<String> hintText = [
    'Male, Etc',
    'Islam, Etc',
    'Select Country',
    'A,B,C, Etc',
    'Bold, Etc',
    'Select Date',
  ];



  List<List<String>> humanCatDropdownLists = [
    ["Male", "Female"],
    ["Islam", "Christianity", "Hinduism", "Bhuddism"],
    [],
    ["A", "B", "C","D","E","F","G","H","I","J"],
    ["Bold", "Shy", "Funny"],
    [],
  ];

  String? selectedCategory;
  DateTime? selectedDate;
  Map<String, dynamic> selectedValues = {};


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white.withOpacity(0.94),
        body: Form(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              CustomSliverAppbar(
                title: "Fill the form",
                icon: Icons.cancel_outlined,
              ),
              SliverPadding(
                padding: const EdgeInsets.only(top: 42.0, right: 24.0, left: 24.0),
                sliver: SliverList.separated(
                  itemBuilder: (BuildContext context, int index) {
                    Widget formField;

                    if (fieldText[index] == 'DOB') {

                      formField = GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width.sw,
                          decoration: _getCommonDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child:
                            AppText(
                              selectedDate != null
                                  ? selectedDate!.toLocal().toString().split(' ')[0]
                                  : hintText[index],
                              style: (selectedDate == null)
                                  ?Styles.smallPlusJakartaSans(
                                context,
                                fontSize: 14,
                                color: AppColors.lightgrey,
                              )
                                  : Styles.plusJakartaSans(
                                context,
                                color: AppColors.lebelTextColor, // Set the color for the default style
                              ),
                            ),

                          ),
                        ),
                      );
                    } else if (fieldText[index] == 'Country') {
                      // Add CountryPicker with border
                      formField = GestureDetector(
                        onTap: () {
                          _selectCountry(context);
                        },
                        child: Container(  width: MediaQuery.of(context).size.width.sw,
                          decoration: _getCommonDecoration(),
                          child: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child:

                            AppText(
                              selectedValues['Country'] ?? hintText[index],
                              style: (selectedValues['Country'] == null)
                                  ? Styles.smallPlusJakartaSans(
                                context,
                                fontSize: 14,
                                color: AppColors.lightgrey,
                              )
                                  : Styles.plusJakartaSans(
                                context,
                                fontSize: 16,
                                color: AppColors.lebelTextColor,
                              ),
                            ),

                            // AppText(
                            //    selectedValues['Country'] ?? hintText[index],
                            //   style: Styles.smallPlusJakartaSans(
                            //     context,
                            //     fontSize: 14,
                            //     color: AppColors.lightgrey,
                            //   ),
                            // ),


                          ),
                        ),
                      );
                    } else {
                      // Dropdown for other fields
                      formField = CustomDropDownWidget(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.lightgrey,
                          size: 16,
                        ),
                        isBorderRequired: true,
                        prefixIcon: null,
                        hintText: hintText[index],
                        value: selectedValues[fieldText[index]],
                        validationText: 'Please Select Category',
                        onChanged: (value) {
                          setState(() {
                            selectedValues[fieldText[index]] = value;
                          });
                        },
                        itemsMap: [
                          for (int i = 0; i < humanCatDropdownLists[index].length; i++)
                            DropdownMenuItem(
                              value: humanCatDropdownLists[index][i],
                              child: AppText(
                                humanCatDropdownLists[index][i],
                                style: Styles.plusJakartaSans(context,
                                    color: AppColors.lebelTextColor),
                              ),
                            ),
                        ],
                      );
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fieldText[index],
                          textAlign: TextAlign.start,
                          style: Styles.smallPlusJakartaSans(context,
                              fontWeight: FontWeight.w500, color: AppColors.lightgrey),
                        ),
                        5.y,
                        formField,
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 16.0);
                  },
                  itemCount: fieldText.length,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GestureDetector(
            onTap: (){
              print("asdfasldfkjasdkfjl");

            },
            child: CustomButton(
              iconData: Image.asset(Assets.sparkle),
              text: "Generate",
              ontap: () {
                Navigate.to(context, NameGenerated(data: _castSelectedValuesToString()));
                // print(selectedValues);

                // Navigate.to(context, Home());
              },
            ),
          ),

        ),
        
      ),
    );
  }

  BoxDecoration _getCommonDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.lightgrey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
  }



  Future<void> _selectDate(BuildContext context) async {
    DateTime picked = (await showDatePicker(
      // barrierColor: AppColors.white,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    )) ?? DateTime.now();

    setState(() {
      selectedDate = picked;
    });
  }



  Future<void> _selectCountry(BuildContext context) async {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      favorite: ['US', 'IN', 'GB', 'AU'],
      onSelect: (Country value) {
        setState(() {
          selectedValues['Country'] = value.name;
        });
      },
    );
  }

  Map<String, String?> _castSelectedValuesToString() {
    print(selectedValues);
    return selectedValues.cast<String, String?>();
  }
}


