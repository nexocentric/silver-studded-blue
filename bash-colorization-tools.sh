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
SCRIPT_SELF_TEST_MODE=0
SCRIPT_FUNCTION_DEBUG_MODE=0
SCRIPT_FUNCTION_TO_DEBUG=
SCRIPT_VERBOSE_MODE=0
SCRIPT_PATH="$BASH_SOURCE"

#───────────────────────────────────────────────────────────────────────────────
# Script Control Functions
#───────────────────────────────────────────────────────────────────────────────

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
displayScriptHeader()
{
	local scriptName="${SCRIPT_NAME}"

	cat << SCRIPT_HEADER
	$scriptName
SCRIPT_HEADER
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
displayVerboseInformation()
{
	#safety check
	if [[ $# -lt 1 ]]; then
		return
	fi

	#verbose flag checks
	if [[ $# -lt 2 ]] && [[ $SCRIPT_VERBOSE_MODE -eq 0 ]]; then
		return
	fi

	printf "%s\n" "$*" >&2
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
displayScriptUsage()
{
	cat << SCRIPT_USAGE
NAME
	$SCRIPT_NAME - include file for use to quickly build bash scripts

USAGE
	. [$SCRIPT_PATH]
	source [$SCRIPT_PATH]

DESCRIPTION
	This is an include file for use in bash shell scripts. This script is sourced into a script after which the functions contained in this can be used freely.

	Information about this script can be obtained by running the script with the following flags:

	-D	run a script wide debug on all functions available for export in this script

	-d ["FUNCTION_NAME"]	run specified function for debug

	-h	display this information

	-T | -t	run all test suites on this script to ensure that it is safe for use in your environment

	-V	display version information

	-v	display verbose information when running script tests

FUNCTION LIST
	$SCRIPT_NAME contains the following functions:

	stringToArray
	assertInterger
	repeatString
	reverseString
	replaceString

	For more information on the usage of each function please run:
	. [$SCRIPT_PATH] -d "FUNCTION_NAME -h"

AUTHOR
	Written by Dodzi Y. Dzakuma.

REPORTING BUGS
	Report $SCRIPT_NAME on the GitHub page of this script.

COPYRIGHT
	The MIT License (MIT)
	Copyright (c) 2013 Dodzi Y. Dzakuma (http://www.nexocentric.com)

SCRIPT_USAGE
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
cleanUp()
{
	#declarations
	terminationFlag=$1

	#check to see if script was terminated prematurely
	if [[ -n "${terminationFlag}" ]]; then
		printf "%s terminated.\n" "${SCRIPT_NAME}"
		return 1
	fi

	#successful completion
	printf "%s successfully completed operation.\n" "${SCRIPT_NAME}"
}

#───────────────────────────────────────────────────────────────────────────────
# Script Options Parsing
#───────────────────────────────────────────────────────────────────────────────
while getopts $SCRIPT_OPTION_FLAGS scriptOption; do
	case "${scriptOption}" in
		#debug
		D )
			SCRIPT_DEBUG_MODE=1
		;;
		#debug function
		d )
			SCRIPT_FUNCTION_DEBUG_MODE=1
			SCRIPT_FUNCTION_TO_DEBUG="${OPTARG}"
		;;
		# turn on self testing
		T | t )
			SCRIPT_SELF_TEST_MODE=1
		;;
		# display the script usage menu on help or invalid argments
		h )
			displayScriptHeader
			displayScriptUsage
			exit 0
		;;
		#version information
		V )
			cat << VERSION_INFORMATION
${SCRIPT_NAME} ${SCRIPT_VERSION}
The MIT License (MIT)
Copyright (c) 2014 Dodzi Y. Dzakuma (http://www.nexocentric.com)

Thank you for taking the time to look through and/or use this script.
Your support is greatly appreciated.
VERSION_INFORMATION
			exit 0
		;;
		# verbose mode
		v )
			SCRIPT_VERBOSE_MODE=1
		;;
	esac
done

#remove parsed options from the list
shift $((OPTIND-1))

#───────────────────────────────────────────────────────────────────────────────
# Script Constants
#───────────────────────────────────────────────────────────────────────────────

#-----------------------------------------------------------
# color name index modifiers
#-----------------------------------------------------------
export COLOR_CODE=0
export COLOR_NAME=1
export COLOR_HEX_CODE=2
export COLOR_HUE=3

#-----------------------------------------------------------
# default system colors
#-----------------------------------------------------------
export BLACK_SYSTEM=(0 "BLACK_SYSTEM" "#000000" "Black")
export RED_SYSTEM=(1 "RED_SYSTEM" "#800000" "Brown")
export GREEN_SYSTEM=(2 "GREEN_SYSTEM" "#008000" "Green")
export YELLOW_SYSTEM=(3 "YELLOW_SYSTEM" "#808000" "Green")
export BLUE_SYSTEM=(4 "BLUE_SYSTEM" "#000080" "Blue")
export MAGENTA_SYSTEM=(5 "MAGENTA_SYSTEM" "#800080" "Violet")
export CYAN_SYSTEM=(6 "CYAN_SYSTEM" "#008080" "Blue")
export LIGHT_GRAY_SYSTEM=(7 "LIGHT_GRAY_SYSTEM" "#c0c0c0" "Grey")
export DARK_GRAY_SYSTEM=(8 "DARK_GRAY_SYSTEM" "#808080" "Grey")
export BRIGHT_RED_SYSTEM=(9 "BRIGHT_RED_SYSTEM" "#ff0000" "Red")
export BRIGHT_GRAY_SYSTEM=(10 "BRIGHT_GRAY_SYSTEM" "#00ff00" "Green")
export BRIGHT_YELLOW_SYSTEM=(11 "BRIGHT_YELLOW_SYSTEM" "#ffff00" "Yellow")
export BRIGHT_BLUE_SYSTEM=(12 "BRIGHT_BLUE_SYSTEM" "#0000ff" "Blue")
export BRIGHT_MAGENTA_SYSTEM=(13 "BRIGHT_MAGENTA_SYSTEM" "#ff00ff" "Violet")
export BRIGHT_CYAN_SYSTEM=(14 "BRIGHT_CYAN_SYSTEM" "#00ffff" "Blue")
export WHITE_SYSTEM=(15 "WHITE_SYSTEM" "#ffffff" "White")

#-----------------------------------------------------------
# 6 by 6 by 6 color space
#-----------------------------------------------------------
export BLACK=(16 "BLACK" "#000000" "Black")
export NAVY=(17 "NAVY" "#00005f" "Blue")
export DARK_BLUE=(18 "DARK_BLUE" "#000087" "Blue")
export NEW_MIDNIGHT_BLUE=(19 "NEW_MIDNIGHT_BLUE" "#0000af" "Blue")
export MEDIUM_BLUE=(20 "MEDIUM_BLUE" "#0000d7" "Blue")
export BLUE=(21 "BLUE" "#0000ff" "Blue")
export DARK_GREEN=(22 "DARK_GREEN" "#005f00" "Green")
export MOSQUE=(23 "MOSQUE" "#005f5f" "Green")
export BLUE_LAGOON=(24 "BLUE_LAGOON" "#005f87" "Green")
export COBALT=(25 "COBALT" "#005faf" "Blue")
export NAVY_BLUE=(26 "NAVY_BLUE" "#005fd7" "Blue")
export DARK_DODGER_BLUE=(27 "DARK_DODGER_BLUE" "#005fff" "Blue")
export MEDIUM_GREEN=(28 "MEDIUM_GREEN" "#008700" "Green")
export OBSERVATORY=(29 "OBSERVATORY" "#00875f" "Green")
export DARK_CYAN=(30 "DARK_CYAN" "#008787" "Green")
export CERULEAN=(31 "CERULEAN" "#0087af" "Blue")
export PACIFIC_BLUE=(32 "PACIFIC_BLUE" "#0087d7" "Blue")
export MEDIUM_DODGER_BLUE=(33 "MEDIUM_DODGER_BLUE" "#0087ff" "Blue")
export ISLAMIC_GREEN=(34 "ISLAMIC_GREEN" "#00af00" "Green")
export JADE=(35 "JADE" "#00af5f" "Green")
export PERSIAN_GREEN=(36 "PERSIAN_GREEN" "#00af87" "Green")
export BONDI_BLUE=(37 "BONDI_BLUE" "#00afaf" "Blue")
export IRIS_BLUE=(38 "IRIS_BLUE" "#00afd7" "Blue")
export DARK_SKY_BLUE=(39 "DARK_SKY_BLUE" "#00afff" "Blue")
export DARK_LIME=(40 "DARK_LIME" "#00d700" "Green")
export MALACHITE=(41 "MALACHITE" "#00d75f" "Green")
export DEEP_CARIBBEAN_GREEN=(42 "DEEP_CARIBBEAN_GREEN" "#00d787" "Green")
export CARIBBEAN_GREEN=(43 "CARIBBEAN_GREEN" "#00d7af" "Green")
export DARK_TURQUOISE=(44 "DARK_TURQUOISE" "#00d7d7" "Blue")
export LIGHT_SKY_BLUE=(45 "LIGHT_SKY_BLUE" "#00d7ff" "Blue")
export LIGHT_LIME=(46 "LIGHT_LIME" "#00ff00" "Green")
export DARK_SPRING_GREEN=(47 "DARK_SPRING_GREEN" "#00ff5f" "Green")
export SPRING_GREEN=(48 "SPRING_GREEN" "#00ff87" "Green")
export MEDIUM_SPRING_GREEN=(49 "MEDIUM_SPRING_GREEN" "#00ffaf" "Green")
export BRIGHT_TURQUOISE=(50 "BRIGHT_TURQUOISE" "#00ffd7" "Blue")
export AQUA=(51 "AQUA" "#00ffff" "Blue")
export MAROON=(52 "MAROON" "#5f0000" "Brown")
export TYRIAN_PURPLE=(53 "TYRIAN_PURPLE" "#5f005f" "Violet")
export DARK_INDIGO=(54 "DARK_INDIGO" "#5f0087" "Violet")
export MEDIUM_INDIGO=(55 "MEDIUM_INDIGO" "#5f00af" "Violet")
export INDIGO=(56 "INDIGO" "#5f00d7" "Violet")
export BRIGHT_INDIGO=(57 "BRIGHT_INDIGO" "#5f00ff" "Violet")
export DARK_OLIVE=(58 "DARK_OLIVE" "#5f5f00" "Green")
export DIM_GRAY=(59 "DIM_GRAY" "#5f5f5f" "Grey")
export KIMBERLY=(60 "KIMBERLY" "#5f5f87" "Violet")
export RICH_BLUE=(61 "RICH_BLUE" "#5f5faf" "Blue")
export SLATE=(62 "SLATE" "#5f5fd7" "Blue")
export NEON_BLUE=(63 "NEON_BLUE" "#5f5fff" "Blue")
export MEDIUM_OLIVE=(64 "MEDIUM_OLIVE" "#5f8700" "Green")
export HIPPIE_GREEN=(65 "HIPPIE_GREEN" "#5f875f" "Green")
export HOKI=(66 "HOKI" "#5f8787" "Blue")
export AIR_FORCE_BLUE=(67 "AIR_FORCE_BLUE" "#5f87af" "Blue")
export DARK_PICTON_BLUE=(68 "DARK_PICTON_BLUE" "#5f87d7" "Blue")
export DARK_SLATE_BLUE=(69 "DARK_SLATE_BLUE" "#5f87ff" "Blue")
export OLIVE=(70 "OLIVE" "#5faf00" "Green")
export FERN=(71 "FERN" "#5faf5f" "Green")
export KEPPEL=(72 "KEPPEL" "#5faf87" "Green")
export FOUNTAIN_BLUE=(73 "FOUNTAIN_BLUE" "#5fafaf" "Blue")
export PICTON_BLUE=(74 "PICTON_BLUE" "#5fafd7" "Blue")
export DARK_MAYA_BLUE=(75 "DARK_MAYA_BLUE" "#5fafff" "Blue")
export EMERALD=(76 "EMERALD" "#5fd700" "Green")
export DARK_PASTEL_GREEN=(77 "DARK_PASTEL_GREEN" "#5fd75f" "Green")
export PASTEL_GREEN=(78 "PASTEL_GREEN" "#5fd787" "Green")
export DARK_AQUAMARINE=(79 "DARK_AQUAMARINE" "#5fd7af" "Blue")
export MEDIUM_TURQUOISE=(80 "MEDIUM_TURQUOISE" "#5fd7d7" "Blue")
export MAYA_BLUE=(81 "MAYA_BLUE" "#5fd7ff" "Blue")
export LIGHT_GREEN=(82 "LIGHT_GREEN" "#5fff00" "Green")
export BRIGHT_GREEN=(83 "BRIGHT_GREEN" "#5fff5f" "Green")
export SCREAMIN_GREEN=(84 "SCREAMIN_GREEN" "#5fff87" "Green")
export MEDIUM_AQUAMARINE=(85 "MEDIUM_AQUAMARINE" "#5fffaf" "Blue")
export AQUAMARINE=(86 "AQUAMARINE" "#5fffd7" "Blue")
export BABY_BLUE=(87 "BABY_BLUE" "#5fffff" "Blue")
export DARK_RED=(88 "DARK_RED" "#870000" "Red")
export DARK_EGGPLANT=(89 "DARK_EGGPLANT" "#87005f" "Violet")
export DARK_MAGENTA=(90 "DARK_MAGENTA" "#870087" "Violet")
export DARK_VIOLET=(91 "DARK_VIOLET" "#8700af" "Violet")
export VIOLET=(92 "VIOLET" "#8700d7" "Violet")
export LIGHT_INDIGO=(93 "LIGHT_INDIGO" "#8700ff" "Violet")
export BRIGHT_OLIVE=(94 "BRIGHT_OLIVE" "#875f00" "Green")
export LIGHT_WOOD=(95 "LIGHT_WOOD" "#875f5f" "Brown")
export TRENDY_PINK=(96 "TRENDY_PINK" "#875f87" "Violet")
export BLUE_MARGUERITE=(97 "BLUE_MARGUERITE" "#875faf" "Violet")
export MEDIUM_PURPLE=(98 "MEDIUM_PURPLE" "#875fd7" "Violet")
export MEDIUM_SLATE_BLUE=(99 "MEDIUM_SLATE_BLUE" "#875fff" "Blue")
export LIGHT_OLIVE=(100 "LIGHT_OLIVE" "#878700" "Green")
export BANDICOOT=(101 "BANDICOOT" "#87875f" "Green")
export SUVA_GREY=(102 "SUVA_GREY" "#878787" "Grey")
export SHIP_COVE=(103 "SHIP_COVE" "#8787af" "Blue")
export PORTAGE=(104 "PORTAGE" "#8787d7" "Blue")
export SLATE_BLUE=(105 "SLATE_BLUE" "#8787ff" "Blue")
export DARK_CITRUS=(106 "DARK_CITRUS" "#87af00" "Green")
export CHELSEA_CUCUMBER=(107 "CHELSEA_CUCUMBER" "#87af5f" "Green")
export DARK_SEA_GREEN=(108 "DARK_SEA_GREEN" "#87af87" "Green")
export ZIGGURAT=(109 "ZIGGURAT" "#87afaf" "Blue")
export SEAGULL=(110 "SEAGULL" "#87afd7" "Blue")
export LIGHT_MAYA_BLUE=(111 "LIGHT_MAYA_BLUE" "#87afff" "Blue")
export LAWN_GREEN=(112 "LAWN_GREEN" "#87d700" "Green")
export LIGHT_PASTEL_GREEN=(113 "LIGHT_PASTEL_GREEN" "#87d75f" "Green")
export GOSSIP=(114 "GOSSIP" "#87d787" "Green")
export BERMUDA=(115 "BERMUDA" "#87d7af" "Green")
export RIPTIDE=(116 "RIPTIDE" "#87d7d7" "Green")
export DARK_COLUMBIA_BLUE=(117 "COLUMBIA_BLUE" "#87d7ff" "Blue")
export CHARTREUSE=(118 "CHARTREUSE" "#87ff00" "Green")
export BRIGHT_SCREAMIN_GREEN=(119 "BRIGHT_SCREAMIN_GREEN" "#87ff5f" "Green")
export DARK_MINT_GREEN=(120 "DARK_MINT_GREEN" "#87ff87" "Green")
export MEDIUM_MINT_GREEN=(121 "MEDIUM_MINT_GREEN" "#87ffaf" "Green")
export BRIGHT_AQUAMARINE=(122 "BRIGHT_AQUAMARINE" "#87ffd7" "Blue")
export ELECTRIC_BLUE=(123 "ELECTRIC_BLUE" "#87ffff" "Blue")
export DARK_FREE_SPEECH_RED=(124 "DARK_FREE_SPEECH_RED" "#af0000" "Red")
export EGGPLANT=(125 "EGGPLANT" "#af005f" "Violet")
export BRIGHT_EGGPLANT=(126 "BRIGHT_EGGPLANT" "#af0087" "Violet")
export MEDIUM_MAGENTA=(127 "MEDIUM_MAGENTA" "#af00af" "Violet")
export BRIGHT_VIOLET=(128 "BRIGHT_VIOLET" "#af00d7" "Violet")
export ELECTRIC_PURPLE=(129 "ELECTRIC_PURPLE" "#af00ff" "Violet")
export TAWNY=(130 "TAWNY" "#af5f00" "Orange")
export CORAL_TREE=(131 "CORAL_TREE" "#af5f5f" "Red")
export TAPESTRY=(132 "TAPESTRY" "#af5f87" "Red")
export VIOLET_BLUE=(133 "VIOLET_BLUE" "#af5faf" "Violet")
export MEDIUM_ORCHID=(134 "MEDIUM_ORCHID" "#af5fd7" "Violet")
export BRIGHT_SLATE_BLUE=(135 "BRIGHT_SLATE_BLUE" "#af5fff" "Blue")
export DARK_GOLDENROD=(136 "DARK_GOLDENROD" "#af8700" "Yellow")
export TEAK=(137 "TEAK" "#af875f" "Yellow")
export THATCH=(138 "THATCH" "#af8787" "Brown")
export LONDON_HUE=(139 "LONDON_HUE" "#af87af" "Violet")
export WISTERIA=(140 "WISTERIA" "#af87d7" "Violet")
export LIGHT_SLATE_BLUE=(141 "LIGHT_SLATE_BLUE" "#af87ff" "Blue")
export CITRUS=(142 "CITRUS" "#afaf00" "Green")
export OLIVE_GREEN=(143 "OLIVE_GREEN" "#afaf5f" "Green")
export NEUTRAL_GREEN=(144 "NEUTRAL_GREEN" "#afaf87" "Green")
export DARK_GRAY=(145 "DARK_GRAY" "#afafaf" "Grey")
export MOON_RAKER=(146 "MOON_RAKER" "#afafd7" "Violet")
export DARK_LAVENDER_BLUE=(147 "DARK_LAVENDER_BLUE" "#afafff" "Blue")
export DARK_SPRING_BUD=(148 "DARK_SPRING_BUD" "#afd700" "Green")
export CONIFER=(149 "CONIFER" "#afd75f" "Green")
export FEIJOA=(150 "FEIJOA" "#afd787" "Green")
export CHINOOK=(151 "CHINOOK" "#afd7af" "Green")
export SCANDAL=(152 "SCANDAL" "#afd7d7" "Green")
export COLUMBIA_BLUE=(153 "DARK_COLUMBIA_BLUE" "#afd7ff" "Blue")
export SPRING_BUD=(154 "SPRING_BUD" "#afff00" "Green")
export GREEN_YELLOW=(155 "GREEN_YELLOW" "#afff5f" "Green")
export MINT_GREEN=(156 "MINT_GREEN" "#afff87" "Green")
export BRIGHT_MINT_GREEN=(157 "BRIGHT_MINT_GREEN" "#afffaf" "Green")
export LIGHT_AQUAMARINE=(158 "LIGHT_AQUAMARINE" "#afffd7" "Blue")
export BRIGHT_COLUMBIA_BLUE=(159 "COLUMBIA_BLUE" "#afffff" "Blue")
export FREE_SPEECH_RED=(160 "FREE_SPEECH_RED" "#d70000" "Red")
export DARK_RAZZMATAZZ=(161 "DARK_RAZZMATAZZ" "#d7005f" "Red")
export DARK_HOLLYWOOD_CERISE=(162 "DARK_HOLLYWOOD_CERISE" "#d70087" "Red")
export MAGENTA=(163 "MAGENTA" "#d700af" "Violet")
export BRIGHT_MAGENTA=(164 "BRIGHT_MAGENTA" "#d700d7" "Violet")
export PSYCHEDELIC_PURPLE=(165 "PSYCHEDELIC_PURPLE" "#d700ff" "Violet")
export TENNE=(166 "TENNE" "#d75f00" "Orange")
export ROMAN=(167 "ROMAN" "#d75f5f" "Red")
export DARK_VIOLET_RED=(168 "DARK_VIOLET_RED" "#d75f87" "Red")
export VIOLET_RED=(169 "VIOLET_RED" "#d75faf" "Red")
export ORCHID=(170 "ORCHID" "#d75fd7" "Violet")
export DARK_HELIOTROPE=(171 "DARK_HELIOTROPE" "#d75fff" "Violet")
export MANGO_TANGO=(172 "MANGO_TANGO" "#d78700" "Orange")
export COPPER=(173 "COPPER" "#d7875f" "Red")
export MY_PINK=(174 "MY_PINK" "#d78787" "Red")
export KOBI=(175 "KOBI" "#d787af" "Red")
export PLUM=(176 "PLUM" "#d787d7" "Violet")
export HELIOTROPE=(177 "HELIOTROPE" "#d787ff" "Violet")
export GOLDEN_POPPY=(178 "GOLDEN_POPPY" "#d7af00" "Yellow")
export EQUATOR=(179 "EQUATOR" "#d7af5f" "Yellow")
export CALICO=(180 "CALICO" "#d7af87" "Brown")
export PINK_FLARE=(181 "PINK_FLARE" "#d7afaf" "Red")
export FRENCH_LILAC=(182 "FRENCH_LILAC" "#d7afd7" "Violet")
export MAUVE=(183 "MAUVE" "#d7afff" "Violet")
export SCHOOL_BUS_YELLOW=(184 "SCHOOL_BUS_YELLOW" "#d7d700" "Yellow")
export GOLDENROD=(185 "GOLDENROD" "#d7d75f" "Yellow")
export DECO=(186 "DECO" "#d7d787" "Green")
export ATHS_SPECIAL=(187 "ATHS_SPECIAL" "#d7d7af" "Yellow")
export LIGHT_GREY=(188 "LIGHT_GREY" "#d7d7d7" "Grey")
export LAVENDER_BLUE=(189 "LAVENDER_BLUE" "#d7d7ff" "Blue")
export CHARTREUSE_YELLOW=(190 "CHARTREUSE_YELLOW" "#d7ff00" "Yellow")
export LEMON=(191 "LEMON" "#d7ff5f" "Yellow")
export DARK_CANARY=(192 "DARK_CANARY" "#d7ff87" "Yellow")
export MEDIUM_CANARY=(193 "MEDIUM_CANARY" "#d7ffaf" "Yellow")
export HONEYDEW=(194 "HONEYDEW" "#d7ffd7" "White")
export LIGHT_CYAN=(195 "LIGHT_CYAN" "#d7ffff" "Blue")
export RED=(196 "RED" "#ff0000" "Red")
export RAZZMATAZZ=(197 "RAZZMATAZZ" "#ff005f" "Red")
export DEEP_PINK=(198 "DEEP_PINK" "#ff0087" "Red")
export HOLLYWOOD_CERISE=(199 "HOLLYWOOD_CERISE" "#ff00af" "Red")
export HOT_MAGENTA=(200 "HOT_MAGENTA" "#ff00d7" "Red")
export LIGHT_MAGENTA=(201 "LIGHT_MAGENTA" "#ff00ff" "Violet")
export SAFETY_ORANGE=(202 "SAFETY_ORANGE" "#ff5f00" "Orange")
export BITTERSWEET=(203 "BITTERSWEET" "#ff5f5f" "Orange")
export WILD_WATERMELON=(204 "WILD_WATERMELON" "#ff5f87" "Red")
export HOT_PINK=(205 "HOT_PINK" "#ff5faf" "Red")
export PINK=(206 "PINK" "#ff5fd7" "Violet")
export PINK_FLAMINGO=(207 "PINK_FLAMINGO" "#ff5fff" "Red")
export DARK_ORANGE=(208 "DARK_ORANGE" "#ff8700" "Orange")
export CORAL=(209 "CORAL" "#ff875f" "Orange")
export MONA_LISA=(210 "MONA_LISA" "#ff8787" "Red")
export TICKLE_ME_PINK=(211 "TICKLE_ME_PINK" "#ff87af" "Red")
export NEON_PINK=(212 "NEON_PINK" "#ff87d7" "Violet")
export FUCHSIA_PINK=(213 "FUCHSIA_PINK" "#ff87ff" "Red")
export ORANGE=(214 "ORANGE" "#ffaf00" "Orange")
export RAJAH=(215 "RAJAH" "#ffaf5f" "Orange")
export MACARONI_AND_CHEESE=(216 "MACARONI_AND_CHEESE" "#ffaf87" "Orange")
export MELON=(217 "MELON" "#ffafaf" "Red")
export COTTON_CANDY=(218 "COTTON_CANDY" "#ffafd7" "Red")
export LAVENDER_ROSE=(219 "LAVENDER_ROSE" "#ffafff" "Red")
export GOLD=(220 "GOLD" "#ffd700" "Yellow")
export DANDELION=(221 "DANDELION" "#ffd75f" "Yellow")
export SALOMIE=(222 "SALOMIE" "#ffd787" "Yellow")
export NAVAJO_WHITE=(223 "NAVAJO_WHITE" "#ffd7af" "Brown")
export MISTY_ROSE=(224 "MISTY_ROSE" "#ffd7d7" "Violet")
export LAVENDER_BLUSH=(225 "LAVENDER_BLUSH" "#ffd7ff" "Violet")
export YELLOW=(226 "YELLOW" "#ffff00" "Yellow")
export LASER_LEMON=(227 "LASER_LEMON" "#ffff5f" "Yellow")
export CANARY=(228 "CANARY" "#ffff87" "Yellow")
export BRIGHT_CANARY=(229 "BRIGHT_CANARY" "#ffffaf" "Yellow")
export CREAM=(230 "CREAM" "#ffffd7" "White")
export WHITE=(231 "WHITE" "#ffffff" "White")

#-----------------------------------------------------------
# grayscale ramp
#-----------------------------------------------------------
export BLACK_100=(232 "BLACK_100" "#080808" "Black")
export BLACK_90=(233 "BLACK_90" "#121212" "Black")
export GRAY_5=(234 "GRAY_5" "#1c1c1c" "Grey")
export GRAY_10=(235 "GRAY_10" "#262626" "Grey")
export GRAY_15=(236 "GRAY_15" "#303030" "Grey")
export GRAY_20=(237 "GRAY_20" "#3a3a3a" "Grey")
export GRAY_25=(238 "GRAY_25" "#444444" "Grey")
export GRAY_30=(239 "GRAY_30" "#4e4e4e" "Grey")
export GRAY_35=(240 "GRAY_35" "#585858" "Grey")
export GRAY_40=(241 "GRAY_40" "#606060" "Grey")
export GRAY_45=(242 "GRAY_45" "#666666" "Grey")
export GRAY_50=(243 "GRAY_50" "#767676" "Grey")
export GRAY_55=(244 "GRAY_55" "#808080" "Grey")
export GRAY_60=(245 "GRAY_60" "#8a8a8a" "Grey")
export GRAY_65=(246 "GRAY_65" "#949494" "Grey")
export GRAY_70=(247 "GRAY_70" "#9e9e9e" "Grey")
export GRAY_75=(248 "GRAY_75" "#a8a8a8" "Grey")
export GRAY_80=(249 "GRAY_80" "#b2b2b2" "Grey")
export GRAY_85=(250 "GRAY_85" "#bcbcbc" "Grey")
export GRAY_90=(251 "GRAY_90" "#c6c6c6" "Grey")
export GRAY_95=(252 "GRAY_95" "#d0d0d0" "Grey")
export GRAY_100=(253 "GRAY_100" "#dadada" "White")
export WHITE_90=(254 "WHITE_90" "#e4e4e4" "White")
export WHITE_100=(255 "WHITE_100" "#eeeeee" "White")

#-----------------------------------------------------------
# the color index
#-----------------------------------------------------------
export COLORDEX=("BLACK_SYSTEM" "RED_SYSTEM" "GREEN_SYSTEM" "YELLOW_SYSTEM" "BLUE_SYSTEM" "MAGENTA_SYSTEM" "CYAN_SYSTEM" "LIGHT_GRAY_SYSTEM" "DARK_GRAY_SYSTEM" "BRIGHT_RED_SYSTEM" "BRIGHT_GRAY_SYSTEM" "BRIGHT_YELLOW_SYSTEM" "BRIGHT_BLUE_SYSTEM" "BRIGHT_MAGENTA_SYSTEM" "BRIGHT_CYAN_SYSTEM" "WHITE_SYSTEM" "BLACK" "NAVY" "DARK_BLUE" "NEW_MIDNIGHT_BLUE" "MEDIUM_BLUE" "BLUE" "DARK_GREEN" "MOSQUE" "BLUE_LAGOON" "COBALT" "NAVY_BLUE" "DARK_DODGER_BLUE" "MEDIUM_GREEN" "OBSERVATORY" "DARK_CYAN" "CERULEAN" "PACIFIC_BLUE" "MEDIUM_DODGER_BLUE" "ISLAMIC_GREEN" "JADE" "PERSIAN_GREEN" "BONDI_BLUE" "IRIS_BLUE" "DARK_SKY_BLUE" "DARK_LIME" "MALACHITE" "DEEP_CARIBBEAN_GREEN" "CARIBBEAN_GREEN" "DARK_TURQUOISE" "LIGHT_SKY_BLUE" "LIGHT_LIME" "DARK_SPRING_GREEN" "SPRING_GREEN" "MEDIUM_SPRING_GREEN" "BRIGHT_TURQUOISE" "AQUA" "MAROON" "TYRIAN_PURPLE" "DARK_INDIGO" "MEDIUM_INDIGO" "INDIGO" "BRIGHT_INDIGO" "DARK_OLIVE" "DIM_GRAY" "KIMBERLY" "RICH_BLUE" "SLATE" "NEON_BLUE" "MEDIUM_OLIVE" "HIPPIE_GREEN" "HOKI" "AIR_FORCE_BLUE" "DARK_PICTON_BLUE" "DARK_SLATE_BLUE" "OLIVE" "FERN" "KEPPEL" "FOUNTAIN_BLUE" "PICTON_BLUE" "DARK_MAYA_BLUE" "EMERALD" "DARK_PASTEL_GREEN" "PASTEL_GREEN" "DARK_AQUAMARINE" "MEDIUM_TURQUOISE" "MAYA_BLUE" "LIGHT_GREEN" "BRIGHT_GREEN" "SCREAMIN_GREEN" "MEDIUM_AQUAMARINE" "AQUAMARINE" "BABY_BLUE" "DARK_RED" "DARK_EGGPLANT" "DARK_MAGENTA" "DARK_VIOLET" "VIOLET" "LIGHT_INDIGO" "BRIGHT_OLIVE" "LIGHT_WOOD" "TRENDY_PINK" "BLUE_MARGUERITE" "MEDIUM_PURPLE" "MEDIUM_SLATE_BLUE" "LIGHT_OLIVE" "BANDICOOT" "SUVA_GREY" "SHIP_COVE" "PORTAGE" "SLATE_BLUE" "DARK_CITRUS" "CHELSEA_CUCUMBER" "DARK_SEA_GREEN" "ZIGGURAT" "SEAGULL" "LIGHT_MAYA_BLUE" "LAWN_GREEN" "LIGHT_PASTEL_GREEN" "GOSSIP" "BERMUDA" "RIPTIDE" "DARK_COLUMBIA_BLUE" "CHARTREUSE" "BRIGHT_SCREAMIN_GREEN" "DARK_MINT_GREEN" "MEDIUM_MINT_GREEN" "BRIGHT_AQUAMARINE" "ELECTRIC_BLUE" "DARK_FREE_SPEECH_RED" "EGGPLANT" "BRIGHT_EGGPLANT" "MEDIUM_MAGENTA" "BRIGHT_VIOLET" "ELECTRIC_PURPLE" "TAWNY" "CORAL_TREE" "TAPESTRY" "VIOLET_BLUE" "MEDIUM_ORCHID" "BRIGHT_SLATE_BLUE" "DARK_GOLDENROD" "TEAK" "THATCH" "LONDON_HUE" "WISTERIA" "LIGHT_SLATE_BLUE" "CITRUS" "OLIVE_GREEN" "NEUTRAL_GREEN" "DARK_GRAY" "MOON_RAKER" "DARK_LAVENDER_BLUE" "DARK_SPRING_BUD" "CONIFER" "FEIJOA" "CHINOOK" "SCANDAL" "COLUMBIA_BLUE" "SPRING_BUD" "GREEN_YELLOW" "MINT_GREEN" "BRIGHT_MINT_GREEN" "LIGHT_AQUAMARINE" "BRIGHT_COLUMBIA_BLUE" "FREE_SPEECH_RED" "DARK_RAZZMATAZZ" "DARK_HOLLYWOOD_CERISE" "MAGENTA" "BRIGHT_MAGENTA" "PSYCHEDELIC_PURPLE" "TENNE" "ROMAN" "DARK_VIOLET_RED" "VIOLET_RED" "ORCHID" "DARK_HELIOTROPE" "MANGO_TANGO" "COPPER" "MY_PINK" "KOBI" "PLUM" "HELIOTROPE" "GOLDEN_POPPY" "EQUATOR" "CALICO" "PINK_FLARE" "FRENCH_LILAC" "MAUVE" "SCHOOL_BUS_YELLOW" "GOLDENROD" "DECO" "ATHS_SPECIAL" "LIGHT_GREY" "LAVENDER_BLUE" "CHARTREUSE_YELLOW" "LEMON" "DARK_CANARY" "MEDIUM_CANARY" "HONEYDEW" "LIGHT_CYAN" "RED" "RAZZMATAZZ" "DEEP_PINK" "HOLLYWOOD_CERISE" "HOT_MAGENTA" "LIGHT_MAGENTA" "SAFETY_ORANGE" "BITTERSWEET" "WILD_WATERMELON" "HOT_PINK" "PINK" "PINK_FLAMINGO" "DARK_ORANGE" "CORAL" "MONA_LISA" "TICKLE_ME_PINK" "NEON_PINK" "FUCHSIA_PINK" "ORANGE" "RAJAH" "MACARONI_AND_CHEESE" "MELON" "COTTON_CANDY" "LAVENDER_ROSE" "GOLD" "DANDELION" "SALOMIE" "NAVAJO_WHITE" "MISTY_ROSE" "LAVENDER_BLUSH" "YELLOW" "LASER_LEMON" "CANARY" "BRIGHT_CANARY" "CREAM" "WHITE" "BLACK_100" "BLACK_90" "GRAY_5" "GRAY_10" "GRAY_15" "GRAY_20" "GRAY_25" "GRAY_30" "GRAY_35" "GRAY_40" "GRAY_45" "GRAY_50" "GRAY_55" "GRAY_60" "GRAY_65" "GRAY_70" "GRAY_75" "GRAY_80" "GRAY_85" "GRAY_90" "GRAY_95" "GRAY_100" "WHITE_90" "WHITE_100")

#-----------------------------------------------------------
# color formatting codes
#-----------------------------------------------------------
export FORMATTING_ESCAPE_SEQUENCE="\e[m"
export FORMATTING_RESET_SEQUENCE="\e[0m"
export COLORIZE_BACKGROUND_CODE="48;5;"
export COLORIZE_FOREGROUND_CODE="38;5;"
export OPEN_ESCAPE_SEQUENCE="\e["
export CLOSE_ESCAPE_SEQUENCE="m"
export CODE_SEPARATOR=";"

#-----------------------------------------------------------
# text formatting codes
#-----------------------------------------------------------
export TEXT_FORMAT_BOLD="1"
export TEXT_FORMAT_DIM="2"
export TEXT_FORMAT_UNDERLINED="4"
export TEXT_FORMAT_BLINK="5"
export TEXT_FORMAT_INVERT="7"
export TEXT_FORMAT_HIDDEN="8"

#───────────────────────────────────────────────────────────────────────────────
# Script Functions
#───────────────────────────────────────────────────────────────────────────────

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# Retrieves the name of the color from the colordex by it's
# index.
# [parameters]
# 1) a string representing the color name accceptable
#    formats listed below:
#    [red system]
#    [RED_SYSTEM]
#    [red_system]
#    [red-system]
# [return]
# 1) a number representing the shell code for the
#    color name
#===========================================================
colorName()
{
	#---------------------------------------
	# initializations
	#---------------------------------------
	local colorName=$1
	colorName="${COLORDEX[$colorName]}"
	
	#---------------------------------------
	# print the color name
	#---------------------------------------
	printf "%s" "${colorName}"
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# Retrieves the hue of the color.
# [parameters]
# 1) a string representing the color name accceptable
#    formats listed below:
#    [red system]
#    [RED_SYSTEM]
#    [red_system]
#    [red-system]
# [return]
# 1) the hue of the color
#===========================================================
colorHue()
{
	#---------------------------------------
	# initializations
	#---------------------------------------
	local colorName="${1}"
	local hue=

	#---------------------------------------
	# get hue name and print it
	#---------------------------------------
	eval hue=\${${colorName}[$COLOR_HUE]}
	printf "${hue}"
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# Retrieves the hex code of the color.
# [parameters]
# 1) a string representing the color name accceptable
#    formats listed below:
#    [red system]
#    [RED_SYSTEM]
#    [red_system]
#    [red-system]
# [return]
# 1) the hue of the color
#===========================================================
colorHexCode()
{
	#---------------------------------------
	# initializations
	#---------------------------------------
	local colorName="${1}"
	local hexCode=

	#---------------------------------------
	# get the hex code and print it
	#---------------------------------------
	eval hexCode=\${${colorName}[$COLOR_HEX_CODE]}
	printf "${hexCode}"
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# Calculates the RGB values for a color prints them for
# later use.
# [parameters]
# 1) a string representing the color name accceptable
#    formats listed below:
#    [red system]
#    [RED_SYSTEM]
#    [red_system]
#    [red-system]
# [return]
# 1) the RGB values format example below:
#    255 255 255
#===========================================================
rgbValues()
{
	#---------------------------------------
	# initializations
	#---------------------------------------
	local hexValue="${1}"
	local red=
	local green=
	local blue=

	#---------------------------------------
	# get the hex code for the color 
	# in question
	#---------------------------------------
	eval hexValue=\${${hexValue}[$COLOR_HEX_CODE]}

	#---------------------------------------
	# safety check for the hex code found
	#---------------------------------------
	if [[ ! "$hexValue" =~ [A-Fa-f0-9]{6} ]]; then
		return
	fi

	#---------------------------------------
	# remove the leading sharp from the
	# code if included
	#---------------------------------------
	hexValue="${hexValue/##/}"

	#---------------------------------------
	# convert each hex set to RGB
	#---------------------------------------
	red=$(printf "%d" "0x${hexValue:0:2}")
	green=$(printf "%d" "0x${hexValue:2:2}")
	blue=$(printf "%d" "0x${hexValue:4:2}")

	#---------------------------------------
	# print out the RGB codes
	#---------------------------------------
	printf "%s %s %s" "${red}" "${green}" "${blue}"
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
escapeBraces()
{
	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	local string="${1}"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	string=${string//\{/\\\{}
	string=${string//\}/\\\}}

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	printf "%s" "$string"
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
openEscapeSequence()
{
	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	local string="${1}"
	local escapeSequenceRegex="^[\\]e\[[0-9\;]*m"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	#check to make sure that the string isn't already escaped
	if [[ "${string}" =~ $escapeSequenceRegex ]]; then
		#keep it D.R.Y.
		printf "%s" "${string}"
	else
		#hasn't been escaped, so add the code
		printf "%s" "${FORMATTING_ESCAPE_SEQUENCE}${string}"
	fi
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
closeEscapeSequence()
{
	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	local string="${1}"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	printf "%s" "${string}"
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
extractFormattingCodes()
{
	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	local codes="${1}"
	local extractionRegex="^[\\]e\[\([124578;]*\){0,1}\(48;5;[0-9]{1,3}[;]{0,1}\){0,1}\(38;5;[0-9]{1,3}\){0,1}m.*"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	extractionRegex=$(escapeBraces "${extractionRegex}")

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	codes=$( \
		echo "${codes}" | \
		sed "s/${extractionRegex}/\1\2\3/" \
	)
	printf "%s" "${codes}"
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
extractString()
{
	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	local string="${1}"
	local extractionRegex="^[\\]e\[\([124578;]*\){0,1}\(48;5;[0-9]{1,3}[;]{0,1}\){0,1}\(38;5;[0-9]{1,3}\){0,1}m\(.*\)"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	extractionRegex=$(escapeBraces "${extractionRegex}")

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	string=$( \
		echo "${string}" | \
		sed "s/${extractionRegex}/\4/" \
	)
	printf "%s" "${string}"
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
insertFormattingCode()
{
	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	local string=$(openEscapeSequence "${1}") #if you don't have this everything breaks!
	local newFormattingCode="${2}"
	local oldFormattingCode=$(extractFormattingCodes "${string}")
	local codeIndex=0
	local codeList=
	local code=

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	#extract string
	string=$(extractString "${string}")

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	IFS=';' read -ra codes <<< "$oldFormattingCode"
	for code in ${codes[@]}; do
		if [[ $code == 48 ]] && [[ -z "${codeList[1]}" ]]; then
			((codeIndex++))
		fi
		if [[ $code == 38 ]] && [[ -z "${codeList[2]}" ]]; then
			((codeIndex++))
		fi
		#printf "$code\n"
		if [[ -n "${codeList[$codeIndex]}" ]]; then
			codeList[$codeIndex]="${codeList[$codeIndex]};${code}"
		else
			codeList[$codeIndex]="${code}"
		fi
	done

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	if [[ "${newFormattingCode}" =~ ^48 ]]; then
		codeList[1]="${newFormattingCode}"
	elif [[ "${newFormattingCode}" =~ ^38 ]]; then
		codeList[2]="${newFormattingCode}"
	else
		codeList[0]="${newFormattingCode}"
	fi

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	newFormattingCode=
	for code in ${codeList[@]}; do
		if [[ -n "${newFormattingCode}" ]]; then
			newFormattingCode="${newFormattingCode};${code}"
		else
			newFormattingCode="${code}"
		fi
	done

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	printf "${OPEN_ESCAPE_SEQUENCE}${newFormattingCode}${CLOSE_ESCAPE_SEQUENCE}${string}"
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
formatText()
{
	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	#declarations
	local formattedString="$1"
	local formattingCodes=
	
	#---------------------------------------
	# text formatting codes
	#---------------------------------------
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

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	formattedString=$(insertFormattingCode "${formattedString}" "${formattingCodes}")

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	printf "%s" $formattedString
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
colorizeText()
{
	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	local colorizedString="${1}"
	local colorCode="${COLORIZE_FOREGROUND_CODE}${2}"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	colorizedString=$(insertFormattingCode "${colorizedString}" "${colorCode}")

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	printf "%s" $colorizedString
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
colorizeBackground()
{
	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	local colorizedString="${1}"
	local colorCode="${COLORIZE_BACKGROUND_CODE}${2}"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	colorizedString=$(insertFormattingCode "${colorizedString}" "${colorCode}")

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	printf "%s" $colorizedString
}

#───────────────────────────────────────────────────────────────────────────────
# Function Test
#───────────────────────────────────────────────────────────────────────────────
if [[ $SCRIPT_SELF_TEST_MODE -eq 1 ]]; then

testOpenEscapeSequence()
{
	local originalString="supercalifragilisticexpialidocious"
	local returnedString=

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	#test properly escapes string no escapes
	returnedString=$(openEscapeSequence "${originalString}")
	assertSame \
		"(${BASH_SOURCE}:${LINENO}) Failed to append escape sequence with string." \
		"\\e[m${originalString}" \
		"${returnedString}"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	#test properly escapes string with escapes but none at beginning
	returnedString=$(openEscapeSequence "${originalString}")
	returnedString=$(openEscapeSequence "sing ${returnedString}")
	assertSame \
		"(${BASH_SOURCE}:${LINENO}) Failed to append escape sequence with string." \
		"\\e[msing \\e[m${originalString}" \
		"${returnedString}"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	#test doesn't escape previously escaped string
	returnedString=$(openEscapeSequence "${originalString}")
	returnedString=$(openEscapeSequence "${returnedString}")
	assertSame "(${BASH_SOURCE}:${LINENO}) Failed to detect perviously escaped string." \
		"\\e[m${originalString}" \
		"${returnedString}"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
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

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	#formatting code test
	testSequence="${openSequence}${formatting}${closeSequence}super cali fragi listic expi ali docious"
	extractedCode=$(extractFormattingCodes "${testSequence}")
	assertSame "(${BASH_SOURCE}:${LINENO}) Failed to extract formatting code." \
		"${formatting}" \
		"${extractedCode}"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	#background code test
	testSequence="${openSequence}${background}${closeSequence}super cali fragi listic expi ali docious"
	extractedCode=$(extractFormattingCodes "${testSequence}")
	assertSame "(${BASH_SOURCE}:${LINENO}) Failed to extract background colorization code." \
		"${background}" \
		"${extractedCode}"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	#foreground code test
	testSequence="${openSequence}${foreground}${closeSequence}super cali fragi listic expi ali docious"
	extractedCode=$(extractFormattingCodes "${testSequence}")
	assertSame "(${BASH_SOURCE}:${LINENO}) Failed to extract foreground colorization code." \
		"${foreground}" \
		"${extractedCode}"
	
	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	#formatting and foreground code test
	testSequence="${openSequence}${formatting}${separator}${foreground}${closeSequence}super cali fragi listic expi ali docious"
	extractedCode=$(extractFormattingCodes "${testSequence}")
	assertSame "(${BASH_SOURCE}:${LINENO}) Failed to extract formatting and foreground colorization codes." \
		"${formatting}${separator}${foreground}" \
		"${extractedCode}"

	#---------------------------------------
	# text formatting codes
	#---------------------------------------
	#formatting and foreground code test
	testSequence="${openSequence}${formatting}${separator}${background}${separator}${foreground}${closeSequence}super cali fragi listic expi ali docious"
	extractedCode=$(extractFormattingCodes "${testSequence}")
	assertSame "(${BASH_SOURCE}:${LINENO}) Failed to extract all codes." \
		"${formatting}${separator}${background}${separator}${foreground}" \
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

#───────────────────────────────────────────────────────────────────────────────
# Script Debugging
#───────────────────────────────────────────────────────────────────────────────
if [[ $SCRIPT_FUNCTION_DEBUG_MODE -eq 1 ]]; then
	printf "Running single function to debug.\n${SCRIPT_FUNCTION_TO_DEBUG}\n"
	eval $SCRIPT_FUNCTION_TO_DEBUG
	exit 0
fi

if [[ $SCRIPT_DEBUG_MODE -eq 1 ]]; then
	printf "Running script for full debug.\n"
	exit 0
fi

#───────────────────────────────────────────────────────────────────────────────
# Function Exports
#───────────────────────────────────────────────────────────────────────────────
export -f colorName
export -f colorHue
export -f colorHexCode
export -f rgbValues
export -f formatText
export -f colorizeText
export -f colorizeBackground
export -f escapeBraces
export -f openEscapeSequence
export -f closeEscapeSequence
export -f extractFormattingCodes
export -f extractString
export -f insertFormattingCode