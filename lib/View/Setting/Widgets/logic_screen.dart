import 'package:dido_koodak1/Const/measures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Utils/widget_util.dart';

class LogicScreen extends StatelessWidget {
  LogicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            const SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Image(
                image: AssetImage(
                  'assets/images/Backgrounds/splashBg.PNG',
                ),
                fit: BoxFit.fill,
              ),
            ),
            _buildBg(),
            _buildRadin(),
            Center(
              child: Container(
                padding: paddingAll24,
                height: Get.height * .78,
                width: Get.width * .35,
                child:const Center(
                  child: SingleChildScrollView(
                    child: Text(
                      '\nسیاست حفظ اطلاعات و محرمانگی اطلاعات کاربران در اپلیکیشن دیدوپارک'
                      '\nدیدوپارک معتقد است اصول حفظ حریم شخصی و اطلاعات کاربران بسیار مهم و حساس است. برای دیدوپارک حفظ محرمانگی، نحوه استفاده و محافظت از اطلاعات کاربران دارای اولویت بالایی است و دیدوپارک از اهمیت این مقوله برای کاربران خود آگاه است. در این سند اصول محرمانگی اطلاعات وب رمز و نیز راهکارهای وب رمز برای حفظ حریم شخصی و اطلاعات کاربران سایت وب رمز توضیح داده شده است. به طور کلی دامنه‌ی اعمال این سیاست‌ها به گونه‌ای است که سیاست محرمانگی تمامی اطلاعاتی که از کاربران در داخل وب‌سایت و یا اپلیکیشن موبایل از کاربر جمع‌آوری می‌شود را در بر می‌گیرد. از اطلاعات کاربری برای شناسایی و تایید هویت کاربر استفاده می‌شود که اطلاعات کاربر با سایر اطلاعات، تطبیق داده می‌شود.'
                      '\nاین اطلاعات شامل چه مواردی می‌شود؟'
                      '\nهنگامی که کاربر حساب خود را باز می‌کند، اطلاعاتی که در زیر آمده است از کاربر دریافت خواهد شد:'
                      '\nاطلاعات حساب شامل: شماره تلفن همراه، نام کاربری،'
                      '\nاطلاعات شناسایی کاربر شامل: نام و نام خانوادگی، آدرس ایمیل، کد ملی'
                      '\nاطلاعات دستگاه تلفن همراه: نوع دستگاه، سیستم عامل'
                      '\nدر صورت درخواست کاربر، نام کاربری و رمزعبور سامانه بر روی حافظه داخلی دستگاه ذخیره و مجددا برای ورود خودکار استفاده می شود، بدیهی است که در اینصورت مسئولیت حفاظت از این اطلاعات به عهده کاربر بوده و در صورت مفقود شدن یا سوء استفاده افراد یا بدافزارهای دیگر از اطلاعات ذخیره شده، مسئولیتی متوجه اپلیکیشن نخواهد بود.'
                      '\nمحافظت و نگه‌داری از اطلاعات کاربر چگونه صورت می‌گیرد؟'
                      '\nدیدوپارک اطلاعات شخصی کاربران را با استفاده از سرورهای محافظت شده شخص ثالث واقع در مراکز داده ایمن در ایران ذخیره و پردازش می نماید. این اطلاعات توسط حفاظت‌های فیزیکی، الکترونیکی و رویه‌ای در مطابقت با قوانین و مقررات سیستم بانک مرکزی جمهوری اسلامی و سایر قوانین نهادهای ذیربط محافظت می‌شود. علاوه بر این برای افزایش هرچه بیشتر امنیت اطلاعات، از سیستم‌های امنیت رایانه‌ای مانند فایروال ها و رمزنگاری داده‌ها استفاده می‌شود.'
                      '\nدیدوپارک کنترل دسترسی‌های فیزیکی را بصورت کامل و طبق استاندارد جهانی، رعایت می‌کند و اجازه دسترسی به اطلاعات فقط برای آن دسته از کارکنانی که نیاز به انجام مسئولیت‌های شغلی خود دارند و بر اساس قراردادهای محرمانگی انجام می‌دهد. دیدوپارک تمام تلاش و تمرکز خود را بر افزایش امنیت سیستم بکار می‌برد و همواره در حال بروزرسانی آن می‌باشد. علی‌رغم همه این تلاش‌ها برای افزایش امنیت اطلاعات کاربران، خود کاربر نیز موظف است اطلاعات شخصی حساب کاربری و رمز عبور خود را در اختیار شرکت‌ها، افراد و یا کاربران دیگر قرار ندهد.'
                      '\n۴) به ارائه دهندگان خدمات و یا فروشندگانی که از طریق خدماتی را به کاربران خود ارائه می‌دهند، برای جلوگیری از تقلب و کلاه‌برداری.'
                      '\n۵) به ارائه دهندگان خدمات تحت قرارداد که به بخش‌هایی از عملیات کسب و کار ما کمک می‌کنند (برای مثال، جلوگیری از تقلب، پردازش پرداخت یا خدمات فن‌آوری)؛ آن‌ها موظفند طبق این قرارداد از اطلاعات کاربر در جهت لطمه زدن به منافع کاربر استفاده ننمایند.',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'xKoodak',
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: paddingAll32,
                child: WidgetUtil.backButton(function: () {
                  Get.back();
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBg() {
    return Center(
      child: Image(
        image: const AssetImage(
          'assets/images/Backgrounds/alertBg.png',
        ),
        fit: BoxFit.fill,
        height: Get.height * .8,
        width: Get.height * .9,
      ),
    );
  }

  Widget _buildRadin() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: Get.width * .7,
        ),
        height: Get.height * .45,
        width: Get.width * .25,
        child: SvgPicture.asset(
          'assets/images/Characters/radin.svg',
          height: Get.height * .6,
          width: Get.height * .7,
        ),
      ),
    );
  }
}
