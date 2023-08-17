import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';

import 'constant.dart';

class EmailBox extends StatefulWidget {
  const EmailBox({super.key});

  @override
  State<EmailBox> createState() => _EmailBoxState();
}

class _EmailBoxState extends State<EmailBox> with TickerProviderStateMixin {
  double mainBoxWidth = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 11, vsync: this);
  }

  String language = '';
  String? value1;
  String? value2;
  String? value3;
  double fontSize = 1.0;
  // create some values
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  bool colorPicker = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    setState(() {
      mainBoxWidth = w - 125;
    });
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: h - h * 0.07,
      width: mainBoxWidth,
      margin: const EdgeInsets.only(left: 65, right: 60),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 12,
            top: 12,
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.only(left: 10),
                  controller: tabController,
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      child: Text(
                        "General",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Labels",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Inbox",
                        maxLines: 1, // Set maxLines to 1
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Accounts and Import",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Filters and Blocked Addresses",
                        // maxLines: 1, // Set maxLines to 1
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Forwarding and POP/IMAP",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Add-ons",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Chat and Meet",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Advanced",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Offline",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Themes",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Expanded(
                  child: TabBarView(controller: tabController, children: [
                    ListView.builder(
                        itemCount: strings.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                width: w,
                                height: 70,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 10,
                                      top: 2,
                                      child: Text(
                                        '${strings[index]}:',
                                        style: const TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 7),
                                      child: const Positioned(
                                        left: 10,
                                        top: 15,
                                        width: 120,
                                        height: 50,
                                        child: Text(
                                          '(Use the "Remove formatting" button on the toolbar to reset the default text style)',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10.0,
                                          ),
                                          maxLines: 4,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 150,
                                      top: 2,
                                      child: Text(
                                        '${value[index]}',
                                        style: const TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 0),
                                      child: Positioned(
                                        left: 260,
                                        top: 1,
                                        child: Container(
                                          width: 220,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: LanguagePickerDropdown(
                                            initialValue: Languages.english,
                                            onValuePicked: (Language language) {
                                              print(language.name);
                                            },
                                            itemBuilder: _buildDialogItem,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 0),
                                      child: const Positioned(
                                        left: 485,
                                        top: 2,
                                        child: Text(
                                          'Change language settings for other Google products',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 7),
                                      child: Container(
                                        width: 300,
                                        height: 60,
                                        margin:
                                            const EdgeInsets.only(left: 150),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 5.0,
                                              spreadRadius: 3.0,
                                              offset: Offset(0,
                                                  4), // Adjust the offset as needed
                                            ),
                                          ],
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 120,
                                                  height: 15,
                                                  margin: const EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<String>(
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10,
                                                      ),
                                                      dropdownColor:
                                                          Colors.white,
                                                      menuMaxHeight: 300,
                                                      hint: const Text(
                                                        "Sans Serif",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      isExpanded: true,
                                                      value: value2,
                                                      autofocus: true,
                                                      items: fontFamily
                                                          .map(buildMenuItem)
                                                          .toList(),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          value2 = value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 75,
                                                  height: 15,
                                                  margin: const EdgeInsets.only(
                                                      left: 0, top: 5),
                                                  child:
                                                      DropdownButtonHideUnderline(
                                                    child:
                                                        DropdownButton<String>(
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10,
                                                      ),
                                                      dropdownColor:
                                                          Colors.white,
                                                      menuMaxHeight: 300,
                                                      hint: const Text(
                                                        "ᵀT",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 10),
                                                      ),
                                                      isExpanded: true,
                                                      value: value3,
                                                      autofocus: true,
                                                      items: size
                                                          .map(buildMenuItem)
                                                          .toList(),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          value3 = value!;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      colorPicker =
                                                          !colorPicker;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 10,
                                                    height: 20,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 5, top: 5),
                                                    child: const Center(
                                                      child: Text(
                                                        'A',
                                                        style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontSize: 10),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25,
                                                  height: 20,
                                                  margin: const EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  child: const Text('en'),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10, top: 10),
                                              child: const Text(
                                                'This is what your body text will look like',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 0),
                                      child: const Positioned(
                                        left: 150,
                                        top: 20,
                                        child: Text(
                                          'Show all language options',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 1),
                                      child: Positioned(
                                        left: 250,
                                        top: 2,
                                        child: Container(
                                          width: 200,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                              iconEnabledColor: Colors.white,
                                              dropdownColor: Colors.white,
                                              hint: const Text(
                                                "India",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              isExpanded: true,
                                              value: value1,
                                              items: countryName
                                                  .map(buildMenuItem)
                                                  .toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  value1 = value!;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (index == 14),
                                      child: Stack(
                                        children: [
                                          Container(
                                              width: 700,
                                              height: 25,
                                              margin: const EdgeInsets.only(
                                                  left: 150),
                                              child: const Text.rich(
                                                  TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        'Drag the stars between the lists.',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10)),
                                                TextSpan(
                                                    text:
                                                        'The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.',
                                                    style:
                                                        TextStyle(fontSize: 10))
                                              ]))),
                                          Container(
                                            width: 700,
                                            height: 25,
                                            margin: const EdgeInsets.only(
                                                left: 150, top: 25),
                                            child: const Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                      text: 'Presets:    ',
                                                      style: TextStyle(
                                                          fontSize: 10)),
                                                  TextSpan(
                                                      text:
                                                          '1 star  4 stars  all stars',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 10))
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 25,
                                            margin: const EdgeInsets.only(
                                                left: 150, top: 40),
                                            child: const Text(
                                              'In use:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 25,
                                            margin: const EdgeInsets.only(
                                                left: 150, top: 60),
                                            child: const Text(
                                              'Not in use:',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                          Draggable<String>(
                                            feedback: Container(
                                              width: 20,
                                              height: 15,
                                              margin: const EdgeInsets.only(
                                                  left: 200, top: 60),
                                              child: Image.asset(
                                                'star.png',
                                                scale: 40,
                                              ),
                                            ),
                                            child: Container(
                                              width: 20,
                                              height: 15,
                                              margin: const EdgeInsets.only(
                                                  left: 200, top: 60),
                                              child: Image.asset(
                                                'star.png',
                                                scale: 40,
                                              ),
                                            ),
                                          ),
                                          DragTarget(builder:
                                              (context, accepted, rejected) {
                                            return Container(
                                              width: 20,
                                              height: 15,
                                              margin: const EdgeInsets.only(
                                                  left: 200, top: 40),
                                              color: Colors.white,
                                            );
                                          }),
                                          DragTarget(
                                              onAccept: (Color color) {},
                                              builder: (context, accepted,
                                                  rejected) {
                                                return Container(
                                                  width: 20,
                                                  height: 15,
                                                  margin: const EdgeInsets.only(
                                                      left: 250, top: 40),
                                                  color: Colors.white,
                                                );
                                              }),
                                          DragTarget(
                                              onAccept: (Color color) {},
                                              builder: (context, accepted,
                                                  rejected) {
                                                return Container(
                                                  width: 20,
                                                  height: 15,
                                                  margin: const EdgeInsets.only(
                                                      left: 300, top: 40),
                                                  color: Colors.white,
                                                );
                                              }),
                                          DragTarget(
                                              onAccept: (Color color) {},
                                              builder: (context, accepted,
                                                  rejected) {
                                                return Container(
                                                  width: 20,
                                                  height: 15,
                                                  margin: const EdgeInsets.only(
                                                      left: 200, top: 40),
                                                  color: Colors.white,
                                                );
                                              }),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        }),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                    ),
                  ]),
                )
              ],
            ),
          ),
          Visibility(
            visible: colorPicker,
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  Widget _buildDialogItem(Language language) => Row(
        children: <Widget>[
          Text(
            language.name,
            style: TextStyle(fontSize: 10),
          ),
          const SizedBox(width: 8.0),
          Flexible(
              child: Text(
            "(${language.isoCode})",
            style: TextStyle(fontSize: 10),
          ))
        ],
      );
}
