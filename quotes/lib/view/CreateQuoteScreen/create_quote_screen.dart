import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quotes/const/sizedbox_ext.dart';
import 'dart:io';

import 'package:quotes/view/CreateQuoteScreen/bottom.dart';

class CreateQuoteScreen extends StatefulWidget {
  const CreateQuoteScreen({Key? key}) : super(key: key);

  @override
  State<CreateQuoteScreen> createState() => _CreateQuoteScreenState();
}

class _CreateQuoteScreenState extends State<CreateQuoteScreen> {
  int _selectedIndex = 0;
  TextEditingController _userInputController = TextEditingController();
  String? backgroundImage;
  String selectedFontStyle = 'Arial Black';
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Quote'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 300,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.pink.withOpacity(0.2),
                ],
              ),
              image: backgroundImage != null
                  ? DecorationImage(
                      image: FileImage(File(backgroundImage!)),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Center(
              child: TextField(
                controller: _userInputController,
                textAlign: TextAlign.center,
                maxLines: null,
                style: _getTextStyle(),
                decoration: const InputDecoration(
                  hintText: 'Write your quote...',
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTabSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 1) {
            _pickImageFromGallery();
          } else if (index == 2) {
            _showFontStyleSelection(context);
          } else if (index == 3) {
            _showTextColorSelection(context);
          }
        },
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      if (file.existsSync()) {
        setState(() {
          backgroundImage = pickedFile.path;
        });
      } else {
        print("Selected file does not exist!");
      }
    }
  }

  void _showFontStyleSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Select Font Style')),
          content: Column(
            children: [
              _buildFontStyleOption('Arial Black', context),
              30.h.sbh,
              _buildFontStyleOption('Italic', context),
              30.h.sbh,
              _buildFontStyleOption('Bold', context),
              30.h.sbh,
              _buildFontStyleOption('Light Italic', context),
              30.h.sbh,
              _buildFontStyleOption('Bold Italic', context),
              30.h.sbh,
              _buildFontStyleOption('Extra Light', context),
              30.h.sbh,
              _buildFontStyleOption('Thin Italic', context),
            ],
          ),
        );
      },
    );
  }

  void _showTextColorSelection(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('Select Text Color')),
          content: Column(
            children: [
              60.h.sbh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildColorOption(Color(0xff4738A5), context),
                  30.w.sbw,
                  _buildColorOption(Color(0xffAF1D1D), context),
                ],
              ),
              60.h.sbh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildColorOption(Color(0xffA9E593), context),
                  30.w.sbw,
                  _buildColorOption(Color(0xffC56DB1), context),
                ],
              ),
              60.h.sbh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildColorOption(Color(0xffC9C176), context),
                  30.w.sbw,
                  _buildColorOption(Color(0xff83E2DD), context),
                ],
              ),
              60.h.sbh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildColorOption(Color(0xffFFC092), context),
                  30.w.sbw,
                  _buildColorOption(Color(0xffF52E2E), context),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFontStyleOption(String fontStyle, BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedFontStyle = fontStyle;
        });
        Navigator.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(fontStyle),
      ),
    );
  }

  Widget _buildColorOption(Color color, BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          textColor = color;
        });
        Navigator.of(context).pop();
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  TextStyle _getTextStyle() {
    List<String> styles = selectedFontStyle.split(' ');
    FontStyle? fontStyle;
    FontWeight? fontWeight;
    double letterSpacing = 0.0;
    for (String style in styles) {
      switch (style) {
        case 'Italic':
          fontStyle = FontStyle.italic;
          break;
        case 'Bold':
          fontWeight = FontWeight.bold;
          break;
        case 'Extra':
          letterSpacing = 2.0;
          break;
      }
    }
    return TextStyle(
      color: textColor,
      fontSize: 20,
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing,
      fontFamily:
          selectedFontStyle == 'Arial Black' ? 'Arial Black' : 'Default Font',
    );
  }
}
