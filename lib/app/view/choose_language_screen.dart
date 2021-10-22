import 'package:flutter/material.dart';
import 'package:netspot/app/components/button_primary_component.dart';
import 'package:netspot/app/components/footer_component.dart';
import 'package:netspot/app/components/icon_component.dart';
import 'package:netspot/languages/lables.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  final List<String> _langs = [
    "English",
    "Arabic",
    "Kurdish",
  ];
  String? _selectedLang;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 121,
                      ),
                      Row(children: [
                        IconComponent(
                          size: 48,
                          fontSize: 21,
                        ),
                      ]),
                      SizedBox(
                        height: 145,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          labels['choose.a.language'] ?? '',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        labels['message.lorem'] ?? '',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Container(
                        width: double.infinity,
                        height: 65,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Theme.of(context).canvasColor,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            items: _langs
                                .map((value) => DropdownMenuItem(
                                      child: Text(value),
                                      value: value,
                                    ))
                                .toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _selectedLang = value;
                              });
                            },
                            isExpanded: false,
                            value: _selectedLang ?? _langs.first,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      ButtonPrimaryComponent(
                        child: Text(labels['btn.next'] ?? ''),
                        fontWeight: FontWeight.w700,
                        onPress: () {
                          Navigator.of(context).pushReplacementNamed('/signin');
                        },
                      ),
                    ],
                  ),
                ),
                FooterComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
