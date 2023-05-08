import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyDescriptionCard extends StatefulWidget {
  final Map<String, dynamic> company;
  const CompanyDescriptionCard({required this.company, super.key});

  @override
  State<CompanyDescriptionCard> createState() => _CompanyDescriptionCardState();
}

class _CompanyDescriptionCardState extends State<CompanyDescriptionCard> {
  @override
  Widget build(BuildContext context) {
    TargetPlatform platform = Theme.of(context).platform;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color(0xFFD9D9D9),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            widget.company['company_name'],
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            widget.company['description'].length > 100
                ? '${widget.company['description'].substring(0, widget.company['description'].length ~/ 2)}...'
                : widget.company['description'],
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
        trailing: const Icon(
          Icons.notifications,
        ),
        onLongPress: () {
          platform == TargetPlatform.iOS
              ? showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    content: Text(
                      widget.company['description'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                )
              : showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    content: Text(
                      widget.company['description'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
