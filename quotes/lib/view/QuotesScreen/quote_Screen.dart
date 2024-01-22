import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes/const/style.dart';
import 'package:quotes/view/CreateQuoteScreen/create_quote_screen.dart';
import 'package:quotes/view/OpenQuoteScreen/open_quote_screen.dart';
import 'package:quotes/view/QuotesScreen/list.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  int selectedGridItemIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Text(
            'Quotes Categories',
            style: AppStyle.heading24blackw500,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 30.h),
        child: GridView.builder(
          itemCount: QuoteContent.quoteContentLength.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 49.0,
            crossAxisSpacing: 15,
            childAspectRatio: (179.w / 54.h),
          ),
          itemBuilder: (context, index) {
            final quotecontentlength = QuoteContent.quoteContentLength;
            return buildGridItem(
              quotecontentlength[index],
              isSelected: index == selectedGridItemIndex,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OpenQuoteScreen(
                      selectedCategory: quotecontentlength[index].title,
                    ),
                  ),
                );
                setState(() {
                  selectedGridItemIndex = index;
                });
              },
            );
          },
        ),
      ),
      floatingActionButton:FloatingActionButton(
         onPressed: () {
           Navigator.push(
             context,
             MaterialPageRoute(builder: (context) => CreateQuoteScreen()),
           );
         },
         elevation: 0,
         shape: CircleBorder(),
         backgroundColor: Color(0xffCFD7FF),
         child: Icon(Icons.edit),
       )
    );
  }

  Widget buildGridItem(QuoteContent item,
      {required bool isSelected, required Null Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isSelected ? Colors.blue.withOpacity(0.3) : Color(0xffF1C9FF),
        child: Center(
          child: Text(
            item.title,
            style: AppStyle.heading16black400,
          ),
        ),
      ),
    );
  }
}
