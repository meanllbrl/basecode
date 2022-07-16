import 'package:basecodev2/providers/provider_data.dart';
import 'package:basecodev2/screens/panels/initial_panel.dart';
import 'package:basecodev2/services/app_localization.dart';
import 'package:basecodev2/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

/*
?????MEANSOFT BASE CODE?????
!THIS CODE FOR CREATING NEW PROJECTS WITH SOME PREDESIGNED SPESIFICATIONS...
  * LOCAL NOTIFICATION (DELETE //fl's - SETUPS )
  * PROVIDER - hazır (ProviderData.provide)
  * MEAN LIB - (meanlib kütüphanesindeki tüm kullanımlar)
  * LOCALIZATION - eklendi test edilmeli
  * THEME PROVIDER - eklendi style eklemeleri de yapıldı
  * TYPOGRAPHY - COLORIZATION - SIZING - CONSTANT CLASSES
  * PANEL VIEW FODLERS
*/

//LOCAL NOTIFICATION
//flfinal FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//fl  await flutterLocalNotificationsPlugin.initialize(
//fl      LocalNotificationHandler.init(), onSelectNotification: (String? payload) {
//fl    if (payload!.isNotEmpty) debugPrint("");
//fl    throw Exception("");
//fl  });
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => ProviderData()))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeService(
      child: Builder(
          builder: (themeContext) => MaterialApp(
                theme: ThemeProvider.themeOf(themeContext).data,
                title: "Meansoft",
                debugShowCheckedModeBanner: false,
                //lOCAL START
                localizationsDelegates: AppLocalizations
                    .localizationDelegates(),
                supportedLocales: AppLocalizations
                    .supportedLocales(),
                localeResolutionCallback: (locale, supportedLocales) =>
                    AppLocalizations.localeResolutionCallback(
                        locale, supportedLocales),
                //LOCAL END

                initialRoute: InitialPanel.id, //Rotanın temel sayfası eklenebilir
                routes: {
                  InitialPanel.id:(context) => const InitialPanel()
                }, //rotalar burada belirlenebilir.
              )),
    );
  }
}
