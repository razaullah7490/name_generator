import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Presentation/Resources/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_dropdown.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_sliver_appbar.dart';

import 'package:name_generator/SRC/Presentation/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Re-generate/re_generated_screen.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Input/Cubit/human_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Input/Cubit/human_state.dart';
import '../../../Common/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputFormScren extends StatefulWidget {
  const InputFormScren({Key? key}) : super(key: key);

  @override
  State<InputFormScren> createState() => _InputFormScrenState();
}

class _InputFormScrenState extends State<InputFormScren> {
  List<String> fieldText = [
    'gender',
    'religion',
    'country',
    'latter',
    'personality',
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
    [
      "A",
      "B",
      "C",
      "D",
      "E",
      "F",
      "G",
      "H",
      "I",
      "J",
      "k",
      "L",
      "M",
      "N",
      "O",
      "P",
      "Q",
      "R",
      "S" "T",
      "U",
      "V",
      "W",
      "X",
      "Y",
      "Z"
    ],
    ["Bold", "Shy", "Funny"],
    [],
  ];

  String? selectedCategory;
  DateTime? selectedDate;
  Map<String, dynamic> selectedValues = {};

  @override
  void initState() {
    // context.read<HumanCubit>().getHumanName(selectedValues);
    super.initState();
  }

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
                padding: const EdgeInsets.only(
                  top: 42.0,
                  right: 24.0,
                  left: 24.0,
                ),
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
                            child: AppText(
                              selectedDate != null
                                  ? selectedDate!
                                      .toLocal()
                                      .toString()
                                      .split(' ')[0]
                                  : hintText[index],
                              style: (selectedDate == null)
                                  ? Styles.smallPlusJakartaSans(
                                      context,
                                      fontSize: 14,
                                      color: AppColors.lightgrey,
                                    )
                                  : Styles.plusJakartaSans(
                                      context,
                                      color: AppColors.lebelTextColor,
                                    ),
                            ),
                          ),
                        ),
                      );
                    } else if (fieldText[index] == 'country') {
                      formField = GestureDetector(
                        onTap: () {
                          _selectCountry(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width.sw,
                          decoration: _getCommonDecoration(),
                          child: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: AppText(
                              selectedValues['country'] ?? hintText[index],
                              style: (selectedValues['country'] == null)
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
                          ),
                        ),
                      );
                    } else {
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
                          for (int i = 0;
                              i < humanCatDropdownLists[index].length;
                              i++)
                            DropdownMenuItem(
                              value: humanCatDropdownLists[index][i],
                              child: AppText(
                                humanCatDropdownLists[index][i],
                                style: Styles.plusJakartaSans(
                                  context,
                                  color: AppColors.lebelTextColor,
                                ),
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
                          style: Styles.smallPlusJakartaSans(
                            context,
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightgrey,
                          ),
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
          child: BlocConsumer<HumanCubit, HumanState>(
            listener: (context, state) {
              print('$state is consumer listener state');
              // Handle state changes if needed
            },
            builder: (context, state) {
              print('$state is consumer builder state');
              return CustomButton(
                iconData: Image.asset(Assets.sparkle),
                text: "Generate",
                ontap: () {
                  print('mmmmm');
                  Navigate.to(context, NameGenerated(data: {},));
                  context.read<HumanCubit>().getHumanName(selectedValues);
                },
              );
            },
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
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        )) ??
        DateTime.now();

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
          selectedValues['country'] = value.name;
        });
      },
    );
  }
}
