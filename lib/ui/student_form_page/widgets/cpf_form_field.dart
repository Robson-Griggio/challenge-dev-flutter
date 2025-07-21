import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CpfFormField extends StatelessWidget {
  final Function onSaved;
  const CpfFormField({super.key, required this.onSaved});

  // Instância do formatador da máscara para o CPF
  static final _cpfMaskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')}, // Permite apenas dígitos
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
      inputFormatters: [_cpfMaskFormatter],
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'CPF*',
        border: OutlineInputBorder(),
        hintText: '000.000.000-00',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o CPF.';
        }
        if (!_isValidCpf(value)) {
          return 'CPF inválido.';
        }
        return null;
      },
      onSaved: (newValue) => onSaved(newValue),
    );
  }
}
