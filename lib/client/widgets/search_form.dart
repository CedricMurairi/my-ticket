import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ticket/models/tickets.dart';
import 'package:my_ticket/shared/form_field.dart';
import 'package:my_ticket/shared/text_button.dart';
import 'package:provider/provider.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final TextEditingController fromLocation = TextEditingController();
  final TextEditingController toLocation = TextEditingController();
  final TextEditingController dateOfDeparture = TextEditingController();
  final TextEditingController timeOfDeparture = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TargetPlatform platform = Theme.of(context).platform;
    final tickets = Provider.of<TicketModel>(context, listen: false);

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.23,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      child: CustomFormField(
                          controller: fromLocation,
                          hint: "From",
                          keyboard: TextInputType.text),
                    ),
                    Flexible(
                      child: CustomFormField(
                          controller: toLocation,
                          hint: "To",
                          keyboard: TextInputType.text),
                    ),
                  ],
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5),
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          controller: dateOfDeparture,
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                            hintText: "Date of Departure",
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 25),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                          ),
                          onTap: () async {
                            platform == TargetPlatform.iOS
                                ? showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        child: CupertinoDatePicker(
                                          initialDateTime: DateTime.now(),
                                          onDateTimeChanged: (DateTime value) {
                                            setState(() {
                                              dateOfDeparture.text = value
                                                  .toString()
                                                  .substring(0, 10);
                                            });
                                          },
                                          minimumYear: 2020,
                                          maximumYear: 2050,
                                          mode: CupertinoDatePickerMode.date,
                                        ),
                                      );
                                    })
                                : showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime(2050))
                                    .then(
                                    (value) {
                                      if (value != null) {
                                        setState(
                                          () {
                                            dateOfDeparture.text = value
                                                .toString()
                                                .substring(0, 10);
                                          },
                                        );
                                      }
                                    },
                                  );
                          },
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5),
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          controller: timeOfDeparture,
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                            hintText: "Time of Departure",
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 25),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                          ),
                          onTap: () {
                            platform == TargetPlatform.iOS
                                ? showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        child: CupertinoDatePicker(
                                          initialDateTime: DateTime.now(),
                                          onDateTimeChanged: (DateTime value) {
                                            setState(() {
                                              timeOfDeparture.text = value
                                                  .toString()
                                                  .substring(11, 16);
                                            });
                                          },
                                          minimumYear: 2020,
                                          maximumYear: 2050,
                                          mode: CupertinoDatePickerMode.time,
                                        ),
                                      );
                                    })
                                : showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      setState(() {
                                        timeOfDeparture.text =
                                            value.format(context).toString();
                                      });
                                    }
                                  });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                CustomTextButton(
                  text: "Search",
                  customFontSize: 18,
                  action: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, String> queries = {
                        "from": fromLocation.value.text,
                        "to": toLocation.value.text,
                        "date_of_departure": dateOfDeparture.value.text,
                        "time_of_departure": timeOfDeparture.value.text,
                      };
                      tickets.searching == false
                          ? tickets.searchTickets(queries)
                          : null;
                    }
                    _formKey.currentState!.reset();
                    fromLocation.clear();
                    toLocation.clear();
                    dateOfDeparture.clear();
                    timeOfDeparture.clear();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
