import 'package:c214_seminario/User.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'Dado um usuário de idade 17, quando faz aniversário sua idade é incrementada para 18',
      () async {
    //ARRANGE
    final user = User('Jé', 17);

    //ACT
    user.aniversario();

    //ASSERT
    expect(user.idade, 18);
  });
}
