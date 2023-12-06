import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:name_generator/SRC/Application/Services/Navigation/navigation.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/assets.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/color.dart';
import 'package:name_generator/SRC/Data/DataSource/Resources/styles.dart';
import 'package:name_generator/SRC/Presentation/Common/app_text.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/Components/Appbar/custom_appbar.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/Components/Categories/Components/cat_icon.dart';
import 'package:name_generator/SRC/Presentation/Screens/Home/Form/form.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

int _currentIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Scaffold(
        backgroundColor: Color(0xffE8E7E7),
        appBar: CustomAppbar(title: 'Hello 👋', subtitle: 'Farooq Ahmad', icon: Assets.notifications,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 200.0, // Adjust the height as needed
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
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
                                    borderRadius: BorderRadius.circular(80.sp), //
                                  ),
                                  child: Image.asset(
                                    url,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                              
                        Padding(
                          padding:  EdgeInsets.only(top: 10.sp, left: 25.sp),
                          child: AppText('Name Categories', style: Styles.largePlusJakartaSans(context, fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                           )),
                        ),
                        SingleChildScrollView(scrollDirection: Axis.vertical, 
                        physics: BouncingScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.sp, left: 30.sp ),
                            child: Wrap(

                              // spacing: 20.sp,
                              alignment: WrapAlignment.spaceBetween,
                              // runSpacing: 9.sp,
                          
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.sp)),
          onPressed: (){
            Navigate.to(context, FormScreen());
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
        ),
      ),
    );
  }
}









 