import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../routes.dart';

class VideoFormat {
  final String title;
  final String image;
  final String description;
  final String details;
  final IconData icon;

  const VideoFormat(
      this.title,
      this.image,
      this.description,
      this.details,
      this.icon,
      );
}

const formats = [
  VideoFormat(
    'MP4',
    'assets/images/mp4.png',
    'Популярный формат для хранения и передачи видео.',
    'MP4 (MPEG-4 Part 14) — один из самых популярных '
        'мультимедийных контейнеров. Он используется для '
        'хранения видео, аудио и субтитров. '
        'Формат широко поддерживается смартфонами, '
        'компьютерами, браузерами и видеоплатформами.',
    Icons.video_file,
  ),

  VideoFormat(
    'AVI',
    'assets/images/avi.png',
    'Формат мультимедийного контейнера Microsoft.',
    'AVI (Audio Video Interleave) — мультимедийный '
        'контейнер, разработанный компанией Microsoft. '
        'Он позволяет хранить видео и аудио в одном файле. '
        'Используется в различных программах '
        'для воспроизведения и обработки видео.',
    Icons.movie,
  ),

  VideoFormat(
    'MKV',
    'assets/images/mkv.png',
    'Гибкий контейнер для видео, аудио и субтитров.',
    'MKV (Matroska Video) — открытый мультимедийный '
        'контейнер. Он поддерживает несколько звуковых '
        'дорожек, субтитры и видеопотоки. '
        'Часто применяется для хранения фильмов '
        'и видеозаписей высокого качества.',
    Icons.video_library,
  ),

  VideoFormat(
    'MOV',
    'assets/images/mov.png',
    'Формат видеофайлов, разработанный Apple.',
    'MOV — мультимедийный контейнер, разработанный '
        'компанией Apple для технологии QuickTime. '
        'Он применяется для хранения видео и аудио, '
        'а также используется в программах '
        'для монтажа видеоматериалов.',
    Icons.smart_display,
  ),

  VideoFormat(
    'WebM',
    'assets/images/webm.png',
    'Открытый формат видео для интернета.',
    'WebM — открытый формат мультимедийных файлов, '
        'ориентированный на воспроизведение видео '
        'в интернете. Он поддерживается современными '
        'браузерами и позволяет эффективно передавать '
        'видео с использованием современных кодеков.',
    Icons.language,
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openDetails(BuildContext context, VideoFormat format) {
    Navigator.pushNamed(
      context,
      Routes.detail,
      arguments: format,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width > 600;

    final isDesktop =
        kIsWeb ||
            defaultTargetPlatform == TargetPlatform.macOS ||
            defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.linux;

    final double verticalSpacing = isDesktop ? 28 : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Практическая работа №6',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.lightGreen,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Text(
                          'Форматы видеофайлов',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(height: verticalSpacing),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen.shade50,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Text(
                          'Приложение демонстрирует различные форматы '
                              'видеофайлов. Изображения представлены в '
                              'горизонтальном списке, а информация о '
                              'форматах — в карточках ниже.',
                          textAlign: TextAlign.center,
                        ),
                      ),

                      SizedBox(height: verticalSpacing),

                      SizedBox(
                        height: 180,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: formats.length,
                          separatorBuilder: (context, index) =>
                          const SizedBox(width: 14),
                          itemBuilder: (context, index) {
                            final format = formats[index];

                            return InkWell(
                              onTap: () => openDetails(
                                context,
                                format,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                width: 180,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(16),
                                ),
                                child: Image.asset(
                                  format.image,
                                  fit: BoxFit.contain,
                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return Icon(
                                      format.icon,
                                      size: 65,
                                      color: Colors.lightGreen,
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: verticalSpacing),

                      const Text(
                        'Список форматов',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: formats.length,

                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isWide ? 2 : 1,
                          mainAxisExtent: 115,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                        ),

                        itemBuilder: (context, index) {
                          final format = formats[index];

                          return Card(
                            color: Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: ListTile(
                              contentPadding:
                              const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              leading: Icon(
                                format.icon,
                                color: Colors.lightGreen,
                              ),
                              title: Text(
                                format.title,
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                format.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                              onTap: () => openDetails(
                                context,
                                format,
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const StudentFooter(),
        ],
      ),

      bottomNavigationBar: const AppNavigationBar(
        selectedIndex: 0,
      ),
    );
  }
}

class StudentFooter extends StatelessWidget {
  const StudentFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      color: Colors.lightGreen.shade50,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Row(
            children: [
              const Icon(
                Icons.account_circle,
                size: 45,
                color: Colors.lightGreen,
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Безфамильный Евгений Геннадьевич\n'
                        'Группа ИКБО-63-23',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}