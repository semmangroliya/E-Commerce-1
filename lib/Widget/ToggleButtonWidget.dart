import 'package:flutter/material.dart';

class ToggleButtonWidget extends StatefulWidget {

  @override
  State<ToggleButtonWidget> createState() => ToggleButtonWidgetState();
}

class ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  List<bool> isSelected = [true, false, false];

  FocusNode focusNodeButton1 = FocusNode();
  FocusNode focusNodeButton2 = FocusNode();
  FocusNode focusNodeButton3 = FocusNode();

  List<FocusNode>? focusToggle;

  @override
  void initState() {
    // TODO: implement initState
    focusToggle = [
      focusNodeButton1,
      focusNodeButton2,
      focusNodeButton3,
    ];
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    focusNodeButton1.dispose();
    focusNodeButton2.dispose();
    focusNodeButton3.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;
    return ToggleButtons(
      borderWidth: 0,
      fillColor: Colors.transparent,
      selectedColor: Colors.grey,
      disabledColor: Colors.black,
      selectedBorderColor: Colors.transparent,
      borderColor: Colors.transparent,
      focusNodes: focusToggle,
      children: [
        Icon(
          Icons.grid_view,
          size: mHeight * 0.035,
        ),
        Icon(
          Icons.view_agenda_outlined,
          size: mHeight * 0.035,
        ),
        Icon(
          Icons.crop_landscape_sharp,
          size: mHeight * 0.035,
        ),
      ],
      onPressed: (int index){
        setState(() {
          for(int buttonIndex = 0;buttonIndex < isSelected.length;buttonIndex++){
            if(buttonIndex == index){
              isSelected[buttonIndex] = true;
            }
            else{
              isSelected[buttonIndex] = false;
            }
          }
        });
      },
      isSelected: isSelected,
    );
  }
}
