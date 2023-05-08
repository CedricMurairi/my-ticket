import 'package:flutter/material.dart';

class ProfileSettingsCard extends StatefulWidget {
  final Widget title;
  final Widget subtitle;
  final Widget trailing;
  const ProfileSettingsCard({
    required this.title,
    required this.subtitle,
    this.trailing = const Text(''),
    super.key,
  });

  @override
  State<ProfileSettingsCard> createState() => _ProfileSettingsCardState();
}

class _ProfileSettingsCardState extends State<ProfileSettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: 1,
          color: Color(0xFFD9D9D9),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ListTile(
        title: widget.title,
        subtitle: widget.subtitle,
        trailing: widget.trailing,
        onTap: () {},
      ),
    );
  }
}
