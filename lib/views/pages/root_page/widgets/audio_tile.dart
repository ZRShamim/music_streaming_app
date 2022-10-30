import 'package:flutter/material.dart';
import 'package:music_streaming_app/views/utils/styles/custom_colors.dart';
import 'package:music_streaming_app/views/utils/styles/custom_styles.dart';

class AudioTile extends StatelessWidget {
  const AudioTile({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
    required this.isPlaying,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool isPlaying;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        color: isPlaying ? CustomColors.black2A : Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1437773409l/6681454._SY475_.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: CustomStyles.titleStyle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      subtitle,
                      style: CustomStyles.subtitleStyle,
                    ),
                  ],
                ),
              ],
            ),
            // const MoreButton(),
          ],
        ),
      ),
    );
  }
}
