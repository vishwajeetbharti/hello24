import 'package:flutter/material.dart';

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
                                    Positioned(
                                      left: 150,
                                      top: 2,
                                      child: Text(
                                        '${value[index]}',
                                        style: const TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
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
          )
        ],
      ),
    );
  }
}
