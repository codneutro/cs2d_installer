##### README #####

This git repo contains the Counter-Strike 2D language files.
Counter-Strike 2D is a multiplayer top-down action shooter.
Copyright © 2002-2015 Unreal Software
The original Counter-Strike is a game of the Valve Corporation. Unreal Software is not affiliated with the Valve Corporation in any way.

www.CS2D.com
www.UnrealSoftware.de


##### FILE NAMES #####

Language files should be named after this simple pattern:
LANGUAGE-NAME-IN-ENGLISH (LANGUAGE-NAME-IN-ACTUAL-LANGUAGE).txt

e.g.:
- French (Francais).txt
- German (Deutsch).txt
- Italian (Italiano).txt

You can omit the "(LANGUAGE-NAME-IN-ACTUAL-LANGUAGE)"-part for some special cases. E.g. English itself or for artifical languages. You may also replace it with a little description. E.g. if there are multiple versions of the same language.

!!! ATTENTION: ONLY USE THE FOLLOWING CHARACTERS IN THE FILE NAME PLEASE !!!
- Letters from the English alphabet A-Z, a-z (https://en.wikipedia.org/wiki/English_alphabet)
- Digits 0-9
- ( and )
- . (for the .txt extension only!)


##### FILE STRUCTURE #####

The syntax is as simple as:
KEY=VALUE

With KEY being a numeric value with 4 digits (starting at 0001) and leading zeros and VALUE being the actual translation.
e.g.:
0001=Hello World!

Comments are allowed. Lines with comments should start with //
Note: It is NOT possible to add comment behind a KEY=VALUE line!

Line separators:
Some texts contain line separators: |
These must be applied carefully/manually so the text fits into boxes properly.

Variables:
Some texts contain variables which are replaced at runtime.
Variables start with $, followed by a number: $1, $2, ... etc.

Colors:
It is possible to define colors by adding a color code to the beginning of a line. A color code follows this pattern: ©RRRGGGBBBText
With RRR, GGG and BBB being values from 000 to 255 (always 3 digits, leading zeros). E.g.: for red: ©255000000I'm red.
Note: There is NO whitespace between color codes and text!
Attention: Only some strings can be colored!

It's recommended to use "English.txt" as template when creating new translations.