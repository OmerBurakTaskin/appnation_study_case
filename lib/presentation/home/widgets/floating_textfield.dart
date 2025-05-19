import 'package:app_nation_case/core/constants/theme/app_colors.dart';
import 'package:app_nation_case/core/constants/enum/textfield_state_enum.dart';
import 'package:app_nation_case/core/constants/theme/app_text_styles.dart';
import 'package:app_nation_case/core/extensions/context_extension.dart';
import 'package:app_nation_case/core/extensions/widget_extensions.dart';
import 'package:app_nation_case/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingTextfield extends StatefulWidget {
  const FloatingTextfield({super.key});

  @override
  State<FloatingTextfield> createState() => _FloatingTextfieldState();
}

class _FloatingTextfieldState extends State<FloatingTextfield> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final homeBloc = context.read<HomeBloc>();
      if (_focusNode.hasFocus &&
          homeBloc.state.textfieldState == TextfieldStateEnum.small) {
        homeBloc.add(HomeTextfieldStateEvent(TextfieldStateEnum.medium));
      } else {
        homeBloc.add(HomeTextfieldStateEvent(TextfieldStateEnum.small));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        double height = 64;
        switch (state.textfieldState) {
          case TextfieldStateEnum.small:
            height = 64;
            break;
          case TextfieldStateEnum.medium:
            height = 110;
            break;
          case TextfieldStateEnum.large:
            height = context.getHeight;
            break;
        }
        bool isSmall = state.textfieldState == TextfieldStateEnum.small;

        return GestureDetector(
          onVerticalDragEnd: (details) {
            if (details.velocity.pixelsPerSecond.dy > 0) {
              context.read<HomeBloc>().add(HomeTextFieldShrinkEvent());
            } else if (details.velocity.pixelsPerSecond.dy < 0) {
              context.read<HomeBloc>().add(HomeTextFieldExpandEvent());
            }
          },
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            child: Container(
                    alignment: Alignment.bottomCenter,
                    height: height,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: AppColors.whiteBorderColor, width: 2),
                    ),
                    width: state.textfieldState != TextfieldStateEnum.small
                        ? context.getWidth
                        : context.getWidth - 32,
                    child: Column(
                      children: [
                        if (!isSmall)
                          Container(
                            width: 32,
                            height: 3,
                            decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(1.5)),
                          ).paddingSymmetric(vertical: 8),
                        Expanded(
                          child: _textfield(context, isSmall)
                              .paddingSymmetric(vertical: 2, horizontal: 2),
                        ),
                      ],
                    ))
                .paddingOnly(
                    left: isSmall ? 16 : 0,
                    right: isSmall ? 16 : 0,
                    bottom: isSmall ? 12 : 0),
          ),
        );
      },
    );
  }

  Widget _textfield(BuildContext context, bool isSmall) {
    return TextField(
      focusNode: _focusNode,
      controller: _controller,
      onChanged: (query) {
        context.read<HomeBloc>().add(HomeSearchEvent(query));
      },
      maxLines: isSmall ? 1 : 200,
      style: AppTextStyles.medium16,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          hintText: "Search",
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          hintStyle: AppTextStyles.medium16.copyWith(
            color: AppColors.textGrey.withAlpha(153),
          ),
          filled: true,
          border: InputBorder.none),
    );
  }
}
