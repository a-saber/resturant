import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:restaurant/core/core_widgets/default_buttons/default_empty_button.dart';
import 'package:restaurant/core/core_widgets/default_buttons/default_filled_button.dart';
import 'package:restaurant/core/core_widgets/default_form/default_from.dart';
import 'package:restaurant/core/local_database/cache_data.dart';
import 'package:restaurant/core/localization/app_localization.dart';
import 'package:restaurant/core/resources_manager/constants_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal(); // singleton
  factory MyApp() => _instance; // factory

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: ConstantsManager.appTitle,
        theme: ThemeData(
          fontFamily: ConstantsManager.fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        locale: Locale(CacheData.lang!),
        translations: AppLocalization(),
        home: const Test()
    );

  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            DefaultForm(text: 'الاسم', controller: TextEditingController()),
            SizedBox(height: 50,),
            DefaultForm(
              text: 'الاسم',
              controller: TextEditingController(),
              suffixIcon: Icon(Icons.remove_red_eye_outlined, color: Colors.red,),
            ),
            const SizedBox(height: 50,),
            DefaultFilledButton(text: 'حفظ', onPressed: (){},),
            const SizedBox(height: 50,),
            DefaultEmptyButton(text: 'الغاء', onPressed: (){},)
          ],
        ),
      ),
    );
  }
}
