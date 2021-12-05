import 'package:flutter/material.dart';

class AjariPrivacyPage extends StatefulWidget {
  const AjariPrivacyPage({Key? key}) : super(key: key);

  @override
  State<AjariPrivacyPage> createState() => _AjariPrivacyPageState();
}

class _AjariPrivacyPageState extends State<AjariPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              alignment: Alignment.topCenter,
              constraints: constraints.maxWidth > 500
                  ? BoxConstraints(maxWidth: MediaQuery.of(context).size.width /2)
                  : BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(" Kebijakan Privasi Ajari", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(" Update Terakhir : 05 Desember 2021", style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold)),
                        ),
                        Card(
                          color: Colors.greenAccent.withOpacity(0.2),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Kebijakan Privasi", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 16),
                                Column(
                                  children: const [
                                    Text("Harap dibaca kebijakan privasi ini dengan seksama untuk memastikan bahwa anda memahami bagaimana AJARI mengumpulkan, menyimpan, menggunakan, memindahkan, mengungkapkan dan melindungi informasi pribadi yang diperoleh melalui aplikasi kami.",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 12),
                                    Text("Penggunaan anda atas Aplikasi dan layanan kami tunduk kepada kebijakan privasi  ini menindikasikan persetujuan anda terhadap ketentuan pengguna dan kebijakan privasi tersebut.",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Definisi : ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Card(
                                    color: Colors.greenAccent.withOpacity(0.2),
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text('"Aplikasi", Aplikasi AJARI (Belajar Iqro) tersedia di google play store yang tersedia dalam sistem perangkat Anda.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Card(
                                    color: Colors.greenAccent.withOpacity(0.2),
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text('"Informasi Pribadi", Data perseorangan tertentu yang melekat dan dapat diidentifikasi pada suatu individu dan yang dikumpulkan melalui Aplikasi, seperti nama, foto, alamat email, dan informasi lain yang mungkin dapat mengidentifikasi Anda sebagai pengguna Aplikasi. Informasi pribadi juga termasuk pada akses kamera dan audio. yang dibutuhkan dalam menjalankan fungsi dan fitur yang terdapat pada aplikasi AJARI',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Card(
                                    color: Colors.greenAccent.withOpacity(0.2),
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text('"Ketentuan Penggunaan", Syarat dan ketentuan atau prosedur standar operasi atau ketentuan lainnya sehubungan dengan pengembangan aplikasi, sebagaimana dapat diubah atau ditambah dari waktu ke waktu.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Card(
                                    color: Colors.greenAccent.withOpacity(0.2),
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Text('"Layanan", Hal-hal yang ditawarkan oleh AJARI melalui Aplikasi kepada Anda. termasuk namun tidak terbatas pada pemrosesan dan pengantaran untuk produk yang disediakan dari waktu ke waktu melalui Aplikasi.',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
