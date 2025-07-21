import 'package:challenge_dev_flutter/ui/core/ui/default_app_bar.dart';
import 'package:challenge_dev_flutter/ui/core/ui/default_navigation_bar.dart';
import 'package:challenge_dev_flutter/ui/student_form_page/view_model/student_form_view_model.dart';
import 'package:challenge_dev_flutter/ui/student_form_page/widgets/cpf_form_field.dart';
import 'package:challenge_dev_flutter/ui/student_form_page/widgets/date_picker_form_field.dart';
import 'package:challenge_dev_flutter/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentFormScreen extends StatelessWidget {
  final StudentFormViewModel viewModel;
  const StudentFormScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E7D8A),
      appBar: DefaultAppBar(title: 'Adicionar Aluno'),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dados gerais',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome do Aluno*',
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um nome.';
                    }
                    return null;
                  },
                  onSaved: (newValue) => viewModel.name = newValue,
                ),
                const SizedBox(height: 16),
                DatePickerFormField(
                  onSaved: (newValue) => viewModel.birthdate = newValue,
                ),
                const SizedBox(height: 16),
                CpfFormField(onSaved: (newValue) => viewModel.cpf = newValue),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Registro acadêmico*',
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o registro acadêmico.';
                    }
                    return null;
                  },
                  onSaved: (newValue) => viewModel.academicRecord = newValue,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Dados de acesso',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-mail*',
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    final emailRegex = RegExp(
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
                    );

                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um e-mail.';
                    }

                    if (!emailRegex.hasMatch(value)) {
                      return 'Formato de e-mail inválido.';
                    }
                    return null;
                  },
                  onSaved: (newValue) => viewModel.email = newValue,
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () => viewModel.submitForm(
                      () => DialogUtils.showSuccessDialog(
                        context,
                        'Aluno adicionado',
                        'O aluno foi adicionado com sucesso!',
                      ),
                      () => DialogUtils.showFailureDialog(
                        context,
                        'Erro',
                        'Não foi possível adicionar aluno',
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D8A),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Adicionar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: DefaultNavigationbar(),
    );
  }
}
