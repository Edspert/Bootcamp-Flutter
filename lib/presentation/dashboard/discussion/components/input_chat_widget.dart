import 'package:flutter/material.dart';

class InputChatWidget extends StatelessWidget {
  const InputChatWidget({
    super.key,
    this.onTapAdd,
    this.onTapCamera,
    this.onTapSend,
  });

  final Function()? onTapAdd;
  final GestureTapCallback? onTapCamera;
  final GestureTapCallback? onTapSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            color: const Color(0xffF6F6F6),
            onPressed: onTapAdd,
            icon: const Icon(
              Icons.add,
              color: Color(0xff3A7FD5),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 32,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: GestureDetector(
                    onTap: onTapCamera,
                    child: const Icon(
                      Icons.camera_alt,
                      color: Color(0xff3A7FD5),
                    ),
                  ),
                  fillColor: const Color(0xffF6F6F6),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  hintText: 'Ketuk untuk menulis....',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                      style: BorderStyle.none,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                      style: BorderStyle.none,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: onTapSend,
            icon: const Icon(
              Icons.send,
              color: Color(0xff3A7FD5),
            ),
          ),
        ],
      ),
    );
  }
}
