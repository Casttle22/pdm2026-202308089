import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// COLORES PRINCIPALES
const kFondo = Color.fromARGB(255, 255, 255, 255);
const kTexto = Color.fromARGB(255, 25, 25, 25);
const kMuted = Color.fromARGB(255, 109, 109, 109);
const kSuperficie = Color.fromARGB(255, 246, 247, 248);
const kBorde = Color.fromARGB(255, 225, 225, 225);

const kVerdeTarjeta = Color.fromARGB(255, 190, 255, 75);
const kNegroTarjeta = Color.fromARGB(255, 35, 35, 35);
const kGrisTarjeta = Color.fromARGB(255, 75, 75, 75);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add money',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: kFondo,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light,
        ),
      ),
      home: const AddMoneyScreen(),
    );
  }
}

class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // El ancho se adapta al dispositivo.
    final double cardWidth = screenWidth * 0.42;
    final double cardHeight = cardWidth * 1.02;

    return Scaffold(
      backgroundColor: kFondo,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          children: [
            // ENCABEZADO
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: kBorde),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    alignment: Alignment.center,
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back, color: kTexto, size: 21),
                  ),
                ),

                const Expanded(
                  child: Text(
                    'Add money',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w700,
                      color: kTexto,
                    ),
                  ),
                ),

                const SizedBox(width: 52, height: 52),
              ],
            ),

            const SizedBox(height: 34),
            // SELECT CARD
            const Text(
              'Select card',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w700,
                color: kTexto,
              ),
            ),

            const SizedBox(height: 24),
            // TARJETAS
            SizedBox(
              height: cardHeight,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  debitCard(width: cardWidth, height: cardHeight),
                  const SizedBox(width: 17),
                  creditCard(width: cardWidth, height: cardHeight),
                  const SizedBox(width: 17),
                  bankCard(width: cardWidth, height: cardHeight),
                ],
              ),
            ),

            const SizedBox(height: 40),
            // ADD MONEY TO NEOBANK
            const Text(
              'Add money to Neobank',
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w700,
                color: kTexto,
              ),
            ),

            const SizedBox(height: 24),
            // OPCIONES
            moneyOption(Icons.move_to_inbox, 'Move your direct deposit'),
            const SizedBox(height: 14),
            moneyOption(Icons.swap_horiz, 'Transfer from other banks'),
            const SizedBox(height: 14),
            moneyOption(Icons.apple, 'Apple Pay'),
            const SizedBox(height: 14),
            moneyOption(Icons.credit_card_outlined, 'Debit / Credit Card'),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

// OPCIÓN PARA AGREGAR DINERO
Widget moneyOption(IconData icon, String text) {
  return Container(
    height: 78,
    padding: const EdgeInsets.symmetric(horizontal: 22),
    decoration: BoxDecoration(
      color: kSuperficie,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Row(
      children: [
        Icon(icon, size: 29, color: kTexto),
        const SizedBox(width: 18),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: kTexto,
            ),
          ),
        ),

        const Icon(
          Icons.arrow_forward,
          size: 20,
          color: Color.fromARGB(255, 124, 124, 124),
        ),
      ],
    ),
  );
}

// TARJETA DE DÉBITO VERDE
Widget debitCard({required double width, required double height}) {
  return Container(
    width: width,
    height: height,
    padding: const EdgeInsets.all(5),
    child: Container(
      decoration: BoxDecoration(
        color: kVerdeTarjeta,
        borderRadius: BorderRadius.circular(23),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(23),
        child: Stack(
          children: [
            // Círculo superior izquierdo
            Positioned(
              left: 14,
              top: 14,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: kTexto,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),

            // Logo
            Positioned(
              right: 15,
              top: 18,
              child: SizedBox(
                width: 42,
                height: 33,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 54, 34),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 177, 0),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Información de la tarjeta
            const Positioned(
              left: 14,
              bottom: 42,
              child: Text(
                'Debit card',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 90, 100, 80),
                ),
              ),
            ),

            const Positioned(
              left: 14,
              bottom: 17,
              child: Text(
                '•••• 4568',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: kTexto,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// TARJETA DE CRÉDITO NEGRA
Widget creditCard({required double width, required double height}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: kNegroTarjeta,
      borderRadius: BorderRadius.circular(27),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(27),
      child: Stack(
        children: [
          // Líneas decorativas
          Positioned(
            right: -22,
            bottom: -18,
            child: Transform.rotate(angle: -0.58),
          ),

          // Círculo blanco
          Positioned(
            left: 17,
            top: 17,
            child: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 238, 238, 238),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // VISA
          const Positioned(
            right: 18,
            top: 20,
            child: Text(
              'VISA',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),

          const Positioned(
            left: 18,
            bottom: 43,
            child: Text(
              'Credit card',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 180, 180, 180),
              ),
            ),
          ),

          const Positioned(
            left: 18,
            bottom: 18,
            child: Text(
              '•••• 2478',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}

// TERCERA TARJETA
Widget bankCard({required double width, required double height}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: kGrisTarjeta,
      borderRadius: BorderRadius.circular(27),
    ),
    child: Stack(
      children: [
        Positioned(
          left: 17,
          top: 17,
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 235, 235, 235),
              shape: BoxShape.circle,
            ),
          ),
        ),

        const Positioned(
          left: 18,
          bottom: 43,
          child: Text(
            'Bank card',
            style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 190, 190, 190),
            ),
          ),
        ),

        const Positioned(
          left: 18,
          bottom: 18,
          child: Text(
            '•••• 1024',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
