import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Extensions/extensions.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Common/cat_icon.dart';
import 'package:name_generator/SRC/Presentation/Common/round_avatar.dart';
import 'package:name_generator/SRC/Presentation/Screens/Form/Widgets/form.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController inputcontroller = TextEditingController();

  final List<String> categoryimages = [
    Assets.briefcase,
    Assets.man,
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
    'Business',
    'Human',
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
int i=0;
  @override
  Widget build(BuildContext context) {
    print('rebuilddd ${ i++}');
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: AppText('Hello 👋\nFarooq Ahmad',  maxLine: 2, style: Styles.plusJakartaBold(context, fontSize: 16.sp )),

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
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 1,
                    ),
                    items: carouselImages.map((String url) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width.w,
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(

                              color: Colors.amber,
                              
                              borderRadius: BorderRadius.all(Radius.circular(80.r)),
                            ),
                            child: Image.asset(
                              url,
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.sp, left: 15.sp),
                    child: AppText('Name Categories',
                        style: Styles.smallPlusJakartaSans(
                          context,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.sp, left: 20.sp),
                      child: Wrap(
                      
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < categorynames.length; i++)
                            CategoryTile(
                              title: categorynames[i],
                              icon: categoryimages[i],
                            )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.sp)),
          onPressed: () {
            Navigate.to(context, const FormScreen());
          },
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
