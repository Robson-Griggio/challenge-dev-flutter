import 'package:flutter/material.dart';

class DefaultNavigationbar extends StatelessWidget {
  const DefaultNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {},
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF2E7D8A),
      unselectedItemColor: Colors.grey[600],
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        BottomNavigationBarItem(icon: Icon(Icons.help_outline), label: 'Ajuda'),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined),
          label: 'Notificações',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Perfil',
        ),
      ],
    );
  }
}
