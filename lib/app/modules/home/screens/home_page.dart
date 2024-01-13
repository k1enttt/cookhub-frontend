import 'package:cookhub_frontend/app/modules/home/screens/show_all_screen.dart';
import 'package:cookhub_frontend/app/modules/home/models/home_model.dart';
import 'package:cookhub_frontend/app/modules/home/widgets/slider_widget.dart';
import 'package:cookhub_frontend/core/constants/image_strings.dart';
import 'package:cookhub_frontend/core/constants/sizes.dart';
import 'package:cookhub_frontend/core/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<HomeModel> _postList = [];

  void _fetchingData() async {
    const ipServer = 'http://34.87.90.9:8000';
    final url = Uri.parse('$ipServer/api/v1/posts?page=1&perPage=20');
    final response = await http.get(url);
    print(response.body);
    // final Map<String, dynamic> _listData = json.decode(response.body);
    // final userData = _listData["data"];
    // for (final item in userData) {
    //   _postList.add(HomeModel(
    //       imageUrl: item["author"]["avatar_url"],
    //       title: item["content"],
    //       avatarUrl: item["author"]["avatar_url"],
    //       name: item["author"]["name"],
    //       time: '30',
    //       rate: '4.6'));
    // }
  }

  @override
  void initState() {
    super.initState();
    _fetchingData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'What would you like\nto cook today?',
                style: TTextTheme.lightTextTheme.displayMedium!.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.space_24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trending now',
                  style: TTextTheme.lightTextTheme.displayMedium!.copyWith(
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ShowAllHomeScreen());
                  },
                  child: SvgPicture.asset(
                    TIcons.arrow_left_smIcon,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            SliderWidget(
              postData: _postList,
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'For you',
                  style: TTextTheme.lightTextTheme.displayMedium!.copyWith(
                    color: Colors.black,
                  ),
                ),
                SvgPicture.asset(
                  TIcons.arrow_left_smIcon,
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            SliderWidget(
              postData: _postList,
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cooks you may like',
                  style: TTextTheme.lightTextTheme.displayMedium!.copyWith(
                    color: Colors.black,
                  ),
                ),
                SvgPicture.asset(
                  TIcons.arrow_left_smIcon,
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            SliderWidget(
              postData: _postList,
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discover',
                  style: TTextTheme.lightTextTheme.displayMedium!.copyWith(
                    color: Colors.black,
                  ),
                ),
                SvgPicture.asset(
                  TIcons.arrow_left_smIcon,
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            SliderWidget(
              postData: _postList,
            ),
            const SizedBox(
              height: TSizes.space_16,
            ),
            SliderWidget(
              postData: _postList,
            ),
            const SizedBox(
              height: TSizes.space_72,
            ),
          ],
        ),
      ),
    );
  }
}
