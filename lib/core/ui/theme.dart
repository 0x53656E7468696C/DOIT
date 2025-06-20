import 'package:doit/core/ui/colors.dart';
import 'package:flutter/material.dart';

class DOITThemeData{
  static final ThemeData lit = ThemeData().copyWith(
    iconTheme: IconThemeData(
      color: DOITColors.midOpTxtLit
    ),
    colorScheme: ColorScheme.light().copyWith(
          primary:  DOITColors.shadowColorLit,
    ),

    datePickerTheme: DatePickerThemeData(
      dayStyle: TextStyle(
        color:   DOITColors.leOpTexLit,
        fontFamily: 'Jura-semi',
        letterSpacing: 1.45,
        wordSpacing: 1.2,
        fontSize: 12
      ),
      weekdayStyle: TextStyle(
        color:   DOITColors.midOpTxtLit,
        fontFamily: 'Montserrat-semi',
        letterSpacing: 1.45,
        wordSpacing: 1.2,
        fontSize: 11.1
      )
    ),
    extensions: <ThemeExtension>[
      const ColorExt(
        DOITCardColor: DOITColors.cardLit,
        borderColor: DOITColors.leOpTexLit,
        shadowColor: Color(0xFF90CAF9) 
        
      ),
    ],
    
        cardTheme:  CardThemeData(
          color: DOITColors.cardLit,
          elevation: 3,
          shadowColor: DOITColors.shadowColorLit,
          shape:  ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(51),
            side: const BorderSide(
              color: DOITColors.cardBorderLit,
              strokeAlign: BorderSide.strokeAlignOutside
            )


          ),
        ),



        dividerTheme: DividerThemeData(
          thickness: 0.9,
          color:  DOITColors.leOpTexLit,
        ),
        
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: DOITColors.midOpTxtLit, fontFamily: 'Jura'     ,   letterSpacing: 1.32,),
      titleLarge: TextStyle(color:  DOITColors.higOpTxtLit, fontFamily: 'Jura-semi',       letterSpacing: 1.45, ),
      titleSmall: TextStyle(color:  DOITColors.leOpTexLit, fontFamily: 'Jura-semi',       letterSpacing: 1.32,),
      
      bodyMedium: TextStyle(
        color:   DOITColors.midOpTxtLit,
        fontFamily: 'Montserrat-semi',
        fontSize: 12,
        letterSpacing: 1.45,
        wordSpacing: 1.2

        
      ),
      bodyLarge: TextStyle(
        color:  DOITColors.midOpTxtLit,
        fontFamily: 'Montserrat-bold',
        letterSpacing: 1.45,
        wordSpacing: 1.2
        
   
      ),
      bodySmall: TextStyle(
        color:   DOITColors.leOpTexLit,
        fontFamily: 'Montserrat',
        letterSpacing: 1.45,
        wordSpacing: 1.2
        

      ),
    ),
    scaffoldBackgroundColor: DOITColors.bgLit,
    listTileTheme: ListTileThemeData(
      iconColor: Color.fromARGB(210, 255, 241, 213),
      textColor: Color.fromARGB(174, 255, 241, 213),
    ),
  );
  static final ThemeData dark = ThemeData.dark().copyWith(
        datePickerTheme: DatePickerThemeData(
      dayStyle: TextStyle(
        color:   DOITColors.leOpTexDark,
        fontFamily: 'Jura-semi',
        letterSpacing: 1.45,
        wordSpacing: 1.2,
        fontSize: 12

      ),
      weekdayStyle: TextStyle(
        color:   DOITColors.midOpTxtDark,
        fontFamily: 'Montserrat-semi',
        letterSpacing: 1.45,
        wordSpacing: 1.2,
        fontSize: 11.1
      )

      ),


     scaffoldBackgroundColor: DOITColors.bgDark,

    extensions: <ThemeExtension>[
      const ColorExt(
        DOITCardColor : DOITColors.cardDark,
        borderColor: DOITColors.leOpTexDark,
        shadowColor: Color(0xFFEF9A9A),
      ),
    ],
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: DOITColors.higOpTxtDark, fontFamily: 'Jura', letterSpacing: 1.32),
      titleLarge: TextStyle(color: DOITColors.higOpTxtDark, fontFamily: 'Jura-bold', letterSpacing: 1.45),
      titleSmall: TextStyle(color: DOITColors.leOpTexDark, fontFamily: 'Jura-semi', letterSpacing: 1.32),

      // bodyMedium: TextStyle(color: Color.fromARGB(167, 102, 102, 102))
      // bodyMedium: TextStyle(color: Color.fromARGB(167, 70, 69, 104)),
      bodyMedium: TextStyle(
        color: DOITColors.midOpTxtDark,
        fontFamily: 'Montserrat-semi',
        fontSize: 12,
        letterSpacing: 1.45,
        wordSpacing: 1.2
      ),
      bodyLarge: TextStyle(
        color: DOITColors.midOpTxtDark,
        fontFamily: 'Montserrat-bold',
        letterSpacing: 1.45,
        wordSpacing: 1.2
      ),
      bodySmall: TextStyle(
        color: DOITColors.leOpTexDark,
        fontFamily: 'Montserrat',
        letterSpacing: 1.45,
        wordSpacing: 1.2
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: const Color.fromARGB(206, 70, 69, 104),
      textColor: const Color.fromARGB(204, 70, 69, 104),
    ),
  cardTheme: CardThemeData(
          color: DOITColors.cardDark,
          elevation: 4.5,
          shadowColor: DOITColors.shadowColorDark,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(51),
            side: BorderSide(
              color: DOITColors.cardBorderDark,
              width: 0.5,
              strokeAlign: BorderSide.strokeAlignOutside
            )


          ),
        ),
   iconTheme: IconThemeData(
      color: DOITColors.leOpTexDark
    ),
            dividerTheme: DividerThemeData(
          thickness: 0.9,
          color:  DOITColors.leOpTexDark,
        ),
                    colorScheme: ColorScheme.dark().copyWith(
          primary:  DOITColors.shadowColorLit,
    ),
  );
}

class ColorExt extends ThemeExtension<ColorExt>{
   final Color borderColor ;
   final Color shadowColor;
   final Color DOITCardColor;
    const ColorExt({required this.borderColor, required this.shadowColor, required this.DOITCardColor});
    
      @override
      ThemeExtension<ColorExt> copyWith() {
        return ColorExt(
          DOITCardColor: DOITCardColor,
          borderColor: borderColor,
          shadowColor: shadowColor,
        );
      }
    
      @override
      ThemeExtension<ColorExt> lerp(covariant ThemeExtension<ColorExt>? other, double t) {
        if (other is! ColorExt) return this;
        return ColorExt(
          DOITCardColor: Color.lerp(DOITCardColor, other.DOITCardColor, t)!,
          borderColor: Color.lerp(borderColor, other.borderColor, t)!,
          shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
        );
      }

}