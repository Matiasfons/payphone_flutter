import 'package:http/http.dart' as http;
import 'dart:convert';

//SE GENERA UN LINK DE PAGO CON LA INFORMACIÓN UTILIZANDO LA API DE PAYPHONE Y DEVOLVEMOS LA URL RESULTANTE
generateLinkPayPhone(amount, tax, amountWithTax, clientTransactionId, currency,
    reference, expireIn, token) async {
  var response = await http.post(
      Uri.parse('https://pay.payphonetodoesposible.com/api/Links'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode({
        "amount": amount,
        "tax": tax,
        "amountWithTax": amountWithTax,
        "clientTransactionId": clientTransactionId,
        "currency": currency,
        "reference": reference,
        "expireIn": expireIn
      }));
  var decode = json.decode(response.body);

  return decode;
}
