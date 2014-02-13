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

#script variables
COLOR_CODE=0
COLOR_NAME=1
COLOR_HEX_CODE=2
COLOR_HUE=3
a0=(0 "Black" "#000000" "Black")
a1=(1 "Maroon" "#800000" "Brown")
a2=(2 "Green" "#008000" "Green")
a3=(3 "Olive" "#808000" "Green")
a4=(4 "Navy" "#000080" "Blue")
a5=(5 "Purple" "#800080" "Violet")
a6=(6 "Teal" "#008080" "Blue")
a7=(7 "Silver" "#c0c0c0" "Grey")
a8=(8 "Grey" "#808080" "Grey")
a9=(9 "Red" "#ff0000" "Red")
a10=(10 "Lime" "#00ff00" "Green")
a11=(11 "Yellow" "#ffff00" "Yellow")
a12=(12 "Blue" "#0000ff" "Blue")
a13=(13 "Magenta" "#ff00ff" "Violet")
a14=(14 "Aqua" "#00ffff" "Blue")
a15=(15 "White" "#ffffff" "White")
a16=(16 "Black" "#000000" "Black")
a17=(17 "Navy" "#00005f" "Blue")
a18=(18 "Dark Blue" "#000087" "Blue")
a19=(19 "New Midnight Blue" "#0000af" "Blue")
a20=(20 "Medium Blue" "#0000d7" "Blue")
a21=(21 "Blue" "#0000ff" "Blue")
a22=(22 "Green" "#005f00" "Green")
a23=(23 "Mosque" "#005f5f" "Green")
a24=(24 "Blue Lagoon" "#005f87" "Green")
a25=(25 "Cobalt" "#005faf" "Blue")
a26=(26 "Navy Blue" "#005fd7" "Blue")
a27=(27 "Dodger Blue" "#005fff" "Blue")
a28=(28 "Green" "#008700" "Green")
a29=(29 "Observatory" "#00875f" "Green")
a30=(30 "Dark Cyan" "#008787" "Green")
a31=(31 "Cerulean" "#0087af" "Blue")
a32=(32 "Pacific Blue" "#0087d7" "Blue")
a33=(33 "Dodger Blue" "#0087ff" "Blue")
a34=(34 "Islamic Green" "#00af00" "Green")
a35=(35 "Jade" "#00af5f" "Green")
a36=(36 "Persian Green" "#00af87" "Green")
a37=(37 "Bondi Blue" "#00afaf" "Blue")
a38=(38 "Iris Blue" "#00afd7" "Blue")
a39=(39 "Deep Sky Blue" "#00afff" "Blue")
a40=(40 "Lime" "#00d700" "Green")
a41=(41 "Malachite" "#00d75f" "Green")
a42=(42 "Caribbean Green" "#00d787" "Green")
a43=(43 "Caribbean Green" "#00d7af" "Green")
a44=(44 "Dark Turquoise" "#00d7d7" "Blue")
a45=(45 "Deep Sky Blue" "#00d7ff" "Blue")
a46=(46 "Lime" "#00ff00" "Green")
a47=(47 "Spring Green" "#00ff5f" "Green")
a48=(48 "Spring Green" "#00ff87" "Green")
a49=(49 "Medium Spring Green" "#00ffaf" "Green")
a50=(50 "Bright Turquoise" "#00ffd7" "Blue")
a51=(51 "Aqua" "#00ffff" "Blue")
a52=(52 "Maroon" "#5f0000" "Brown")
a53=(53 "Tyrian Purple" "#5f005f" "Violet")
a54=(54 "Indigo" "#5f0087" "Violet")
a55=(55 "Indigo" "#5f00af" "Violet")
a56=(56 "Electric Indigo" "#5f00d7" "Violet")
a57=(57 "Electric Indigo" "#5f00ff" "Violet")
a58=(58 "Olive" "#5f5f00" "Green")
a59=(59 "Dim Gray" "#5f5f5f" "Grey")
a60=(60 "Kimberly" "#5f5f87" "Violet")
a61=(61 "Rich Blue" "#5f5faf" "Blue")
a62=(62 "Slate Blue" "#5f5fd7" "Blue")
a63=(63 "Neon Blue" "#5f5fff" "Blue")
a64=(64 "Olive" "#5f8700" "Green")
a65=(65 "Hippie Green" "#5f875f" "Green")
a66=(66 "Hoki" "#5f8787" "Blue")
a67=(67 "Air Force Blue" "#5f87af" "Blue")
a68=(68 "Picton Blue" "#5f87d7" "Blue")
a69=(69 "Light Slate Blue" "#5f87ff" "Blue")
a70=(70 "Olive" "#5faf00" "Green")
a71=(71 "Fern" "#5faf5f" "Green")
a72=(72 "Keppel" "#5faf87" "Green")
a73=(73 "Fountain Blue" "#5fafaf" "Blue")
a74=(74 "Picton Blue" "#5fafd7" "Blue")
a75=(75 "Maya Blue" "#5fafff" "Blue")
a76=(76 "Bright Green" "#5fd700" "Green")
a77=(77 "Pastel Green" "#5fd75f" "Green")
a78=(78 "Pastel Green" "#5fd787" "Green")
a79=(79 "Medium Aquamarine" "#5fd7af" "Blue")
a80=(80 "Medium Turquoise" "#5fd7d7" "Blue")
a81=(81 "Maya Blue" "#5fd7ff" "Blue")
a82=(82 "Bright Green" "#5fff00" "Green")
a83=(83 "Screamin' Green" "#5fff5f" "Green")
a84=(84 "Screamin' Green" "#5fff87" "Green")
a85=(85 "Aquamarine" "#5fffaf" "Blue")
a86=(86 "Aquamarine" "#5fffd7" "Blue")
a87=(87 "Baby Blue" "#5fffff" "Blue")
a88=(88 "Dark Red" "#870000" "Red")
a89=(89 "Eggplant" "#87005f" "Violet")
a90=(90 "Dark Magenta" "#870087" "Violet")
a91=(91 "Dark Violet" "#8700af" "Violet")
a92=(92 "Dark Violet" "#8700d7" "Violet")
a93=(93 "Electric Indigo" "#8700ff" "Violet")
a94=(94 "Olive" "#875f00" "Green")
a95=(95 "Light Wood" "#875f5f" "Brown")
a96=(96 "Trendy Pink" "#875f87" "Violet")
a97=(97 "Blue Marguerite" "#875faf" "Violet")
a98=(98 "Medium Purple" "#875fd7" "Violet")
a99=(99 "Light Slate Blue" "#875fff" "Blue")
a100=(100 "Olive" "#878700" "Green")
a101=(101 "Bandicoot" "#87875f" "Green")
a102=(102 "Suva Grey" "#878787" "Grey")
a103=(103 "Ship Cove" "#8787af" "Blue")
a104=(104 "Portage" "#8787d7" "Blue")
a105=(105 "Light Slate Blue" "#8787ff" "Blue")
a106=(106 "Citrus" "#87af00" "Green")
a107=(107 "Chelsea Cucumber" "#87af5f" "Green")
a108=(108 "Dark Sea Green" "#87af87" "Green")
a109=(109 "Ziggurat" "#87afaf" "Blue")
a110=(110 "Seagull" "#87afd7" "Blue")
a111=(111 "Maya Blue" "#87afff" "Blue")
a112=(112 "Lawn Green" "#87d700" "Green")
a113=(113 "Pastel Green" "#87d75f" "Green")
a114=(114 "Gossip" "#87d787" "Green")
a115=(115 "Bermuda" "#87d7af" "Green")
a116=(116 "Riptide" "#87d7d7" "Green")
a117=(117 "Columbia Blue" "#87d7ff" "Blue")
a118=(118 "Chartreuse" "#87ff00" "Green")
a119=(119 "Screamin' Green" "#87ff5f" "Green")
a120=(120 "Mint Green" "#87ff87" "Green")
a121=(121 "Mint Green" "#87ffaf" "Green")
a122=(122 "Aquamarine" "#87ffd7" "Blue")
a123=(123 "Electric Blue" "#87ffff" "Blue")
a124=(124 "Free Speech Red" "#af0000" "Red")
a125=(125 "Eggplant" "#af005f" "Violet")
a126=(126 "Eggplant" "#af0087" "Violet")
a127=(127 "Deep Magenta" "#af00af" "Violet")
a128=(128 "Dark Violet" "#af00d7" "Violet")
a129=(129 "Electric Purple" "#af00ff" "Violet")
a130=(130 "Tenne (Tawny)" "#af5f00" "Orange")
a131=(131 "Coral Tree" "#af5f5f" "Red")
a132=(132 "Tapestry" "#af5f87" "Red")
a133=(133 "Violet Blue" "#af5faf" "Violet")
a134=(134 "Medium Orchid" "#af5fd7" "Violet")
a135=(135 "Light Slate Blue" "#af5fff" "Blue")
a136=(136 "Dark Goldenrod" "#af8700" "Yellow")
a137=(137 "Teak" "#af875f" "Yellow")
a138=(138 "Thatch" "#af8787" "Brown")
a139=(139 "London Hue" "#af87af" "Violet")
a140=(140 "Wisteria" "#af87d7" "Violet")
a141=(141 "Light Slate Blue" "#af87ff" "Blue")
a142=(142 "Citrus" "#afaf00" "Green")
a143=(143 "Olive Green" "#afaf5f" "Green")
a144=(144 "Neutral Green" "#afaf87" "Green")
a145=(145 "Dark Gray" "#afafaf" "Grey")
a146=(146 "Moon Raker" "#afafd7" "Violet")
a147=(147 "Lavender Blue" "#afafff" "Blue")
a148=(148 "Spring Bud" "#afd700" "Green")
a149=(149 "Conifer" "#afd75f" "Green")
a150=(150 "Feijoa" "#afd787" "Green")
a151=(151 "Chinook" "#afd7af" "Green")
a152=(152 "Scandal" "#afd7d7" "Green")
a153=(153 "Columbia Blue" "#afd7ff" "Blue")
a154=(154 "Spring Bud" "#afff00" "Green")
a155=(155 "Green Yellow" "#afff5f" "Green")
a156=(156 "Mint Green" "#afff87" "Green")
a157=(157 "Mint Green" "#afffaf" "Green")
a158=(158 "Aquamarine" "#afffd7" "Blue")
a159=(159 "Columbia Blue" "#afffff" "Blue")
a160=(160 "Free Speech Red" "#d70000" "Red")
a161=(161 "Razzmatazz" "#d7005f" "Red")
a162=(162 "Hollywood Cerise" "#d70087" "Red")
a163=(163 "Deep Magenta" "#d700af" "Violet")
a164=(164 "Deep Magenta" "#d700d7" "Violet")
a165=(165 "Psychedelic Purple" "#d700ff" "Violet")
a166=(166 "Tenne (Tawny)" "#d75f00" "Orange")
a167=(167 "Roman" "#d75f5f" "Red")
a168=(168 "Pale Violet Red" "#d75f87" "Red")
a169=(169 "Pale Violet Red" "#d75faf" "Red")
a170=(170 "Orchid" "#d75fd7" "Violet")
a171=(171 "Heliotrope" "#d75fff" "Violet")
a172=(172 "Mango Tango" "#d78700" "Orange")
a173=(173 "Copper" "#d7875f" "Red")
a174=(174 "My Pink" "#d78787" "Red")
a175=(175 "Kobi" "#d787af" "Red")
a176=(176 "Plum" "#d787d7" "Violet")
a177=(177 "Heliotrope" "#d787ff" "Violet")
a178=(178 "Golden Poppy" "#d7af00" "Yellow")
a179=(179 "Equator" "#d7af5f" "Yellow")
a180=(180 "Calico" "#d7af87" "Brown")
a181=(181 "Pink Flare" "#d7afaf" "Red")
a182=(182 "French Lilac" "#d7afd7" "Violet")
a183=(183 "Mauve" "#d7afff" "Violet")
a184=(184 "School Bus Yellow" "#d7d700" "Yellow")
a185=(185 "Goldenrod" "#d7d75f" "Yellow")
a186=(186 "Deco" "#d7d787" "Green")
a187=(187 "Aths Special" "#d7d7af" "Yellow")
a188=(188 "Light Grey" "#d7d7d7" "Grey")
a189=(189 "Lavender Blue" "#d7d7ff" "Blue")
a190=(190 "Chartreuse Yellow" "#d7ff00" "Yellow")
a191=(191 "Laser Lemon" "#d7ff5f" "Yellow")
a192=(192 "Canary" "#d7ff87" "Yellow")
a193=(193 "Canary" "#d7ffaf" "Yellow")
a194=(194 "Honeydew" "#d7ffd7" "White")
a195=(195 "Light Cyan" "#d7ffff" "Blue")
a196=(196 "Red" "#ff0000" "Red")
a197=(197 "Razzmatazz" "#ff005f" "Red")
a198=(198 "Deep Pink" "#ff0087" "Red")
a199=(199 "Hollywood Cerise" "#ff00af" "Red")
a200=(200 "Hot Magenta" "#ff00d7" "Red")
a201=(201 "Magenta" "#ff00ff" "Violet")
a202=(202 "Safety Orange" "#ff5f00" "Orange")
a203=(203 "Bittersweet" "#ff5f5f" "Orange")
a204=(204 "Wild Watermelon" "#ff5f87" "Red")
a205=(205 "Hot Pink" "#ff5faf" "Red")
a206=(206 "Neon Pink" "#ff5fd7" "Violet")
a207=(207 "Pink Flamingo" "#ff5fff" "Red")
a208=(208 "Dark Orange" "#ff8700" "Orange")
a209=(209 "Coral" "#ff875f" "Orange")
a210=(210 "Mona Lisa" "#ff8787" "Red")
a211=(211 "Tickle Me Pink" "#ff87af" "Red")
a212=(212 "Neon Pink" "#ff87d7" "Violet")
a213=(213 "Fuchsia Pink" "#ff87ff" "Red")
a214=(214 "Orange" "#ffaf00" "Orange")
a215=(215 "Rajah" "#ffaf5f" "Orange")
a216=(216 "Macaroni And Cheese" "#ffaf87" "Orange")
a217=(217 "Melon" "#ffafaf" "Red")
a218=(218 "Cotton Candy" "#ffafd7" "Red")
a219=(219 "Lavender Rose" "#ffafff" "Red")
a220=(220 "Gold" "#ffd700" "Yellow")
a221=(221 "Dandelion" "#ffd75f" "Yellow")
a222=(222 "Salomie" "#ffd787" "Yellow")
a223=(223 "Navajo White" "#ffd7af" "Brown")
a224=(224 "Misty Rose" "#ffd7d7" "Violet")
a225=(225 "Lavender Blush" "#ffd7ff" "Violet")
a226=(226 "Yellow" "#ffff00" "Yellow")
a227=(227 "Laser Lemon" "#ffff5f" "Yellow")
a228=(228 "Canary" "#ffff87" "Yellow")
a229=(229 "Canary" "#ffffaf" "Yellow")
a230=(230 "Cream" "#ffffd7" "White")
a231=(231 "White" "#ffffff" "White")
a232=(232 "Black" "#080808" "Black")
a233=(233 "Black" "#121212" "Black")
a234=(234 "Nero" "#1c1c1c" "Grey")
a235=(235 "Nero" "#262626" "Grey")
a236=(236 "Night Rider" "#303030" "Grey")
a237=(237 "Eclipse" "#3a3a3a" "Grey")
a238=(238 "Charcoal" "#444444" "Grey")
a239=(239 "Matterhorn" "#4e4e4e" "Grey")
a240=(240 "Mortar" "#585858" "Grey")
a241=(241 "Dim Gray" "#606060" "Grey")
a242=(242 "Dim Gray" "#666666" "Grey")
a243=(243 "Empress" "#767676" "Grey")
a244=(244 "Grey" "#808080" "Grey")
a245=(245 "Suva Grey" "#8a8a8a" "Grey")
a246=(246 "Suva Grey" "#949494" "Grey")
a247=(247 "Dark Gray" "#9e9e9e" "Grey")
a248=(248 "Dark Gray" "#a8a8a8" "Grey")
a249=(249 "Dark Gray" "#b2b2b2" "Grey")
a250=(250 "Silver" "#bcbcbc" "Grey")
a251=(251 "Silver" "#c6c6c6" "Grey")
a252=(252 "Light Grey" "#d0d0d0" "Grey")
a253=(253 "Gainsboro" "#dadada" "White")
a254=(254 "Gainsboro" "#e4e4e4" "White")
a255=(255 "White Smoke" "#eeeeee" "White")
colorList=("a0" "a1" "a2" "a3" "a4" "a5" "a6" "a7" "a8" "a9" "a10" "a11" "a12" "a13" "a14" "a15" "a16" "a17" "a18" "a19" "a20" "a21" "a22" "a23" "a24" "a25" "a26" "a27" "a28" "a29" "a30" "a31" "a32" "a33" "a34" "a35" "a36" "a37" "a38" "a39" "a40" "a41" "a42" "a43" "a44" "a45" "a46" "a47" "a48" "a49" "a50" "a51" "a52" "a53" "a54" "a55" "a56" "a57" "a58" "a59" "a60" "a61" "a62" "a63" "a64" "a65" "a66" "a67" "a68" "a69" "a70" "a71" "a72" "a73" "a74" "a75" "a76" "a77" "a78" "a79" "a80" "a81" "a82" "a83" "a84" "a85" "a86" "a87" "a88" "a89" "a90" "a91" "a92" "a93" "a94" "a95" "a96" "a97" "a98" "a99" "a100" "a101" "a102" "a103" "a104" "a105" "a106" "a107" "a108" "a109" "a110" "a111" "a112" "a113" "a114" "a115" "a116" "a117" "a118" "a119" "a120" "a121" "a122" "a123" "a124" "a125" "a126" "a127" "a128" "a129" "a130" "a131" "a132" "a133" "a134" "a135" "a136" "a137" "a138" "a139" "a140" "a141" "a142" "a143" "a144" "a145" "a146" "a147" "a148" "a149" "a150" "a151" "a152" "a153" "a154" "a155" "a156" "a157" "a158" "a159" "a160" "a161" "a162" "a163" "a164" "a165" "a166" "a167" "a168" "a169" "a170" "a171" "a172" "a173" "a174" "a175" "a176" "a177" "a178" "a179" "a180" "a181" "a182" "a183" "a184" "a185" "a186" "a187" "a188" "a189" "a190" "a191" "a192" "a193" "a194" "a195" "a196" "a197" "a198" "a199" "a200" "a201" "a202" "a203" "a204" "a205" "a206" "a207" "a208" "a209" "a210" "a211" "a212" "a213" "a214" "a215" "a216" "a217" "a218" "a219" "a220" "a221" "a222" "a223" "a224" "a225" "a226" "a227" "a228" "a229" "a230" "a231" "a232" "a233" "a234" "a235" "a236" "a237" "a238" "a239" "a240" "a241" "a242" "a243" "a244" "a245" "a246" "a247" "a248" "a249" "a250" "a251" "a252" "a253" "a254" "a255")
hueList=("Black" "Brown" "Green" "Blue" "Violet" "Grey" "Red" "Yellow" "White" "Orange")

FORMATTING_ESCAPE_SEQUENCE="\e[m"
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
	local formattingCodes=
	local formattedString="$1"
	local resetFormatting="$3"

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

	formattedString="\e[${formattingCodes}m${formattedString}"
	if [[ -z "$resetFormatting" ]]; then
		formattedString="${formattedString}\e[2${formattingCodes}m"
	fi

	printf "%s" $formattedString
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

# for hue in ${hueList[@]}; do
# 	printf "${hue}\n"
# 	for colorInformation in ${colorList[@]}; do
# 		eval colorHue=\${${colorInformation}[$COLOR_HUE]}
# 		if [[ "${hue}" == "${colorHue}" ]]; then
# 			eval colorCode=\$${colorInformation}
# 			eval colorName=\${${colorInformation}[$COLOR_NAME]}
# 			colorSpectrum=$(colorizeBackground $colorCode "${colorHue}:${colorName}")
# 		 	printf "${colorSpectrum} "
# 		fi
# 	done
# 	printf "\n"
# done

openEscapeSequence()
{
	local string="${1}"
	local escapeSequenceRegex="^[\\]e\[[0-9\;]*m"

	if [[ "${string}" =~ $escapeSequenceRegex ]]; then
		echo "${string}"
	else
		echo "${FORMATTING_ESCAPE_SEQUENCE}${string}"
	fi
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
openEscapeSequence "yes"

openEscapeSequence $(openEscapeSequence "yes")
# for colorInformation in ${colorList[@]}; do
# 	eval colorCode=\$${colorInformation}
# 	eval colorName=\${${colorInformation}[$COLOR_NAME]}
# 	colorSpectrum=$(colorizeBackground $colorCode "$colorName")
# 	printf "${colorSpectrum}"
# 	printf "\n"
#done