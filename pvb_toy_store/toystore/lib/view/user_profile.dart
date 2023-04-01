// ignore_for_file: unnecessary_import, import_of_legacy_library_into_null_safe, sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kenburns/kenburns.dart';
import 'package:pvb_toy_app/model/user.dart';
import 'package:pvb_toy_app/network/user.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: use_key_in_widget_constructors
class UserProfile extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _UserProfile createState() => _UserProfile();
}

class _UserProfile extends State<UserProfile> {
  dynamic token;
  @override
  // ignore: must_call_super
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    getToken();
  }

  void getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      token = pref.getString('token');
    });
  }

  final _fetchUser = FutureProvider.family<myUser, dynamic>((ref, token) async {
    var result = await fetchUser(token);
    return result;
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      var userProfileApiResult = ref.watch(_fetchUser(token));

      // ignore: prefer_const_constructors
      return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(0xFF0C1B37),
          body: userProfileApiResult.when(
            data: (userResponse) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    ShapeOfView(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 7 * 4,
                      shape: DiagonalShape(
                          position: DiagonalPosition.Bottom,
                          direction: DiagonalDirection.Left,
                          angle: DiagonalAngle.deg(angle: 10)),
                      // ignore: missing_required_param
                      child: KenBurns(
                        minAnimationDuration: const Duration(seconds: 2),
                        maxAnimationDuration: const Duration(seconds: 10),
                        maxScale: 1.1,
                        child: Image.network(
                          'https://www.metalbridges.com/wp-content/uploads/2017/09/Kamen-Rider-Climax-Fighters-news-11.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                // ignore: prefer_const_constructors
                                icon: Icon(
                                  Icons.navigate_before,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                onPressed: (() {
                                  Navigator.of(context).pushNamed('/home');
                                }))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                              // children: [
                              //   // ignore: prefer_const_constructors
                              //   SizedBox(
                              //     height: 10,
                              //   ),
                              //   Row(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     children: [
                              //       Text('${userResponse.email}',
                              //           style: GoogleFonts.montserrat(
                              //               color: Colors.white, fontSize: 20)),
                              //       Text('${userResponse.phone}',
                              //           style: GoogleFonts.montserrat(
                              //               color: Colors.white, fontSize: 20))
                              //     ],
                              //   )
                              // ],
                              ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height / 7 * 3.2,
                          ),
                          // ignore: sized_box_for_whitespace
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: CircleAvatar(
                                    backgroundImage: NetworkImage(userResponse
                                        .profilePicture
                                        .toString())),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/orders');
                                      },
                                      icon: const Icon(
                                        Icons.list_alt,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    'Orders',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${userResponse.email}',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '${userResponse.firstName} ${userResponse.lastName}',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${userResponse.phone}',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white, fontSize: 20)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  '${userResponse.address}',
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white, fontSize: 20),
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            error: (error, stack) => Center(
              child: Text(
                '$error',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            loading: (() => const Center(
                  child: CircularProgressIndicator(),
                )),
          ));
    }));
  }
}
