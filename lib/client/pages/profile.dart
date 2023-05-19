import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';
import 'package:my_ticket/client/widgets/profile_settings_card.dart';
import 'package:my_ticket/shared/text_button.dart';
import 'package:provider/provider.dart';

import 'package:my_ticket/models/location.dart';
import 'package:my_ticket/models/user.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final location = Provider.of<LocationModel>(context);

    return MainLayout(
      child: Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Consumer<UserModel>(
          builder: (context, user, _) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.width * 0.25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFD9E7CB),
                      Color(0xFFFFDCC1),
                      Color(0xFFFFE088),
                      Color(0xFFD9D9D9)
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.23,
                  height: MediaQuery.of(context).size.width * 0.23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: user.user?.photoURL != null
                        ? DecorationImage(
                            image: NetworkImage(
                              user.user?.photoURL ?? '',
                            ),
                            fit: BoxFit.cover)
                        : null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text(
                  user.user?.displayName ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                user.user?.email ?? '',
                style: const TextStyle(fontSize: 15),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    ProfileSettingsCard(
                      title: const Text("Location"),
                      subtitle: location.userLocation != null
                          ? Text(location.userLocation!.isNotEmpty
                              ? "${location.userLocation![0].street ?? ''} | ${location.userLocation![0].country ?? ''}"
                              : "")
                          : const Text(""),
                    ),
                    ProfileSettingsCard(
                      title: const Text("Phone Number"),
                      subtitle: Text(
                        user.user?.phoneNumber?.isEmpty ?? true
                            ? "Add your phone number"
                            : user.user?.phoneNumber ?? '',
                      ),
                      trailing: const Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 160, 160, 160),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: CustomTextButton(
                          text: "Log Out",
                          action: () {
                            FirebaseAuth.instance.signOut().then(
                                  (value) => {
                                    user.getUser().then((value) {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/login', (route) => false);
                                    })
                                  },
                                );
                          },
                          customFontSize: 18,
                          alignment: Alignment.topLeft,
                          color: const Color.fromARGB(255, 160, 160, 160),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
