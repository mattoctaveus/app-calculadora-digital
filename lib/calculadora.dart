// criar este arquivo calculadora.dart
// ctrl + i : para perguntar ai flutter
// widget = text or container

import 'package:expressions/expressions.dart';
import 'dart:math'; // Biblioteca para operações matemáticas
import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  // parte 08
  final String _limpar = 'Limpar';

  // parte 06
  String _expressao = '';
  String _resultado = '';

  // parte 07 para funcionar a função limpar
  void _pressionarBotao(String valor) {
    setState(() {
      if (valor == _limpar) {
        _expressao = '';
        _resultado = '';
      } else if (valor == '=') {
        _calcularResultado(); // parte 09
      } else {
        _expressao += valor;
      }
    });
  }

  // parte 11
  void _calcularResultado() {
    try {
      // Verifica e executa funções como sin, cos, tan
      _resultado = _avaliarExpressao(_expressao).toString();
    } catch (e) {
      _resultado = 'Erro: não foi possível calcular.';
    }
  }

  // parte 10
  double _avaliarExpressao(String expressao) {
    expressao = expressao.replaceAll('×', '*');
    expressao = expressao.replaceAll('÷', '/');

    // Tratamento manual de funções como sin, cos, tan
    if (expressao.contains('sin(')) {
      return _resolverFuncao('sin', expressao);
    } else if (expressao.contains('cos(')) {
      return _resolverFuncao('cos', expressao);
    } else if (expressao.contains('tan(')) {
      return _resolverFuncao('tan', expressao);
    } else if (expressao.contains('ln(')) {
      return _resolverFuncao('ln', expressao);
    } else if (expressao.contains('e^')) {
      return _resolverFuncao('e^', expressao);
    }

    // Avaliar expressões básicas com a biblioteca
    ExpressionEvaluator avaliador = const ExpressionEvaluator();
    dynamic resultado = avaliador.eval(Expression.parse(expressao), {});
    return resultado.toDouble();
  }

  // Função para resolver expressões matemáticas específicas
  double _resolverFuncao(String funcao, String expressao) {
    String valorStr = expressao.replaceAll(RegExp(r'[a-zA-Z\(\)]'), '');
    double valor = double.tryParse(valorStr) ?? 0.0;

    switch (funcao) {
      case 'sin':
        return sin(valor); // Seno
      case 'cos':
        return cos(valor); // Cosseno
      case 'tan':
        return tan(valor); // Tangente
      case 'ln':
        return log(valor); // Logaritmo natural
      case 'e^':
        return exp(valor); // Exponencial
      default:
        throw Exception('Função desconhecida');
    }
  }

  // ignore: unused_element
  Widget _botao(String valor) {
    return TextButton(
      child: Text(
        valor,
        style: const TextStyle(fontSize: 18.8, fontWeight: FontWeight.bold),
      ),
      onPressed: () => _pressionarBotao(valor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // parte 05
        Expanded(
          child: Text(
            _expressao,
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
        Expanded(
          child: Text(
            _resultado,
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
        // parte 01
        Expanded(
          flex: 3,
          child: GridView.count(
            crossAxisCount: 4,
            // GridView permite colocar vários elementos em formato de tabela;
            childAspectRatio: 2,
            // parte 03
            children: [
              _botao('7'),
              _botao('8'),
              _botao('9'),
              _botao('÷'),
              _botao('4'),
              _botao('5'),
              _botao('6'),
              _botao('×'),
              _botao('1'),
              _botao('2'),
              _botao('3'),
              _botao('-'),
              _botao('0'),
              _botao('.'),
              _botao('='), // Botão de cálculo
              _botao('+'),
              // Adicionando funções científicas
              _botao('sin('),
              _botao('cos('),
              _botao('tan('),
              _botao('ln('),
              _botao('e^'),
            ],
          ),
        ),
        Expanded(
          child: _botao(_limpar), // parte 08
        ) // parte 04
      ],
    );
  }
}
