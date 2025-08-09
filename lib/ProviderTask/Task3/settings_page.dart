import 'package:challenge1/ProviderTask/Task3/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Consumer<ThemeProvider>(
        builder: (ctx, provider, _) {
          return SwitchListTile.adaptive(
            title: const Text("Dark Mode"),
            subtitle: const Text("Change theme mode here"),
            value: provider.getThemeValue(),
            onChanged: (value) {
              provider.updateTheme(value: value);
            },
          );
        },
      ),
    );
  }
}