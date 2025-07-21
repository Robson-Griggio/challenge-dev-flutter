import 'package:challenge_dev_flutter/ui/core/ui/default_app_bar.dart';
import 'package:challenge_dev_flutter/ui/core/ui/default_navigation_bar.dart';
import 'package:challenge_dev_flutter/ui/home_page/view_model/home_page_view_model.dart';
import 'package:challenge_dev_flutter/ui/home_page/widgets/student_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageScreen extends StatelessWidget {
  final HomePageViewModel viewModel;
  const HomePageScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final studentsCommand = viewModel.getAllStudentsCommand;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: DefaultAppBar(title: 'Alunos'),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 1.5),
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16.0,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                  size: 20.0,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 14.0,
                ),
              ),
              style: TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
          ),
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
                        onEdit: () => context.push(
                          Uri(
                            path: '/student/edit',
                            queryParameters: {'id': student.id},
                          ).toString(),
                        ),
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
        onPressed: () => context.push('/student/add'),
        backgroundColor: Color(0xFF2E7D8A),
        icon: Icon(Icons.add, color: Colors.white),
        label: Text('Adicionar aluno', style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: DefaultNavigationbar(),
    );
  }
}
