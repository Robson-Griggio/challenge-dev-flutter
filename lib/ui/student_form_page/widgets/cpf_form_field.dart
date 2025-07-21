import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CpfFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEditMode;
  const CpfFormField({
    super.key,
    required this.controller,
    required this.isEditMode,
  });

  static final _cpfMaskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
    initialText: '',
  );

  static bool _isValidCpf(String cpf) {
    // Remove caracteres não numéricos
    final numbers = cpf.replaceAll(RegExp(r'[^0-9]'), '');

    if (numbers.length != 11) return false;

    // Verifica se todos os dígitos são iguais (ex: 111.111.111-11)
    if (RegExp(r'^(\d)\1*$').hasMatch(numbers)) return false;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [_cpfMaskFormatter],
      keyboardType: TextInputType.number,
      maxLength: 14,
      decoration: const InputDecoration(
        labelText: 'CPF*',
        border: OutlineInputBorder(),
        hintText: '000.000.000-00',
        counterText: '',
      ),
      readOnly: isEditMode,
      validator: (value) {
        if (isEditMode) return null;
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o CPF.';
        }
        if (!_isValidCpf(value)) {
          return 'CPF inválido.';
        }
        return null;
      },
    );
  }
}
