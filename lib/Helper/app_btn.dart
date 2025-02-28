import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class AppBtn extends StatelessWidget {
  final String? title;
  final AnimationController? btnCntrl;
  final Animation? btnAnim;
  final VoidCallback? onBtnSelected;


  const AppBtn(
      {Key? key,
      this.title,
      this.btnCntrl,
      this.btnAnim,
      this.onBtnSelected,
 })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildBtnAnimation,
      animation: btnCntrl!,
    );
  }

  Widget _buildBtnAnimation(BuildContext context, Widget? child) {
    return Padding(
  padding: EdgeInsets.only(top: 25),
      child: CupertinoButton(
        child: Container(
          width: btnAnim!.value,
          height: 45,
        
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(

            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [primary,secondary],
                stops: [0, 1]),
            borderRadius: BorderRadius.all(const Radius.circular(10.0)),
          ),
          child: btnAnim!.value > 75.0
              ? Text(title!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: white, fontWeight: FontWeight.normal))
              : CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(white),
                ),
        ),
        onPressed: () {
          onBtnSelected!();
        },
      ),
    );
  }
}
