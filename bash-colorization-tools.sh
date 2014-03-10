#!/bin/sh
#═══════════════════════════════════════════════════════════════════════════════
# [work]
# Silver-Studded-Blue BASH Scripting Tools
# [copyright]
# (c) 2013 Dodzi Y. Dzakuma (http://www.nexocentric.com)
# See copyright at footer for more information.
# [summary]
# This is just a set of tools that I developed and tested to make it easier
# for me to create BASH scripts. If you feel that they would be useful for you
# please feel free to use them.
#═══════════════════════════════════════════════════════════════════════════════

#───────────────────────────────────────────────────────────────────────────────
# Script Settings
#───────────────────────────────────────────────────────────────────────────────
SCRIPT_NAME="Silver-Studded-Blue BASH Scripting Tools"
SCRIPT_VERSION="0.01"
SCRIPT_VERSION_NAME="azuki"
SCRIPT_OPTION_FLAGS="Dd:hTtVv"
SCRIPT_DEBUG_MODE=0
SCRIPT_SELF_TEST_MODE=1
SCRIPT_FUNCTION_DEBUG_MODE=0
SCRIPT_FUNCTION_TO_DEBUG=
SCRIPT_VERBOSE_MODE=0
SCRIPT_PATH="$BASH_SOURCE"

#───────────────────────────────────────────────────────────────────────────────
# Script Constants
#───────────────────────────────────────────────────────────────────────────────

#-----------------------------------------------------------
# color name index modifiers
#-----------------------------------------------------------
COLOR_CODE=0
COLOR_NAME=1
COLOR_HEX_CODE=2
COLOR_HUE=3

#-----------------------------------------------------------
# default system colors
#-----------------------------------------------------------
BLACK_SYSTEM=(0 "BLACK_SYSTEM" "#000000" "Black")
RED_SYSTEM=(1 "RED_SYSTEM" "#800000" "Brown")
GREEN_SYSTEM=(2 "GREEN_SYSTEM" "#008000" "Green")
YELLOW_SYSTEM=(3 "YELLOW_SYSTEM" "#808000" "Green")
BLUE_SYSTEM=(4 "BLUE_SYSTEM" "#000080" "Blue")
MAGENTA_SYSTEM=(5 "MAGENTA_SYSTEM" "#800080" "Violet")
CYAN_SYSTEM=(6 "CYAN_SYSTEM" "#008080" "Blue")
LIGHT_GRAY_SYSTEM=(7 "LIGHT_GRAY_SYSTEM" "#c0c0c0" "Grey")
DARK_GRAY_SYSTEM=(8 "DARK_GRAY_SYSTEM" "#808080" "Grey")
BRIGHT_RED_SYSTEM=(9 "BRIGHT_RED_SYSTEM" "#ff0000" "Red")
BRIGHT_GRAY_SYSTEM=(10 "BRIGHT_GRAY_SYSTEM" "#00ff00" "Green")
BRIGHT_YELLOW_SYSTEM=(11 "BRIGHT_YELLOW_SYSTEM" "#ffff00" "Yellow")
BRIGHT_BLUE_SYSTEM=(12 "BRIGHT_BLUE_SYSTEM" "#0000ff" "Blue")
BRIGHT_MAGENTA_SYSTEM=(13 "BRIGHT_MAGENTA_SYSTEM" "#ff00ff" "Violet")
BRIGHT_CYAN_SYSTEM=(14 "BRIGHT_CYAN_SYSTEM" "#00ffff" "Blue")
WHITE_SYSTEM=(15 "WHITE_SYSTEM" "#ffffff" "White")

#-----------------------------------------------------------
# 6 by 6 by 6 color space
#-----------------------------------------------------------
BLACK=(16 "BLACK" "#000000" "Black")
NAVY=(17 "NAVY" "#00005f" "Blue")
DARK_BLUE=(18 "DARK_BLUE" "#000087" "Blue")
NEW_MIDNIGHT_BLUE=(19 "NEW_MIDNIGHT_BLUE" "#0000af" "Blue")
MEDIUM_BLUE=(20 "MEDIUM_BLUE" "#0000d7" "Blue")
BLUE=(21 "BLUE" "#0000ff" "Blue")
DARK_GREEN=(22 "DARK_GREEN" "#005f00" "Green")
MOSQUE=(23 "MOSQUE" "#005f5f" "Green")
BLUE_LAGOON=(24 "BLUE_LAGOON" "#005f87" "Green")
COBALT=(25 "COBALT" "#005faf" "Blue")
NAVY_BLUE=(26 "NAVY_BLUE" "#005fd7" "Blue")
DARK_DODGER_BLUE=(27 "DARK_DODGER_BLUE" "#005fff" "Blue")
MEDIUM_GREEN=(28 "MEDIUM_GREEN" "#008700" "Green")
OBSERVATORY=(29 "OBSERVATORY" "#00875f" "Green")
DARK_CYAN=(30 "DARK_CYAN" "#008787" "Green")
CERULEAN=(31 "CERULEAN" "#0087af" "Blue")
PACIFIC_BLUE=(32 "PACIFIC_BLUE" "#0087d7" "Blue")
MEDIUM_DODGER_BLUE=(33 "MEDIUM_DODGER_BLUE" "#0087ff" "Blue")
ISLAMIC_GREEN=(34 "ISLAMIC_GREEN" "#00af00" "Green")
JADE=(35 "JADE" "#00af5f" "Green")
PERSIAN_GREEN=(36 "PERSIAN_GREEN" "#00af87" "Green")
BONDI_BLUE=(37 "BONDI_BLUE" "#00afaf" "Blue")
IRIS_BLUE=(38 "IRIS_BLUE" "#00afd7" "Blue")
DARK_SKY_BLUE=(39 "DARK_SKY_BLUE" "#00afff" "Blue")
DARK_LIME=(40 "DARK_LIME" "#00d700" "Green")
MALACHITE=(41 "MALACHITE" "#00d75f" "Green")
DEEP_CARIBBEAN_GREEN=(42 "DEEP_CARIBBEAN_GREEN" "#00d787" "Green")
CARIBBEAN_GREEN=(43 "CARIBBEAN_GREEN" "#00d7af" "Green")
DARK_TURQUOISE=(44 "DARK_TURQUOISE" "#00d7d7" "Blue")
LIGHT_SKY_BLUE=(45 "LIGHT_SKY_BLUE" "#00d7ff" "Blue")
LIGHT_LIME=(46 "LIGHT_LIME" "#00ff00" "Green")
DARK_SPRING_GREEN=(47 "DARK_SPRING_GREEN" "#00ff5f" "Green")
SPRING_GREEN=(48 "SPRING_GREEN" "#00ff87" "Green")
MEDIUM_SPRING_GREEN=(49 "MEDIUM_SPRING_GREEN" "#00ffaf" "Green")
BRIGHT_TURQUOISE=(50 "BRIGHT_TURQUOISE" "#00ffd7" "Blue")
AQUA=(51 "AQUA" "#00ffff" "Blue")
MAROON=(52 "MAROON" "#5f0000" "Brown")
TYRIAN_PURPLE=(53 "TYRIAN_PURPLE" "#5f005f" "Violet")
DARK_INDIGO=(54 "DARK_INDIGO" "#5f0087" "Violet")
MEDIUM_INDIGO=(55 "MEDIUM_INDIGO" "#5f00af" "Violet")
INDIGO=(56 "INDIGO" "#5f00d7" "Violet")
BRIGHT_INDIGO=(57 "BRIGHT_INDIGO" "#5f00ff" "Violet")
DARK_OLIVE=(58 "DARK_OLIVE" "#5f5f00" "Green")
DIM_GRAY=(59 "DIM_GRAY" "#5f5f5f" "Grey")
KIMBERLY=(60 "KIMBERLY" "#5f5f87" "Violet")
RICH_BLUE=(61 "RICH_BLUE" "#5f5faf" "Blue")
SLATE=(62 "SLATE" "#5f5fd7" "Blue")
NEON_BLUE=(63 "NEON_BLUE" "#5f5fff" "Blue")
MEDIUM_OLIVE=(64 "MEDIUM_OLIVE" "#5f8700" "Green")
HIPPIE_GREEN=(65 "HIPPIE_GREEN" "#5f875f" "Green")
HOKI=(66 "HOKI" "#5f8787" "Blue")
AIR_FORCE_BLUE=(67 "AIR_FORCE_BLUE" "#5f87af" "Blue")
DARK_PICTON_BLUE=(68 "DARK_PICTON_BLUE" "#5f87d7" "Blue")
DARK_SLATE_BLUE=(69 "DARK_SLATE_BLUE" "#5f87ff" "Blue")
OLIVE=(70 "OLIVE" "#5faf00" "Green")
FERN=(71 "FERN" "#5faf5f" "Green")
KEPPEL=(72 "KEPPEL" "#5faf87" "Green")
FOUNTAIN_BLUE=(73 "FOUNTAIN_BLUE" "#5fafaf" "Blue")
PICTON_BLUE=(74 "PICTON_BLUE" "#5fafd7" "Blue")
DARK_MAYA_BLUE=(75 "DARK_MAYA_BLUE" "#5fafff" "Blue")
EMERALD=(76 "EMERALD" "#5fd700" "Green")
DARK_PASTEL_GREEN=(77 "DARK_PASTEL_GREEN" "#5fd75f" "Green")
PASTEL_GREEN=(78 "PASTEL_GREEN" "#5fd787" "Green")
DARK_AQUAMARINE=(79 "DARK_AQUAMARINE" "#5fd7af" "Blue")
MEDIUM_TURQUOISE=(80 "MEDIUM_TURQUOISE" "#5fd7d7" "Blue")
MAYA_BLUE=(81 "MAYA_BLUE" "#5fd7ff" "Blue")
LIGHT_GREEN=(82 "LIGHT_GREEN" "#5fff00" "Green")
BRIGHT_GREEN=(83 "BRIGHT_GREEN" "#5fff5f" "Green")
SCREAMIN_GREEN=(84 "SCREAMIN_GREEN" "#5fff87" "Green")
MEDIUM_AQUAMARINE=(85 "MEDIUM_AQUAMARINE" "#5fffaf" "Blue")
AQUAMARINE=(86 "AQUAMARINE" "#5fffd7" "Blue")
BABY_BLUE=(87 "BABY_BLUE" "#5fffff" "Blue")
DARK_RED=(88 "DARK_RED" "#870000" "Red")
DARK_EGGPLANT=(89 "DARK_EGGPLANT" "#87005f" "Violet")
DARK_MAGENTA=(90 "DARK_MAGENTA" "#870087" "Violet")
DARK_VIOLET=(91 "DARK_VIOLET" "#8700af" "Violet")
VIOLET=(92 "VIOLET" "#8700d7" "Violet")
LIGHT_INDIGO=(93 "LIGHT_INDIGO" "#8700ff" "Violet")
BRIGHT_OLIVE=(94 "BRIGHT_OLIVE" "#875f00" "Green")
LIGHT_WOOD=(95 "LIGHT_WOOD" "#875f5f" "Brown")
TRENDY_PINK=(96 "TRENDY_PINK" "#875f87" "Violet")
BLUE_MARGUERITE=(97 "BLUE_MARGUERITE" "#875faf" "Violet")
MEDIUM_PURPLE=(98 "MEDIUM_PURPLE" "#875fd7" "Violet")
MEDIUM_SLATE_BLUE=(99 "MEDIUM_SLATE_BLUE" "#875fff" "Blue")
LIGHT_OLIVE=(100 "LIGHT_OLIVE" "#878700" "Green")
BANDICOOT=(101 "BANDICOOT" "#87875f" "Green")
SUVA_GREY=(102 "SUVA_GREY" "#878787" "Grey")
SHIP_COVE=(103 "SHIP_COVE" "#8787af" "Blue")
PORTAGE=(104 "PORTAGE" "#8787d7" "Blue")
SLATE_BLUE=(105 "SLATE_BLUE" "#8787ff" "Blue")
DARK_CITRUS=(106 "DARK_CITRUS" "#87af00" "Green")
CHELSEA_CUCUMBER=(107 "CHELSEA_CUCUMBER" "#87af5f" "Green")
DARK_SEA_GREEN=(108 "DARK_SEA_GREEN" "#87af87" "Green")
ZIGGURAT=(109 "ZIGGURAT" "#87afaf" "Blue")
SEAGULL=(110 "SEAGULL" "#87afd7" "Blue")
LIGHT_MAYA_BLUE=(111 "LIGHT_MAYA_BLUE" "#87afff" "Blue")
LAWN_GREEN=(112 "LAWN_GREEN" "#87d700" "Green")
LIGHT_PASTEL_GREEN=(113 "LIGHT_PASTEL_GREEN" "#87d75f" "Green")
GOSSIP=(114 "GOSSIP" "#87d787" "Green")
BERMUDA=(115 "BERMUDA" "#87d7af" "Green")
RIPTIDE=(116 "RIPTIDE" "#87d7d7" "Green")
DARK_COLUMBIA_BLUE=(117 "COLUMBIA_BLUE" "#87d7ff" "Blue")
CHARTREUSE=(118 "CHARTREUSE" "#87ff00" "Green")
BRIGHT_SCREAMIN_GREEN=(119 "BRIGHT_SCREAMIN_GREEN" "#87ff5f" "Green")
DARK_MINT_GREEN=(120 "DARK_MINT_GREEN" "#87ff87" "Green")
MEDIUM_MINT_GREEN=(121 "MEDIUM_MINT_GREEN" "#87ffaf" "Green")
BRIGHT_AQUAMARINE=(122 "BRIGHT_AQUAMARINE" "#87ffd7" "Blue")
ELECTRIC_BLUE=(123 "ELECTRIC_BLUE" "#87ffff" "Blue")
DARK_FREE_SPEECH_RED=(124 "DARK_FREE_SPEECH_RED" "#af0000" "Red")
EGGPLANT=(125 "EGGPLANT" "#af005f" "Violet")
BRIGHT_EGGPLANT=(126 "BRIGHT_EGGPLANT" "#af0087" "Violet")
MEDIUM_MAGENTA=(127 "MEDIUM_MAGENTA" "#af00af" "Violet")
BRIGHT_VIOLET=(128 "BRIGHT_VIOLET" "#af00d7" "Violet")
ELECTRIC_PURPLE=(129 "ELECTRIC_PURPLE" "#af00ff" "Violet")
TAWNY=(130 "TAWNY" "#af5f00" "Orange")
CORAL_TREE=(131 "CORAL_TREE" "#af5f5f" "Red")
TAPESTRY=(132 "TAPESTRY" "#af5f87" "Red")
VIOLET_BLUE=(133 "VIOLET_BLUE" "#af5faf" "Violet")
MEDIUM_ORCHID=(134 "MEDIUM_ORCHID" "#af5fd7" "Violet")
BRIGHT_SLATE_BLUE=(135 "BRIGHT_SLATE_BLUE" "#af5fff" "Blue")
DARK_GOLDENROD=(136 "DARK_GOLDENROD" "#af8700" "Yellow")
TEAK=(137 "TEAK" "#af875f" "Yellow")
THATCH=(138 "THATCH" "#af8787" "Brown")
LONDON_HUE=(139 "LONDON_HUE" "#af87af" "Violet")
WISTERIA=(140 "WISTERIA" "#af87d7" "Violet")
LIGHT_SLATE_BLUE=(141 "LIGHT_SLATE_BLUE" "#af87ff" "Blue")
CITRUS=(142 "CITRUS" "#afaf00" "Green")
OLIVE_GREEN=(143 "OLIVE_GREEN" "#afaf5f" "Green")
NEUTRAL_GREEN=(144 "NEUTRAL_GREEN" "#afaf87" "Green")
DARK_GRAY=(145 "DARK_GRAY" "#afafaf" "Grey")
MOON_RAKER=(146 "MOON_RAKER" "#afafd7" "Violet")
DARK_LAVENDER_BLUE=(147 "DARK_LAVENDER_BLUE" "#afafff" "Blue")
DARK_SPRING_BUD=(148 "DARK_SPRING_BUD" "#afd700" "Green")
CONIFER=(149 "CONIFER" "#afd75f" "Green")
FEIJOA=(150 "FEIJOA" "#afd787" "Green")
CHINOOK=(151 "CHINOOK" "#afd7af" "Green")
SCANDAL=(152 "SCANDAL" "#afd7d7" "Green")
COLUMBIA_BLUE=(153 "DARK_COLUMBIA_BLUE" "#afd7ff" "Blue")
SPRING_BUD=(154 "SPRING_BUD" "#afff00" "Green")
GREEN_YELLOW=(155 "GREEN_YELLOW" "#afff5f" "Green")
MINT_GREEN=(156 "MINT_GREEN" "#afff87" "Green")
BRIGHT_MINT_GREEN=(157 "BRIGHT_MINT_GREEN" "#afffaf" "Green")
LIGHT_AQUAMARINE=(158 "LIGHT_AQUAMARINE" "#afffd7" "Blue")
BRIGHT_COLUMBIA_BLUE=(159 "COLUMBIA_BLUE" "#afffff" "Blue")
FREE_SPEECH_RED=(160 "FREE_SPEECH_RED" "#d70000" "Red")
DARK_RAZZMATAZZ=(161 "DARK_RAZZMATAZZ" "#d7005f" "Red")
DARK_HOLLYWOOD_CERISE=(162 "DARK_HOLLYWOOD_CERISE" "#d70087" "Red")
MAGENTA=(163 "MAGENTA" "#d700af" "Violet")
BRIGHT_MAGENTA=(164 "BRIGHT_MAGENTA" "#d700d7" "Violet")
PSYCHEDELIC_PURPLE=(165 "PSYCHEDELIC_PURPLE" "#d700ff" "Violet")
TENNE=(166 "TENNE" "#d75f00" "Orange")
ROMAN=(167 "ROMAN" "#d75f5f" "Red")
DARK_VIOLET_RED=(168 "DARK_VIOLET_RED" "#d75f87" "Red")
VIOLET_RED=(169 "VIOLET_RED" "#d75faf" "Red")
ORCHID=(170 "ORCHID" "#d75fd7" "Violet")
DARK_HELIOTROPE=(171 "DARK_HELIOTROPE" "#d75fff" "Violet")
MANGO_TANGO=(172 "MANGO_TANGO" "#d78700" "Orange")
COPPER=(173 "COPPER" "#d7875f" "Red")
MY_PINK=(174 "MY_PINK" "#d78787" "Red")
KOBI=(175 "KOBI" "#d787af" "Red")
PLUM=(176 "PLUM" "#d787d7" "Violet")
HELIOTROPE=(177 "HELIOTROPE" "#d787ff" "Violet")
GOLDEN_POPPY=(178 "GOLDEN_POPPY" "#d7af00" "Yellow")
EQUATOR=(179 "EQUATOR" "#d7af5f" "Yellow")
CALICO=(180 "CALICO" "#d7af87" "Brown")
PINK_FLARE=(181 "PINK_FLARE" "#d7afaf" "Red")
FRENCH_LILAC=(182 "FRENCH_LILAC" "#d7afd7" "Violet")
MAUVE=(183 "MAUVE" "#d7afff" "Violet")
SCHOOL_BUS_YELLOW=(184 "SCHOOL_BUS_YELLOW" "#d7d700" "Yellow")
GOLDENROD=(185 "GOLDENROD" "#d7d75f" "Yellow")
DECO=(186 "DECO" "#d7d787" "Green")
ATHS_SPECIAL=(187 "ATHS_SPECIAL" "#d7d7af" "Yellow")
LIGHT_GREY=(188 "LIGHT_GREY" "#d7d7d7" "Grey")
LAVENDER_BLUE=(189 "LAVENDER_BLUE" "#d7d7ff" "Blue")
CHARTREUSE_YELLOW=(190 "CHARTREUSE_YELLOW" "#d7ff00" "Yellow")
LEMON=(191 "LEMON" "#d7ff5f" "Yellow")
DARK_CANARY=(192 "DARK_CANARY" "#d7ff87" "Yellow")
MEDIUM_CANARY=(193 "MEDIUM_CANARY" "#d7ffaf" "Yellow")
HONEYDEW=(194 "HONEYDEW" "#d7ffd7" "White")
LIGHT_CYAN=(195 "LIGHT_CYAN" "#d7ffff" "Blue")
RED=(196 "RED" "#ff0000" "Red")
RAZZMATAZZ=(197 "RAZZMATAZZ" "#ff005f" "Red")
DEEP_PINK=(198 "DEEP_PINK" "#ff0087" "Red")
HOLLYWOOD_CERISE=(199 "HOLLYWOOD_CERISE" "#ff00af" "Red")
HOT_MAGENTA=(200 "HOT_MAGENTA" "#ff00d7" "Red")
LIGHT_MAGENTA=(201 "LIGHT_MAGENTA" "#ff00ff" "Violet")
SAFETY_ORANGE=(202 "SAFETY_ORANGE" "#ff5f00" "Orange")
BITTERSWEET=(203 "BITTERSWEET" "#ff5f5f" "Orange")
WILD_WATERMELON=(204 "WILD_WATERMELON" "#ff5f87" "Red")
HOT_PINK=(205 "HOT_PINK" "#ff5faf" "Red")
PINK=(206 "PINK" "#ff5fd7" "Violet")
PINK_FLAMINGO=(207 "PINK_FLAMINGO" "#ff5fff" "Red")
DARK_ORANGE=(208 "DARK_ORANGE" "#ff8700" "Orange")
CORAL=(209 "CORAL" "#ff875f" "Orange")
MONA_LISA=(210 "MONA_LISA" "#ff8787" "Red")
TICKLE_ME_PINK=(211 "TICKLE_ME_PINK" "#ff87af" "Red")
NEON_PINK=(212 "NEON_PINK" "#ff87d7" "Violet")
FUCHSIA_PINK=(213 "FUCHSIA_PINK" "#ff87ff" "Red")
ORANGE=(214 "ORANGE" "#ffaf00" "Orange")
RAJAH=(215 "RAJAH" "#ffaf5f" "Orange")
MACARONI_AND_CHEESE=(216 "MACARONI_AND_CHEESE" "#ffaf87" "Orange")
MELON=(217 "MELON" "#ffafaf" "Red")
COTTON_CANDY=(218 "COTTON_CANDY" "#ffafd7" "Red")
LAVENDER_ROSE=(219 "LAVENDER_ROSE" "#ffafff" "Red")
GOLD=(220 "GOLD" "#ffd700" "Yellow")
DANDELION=(221 "DANDELION" "#ffd75f" "Yellow")
SALOMIE=(222 "SALOMIE" "#ffd787" "Yellow")
NAVAJO_WHITE=(223 "NAVAJO_WHITE" "#ffd7af" "Brown")
MISTY_ROSE=(224 "MISTY_ROSE" "#ffd7d7" "Violet")
LAVENDER_BLUSH=(225 "LAVENDER_BLUSH" "#ffd7ff" "Violet")
YELLOW=(226 "YELLOW" "#ffff00" "Yellow")
LASER_LEMON=(227 "LASER_LEMON" "#ffff5f" "Yellow")
CANARY=(228 "CANARY" "#ffff87" "Yellow")
BRIGHT_CANARY=(229 "BRIGHT_CANARY" "#ffffaf" "Yellow")
CREAM=(230 "CREAM" "#ffffd7" "White")
WHITE=(231 "WHITE" "#ffffff" "White")

#-----------------------------------------------------------
# grayscale ramp
#-----------------------------------------------------------
BLACK_100=(232 "BLACK_100" "#080808" "Black")
BLACK_90=(233 "BLACK_90" "#121212" "Black")
GRAY_5=(234 "GRAY_5" "#1c1c1c" "Grey")
GRAY_10=(235 "GRAY_10" "#262626" "Grey")
GRAY_15=(236 "GRAY_15" "#303030" "Grey")
GRAY_20=(237 "GRAY_20" "#3a3a3a" "Grey")
GRAY_25=(238 "GRAY_25" "#444444" "Grey")
GRAY_30=(239 "GRAY_30" "#4e4e4e" "Grey")
GRAY_35=(240 "GRAY_35" "#585858" "Grey")
GRAY_40=(241 "GRAY_40" "#606060" "Grey")
GRAY_45=(242 "GRAY_45" "#666666" "Grey")
GRAY_50=(243 "GRAY_50" "#767676" "Grey")
GRAY_55=(244 "GRAY_55" "#808080" "Grey")
GRAY_60=(245 "GRAY_60" "#8a8a8a" "Grey")
GRAY_65=(246 "GRAY_65" "#949494" "Grey")
GRAY_70=(247 "GRAY_70" "#9e9e9e" "Grey")
GRAY_75=(248 "GRAY_75" "#a8a8a8" "Grey")
GRAY_80=(249 "GRAY_80" "#b2b2b2" "Grey")
GRAY_85=(250 "GRAY_85" "#bcbcbc" "Grey")
GRAY_90=(251 "GRAY_90" "#c6c6c6" "Grey")
GRAY_95=(252 "GRAY_95" "#d0d0d0" "Grey")
GRAY_100=(253 "GRAY_100" "#dadada" "White")
WHITE_90=(254 "WHITE_90" "#e4e4e4" "White")
WHITE_100=(255 "WHITE_100" "#eeeeee" "White")

#-----------------------------------------------------------
# color formatting codes
#-----------------------------------------------------------
FORMATTING_ESCAPE_SEQUENCE="\e[m"
FORMATTING_RESET_SEQUENCE="\e[0m"
COLORIZE_BACKGROUND_CODE="48;5;"
COLORIZE_FOREGROUND_CODE="38;5;"
OPEN_ESCAPE_SEQUENCE="\e["
CLOSE_ESCAPE_SEQUENCE="m"

CODE_SEPARATOR=";"
RESET_ALL_FORMATTING_AND_COLORIZATION="0"
TEXT_FORMAT_BOLD="1"
TEXT_FORMAT_DIM="2"
TEXT_FORMAT_UNDERLINED="4"
TEXT_FORMAT_BLINK="5"
TEXT_FORMAT_INVERT="7"
TEXT_FORMAT_HIDDEN="8"

COLOR_TEXT_CODE=38
COLOR_BACKGROUND_CODE=48

#if starts with \e add code, but check to see if code already exists
#replace if exists otherwise add
#if doesn'T start with \e code then you should wrap in coe
#you can use regex to achieve this

#"\e[1;4;48;5;25;38;5;mHello\e[0m"

formatText()
{
	#declarations
	local formattedString="$1"
	local formattingCodes=
	
	#parse list of formatting codes
	for code in "$@"; do
		if [[ "$code" = "$formattedString" ]]; then
			#this is the string we want to format, so we don't need it
			continue
		fi
		
		#
		if [[ -z $formattingCodes ]]; then
			formattingCodes="${code}"
		else
			formattingCodes="${formattingCodes};${code}"
		fi
	done

	#
	formattedString="\e[${formattingCodes}m${formattedString}"
	if [[ -z "$resetFormatting" ]]; then
		formattedString="${formattedString}\e[2${formattingCodes}m"
	fi

	printf "%s" $formattedString
}

rgbValues()
{
	local hexValue="$1"
	local red=
	local green=
	local blue=

	if [[ ! "$hexValue" =~ [A-Fa-f0-9]{6} ]]; then
		return
	fi

	hexValue="${hexValue/##/}"
	red=$(printf "%d" "0x${hexValue:0:2}")
	green=$(printf "%d" "0x${hexValue:2:2}")
	blue=$(printf "%d" "0x${hexValue:4:2}")

	printf "%s %s %s" "${red}" "${green}" "${blue}"
}

colorizeText()
{
	local colorCode=$1
	local colorizedString="\e[38;5;${colorCode}m$2"
	local resetColorization="$3"
	local colorResetCode="\e[0m"

	#if the user doesn't want a color reset
	if [[ -z "${resetColorization}" ]]; then
		colorizedString="${colorizedString}${colorResetCode}"
	fi

	printf "%s" $colorizedString
}

colorizeBackground()
{
	local colorCode=$1
	local colorizedString="\e[48;5;${colorCode}m$2"
	local resetColorization="$3"
	local colorResetCode="\e[0m"

	#if the user doesn't want a color reset
	if [[ -z "${resetColorization}" ]]; then
		colorizedString="${colorizedString}${colorResetCode}"
	fi

	printf "%s" $colorizedString
}

escapeBraces()
{
	local string="${1}"
	string=${string//\{/\\\{}
	string=${string//\}/\\\}}
	printf "%s" "$string"
}

openEscapeSequence()
{
	local string="${1}"
	local escapeSequenceRegex="^[\\]e\[[0-9\;]*m"

	#check to make sure that the string isn't already escaped
	if [[ "${string}" =~ $escapeSequenceRegex ]]; then
		#keep it D.R.Y.
		printf "%s" "${string}"
	else
		#hasn't been escaped, so add the code
		printf "%s" "${FORMATTING_ESCAPE_SEQUENCE}${string}"
	fi
}

closeEscapeSequence()
{
	local string="${1}"

	printf "%s" "${string}"
}

extractFormattingCodes()
{
	local codes="${1}"
	local extractionRegex="^[\\]e\([124578]{0,1}[;]{0,1}\)\(48;5;[0-9]{1,3}\)\(38;5;[0-9]{1,3}\)m"
	local extractionRegex=".*\\e\[\([124578;]*\){0,1}\(48;5;[0-9]{1,3}[;]{0,1}\){0,1}\(38;5;[0-9]{1,3}\){0,1}m.*"
	extractionRegex=$(escapeBraces "${extractionRegex}")

	codes=$( \
		echo "${codes}" | \
		sed "s/${extractionRegex}/\1\2\3/" \
	)
	printf "%s" "${codes}"
}

insertFormattingCode()
{
	local string="${1}"
	local tag="<t>"
	local formattingCodeString="${2}"


	


	printf "%s\n\n" ${string//$tag/$formattingCodeString}
}

#───────────────────────────────────────────────────────────────────────────────
# Function Test
#───────────────────────────────────────────────────────────────────────────────
if [[ $SCRIPT_SELF_TEST_MODE -eq 1 ]]; then

testOpenEscapeSequence()
{
	local originalString="supercalifragilisticexpialidocious"
	local returnedString=

	#test properly escapes string no escapes
	returnedString=$(openEscapeSequence "${originalString}")
	assertSame \
		"(${BASH_SOURCE}:${LINENO}) Failed to append escape sequence with string." \
		"\\e[m${originalString}" \
		"${returnedString}"

	#test properly escapes string with escapes but none at beginning
	returnedString=$(openEscapeSequence "${originalString}")
	returnedString=$(openEscapeSequence "sing ${returnedString}")
	assertSame \
		"(${BASH_SOURCE}:${LINENO}) Failed to append escape sequence with string." \
		"\\e[msing \\e[m${originalString}" \
		"${returnedString}"

	#test doesn't escape previously escaped string
	returnedString=$(openEscapeSequence "${originalString}")
	returnedString=$(openEscapeSequence "${returnedString}")
	assertSame "(${BASH_SOURCE}:${LINENO}) Failed to detect perviously escaped string." \
		"\\e[m${originalString}" \
		"${returnedString}"

	#test doesn't escape previously escaped string
	returnedString=$( \
		openEscapeSequence \
		"\\e[1;2;4;5;7;8;48;5;22;38;5;44m${originalString}" \
	)
	assertSame "(${BASH_SOURCE}:${LINENO}) Failed to detect perviously escaped string." \
		"\\e[1;2;4;5;7;8;48;5;22;38;5;44m${originalString}" \
		"${returnedString}"
}

testExtractFormattingCodes()
{
	local formatting="2"
	local background="${COLORIZE_BACKGROUND_CODE}20"
	local foreground="${COLORIZE_FOREGROUND_CODE}137"
	local openSequence="${OPEN_ESCAPE_SEQUENCE}"
	local closeSequence="${CLOSE_ESCAPE_SEQUENCE}"
	local separator="${CODE_SEPARATOR}"
	local testSequence=
	local extractedCode=

	#formatting code test
	testSequence="${openSequence}${formatting}${closeSequence}super cali fragi listic expi ali docious"
	extractedCode=$(extractFormattingCodes "${testSequence}")
	assertSame "(${BASH_SOURCE}:${LINENO}) Failed to extract formatting code." \
		"${formatting}" \
		"${extractedCode}"

	#background code test
	testSequence="${openSequence}${background}${closeSequence}super cali fragi listic expi ali docious"
	extractedCode=$(extractFormattingCodes "${testSequence}")
	assertSame "(${BASH_SOURCE}:${LINENO}) Failed to extract background colorization code." \
		"${background}" \
		"${extractedCode}"

	#foreground code test
	testSequence="${openSequence}${foreground}${closeSequence}super cali fragi listic expi ali docious"
	extractedCode=$(extractFormattingCodes "${testSequence}")
	assertSame "(${BASH_SOURCE}:${LINENO}) Failed to extract foreground colorization code." \
		"${foreground}" \
		"${extractedCode}"
	
	#formatting and foreground code test
	testSequence="${openSequence}${formatting}${separator}${foreground}${closeSequence}super cali fragi listic expi ali docious"
	extractedCode=$(extractFormattingCodes "${testSequence}")
	assertSame "(${BASH_SOURCE}:${LINENO}) Failed to extract formatting and foreground colorization code." \
		"${formatting}${separator}${foreground}" \
		"${extractedCode}"

}

oneTimeSetUp()
{
	printf "Running tests on: %s" "${SCRIPT_NAME}"
	printf "Located in      : %s" "${BASH_SOURCE}"
}

tearDown()
{
	printf "$(repeatString "==" 20)\n\n\n"
}

#this is an xUnit family testing framework for shell files
if [[ ! -d "./shunit2-2.0.3" ]]; then
	printf "Downloading test tools for this environment."
	curl -L "http://downloads.sourceforge.net/shunit2/shunit2-2.0.3.tgz" | tar zx
	. shunit2-2.0.3/src/shell/shunit2
	#in an environment where i can't leave testing tools lying around
	rm -rf "./shunit2-2.0.3"
else
	#this is probably a development environment
	. shunit2-2.0.3/src/shell/shunit2
fi

fi