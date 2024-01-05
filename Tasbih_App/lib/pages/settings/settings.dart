import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const Map<String, String> languageMap = {
  'en': 'English',
  'ru': 'Русский',
  'es': 'Español',
};

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final myData = setupRemoteConfig();

    final locales = EasyLocalization.of(context)?.supportedLocales ??
        const [
          Locale('en'),
          Locale('ru'),
          Locale('es'),
        ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'.tr()),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Settings Page'),
            TextButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Перейти еще раз на глвную'),
            ),
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Назад'),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Material(
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text(
                      'Language'.tr(),
                    ),
                    leading: const Icon(
                      CupertinoIcons.globe,
                      color: Colors.black,
                    ),
                    trailing: FilledButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: Text(
                        languageMap[context.locale.languageCode] ??
                            context.locale.languageCode,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Icon(Icons.language),
                                ),
                                SizedBox(
                                  height: 200,
                                  child: ListView(
                                    children: locales.map((Locale locale) {
                                      return ListTile(
                                        title: Column(
                                          children: [
                                            Text(languageMap[
                                                    locale.languageCode] ??
                                                locale.languageCode),
                                            const Divider(),
                                          ],
                                        ),
                                        onTap: () {
                                          EasyLocalization.of(context)
                                              ?.setLocale(locale);

                                          Navigator.pop(context);
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: myData,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CupertinoActivityIndicator());
                } else {
                  if (snapshot.data != null) {
                    return Text(snapshot.data!.getString('MyString'));
                  } else {
                    return const Center(child: CupertinoActivityIndicator());
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<FirebaseRemoteConfig> setupRemoteConfig() async {
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  await remoteConfig.fetchAndActivate();
  return remoteConfig;
}
