import 'package:core/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:movies/presentation/pages/watchlist_movie_page.dart';
import 'package:tv/presentation/pages/watchlist_tv_page.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  int bottomNavIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.movie),
      label: "Movies",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.tv_rounded),
      label: "TV Series",
    ),
  ];

  final List<Widget> _listWidget = [
    const WatchlistMoviesPage(),
    const WatchlistTVPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
      ),
      body: _listWidget[bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kMikadoYellow,
        items: _bottomNavBarItems,
        currentIndex: bottomNavIndex,
        onTap: (selected) => setState(() => bottomNavIndex = selected),
      ),
    );
  }
}
