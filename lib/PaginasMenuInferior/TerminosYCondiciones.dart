import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home.dart';

class TerminosYCondiciones extends StatelessWidget {
  const TerminosYCondiciones();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          alignment: Alignment.centerRight,
          tooltip: 'Regresar',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHome()),
            );
          },
        ),
        title: const Text('Mi Rifa Uruuay'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text('Mi Rifa Uruguay',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: const Text(
                'Bases y condiciones',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Divider(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Center(
                child: const Text(
                  "Mirifa.net es una plataforma Uruguaya donde las personas pueden sortear sus productos.\nLos números de la rifa adquiridos son enviados de forma digital.\nEl registro de números vendidos pose mecanismos de seguridad que no permite ser alterado por terceros.\nMirifa.site te da la posibilidad de ganar lo que tanto queres, a un bajo costo y con altas probabilidades.\nCada rifa cuenta con una cantidad mínima de números para ser aprobada.\nUna vez alcanzada esa cantidad mínima, la plataforma verifica que la rifa sea posible.\nUna vez validada se registra en la Agencia de Loterías y Quinielas y comienza la confirmación de los números reservados y se dispara la venta.\nLos sorteos menores a mil números se realizan con el juego ¨La Quiniela¨ de la Dirección Nacional de loterías y Quinielas.\nAquellos sorteos que superen los mil números se realizan con escribano público presente.\nUna vez finalizado el sorteo el ganador recibe su premio y el beneficiario de la rifa recibe su pago.\nSi la rifa no alcanza el mínimo de números vendidos requeridos para su realización, el dinero se devuelve a los participantes que hayan adquirido un número, descontando un 15% del monto total por gastos administrativos de la plataforma.\nLos sorteos con escribano publico serán transmitidos en vivo en nuestras redes sociales.\nLos resultados de los sorteos y números ganadores serán publicados en nuestra plataforma y redes sociales.\nEl ganador será contactado a través del número celular de contacto proporcionado al momento de la compra del número de rifa, coordinando con este la mecánica para la entrega del premio.\nEl premio no podrá ser canjeable por su valor en efectivo y no puede ser cedido ni transferido a terceros.\nNo se hará efectiva la entrega del premio, si el beneficiario NO acredita su calidad de tal, con su documento de identidad.\nEl plazo para el reclamo del premio será de 30 días corridos a partir del día siguiente al sorteo correspondiente.\nVencido este plazo se pierde el derecho a reclamar el mismo.\nCuando por circunstancias no previstas o por razones de fuerza mayor, se deba sustituir alguno de los premios a otorgarse, el premio sustituto será determinado exclusivamente por mirifa.net, efectuando el cambio por un premio de similares características.\nLos premios no adjudicados por cualquier causa serán re-sorteados en fecha a determinar por el Organizador.\nEl beneficiario acepta con la compra de los cupones de Rifa, las condiciones y bases estipuladas.\nEl Organizador se responsabiliza únicamente por la organización integral de la rifa y por la entrega de los premios derivados de la misma, deslindando toda otra responsabilidad no prevista expresamente en las presentes bases.\nEl Organizador no será responsable por ningún daño o perjuicio de cualquier tipo que pudieran sufrir los ganadores con motivo del retiro, uso y disfrute del premio.\nTampoco tendrá responsabilidad alguna ni asumirá costos adicionales en caso que los ganadores decidan realizar modificaciones y/o cambios luego de ser entregado el premio.\nNo podrán participar de esta rifa aquellas personas menores de 18 años.\nLos ganadores de cada rifa autorizan expresamente a difundir sus nombres e imágenes en los medios y formas que mirifa.net estime conveniente para promocionar el sorteo realizado, sin derecho a indemnización o compensación de especie alguna, y siempre en lo concerniente a la rifa. Mirifa.net recopilará en una base de datos la información personal presentada por los participantes.\nMirifa.net está autorizado para enviar periódicamente boletines e información relacionados con los futuros sorteos.\nTodo participante al proporcionar sus datos concede autorización al uso de su información personal para dichos fines.\n Los participantes podrán ejercer los derechos de acceso, rectificación y/o supresión sobre sus datos.\nLa provisión de los datos por parte de los participantes de la promoción es voluntaria y los participantes serán responsables de toda la información enviada",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  //textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
