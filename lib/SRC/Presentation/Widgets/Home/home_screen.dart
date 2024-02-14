import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Presentation/Resources/Navigation/navigation.dart';
import 'package:name_generator/SRC/Presentation/Resources/Extensions/extensions.dart';
import 'package:name_generator/SRC/Presentation/Resources/assets.dart';
import 'package:name_generator/SRC/Presentation/Resources/color.dart';
import 'package:name_generator/SRC/Presentation/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/cat_icon.dart';
import 'package:name_generator/SRC/Presentation/Common/round_avatar.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Home/cubit/home_cubit.dart';
import 'package:name_generator/SRC/Presentation/Widgets/Input/Cubit/input_form_screen.dart';
import 'package:name_generator/SRC/Presentation/Widgets/SubCategory/sub_category_screen.dart';
import '../Form/form.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController inputcontroller = TextEditingController();

  final List<String> categoryimages = [
    Assets.man,
    Assets.briefcase,
    Assets.dog,
    Assets.game,
    Assets.team,
    Assets.superhero,
    Assets.chickenrice,
    Assets.twins,
    Assets.book,
    Assets.game,
    Assets.book,
    Assets.document,
  ];

  final List<String> categorynames = [
    'Human',
    'Business',
    'Pet',
    'Game',
    'Team',
    'Character',
    'Dish',
    'Twins',
    'Book',
    'Game',
    'Book',
    'Document',
  ];

  final List<String> carouselImages = [
    Assets.slider1,
    Assets.slider2,
  ];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    print('rebuilddd ${i++}');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppText('Hello 👋\n${cubit.authService.appUser.name}',
            maxLine: 2,
            style: Styles.plusJakartaBold(context, fontSize: 16.sp)),
        actions: [
          RoundAvatar(
            icon: Assets.notifications,
            issvg: true,
            haveborder: true,
            imageheight: 23.h,
            imagewidth: 23.h,
            padding: 9.sp,
          ),
          10.x,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.y,
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
                items: cubit.banners.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width.w,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        ),
                        child: Image.network(
                          url.imageUrl!,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              7.y,
              Align(
                child: Container(
                  height: 3.h,
                  width: 30.w,
                  color: AppColors.primaryColor,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 10.sp, left: 15.sp),
                child: AppText('Name Categories',
                    style: Styles.smallPlusJakartaSans(
                      context,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              5.y,
              Wrap(
                //  alignment: WrapAlignment.spaceEvenly,
                //runSpacing: 0,
                // alignment: WrapAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < categorynames.length; i++)
                    GestureDetector(
                      onTap: () {
                        Navigate.to(context, SubCategoryScreen());
                      },
                      child: CategoryTile(
                        title: categorynames[i],
                        icon: categoryimages[i],
                      ),
                    )
                ],
              ),
              //50.y,
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 60.h,
        width: 60.w,
        child: FloatingActionButton(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.sp)),
          onPressed: () {
            Navigate.to(context, const FormScreen());
          },
          tooltip: 'Add',
          child: const Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
}
