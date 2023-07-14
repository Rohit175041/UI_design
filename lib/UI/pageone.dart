import 'package:data_analysis/UI/provider/providerone.dart';
import 'package:data_analysis/UI/switchbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    final itembutton = Provider.of<Itembutton>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height / 1.1,
            width: MediaQuery.sizeOf(context).width / 1.15,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Box1(),
                Box2(),
                Box3(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      height: MediaQuery.sizeOf(context).height / 4,
                      // color: Colors.green,
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                          color: itembutton.light == false
                              ? Colors.black
                              : Colors.blueGrey.shade100.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 25.0, left: 15, bottom: 30),
                              child: Icon(Icons.light_outlined,
                                  size: 32,
                                  color:
                                  itembutton.light == false ? Colors.white : Colors.black),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 15, right: 8),
                                child: Text(
                                  "Smart\nLight",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: itembutton.light == false
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25.0, left: 8, right: 10),
                                  child: RotationTransition(
                                    turns:
                                        const AlwaysStoppedAnimation(270 / 360),
                                    child: ChangeNotifierProvider(
                                      create: (_) => Itembutton(),
                                      child: Builder(builder: (context) {
                                        return CustomSwitch(
                                          activeColor: Colors.pinkAccent,
                                          value: itembutton.light,
                                          onChanged: (bool value) {
                                            itembutton.lightbutton(value);
                                          },
                                        );
                                      }),
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      height: MediaQuery.sizeOf(context).height / 4,
                      // color: Colors.green,
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                          color: itembutton.ac == false
                              ? Colors.black
                              : Colors.blueGrey.shade100.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 25.0, left: 15, bottom: 30),
                              child: Image.asset('img/ac1.png',
                                  fit: BoxFit.fitHeight,
                                  color: itembutton.ac == false
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 15, right: 8),
                                child: Text(
                                  "Smart\nAC",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: itembutton.ac == false
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25.0, left: 8, right: 10),
                                  child: RotationTransition(
                                    turns:
                                        const AlwaysStoppedAnimation(270 / 360),
                                    child: ChangeNotifierProvider(
                                      create: (_) => Itembutton(),
                                      child: Builder(builder: (context) {
                                        return CustomSwitch(
                                          activeColor: Colors.pinkAccent,
                                          value: itembutton.ac,
                                          onChanged: (bool value) {
                                            itembutton.acbutton(value);
                                          },
                                        );
                                      }),
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  // height: 20,
                  height: MediaQuery.sizeOf(context).height / 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      height: MediaQuery.sizeOf(context).height / 4,
                      // color: Colors.green,
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                          color: itembutton.tv == false
                              ? Colors.black
                              : Colors.blueGrey.shade100.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 25.0, left: 15, bottom: 30),
                              child: Icon(Icons.tv_rounded,
                                  size: 32,
                                  color: itembutton.tv == false
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 15, right: 8),
                                child: Text(
                                  "Smart\nTV",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: itembutton.tv == false
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25.0, left: 8, right: 10),
                                  child: RotationTransition(
                                    turns:
                                        const AlwaysStoppedAnimation(270 / 360),
                                    child: ChangeNotifierProvider(
                                      create: (_) => Itembutton(),
                                      child: Builder(builder: (context) {
                                        return CustomSwitch(
                                          activeColor: Colors.pinkAccent,
                                          value: itembutton.tv,
                                          onChanged: (bool value) {
                                            itembutton.tvbutton(value);
                                          },
                                        );
                                      }),
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      height: MediaQuery.sizeOf(context).height / 4,
                      // color: Colors.green,
                      decoration: BoxDecoration(
                          // color: Colors.grey,
                          color: itembutton.fan == false
                              ? Colors.black
                              : Colors.blueGrey.shade100.withOpacity(0.5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 25.0, left: 15, bottom: 30),
                              child: Image.asset('img/fan.png',
                                  fit: BoxFit.fitHeight,
                                  color: itembutton.fan == false
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 15, right: 8),
                                child: Text(
                                  "Smart\nFAN",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: itembutton.fan == false
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25.0, left: 8, right: 10),
                                  child: RotationTransition(
                                    turns:
                                        const AlwaysStoppedAnimation(270 / 360),
                                    child: ChangeNotifierProvider(
                                      create: (_) => Itembutton(),
                                      child: Builder(builder: (context) {
                                        return CustomSwitch(
                                          activeColor: Colors.pinkAccent,
                                          value: itembutton.fan,
                                          onChanged: (bool value) {
                                            itembutton.fanbutton(value);
                                          },
                                        );
                                      }),
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Box1() {
    return Container(
      alignment: Alignment.center,
      // color: Colors.green,
      height: MediaQuery.sizeOf(context).height / 15,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.add_box_outlined, size: 32),
          // Image.asset(
          //   'img/ac1.png',
          //   fit: BoxFit.fitHeight,
          // ),
          CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage(
                'https://th.bing.com/th/id/OIP.HLuY60jzx5puuKjbqmWRRwHaEK?pid=ImgDet&rs=1'),
          ),
        ],
      ),
    );
  }

  Widget Box2() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 0),
      child: Container(
        height: MediaQuery.sizeOf(context).height / 5,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('img/home.png'), fit: BoxFit.cover),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Welcome Home",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Garret Reynolds",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Box3() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 12,
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text("Smart Devices",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
//
// Icon(Icons.ac_unit,
// size: 32,
// color:
// ac_Button.ac == false ? Colors.white : Colors.black),
