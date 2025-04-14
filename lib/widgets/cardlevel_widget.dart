import 'package:flutter/material.dart';
import 'package:pomodotimer/theme.dart';

class CardLevel extends StatefulWidget {
  const CardLevel(
      {super.key,
      required this.title,
      required this.arrayContent,
      required this.isActive});

  final String title;
  final List arrayContent;
  final bool isActive;

  @override
  State<CardLevel> createState() => _CardLevelState();
}

class _CardLevelState extends State<CardLevel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: widget.isActive ? blackActiveColor : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: blackActiveColor, width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.title,
              style: widget.isActive
                  ? primaryTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold, color: whiteColor)
                  : primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    )),
          const SizedBox(
            height: 12,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.arrayContent.length,
              itemBuilder: (context, index) {
                return Text(
                  '${widget.arrayContent[index]}',
                  style: widget.isActive
                      ? primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                          color: Colors.white)
                      : primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                );
              })
        ],
      ),
    );
  }
}

class CardLevelCustom extends StatefulWidget {
  const CardLevelCustom({super.key, required this.isActive});

  final bool isActive;

  @override
  State<CardLevelCustom> createState() => _CardLevelCustomState();
}

class _CardLevelCustomState extends State<CardLevelCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: widget.isActive ? blackActiveColor : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: blackActiveColor, width: 2)),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.arrow_forward,
                size: 24,
                color: widget.isActive ? whiteColor : blackActiveColor,
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Custom",
                  style: widget.isActive
                      ? primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold, color: whiteColor)
                      : primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        )),
              const SizedBox(
                height: 12,
              ),
              Text(
                'you also can make your preference as your own',
                style: widget.isActive
                    ? primaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: regular, color: Colors.white)
                    : primaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
