import 'package:flutter/material.dart';

class BottomNaviBar extends StatefulWidget {
  @override
  _BottomNaviBarState createState() => _BottomNaviBarState();
}

int _selectedIndex = 0;

class _BottomNaviBarState extends State<BottomNaviBar> {
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      if (_selectedIndex == 0) {
        Navigator.of(context).pushNamed('/tela_inicial');
      } else if (_selectedIndex == 1) {
        Navigator.of(context).pushNamed('/nova_venda');
      } else if (_selectedIndex == 2) {
        Navigator.of(context).pushNamed('/estoque');
      } else if (_selectedIndex == 3) {
        Navigator.of(context).pushNamed('/listsales');
      }
    }

    return BottomNavigationBar(
      showUnselectedLabels: true,
      iconSize: 30,
      backgroundColor: Colors.orange,
      unselectedItemColor: Color(0xff373435),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'Nova venda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store_mall_directory_outlined),
          label: 'Estoque',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Vendas',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xff4360F6),
      onTap: _onItemTapped,
    );
  }
}
