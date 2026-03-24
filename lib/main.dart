import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const ClinicaDentalApp());

class ClinicaDentalApp extends StatelessWidget {
  const ClinicaDentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smile Studio',
      theme: ThemeData(useMaterial3: true),
      home: const CatalogoServicios(),
    );
  }
}

class CatalogoServicios extends StatelessWidget {
  const CatalogoServicios({super.key});

  // URLs corregidas de las imágenes en GitHub
  final List<Map<String, String>> servicios = const [
    {'titulo': 'Limpieza Pro', 'sub': 'Salud bucal completa', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/limpieza.jfif'},
    {'titulo': 'Blanqueamiento', 'sub': 'Brillo instantáneo', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/blanqueamiento-dental.jpg'},
    {'titulo': 'Ortodoncia', 'sub': 'Alinea tu sonrisa', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/ortodoncia.jfif'},
    {'titulo': 'Implantes', 'sub': 'Recupera piezas', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/implantes.jfif'},
    {'titulo': 'Diseño Sonrisa', 'sub': 'Estética premium', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/dise%C3%B1o%20sonrisa.jpg'},
    {'titulo': 'Odontopediatría', 'sub': 'Cuidado para niños', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/odontopediatra.jpg'},
    {'titulo': 'Endodoncia', 'sub': 'Cero dolor', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/endodoncia.jfif'},
    {'titulo': 'Cirugía Oral', 'sub': 'Extracción segura', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/cirujia%20oaral.jpg'},
    {'titulo': 'Periodoncia', 'sub': 'Encías fuertes', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/peridoncioa.jfif'},
    {'titulo': 'Radiología', 'sub': 'Diagnóstico 3D', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/readiologia.jfif'},
    {'titulo': 'Prótesis', 'sub': 'Funcionalidad total', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/protesis.jpg'},
    {'titulo': 'Resinas', 'sub': 'Acabado natural', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/resinas.png'},
    {'titulo': 'Guardas', 'sub': 'Anti-bruxismo', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/guardas.jpg'},
    {'titulo': 'Check-up', 'sub': 'Valoración inicial', 'img': 'https://raw.githubusercontent.com/gioser0579/foto-examen/main/valoracion.jfif'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F7F8),
      appBar: AppBar(
        title: Text('Nuestros Servicios', 
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF00B4D8),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: servicios.length,
        itemBuilder: (context, index) {
          return CardServicio(
            titulo: servicios[index]['titulo']!,
            subtitulo: servicios[index]['sub']!,
            imageUrl: servicios[index]['img']!,
          );
        },
      ),
    );
  }
}

class CardServicio extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String imageUrl;

  const CardServicio({super.key, 
    required this.titulo, required this.subtitulo, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(51),
            spreadRadius: 2,
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => 
                  Container(color: Colors.cyan[100], child: const Icon(Icons.broken_image, size: 50, color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo,
                  style: GoogleFonts.montserrat(
                    fontSize: 15, fontWeight: FontWeight.bold, color: const Color(0xFF0077B6))),
                const SizedBox(height: 2),
                Text(subtitulo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lexend(fontSize: 11, color: Colors.grey[600])),
                const SizedBox(height: 5),
                Row(
                  children: List.generate(5, (index) => 
                    const Icon(Icons.star, size: 14, color: Color(0xFFFFD700))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
