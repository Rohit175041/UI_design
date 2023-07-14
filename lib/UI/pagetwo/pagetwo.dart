import 'package:data_analysis/UI/provider/providertwo.dart';
import 'package:data_analysis/UI/pagetwo/switchbutton2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'devicebutton2.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  double boxradius = 22;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
        padding: const EdgeInsets.only(
            top: 30.0,
            // right: 165
            right: 185),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            // color: Colors.blueGrey,
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.only(
                // topRight: Radius.elliptical(50, 700)
                topRight: Radius.circular(150)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50.0, right: 205),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(135)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 60.0, right: 215),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade50.withOpacity(0.6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
           
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(130)),
          ),
        ),
      ),
      mainbox(),
    ])));
  }

  Widget mainbox() {
    return Center(
        child: SizedBox(
            height: MediaQuery.sizeOf(context).height / 1.1,
            width: MediaQuery.sizeOf(context).width / 1.15,
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  box1(),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 30,
                  ),
                  deviceConnection(),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 25,
                  ),
                  tvConnection("Smart TV"),
                  Divider(
                    color: Colors.black26,
                    height: MediaQuery.sizeOf(context).height / 28,
                  ),
                  acConnection("Smart AC"),
                  Divider(
                    color: Colors.black26,
                    height: MediaQuery.sizeOf(context).height / 28,
                  ),
                  lightConnection("Smart Light"),
                  Divider(
                    color: Colors.black26,
                    // thickness: 2,
                    height: MediaQuery.sizeOf(context).height / 28,
                  ),
                  fanConnection("Smart FAN"),
                ])));
  }

  Widget box1() {
    return Container(
      alignment: Alignment.center,
      // color: Colors.green,
      height: MediaQuery.sizeOf(context).height / 15,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.navigate_before, size: 32),
          Icon(Icons.more_vert, size: 32),
        ],
      ),
    );
  }

  Widget deviceConnection() {
    return Builder(builder: (context) {
      final deviceButton = Provider.of<Itembutton2>(context, listen: true);
      return Container(
        alignment: Alignment.center,
        // color: Colors.blueGrey.shade100,
        height: MediaQuery.sizeOf(context).height / 13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 2.5,
              height: MediaQuery.sizeOf(context).height / 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Devices",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 190,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                        deviceButton.device == false
                            ? "Connected"
                            : "Not Connected",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ChangeNotifierProvider(
                create: (_) => Itembutton2(),
                child: Devicebutton(
                  activeColor: Colors.pinkAccent,
                  value: deviceButton.device,
                  onChanged: (value) {
                    deviceButton.deviceconnect(value);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget tvConnection(String itemTV) {
    return Builder(builder: (context) {
      final tvButton = Provider.of<Itembutton2>(context, listen: true);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width / 5.5,
            height: MediaQuery.sizeOf(context).height / 8.5,
            // color: Colors.green,
            decoration: BoxDecoration(
                // color: Colors.grey,
                color: tvButton.tv == false
                    ? Colors.black
                    : Colors.blueGrey.shade50.withOpacity(0.3),
                // : Colors.blueGrey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(boxradius))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.tv,
                    size: 32,
                    color: tvButton.tv == false ? Colors.white : Colors.black),
                Text(
                  "2",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: tvButton.tv == false
                        ? Colors.white
                        : Colors.blueGrey.shade50,
                  ),
                )
              ],
            ),
          ),
          Container(
            // color: Colors.green,
            alignment: Alignment.centerLeft,
            width: MediaQuery.sizeOf(context).width / 2.2,
            height: MediaQuery.sizeOf(context).height / 8.5,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      tvButton.tv == false ? "Connected" : "Not Connected",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(itemTV,
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 50,
                ),
                tvButton.tv == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                // color: Colors.grey,
                                color: Colors.blueGrey.shade100,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Bedroom",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                // color: Colors.grey,
                                color: Colors.blueGrey.shade100,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Livingroom",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width / 7,
            height: MediaQuery.sizeOf(context).height / 8.5,
            child: Align(
              alignment: Alignment.centerRight,
              child: ChangeNotifierProvider(
                create: (_) => Itembutton2(),
                child: Builder(builder: (context) {
                  return CustomSwitch(
                    activeColor: Colors.pinkAccent,
                    value: tvButton.tv,
                    onChanged: (bool tv) {
                      tvButton.tvbutton(tv);
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget acConnection(String itemAC) {
    return Builder(builder: (context) {
      final acButton1 = Provider.of<Itembutton2>(context, listen: true);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width / 5.5,
            height: MediaQuery.sizeOf(context).height / 8.5,
            // color: Colors.green,
            decoration: BoxDecoration(
                // color: Colors.grey,
                color: acButton1.ac == false
                    ? Colors.black
                    : Colors.blueGrey.shade50.withOpacity(0.3),
                // : Colors.blueGrey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(boxradius))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('img/ac1.png',
                    fit: BoxFit.fitHeight,
                    color: acButton1.ac == false ? Colors.white : Colors.black),
                Text(
                  "2",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: acButton1.ac == false
                        ? Colors.white
                        : Colors.blueGrey.shade50,
                  ),
                )
              ],
            ),
          ),
          Container(
            // color: Colors.green,
            alignment: Alignment.centerLeft,
            width: MediaQuery.sizeOf(context).width / 2.2,
            height: MediaQuery.sizeOf(context).height / 8.5,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      acButton1.ac == false ? "Connected" : "Not Connected",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(itemAC,
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 50,
                ),
                acButton1.ac == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                // color: Colors.grey,
                                color: Colors.blueGrey.shade100,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Bedroom",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                // color: Colors.grey,
                                color: Colors.blueGrey.shade100,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Livingroom",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width / 7,
            height: MediaQuery.sizeOf(context).height / 8.5,
            child: Align(
              alignment: Alignment.centerRight,
              child: ChangeNotifierProvider(
                create: (_) => Itembutton2(),
                child: Builder(builder: (context) {
                  return CustomSwitch(
                    activeColor: Colors.pinkAccent,
                    value: acButton1.ac,
                    onChanged: (bool ac) {
                      acButton1.acbutton(ac);
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget lightConnection(String itemLight) {
    return Builder(builder: (context) {
      final lightbutton = Provider.of<Itembutton2>(context, listen: true);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width / 5.5,
            height: MediaQuery.sizeOf(context).height / 8.5,
            // color: Colors.green,
            decoration: BoxDecoration(
                // color: Colors.grey,
                color: lightbutton.light == false
                    ? Colors.black
                    : Colors.blueGrey.shade50.withOpacity(0.3),
                // : Colors.blueGrey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(boxradius))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_outlined,
                    size: 32,
                    color: lightbutton.light == false
                        ? Colors.white
                        : Colors.black),
                Text(
                  "2",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: lightbutton.light == false
                        ? Colors.white
                        : Colors.blueGrey.shade50,
                  ),
                )
              ],
            ),
          ),
          Container(
            // color: Colors.green,
            alignment: Alignment.centerLeft,
            width: MediaQuery.sizeOf(context).width / 2.2,
            height: MediaQuery.sizeOf(context).height / 8.5,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      lightbutton.light == false
                          ? "Connected"
                          : "Not Connected",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(itemLight,
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 50,
                ),
                lightbutton.light == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                // color: Colors.grey,
                                color: Colors.blueGrey.shade100,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Bedroom",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                // color: Colors.grey,
                                color: Colors.blueGrey.shade100,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Livingroom",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width / 7,
            height: MediaQuery.sizeOf(context).height / 8.5,
            child: Align(
              alignment: Alignment.centerRight,
              child: ChangeNotifierProvider(
                create: (_) => Itembutton2(),
                child: Builder(builder: (context) {
                  return CustomSwitch(
                    activeColor: Colors.pinkAccent,
                    value: lightbutton.light,
                    onChanged: (bool light) {
                      lightbutton.lightbutton(light);
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget fanConnection(String itemFAN) {
    return Builder(builder: (context) {
      final fanButton1 = Provider.of<Itembutton2>(context, listen: true);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width / 5.5,
            height: MediaQuery.sizeOf(context).height / 8.5,
            // color: Colors.green,
            decoration: BoxDecoration(
                // color: Colors.grey,
                color: fanButton1.fan == false
                    ? Colors.black
                    : Colors.blueGrey.shade50.withOpacity(0.3),
                // : Colors.blueGrey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(boxradius))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('img/fan.png',
                    fit: BoxFit.fitHeight,
                    color:
                        fanButton1.fan == false ? Colors.white : Colors.black),
                Text(
                  "2",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: fanButton1.fan == false
                        ? Colors.white
                        : Colors.blueGrey.shade50,
                  ),
                )
              ],
            ),
          ),
          Container(
            // color: Colors.green,
            alignment: Alignment.centerLeft,
            width: MediaQuery.sizeOf(context).width / 2.2,
            height: MediaQuery.sizeOf(context).height / 8.5,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                      fanButton1.fan == false ? "Connected" : "Not Connected",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(itemFAN,
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 50,
                ),
                fanButton1.fan == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                // color: Colors.grey,
                                color: Colors.blueGrey.shade100,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Bedroom",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                // color: Colors.grey,
                                color: Colors.blueGrey.shade100,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Livingroom",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          Container(
            // color: Colors.blue,
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width / 7,
            height: MediaQuery.sizeOf(context).height / 8.5,
            child: Align(
              alignment: Alignment.centerRight,
              child: ChangeNotifierProvider(
                create: (_) => Itembutton2(),
                child: Builder(builder: (context) {
                  return CustomSwitch(
                    activeColor: Colors.pinkAccent,
                    value: fanButton1.fan,
                    onChanged: (bool fan) {
                      fanButton1.fanbutton(fan);
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      );
    });
  }
}
