import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../provider/korea_provider.dart';

class MyAnimSearchBar extends StatefulWidget {
  const MyAnimSearchBar({
    Key? key,
    this.width = 250,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText = "Ara...",
    this.height = 50,
    this.textInputAction = TextInputAction.done,
    this.animationDurationInMilli = 375,
    this.rtl = false,
    this.autoFocus = false,
    this.style,
    this.closeSearchOnSuffixTap = false,
    this.boxShadow = true,
    this.inputFormatters,
    this.text = '',
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    required this.controller,
  }) : super(key: key);

  final double width;
  final double height;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String labelText;
  final int animationDurationInMilli;
  final bool rtl;
  final bool autoFocus;
  final TextStyle? style;
  final bool closeSearchOnSuffixTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool boxShadow;
  final TextInputAction textInputAction;
  final String? text;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final TextEditingController controller;

  @override
  State<MyAnimSearchBar> createState() => _MyAnimSearchBarState();
}

int toggle = 0;
String textFieldValue = '';

class _MyAnimSearchBarState extends State<MyAnimSearchBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  FocusNode focusNode = FocusNode();

  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDurationInMilli),
    );
    _controller = widget.controller;
  }

  unfocusKeyboard() {
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive resp = Responsive.of(context);
    return Container(
      height: resp.hp(5),
      alignment:
          widget.rtl ? Alignment.centerRight : const Alignment(-1.0, 0.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDurationInMilli),
        height: widget.height,
        width: (toggle == 0) ? resp.wp(11) : widget.width,
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: borderRadiusMedium,
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDurationInMilli),
              top: 6.0,
              right: 7.0,
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: (toggle == 0) ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: paddingAll / 2,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: borderRadiusMedium,
                  ),
                  child: AnimatedBuilder(
                    builder: (context, widget) {
                      return Transform.rotate(
                        angle: _animController.value * 2.0 * pi,
                        child: widget,
                      );
                    },
                    animation: _animController,
                    child: GestureDetector(
                      onTap: () {
                        final series =
                            Provider.of<SerieProvider>(context, listen: false);
                        final movies =
                            Provider.of<MovieProvider>(context, listen: false);
                        final japons =
                            Provider.of<JaponProvider>(context, listen: false);
                        if (_controller.text.isEmpty) {
                          series.search(textFieldValue);
                          movies.search(textFieldValue);
                          japons.search(textFieldValue);
                        } else {
                          series.search(textFieldValue);
                          movies.search(textFieldValue);
                          japons.search(textFieldValue);
                        }
                        try {
                          if (textFieldValue == '') {
                            unfocusKeyboard();
                            setState(() {
                              toggle = 0;
                            });

                            _animController.reverse();
                          }

                          _controller.clear();
                          textFieldValue = '';

                          if (widget.closeSearchOnSuffixTap) {
                            unfocusKeyboard();
                            setState(() {
                              toggle = 0;
                            });
                          }
                        } catch (e) {
                          Text(e.toString());
                        }
                      },
                      child: widget.suffixIcon ??
                          Icon(
                            Icons.close,
                            size: iconSmall,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDurationInMilli),
              left: (toggle == 0) ? 20.0 : 40.0,
              curve: Curves.easeOut,
              top: 11.0,
              child: AnimatedOpacity(
                opacity: (toggle == 0) ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: paddingLeft,
                  alignment: Alignment.topCenter,
                  width: widget.width / 1.7,
                  child: TextField(
                    controller: _controller,
                    inputFormatters: widget.inputFormatters,
                    keyboardType: widget.keyboardType,
                    focusNode: focusNode,
                    textInputAction: widget.textInputAction,
                    cursorRadius: radiusLow,
                    cursorWidth: 2.0,
                    onChanged: widget.onChanged,
                    onEditingComplete: () {
                      unfocusKeyboard();
                      setState(() {
                        toggle = 0;
                      });
                    },
                    style: widget.style ??
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    cursorColor: Theme.of(context).colorScheme.primary,
                    decoration: InputDecoration(
                      contentPadding: paddingBot,
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: widget.labelText,
                      labelStyle: fontSFProMedium16,
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: borderRadiusMedium,
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Material(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: borderRadiusMedium,
              child: IconButton(
                splashRadius: 19.0,
                icon: widget.prefixIcon != null
                    ? toggle == 1
                        ? Icon(
                            Icons.arrow_back_ios,
                            color: Theme.of(context).colorScheme.primary,
                            size: iconSmall,
                          )
                        : widget.prefixIcon!
                    : Icon(
                        toggle == 1 ? Icons.arrow_back_ios : Icons.search,
                        color: Theme.of(context).colorScheme.primary,
                        size: iconSmall,
                      ),
                onPressed: () {
                  final series =
                      Provider.of<SerieProvider>(context, listen: false);
                  final movies =
                      Provider.of<MovieProvider>(context, listen: false);
                  final japons =
                      Provider.of<JaponProvider>(context, listen: false);
                  setState(
                    () {
                      if (toggle == 0) {
                        series.search(textFieldValue);
                        movies.search(textFieldValue);
                        japons.search(textFieldValue);
                        toggle = 1;
                        setState(() {
                          if (widget.autoFocus) {
                            FocusScope.of(context).requestFocus(focusNode);
                          }
                        });

                        _animController.forward();
                      } else {
                        series.search(textFieldValue);
                        movies.search(textFieldValue);
                        japons.search(textFieldValue);
                        toggle = 0;

                        setState(() {
                          if (widget.autoFocus) unfocusKeyboard();
                        });
                        _animController.reverse();
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
