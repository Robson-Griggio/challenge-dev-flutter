import 'package:challenge_dev_flutter/ui/home_page/view_model/home_page_view_model.dart';
import 'package:challenge_dev_flutter/ui/home_page/widgets/student_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePageScreen extends StatelessWidget {
  final HomePageViewModel viewModel;
  const HomePageScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final studentsCommand = viewModel.getAllStudentsCommand;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF2E7D8A),
        elevation: 0,
        title: Text(
          'Alunos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListenableBuilder(
              listenable: studentsCommand,
              builder: (context, child) {
                if (studentsCommand.running) {
                  return Center(child: CircularProgressIndicator());
                } else if (studentsCommand.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Erro: Falha ao carregar lista de alunos'),
                        IconButton(
                          onPressed: () => viewModel.reloadAllStudents,
                          icon: Icon(Icons.replay_outlined),
                        ),
                      ],
                    ),
                  );
                } else if (studentsCommand.data == null ||
                    studentsCommand.data!.isEmpty) {
                  return Center(child: Text('Nenhum aluno encontrado.'));
                }

                final students = studentsCommand.data!;
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: StudentCard(
                        student: student,
                        onEdit: () => print('ID: ${student.id}'),
                        onDelete: () => print('ID: ${student.id}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => print('add student'),
        backgroundColor: Color(0xFF2E7D8A),
        icon: Icon(Icons.add, color: Colors.white),
        label: Text('Adicionar aluno', style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF2E7D8A),
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Ajuda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notificações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
