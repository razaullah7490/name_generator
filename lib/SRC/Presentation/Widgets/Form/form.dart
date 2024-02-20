import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_appbar.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_dropdowm_textfield.dart';

import 'package:name_generator/SRC/Presentation/Resources/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/Navigation/navigation.dart';
import 'package:name_generator/SRC/Presentation/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_button.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_dropdown.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_sliver_appbar.dart';

import 'package:name_generator/SRC/Presentation/Widgets/Form/cubit/form_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Form/cubit/form_state.dart';
import '../Re-generate/re_generated_screen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _keywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FormCubit>();
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: 'Forms',
          autoleading: true,
        ),
        body: BlocConsumer<FormCubit, FormmState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is FormLoading,
              progressIndicator: CircularProgressIndicator(),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      ////
                      ///// There  are very huge number of fields but it will show if it's true from firebase
                      ///
                      child: FormFields(cubit)),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            iconData: Image.asset(Assets.sparkle),
            text: "Generate ",
            ontap: () {
              Navigate.to(
                  context,
                  const NameGenerated(
                    data: {},
                  ));
            },
          ),
        ),
      ),
    );
  }

  FormFields(FormCubit cubit) {
    return Column(
      children: [
        50.y,

        ///============Blog Category =====3 fields===========

        /// Topic Options
        cubit.booleanForm.topicOptions == false
            ? CustomDropDownTextField(
                text: "Enter or choose any topic",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Target Audience
        cubit.booleanForm.targetAudienceOptions == false
            ? CustomDropDownTextField(
                text: "Enter or choose Target Audience",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///keywordPhrases
        cubit.booleanForm.keywordPhrasesOptions == false
            ? CustomDropDownTextField(
                text: "Enter or choose  Keyword Phrases",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///============Book Category =====3 fields===========

        /// Theme Options
        cubit.booleanForm.themeOptionsBook == true
            ? CustomDropDownTextField(
                text: "Enter or choose Theme",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Key word Options
        ///
        cubit.booleanForm.keywordOptions == true
            ? CustomDropDownTextField(
                text: "Enter or choose Keywords",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///Tone options
        cubit.booleanForm.toneOptionsBook == true
            ? CustomDropDownTextField(
                text: "Enter or choose  Tone",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///============Character Category =====6 fields===========

        /// Gender Options
        cubit.booleanForm.gender == true
            ? CustomDropDownTextField(
                text: "Enter or Select Gender",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Region Options
        ///
        cubit.booleanForm.region == true
            ? CustomDropDownTextField(
                text: "Enter or Select Region",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///Tone options
        cubit.booleanForm.nameStyle == true
            ? CustomDropDownTextField(
                text: "Enter or Select Name Style",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Flavour Options
        cubit.booleanForm.flavour == true
            ? CustomDropDownTextField(
                text: "Enter or Select Flavour",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Character type
        ///
        cubit.booleanForm.charType == true
            ? CustomDropDownTextField(
                text: "Enter or Select Character Type",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///Letter  Somefields are not related to specific category
        ///

        cubit.booleanForm.letter == true
            ? CustomDropDownTextField(
                text: "Enter or Select Letter",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///============Dish Category =====6 fields===========

        /// Types
        cubit.booleanForm.type == true
            ? CustomDropDownTextField(
                text: "Enter or Select Type",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Cooking Style
        ///
        cubit.booleanForm.cookingStyle == true
            ? CustomDropDownTextField(
                text: "Enter or Select Cooking Style",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///Texture
        cubit.booleanForm.texture == true
            ? CustomDropDownTextField(
                text: "Enter or Select Texture",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Taste
        cubit.booleanForm.taste == true
            ? CustomDropDownTextField(
                text: "Enter or Select Taste",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Ingredients
        ///
        cubit.booleanForm.ingredient == true
            ? CustomDropDownTextField(
                text: "Enter or Select Ingredients",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///  Cusine Region
        ///

        cubit.booleanForm.letter == true
            ? CustomDropDownTextField(
                text: "Enter or Select Cusine Region",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///============Gamers Category =====5 fields===========

        /// Gender Options
        cubit.booleanForm.gender == true
            ? CustomDropDownTextField(
                text: "Enter or Select Gender",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Name length
        ///
        cubit.booleanForm.nameLength == true
            ? CustomDropDownTextField(
                text: "Enter or Select Name Length",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///Gamming name theme Options
        cubit.booleanForm.gamingNameThemesOptions == true
            ? CustomDropDownTextField(
                text: "Enter or Select Name Theme",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Game Options
        cubit.booleanForm.gameOptions == true
            ? CustomDropDownTextField(
                text: "Enter or Select Game options",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        //-------Letter

        ///============Human Category =====6 fields===========

        //-------------------------------letter and country, gender done

        /// Religion
        ///
        cubit.booleanForm.religion == true
            ? CustomDropDownTextField(
                text: "Enter or Select Religion",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///personality
        ///
        cubit.booleanForm.personality == true
            ? CustomDropDownTextField(
                text: "Enter or Select Personality",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// DOB
        ///
        cubit.booleanForm.dob == true
            ? CustomDropDownTextField(
                text: "Enter or Select DOB",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        ///============Nick Category =====2 fields===========
        // ---------country
        /// Names
        cubit.booleanForm.name == true
            ? CustomDropDownTextField(
                text: "Enter or Select Name",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        //============Pet Category =====6 fields===========
        // ---------country
        /// Names
        cubit.booleanForm.name == true
            ? CustomDropDownTextField(
                text: "Enter or Select Name",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        //============Pet Category =====5 fields===========
        // ---------gender , letter , name length
        /// Pet Type
        cubit.booleanForm.petType == true
            ? CustomDropDownTextField(
                text: "Enter or Select Pet Type",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Theme of a Pet
        ///
        cubit.booleanForm.themeDog == true
            ? CustomDropDownTextField(
                text: "Enter or Select Them",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        //============Product Category =====5 fields===========
        // ---------target audience
        /// Product Types
        cubit.booleanForm.productTypeOptions == true
            ? CustomDropDownTextField(
                text: "Enter or Select Product Type",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Product Features
        ///
        cubit.booleanForm.productFeatures == true
            ? CustomDropDownTextField(
                text: "Enter or Select Product Features",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Product Types
        cubit.booleanForm.productTypeOptions == true
            ? CustomDropDownTextField(
                text: "Enter or Select Product Type",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Product Features
        ///
        cubit.booleanForm.productFeatures == true
            ? CustomDropDownTextField(
                text: "Enter or Select Product Features",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Style or tone of a product
        ///
        cubit.booleanForm.pr == true
            ? CustomDropDownTextField(
                text: "Enter or Select keyWords",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        //============Slogan Category =====2 fields===========

        /// Domain
        cubit.booleanForm.domainOptions == true
            ? CustomDropDownTextField(
                text: "Enter or Select Domain",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Geographic Focus
        ///
        cubit.booleanForm.geographicFocus == true
            ? CustomDropDownTextField(
                text: "Enter or Select Geographic Focus",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        //============Story Category =====3 fields===========

        /// Theme of Story
        cubit.booleanForm.themeStory == true
            ? CustomDropDownTextField(
                text: "Enter or Select Theme",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Element
        ///
        cubit.booleanForm.element == true
            ? CustomDropDownTextField(
                text: "Enter or Select Elemet",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Moods
        cubit.booleanForm.mood == true
            ? CustomDropDownTextField(
                text: "Enter or Select Mood",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        //============Team Category =====3 fields===========
        //------ gender

        /// Num Members
        cubit.booleanForm.numMembers == true
            ? CustomDropDownTextField(
                text: "Enter or Select Number of Team Members",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Theme of a Team
        ///
        cubit.booleanForm.themeTeam == true
            ? CustomDropDownTextField(
                text: "Enter or Select Theme",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        //============Title Category =====4 fields===========

        /// Type of Work
        cubit.booleanForm.typeOfWork == true
            ? CustomDropDownTextField(
                text: "Enter or Select Type of Work",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Subjrct
        ///
        cubit.booleanForm.subject == true
            ? CustomDropDownTextField(
                text: "Enter or Select Subject",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Keyword Idea
        cubit.booleanForm.keywordIdeas == true
            ? CustomDropDownTextField(
                text: "Enter or Select Keyword Idea",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Tone or style of Title
        ///
        cubit.booleanForm.toneStyleTitle == true
            ? CustomDropDownTextField(
                text: "Enter or Select Tone ",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),
        //============Twin Category =====6 fields===========
        // ---------name _style, religion , country ,letter done
        /// Twins Gender
        cubit.booleanForm.twinsGender == true
            ? CustomDropDownTextField(
                text: "Enter or Select Gender",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),

        /// Background
        ///
        cubit.booleanForm.background == true
            ? CustomDropDownTextField(
                text: "Enter or Select Background",
                options: hintText,
                onSelected: (String value) {
                  print("Selected: $value");
                },
              )
            : Container(),
      ],
    );
  }
}

List<String> hintText = [
  'Startup',
  'Restaurant',
  'Web development',
  'Fashion',
  'Marketing',
  'Other',
];
