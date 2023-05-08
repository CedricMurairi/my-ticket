import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ticket/client/layout/main_layout.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../shared/text_button.dart';
import '../widgets/profile_settings_card.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    TargetPlatform platform = Theme.of(context).platform;
    final user = Provider.of<UserModel>(context);
    // final location =
    //     Provider.of<LocationModel>(context, listen: false).userLocation;

    return MainLayout(
      child: Container(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
              child: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                children: [
                  const ProfileSettingsCard(
                    title: Text("Language"),
                    subtitle: Text("English (United States)"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 160, 160, 160),
                    ),
                  ),
                  StatefulBuilder(
                    builder: (BuildContext context, setState) =>
                        ProfileSettingsCard(
                            title: const Text("Notifications"),
                            subtitle: Text(user.notify == true ? "On" : "Off"),
                            trailing: platform == TargetPlatform.iOS
                                ? CupertinoSwitch(
                                    activeColor: const Color.fromARGB(
                                        255, 160, 160, 160),
                                    value: isSwitched,
                                    onChanged: (value) {
                                      setState(() {
                                        isSwitched = value;
                                      });
                                    },
                                  )
                                : Switch(
                                    activeColor: const Color.fromARGB(
                                        255, 160, 160, 160),
                                    value: user.notify ?? false,
                                    onChanged: (value) {
                                      setState(() {
                                        user.setNotify(value);
                                      });
                                    },
                                  )),
                  ),
                  const ProfileSettingsCard(
                    title: Text("Privacy & Security"),
                    subtitle: Text("To Release Soon"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 160, 160, 160),
                    ),
                  ),
                  const ProfileSettingsCard(
                    title: Text("About Itike"),
                    subtitle: Text("Made With Flutter By Cédric Murairi"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
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
                        text: "Delete Account",
                        action: () {},
                        customFontSize: 18,
                        color: const Color.fromARGB(255, 158, 22, 13),
                        alignment: Alignment.topLeft,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
