import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes/const/style.dart';
import 'package:quotes/view/OpenQuoteScreen/open_list.dart';

class OpenQuoteScreen extends StatefulWidget {
  final String selectedCategory;

  const OpenQuoteScreen({Key? key, required this.selectedCategory})
      : super(key: key);

  @override
  State<OpenQuoteScreen> createState() => _OpenQuoteScreenState();
}

class _OpenQuoteScreenState extends State<OpenQuoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.selectedCategory,
          style: AppStyle.heading24blackw500,
        ),
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: OpenContent.openContentLength.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final opencontentlength = OpenContent.openContentLength;
                  return buildGridItem(opencontentlength[index]);
                }),
          )
        ],
      ),
    );
  }

  Widget buildGridItem(OpenContent item) {
    return Image(image: AssetImage(item.image));
  }
}
