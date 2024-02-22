// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_appbar.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_button.dart';
import 'package:name_generator/SRC/Presentation/Common/custom_dropdowm_textfield.dart';
import 'package:name_generator/SRC/Presentation/Resources/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/Navigation/navigation.dart';
import 'package:name_generator/SRC/Presentation/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Form/cubit/form_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Form/cubit/form_state.dart';

import '../Re-generate/re_generated_screen.dart';

class FormScreen extends StatefulWidget {
  String categoryId;
  FormScreen({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _keywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => FormCubit(widget.categoryId),
        child: Scaffold(
          body: BlocConsumer<FormCubit, FormmState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              final cubit = context.read<FormCubit>();
              return ModalProgressHUD(
                inAsyncCall: state is FormLoading,
                progressIndicator: CircularProgressIndicator(),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Padding(
                        padding: EdgeInsets.all(20.w),
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
      ),
    );
  }

  FormFields(FormCubit cubit) {
    return Column(
      children: [
        10.y,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              'Fill the Form',
              style: Styles.plusJakartaSans(context,
                  fontSize: 14.sp, fontWeight: FontWeight.w600),
              //textAlign: TextAlign.center,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.cancel_outlined, color: Colors.black45),
                )),
          ],
        ),

        ///============Blog Category =====3 fields===========

        /// Topic Options
        if (cubit.booleanForm!.topicOptions!)
          CustomDropDownTextField(
            text: "Enter or choose any topic",
            options: cubit.formData?.topicOptions ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Target Audience
        if (cubit.booleanForm!.targetAudienceOptions!)
          CustomDropDownTextField(
            text: "Enter or choose Target Audience",
            options: cubit.formData?.targetAudienceOptions ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///keywordPhrases
        if (cubit.booleanForm!.keywordPhrasesOptions!)
          CustomDropDownTextField(
            text: "Enter or choose  Keyword Phrases",
            options: cubit.formData?.keywordPhrasesOptions ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///============Book Category =====3 fields===========

        /// Theme Options
        if (cubit.booleanForm!.themeOptionsBook!)
          CustomDropDownTextField(
            text: "Enter or choose Theme",
            options: cubit.formData?.themeOptionsBook ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Key word Options
        ///
        if (cubit.booleanForm!.keywordOptions!)
          CustomDropDownTextField(
            text: "Enter or choose Keywords",
            options: cubit.formData?.keywordOptions ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///Tone options
        if (cubit.booleanForm!.toneOptionsBook!)
          CustomDropDownTextField(
            text: "Enter or choose  Tone",
            options: cubit.formData?.toneOptionsBook ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///============Character Category =====6 fields===========

        /// Gender Options
        if (cubit.booleanForm!.gender!)
          CustomDropDownTextField(
            text: "Enter or Select Gender",
            options: cubit.formData?.gender ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Region Options
        ///
        if (cubit.booleanForm!.region!)
          CustomDropDownTextField(
            text: "Enter or Select Region",
            options: cubit.formData?.region ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///Tone options
        if (cubit.booleanForm!.nameStyle!)
          CustomDropDownTextField(
            text: "Enter or Select Name Style",
            options: cubit.formData?.nameStyle ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Flavour Options
        if (cubit.booleanForm!.flavour!)
          CustomDropDownTextField(
            text: "Enter or Select Flavour",
            options: cubit.formData?.flavour ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Character type
        ///
        if (cubit.booleanForm!.charType!)
          CustomDropDownTextField(
            text: "Enter or Select Character Type",
            options: cubit.formData?.charType ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///Letter  Somefields are not related to specific category
        ///

        if (cubit.booleanForm!.letter!)
          CustomDropDownTextField(
            text: "Enter or Select Letter",
            options: cubit.formData?.letter ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///============Dish Category =====6 fields===========

        /// Types
        if (cubit.booleanForm!.type!)
          CustomDropDownTextField(
            text: "Enter or Select Type",
            options: cubit.formData?.type ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Cooking Style
        ///
        if (cubit.booleanForm!.cookingStyle!)
          CustomDropDownTextField(
            text: "Enter or Select Cooking Style",
            options: cubit.formData?.cookingStyle ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///Texture
        if (cubit.booleanForm!.texture!)
          CustomDropDownTextField(
            text: "Enter or Select Texture",
            options: cubit.formData?.texture ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Taste
        if (cubit.booleanForm!.taste!)
          CustomDropDownTextField(
            text: "Enter or Select Taste",
            options: cubit.formData?.taste ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Ingredients
        ///
        if (cubit.booleanForm!.ingredient!)
          CustomDropDownTextField(
            text: "Enter or Select Ingredients",
            options: cubit.formData?.ingredient ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///  Cusine Region
        ///
        if (cubit.booleanForm!.cusineRegion!)
          CustomDropDownTextField(
            text: "Enter or Select Cusine Region",
            options: cubit.formData?.cusineRegion ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///============Gamers Category =====5 fields===========

        /// Name length
        ///
        if (cubit.booleanForm!.nameLength!)
          CustomDropDownTextField(
            text: "Enter or Select Name Length",
            options: cubit.formData?.nameLength ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///Gamming name theme Options
        if (cubit.booleanForm!.gamingNameThemesOptions!)
          CustomDropDownTextField(
            text: "Enter or Select Name Theme",
            options: cubit.formData?.gamingNameThemesOptions ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Game Options
        if (cubit.booleanForm!.gameOptions!)
          CustomDropDownTextField(
            text: "Enter or Select Game options",
            options: cubit.formData?.gameOptions ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),
        //-------Letter

        ///============Human Category =====6 fields===========

        //-------------------------------letter and country, gender done

        /// Religion
        ///
        if (cubit.booleanForm!.religion!)
          CustomDropDownTextField(
            text: "Enter or Select Religion",
            options: cubit.formData?.religion ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///personality
        ///
        if (cubit.booleanForm!.personality!)
          CustomDropDownTextField(
            text: "Enter or Select Personality",
            options: cubit.formData?.personality ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// DOB
        ///
        ///
        if (cubit.booleanForm!.dob!)
          CustomDropDownTextField(
            text: "Enter or Select DOB",
            options: cubit.formData?.dob ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        ///============Nick Category =====2 fields===========
        ///Country
        ///
        if (cubit.booleanForm!.country!)
          CustomDropDownTextField(
            text: "Enter or Select Country",
            options: cubit.formData?.country ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Names
        if (cubit.booleanForm!.name!)
          CustomDropDownTextField(
            text: "Enter or Select Name",
            sf: false,
            options: cubit.formData?.name ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        //============Pet Category =====6 fields===========
        // ---------country
        /// Names

        //============Pet Category =====5 fields===========
        // ---------gender , letter , name length
        /// Pet Type
        if (cubit.booleanForm!.petType!)
          CustomDropDownTextField(
            text: "Enter or Select Pet Type",
            options: cubit.formData?.petType ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Theme of a Pet
        ///
        if (cubit.booleanForm!.themeDog!)
          CustomDropDownTextField(
            text: "Enter or Select Them",
            options: cubit.formData?.themeDog ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        //============Product Category =====5 fields===========
        // ---------target audience
        /// Product Types
        if (cubit.booleanForm!.productTypeOptions!)
          CustomDropDownTextField(
            text: "Enter or Select Product Type",
            options: cubit.formData?.productTypeOptions ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Product Features
        ///
        if (cubit.booleanForm!.productFeatures!)
          CustomDropDownTextField(
            text: "Enter or Select Product Features",
            options: cubit.formData?.productFeatures ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Style or tone of a product
        ///
        if (cubit.booleanForm!.styleOrToneProdu!)
          CustomDropDownTextField(
            text: "Enter or Select Style or Tone",
            options: cubit.formData?.styleOrToneProdu ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        if (cubit.booleanForm!.pr!)
          CustomDropDownTextField(
            text: "Enter or Select keyWords",
            options: cubit.formData?.pr ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        //============Slogan Category =====2 fields===========

        /// Domain
        if (cubit.booleanForm!.domainOptions!)
          CustomDropDownTextField(
            text: "Enter or Select Domain",
            options: cubit.formData?.domainOptions ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Geographic Focus
        ///
        if (cubit.booleanForm!.geographicFocus!)
          CustomDropDownTextField(
            text: "Enter or Select Geographic Focus",
            options: cubit.formData?.geographicFocus ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        //============Story Category =====3 fields===========

        /// Theme of Story
        if (cubit.booleanForm!.themeStory!)
          CustomDropDownTextField(
            text: "Enter or Select Theme",
            options: cubit.formData?.themeStory ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Element
        ///
        if (cubit.booleanForm!.element!)
          CustomDropDownTextField(
            text: "Enter or Select Elemet",
            options: cubit.formData?.element ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Moods

        if (cubit.booleanForm!.mood!)
          CustomDropDownTextField(
            text: "Enter or Select Mood",
            options: cubit.formData?.mood ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        //============Team Category =====3 fields===========
        //------ gender

        /// Num Members
        if (cubit.booleanForm!.numMembers!)
          CustomDropDownTextField(
            text: "Enter or Select Number of Team Members",
            options: cubit.formData?.numMembers ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Theme of a Team
        ///
        if (cubit.booleanForm!.themeTeam!)
          CustomDropDownTextField(
            text: "Enter or Select Theme",
            options: cubit.formData?.themeTeam ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        //============Title Category =====4 fields===========

        /// Type of Work
        if (cubit.booleanForm!.typeOfWork!)
          CustomDropDownTextField(
            text: "Enter or Select Type of Work",
            options: cubit.formData?.typeOfWork ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Subjrct
        ///
        if (cubit.booleanForm!.subject!)
          CustomDropDownTextField(
            text: "Enter or Select Subject",
            options: cubit.formData?.subject ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Keyword Idea
        if (cubit.booleanForm!.keywordIdeas!)
          CustomDropDownTextField(
            text: "Enter or Select Keyword Idea",
            options: cubit.formData?.keywordIdeas ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Tone or style of Title
        ///
        if (cubit.booleanForm!.toneStyleTitle!)
          CustomDropDownTextField(
            text: "Enter or Select Tone ",
            options: cubit.formData?.toneStyleTitle ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        //============Twin Category =====6 fields===========
        // ---------name _style, religion , country ,letter done
        /// Twins Gender
        if (cubit.booleanForm!.twinsGender!)
          CustomDropDownTextField(
            text: "Enter or Select Gender",
            options: cubit.formData?.twinsGender ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          ),

        /// Background
        ///
        if (cubit.booleanForm!.background!)
          CustomDropDownTextField(
            text: "Enter or Select Background",
            options: cubit.formData?.background ?? [],
            onSelected: (String value) {
              print("Selected: $value");
            },
          )
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
