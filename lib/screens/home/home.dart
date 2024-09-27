import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/services/database.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>.value(
      initialData: const [],
      value: DatabaseService().brews,
      catchError: (context, error) {
        return [];
      },
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          ],
        ),
        body: Consumer<List<Brew>?>(builder: (context, brews, child) {
          if (brews == null || brews.isEmpty) {
            return const LoadingScreen();
          }
          return BrewList(
            brews: brews,
          );
        }),
      ),
    );
  }
}
