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
import 'package:name_generator/SRC/Presentation/Widgets/Categories/Human/human.dart';
import '../../Form/form.dart';



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

  final List<Widget> screens = [
    Human() ,
    Human() ,
    Human() ,
    Human() ,
    Human() ,
    Human() ,
    Human() ,
    Human() ,
    Human() ,
    Human() ,
    Human() ,
    Human() ,

    // Business(),
    // Pet(),
    // Game(),
    // Team(),
    // Character(),
    // Dish(),
    // Twins(),
    // Book(),
    // Game(),
    // Book(),
    // Document(),

  ];

  final List<String> carouselImages = [
    Assets.slider1,
    Assets.slider2,
  ];
int i=0;
  @override
  Widget build(BuildContext context) {
    print('rebuilddd ${ i++}');
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  autoPlayAnimationDuration:
                  const Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
                items: carouselImages.map((String url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width.w,
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
              10.y,
              Align(
                alignment: Alignment.centerLeft,
                child: AppText('Name Categories',
                    style: Styles.smallPlusJakartaSans(
                      context,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    )),
              ),

              10.y,

              Wrap(
               // alignment: WrapAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < categorynames.length; i++)
                    GestureDetector(onTap:(){
                      Navigate.to(context, screens[i]);
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

          child: const Icon(Icons.add,size: 30),
        ),

      ),
    );
  }
}
