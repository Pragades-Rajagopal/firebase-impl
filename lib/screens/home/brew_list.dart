import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';

class BrewList extends StatefulWidget {
  final List<Brew> brews;
  const BrewList({
    super.key,
    required this.brews,
  });

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: widget.brews[index]);
      },
    );
  }
}
