import 'package:flag/flag.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/controllers/SharePreferencesController.dart';
import 'package:portfolio/models/languageModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/view/main.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  late List<LanguageModel> languageModels;
  SharePreferencesController spController = SharePreferencesController();
  String selectLanguage = "fa";

  @override
  void initState() {
    super.initState();
    spController.getLanguage().then((lang) {
      setState(() {
        selectLanguage = lang;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    languageModels = [
      LanguageModel(
          title: AppLocalizations.of(context)!.english,
          icon: "usa",
          type: "en"),
      LanguageModel(
          title: AppLocalizations.of(context)!.persian,
          icon: "iran",
          type: "fa"),
    ];
    return DropdownButton<String>(
      underline: Container(),
      borderRadius: BorderRadius.circular(19),
      dropdownColor: ColorApp().PrimaryColor,
      icon: Icon(
        Icons.language,
        color: ColorApp().whiteColor,
      ),
      items: languageModels.map((LanguageModel model) {
        return DropdownMenuItem<String>(
          value: model.type,
          child: Container(
            child: bodyLanguage(model),
          ),
        );
      }).toList(),
      value: selectLanguage,
      onChanged: (valChange) {
        print("DropdownButton change : ${valChange}");
        if (valChange != null) {
          spController.setLanguage(valChange!);
          MyApp.setLocal(context, Locale(valChange!));
        }
      },
    );
  }

  bodyLanguage(LanguageModel model) => Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Image.asset(
              model.getPath(),
              height: 24,
              width: 24,
            ),
          ),
          Text(
            model.title,
            style: TextStyle(color: ColorApp().whiteColor),
          ),
        ],
      );
}
