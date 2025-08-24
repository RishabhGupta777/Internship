import 'package:challenge1/E-comm/controller/auth_controller.dart';
import 'package:challenge1/E-comm/controller/internet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/no_internet_box.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {


  @override
  void initState() {
    super.initState();
    context.read<InternetProvider>().checkConnection();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<InternetProvider>(
      builder: (context, provider, _) {
        if (provider.isOnline == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (provider.isOnline == false) {
          return Scaffold(
            body: NoInternetBox(provider),
          );
        }

        return Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () {
                AuthController.instance.logout();
              },
              child: const Text("Logout"),
            ),
          ),
        );
      },
    );
  }
}
