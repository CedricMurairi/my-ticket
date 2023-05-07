import 'package:flutter/material.dart';

import '../../shared/form_field.dart';
import '../../shared/rounded_styled_button.dart';

class PaymentForm extends StatefulWidget {
  final double ticketPrice;
  const PaymentForm({required this.ticketPrice, super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  bool saveForLater = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25.0, bottom: 20),
            child: Text(
              "Payment",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: 150,
                  height: 100,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/mtn.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: 150,
                  height: 100,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/airtel.png"),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Coming soon:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Image.asset("assets/images/visa.png"),
                    Image.asset("assets/images/mastercard.png"),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 20.0,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1),
            child: Form(
              child: Column(
                children: [
                  CustomFormField(
                    controller: phoneNumberController,
                    hint: "Phone Number",
                    keyboard: TextInputType.phone,
                    prefix: "+250",
                  ),
                  CustomFormField(
                    hint: "${widget.ticketPrice}RWF",
                    controller: amountController,
                    keyboard: TextInputType.number,
                    enabled: false,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Row(
              children: [
                StatefulBuilder(
                  builder: ((context, setState) => Checkbox(
                        key: const Key("saveForLater"),
                        value: saveForLater,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        onChanged: (bool? value) => {
                          setState(
                            () {
                              saveForLater = value!;
                            },
                          ),
                        },
                      )),
                ),
                const Text(
                  "Save number for later",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedStyledButton(
                action: () {},
                color: const Color.fromRGBO(217, 231, 203, 1),
                child: const Text(
                  "Pay Now",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}