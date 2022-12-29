import 'package:carousel_slider/carousel_slider.dart';
import "package:flutter/material.dart";
import 'package:medical/constants/constants.dart';
import 'package:medical/data/doctor_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          // backgroundColor: Colors.grey.shade100,
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                CarouselSlider(
                  items: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/images/doctor_online.jpg"),
                          )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/specialists.jpg"),
                          )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/images/doctor_online.jpg"),
                          )),
                    ),
                  ],
                  options: CarouselOptions(
                      viewportFraction: 0.5,
                      autoPlay: true,
                      height: 100,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      autoPlayCurve: Curves.easeInOut),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our Doctors",
                      style: DoctorNameStyles(),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.grey.shade200,
                        padding: const EdgeInsets.all(10.0),
                        elevation: 1,
                      ),
                      child: const Text("See All"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: doctors.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            tileColor: Colors.blue,
                            leading: Container(
                              height: 200,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(doctors[index].img))),
                            ),
                            title: Text(
                              doctors[index].name,
                              style: DoctorNameStyles(),
                            ),
                            subtitle: Text(
                              doctors[index].title,
                              style: DoctorTitleStyle(),
                            ),
                            trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: const BorderSide(
                                    color: Colors.white,
                                  )
                                )
                              ),
                              child: const Text("Book"),
                              onPressed: () {},
                            ),
                          ),
                  
                          const Divider()
                        ],
                      );
                  
                    },
                  ),
                )
              ],
            ),
          ),

          endDrawer: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    radius: 20,
                    child: ClipOval(
                        child: Image.asset("assets/images/user_avatar.png")),
                  ),
                  accountName: const Text("Kamarudeen Yakubu"),
                  accountEmail: const Text("kamarudeenyakubu@gmail.com"),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    size: 25,
                  ),
                  title: const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {},
                ),

                const Divider(),

                ListTile(
                  leading: const Icon(
                    Icons.book_sharp,
                    size: 25,
                  ),
                  title: const Text(
                    "Appointments",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {},
                ),

                const Divider(),

                ListTile(
                  leading: const Icon(
                    Icons.chat_sharp,
                    size: 25,
                  ),
                  title: const Text(
                    "Messages",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {},
                ),

                const Divider(),

                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    size: 25,
                  ),
                  title: const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {},
                ),

                const Divider(),

                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    size: 25,
                  ),
                  title: const Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {},
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
