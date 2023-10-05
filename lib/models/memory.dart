class Memory {
  static const operacoes = ['%', '/', 'x', '-', '+', '='];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? _operation;
  String _value = '0';
  bool _limparValor =
      false; /*limpa os valores da tela, quando clicar na operação, para aguardar os novos valores*/
  String? _ultimoComando;

  void aplicarComando(String comando) {
    if (_substituirOperacao(comando)) {
      _operation = comando;
      return;
    }
    if (comando == 'AC') {
      _limpar();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando);
    } else {
      _adicionarDigito(comando);
    }
    _ultimoComando = comando;
  }

  _substituirOperacao(String comando) {
    return operacoes.contains(_ultimoComando) &&
        operacoes.contains(comando) &&
        _ultimoComando != '=' &&
        comando != '=';
  }

  _setOperacao(String newOperacao) {
    bool sinalIgual = newOperacao == '=';
    if (_bufferIndex == 0) {
      if (!sinalIgual) {
        _operation = newOperacao;
        _bufferIndex = 1;
        _limparValor = true;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;

      _operation = sinalIgual ? null : newOperacao;
      _bufferIndex = sinalIgual ? 0 : 1;
    }
    _limparValor = true;
  }

  _adicionarDigito(String digito) {
    final ponto = digito == '.';

    final limparValor = (_value == '0' && !ponto) || _limparValor;

    if (ponto && _value.contains('.') && !limparValor) {
      return;
    }

    final valorVazio = ponto ? '0' : '';

    final currentValue = limparValor ? valorVazio : _value;
    _value = currentValue + digito;
    _limparValor = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  _limpar() {
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
    _limparValor = false;
  }

  _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  String get value {
    return _value;
  }
}
