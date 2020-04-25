import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onlinecourseappui/models/category.dart';
import 'package:onlinecourseappui/screens/constants.dart';

class DetailScreen extends StatefulWidget {
  final Category category;
  DetailScreen({this.category});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            child: Column(
              children: <Widget>[
                Container(
                  width: size.width,
                  height: size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F4EF),
                    image: DecorationImage(
                        image: AssetImage(widget.category.image),
                        fit: BoxFit.cover),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 50, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ClipPath(
                          clipper: BestSellerClipper(),
                          child: Container(
                            color: kBestSellerColor,
                            padding: EdgeInsets.only(
                                left: 10, top: 5, right: 20, bottom: 5),
                            child: Text(
                              'BestSeller'.toUpperCase(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Design Thinking',
                          style: kHeadingextStyle,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: <Widget>[
                            SvgPicture.asset('assets/icons/person.svg'),
                            SizedBox(
                              width: 5,
                            ),
                            Text('18K'),
                            SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset('assets/icons/star.svg'),
                            SizedBox(
                              width: 5,
                            ),
                            Text('4.8'),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "\$50",
                                  style:
                                      kHeadingextStyle.copyWith(fontSize: 32)),
                              TextSpan(
                                  text: "\$70",
                                  style: TextStyle(
                                      color: kTextColor.withOpacity(0.5),
                                      decoration: TextDecoration.lineThrough)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height - size.width + 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Course Content',
                          style: kHeadingextStyle,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CourseContent(
                          number: '01',
                          title: 'Welcome to the Course',
                          duration: '5:35',
                          isDone: true,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CourseContent(
                          number: '02',
                          title: 'Design Thinking - Intro',
                          duration: '19:04',
                          isDone: true,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CourseContent(
                          number: '03',
                          title: 'Design Thinking Process',
                          duration: '7:25',
                          isDone: false,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CourseContent(
                          number: '04',
                          title: 'Customer Perspective',
                          duration: '10:45',
                          isDone: false,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 50,
                            color: kTextColor.withOpacity(0.1),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(14),
                            height: 56,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFEDEE),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: SvgPicture.asset(
                                'assets/icons/shopping-bag.svg'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 56,
                              decoration: BoxDecoration(
                                color: kBlueColor,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Text(
                                'Buy Now',
                                style: kSubtitleTextSyule.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final String duration;
  final String title;
  final bool isDone;
  const CourseContent({
    this.number,
    this.duration,
    this.title,
    this.isDone,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          number,
          style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(0.15), fontSize: 32),
        ),
        SizedBox(
          width: 20,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: '${duration} mins\n',
                  style: TextStyle(
                      color: kTextColor.withOpacity(0.5), fontSize: 10)),
              TextSpan(
                  text: title,
                  style: kSubtitleTextSyule.copyWith(
                      fontWeight: FontWeight.w600, height: 1.5))
            ],
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: kGreenColor.withOpacity(isDone ? 1 : 0.5),
              shape: BoxShape.circle),
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
