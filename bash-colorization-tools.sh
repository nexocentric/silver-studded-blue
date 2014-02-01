#!/bin/sh

#script variables
a0=(0 "name" "#000000")
a1=(1 "name" "#800000")
a2=(2 "name" "#008000")
a3=(3 "name" "#808000")
a4=(4 "name" "#000080")
a5=(5 "name" "#800080")
a6=(6 "name" "#008080")
a7=(7 "name" "#c0c0c0")
a8=(8 "name" "#808080")
a9=(9 "name" "#ff0000")
a10=(10 "name" "#00ff00")
a11=(11 "name" "#ffff00")
a12=(12 "name" "#0000ff")
a13=(13 "name" "#ff00ff")
a14=(14 "name" "#00ffff")
a15=(15 "name" "#ffffff")
a16=(16 "name" "#000000")
a17=(17 "name" "#00005f")
a18=(18 "name" "#000087")
a19=(19 "name" "#0000af")
a20=(20 "name" "#0000d7")
a21=(21 "name" "#0000ff")
a22=(22 "name" "#005f00")
a23=(23 "name" "#005f5f")
a24=(24 "name" "#005f87")
a25=(25 "name" "#005faf")
a26=(26 "name" "#005fd7")
a27=(27 "name" "#005fff")
a28=(28 "name" "#008700")
a29=(29 "name" "#00875f")
a30=(30 "name" "#008787")
a31=(31 "name" "#0087af")
a32=(32 "name" "#0087d7")
a33=(33 "name" "#0087ff")
a34=(34 "name" "#00af00")
a35=(35 "name" "#00af5f")
a36=(36 "name" "#00af87")
a37=(37 "name" "#00afaf")
a38=(38 "name" "#00afd7")
a39=(39 "name" "#00afff")
a40=(40 "name" "#00d700")
a41=(41 "name" "#00d75f")
a42=(42 "name" "#00d787")
a43=(43 "name" "#00d7af")
a44=(44 "name" "#00d7d7")
a45=(45 "name" "#00d7ff")
a46=(46 "name" "#00ff00")
a47=(47 "name" "#00ff5f")
a48=(48 "name" "#00ff87")
a49=(49 "name" "#00ffaf")
a50=(50 "name" "#00ffd7")
a51=(51 "name" "#00ffff")
a52=(52 "name" "#5f0000")
a53=(53 "name" "#5f005f")
a54=(54 "name" "#5f0087")
a55=(55 "name" "#5f00af")
a56=(56 "name" "#5f00d7")
a57=(57 "name" "#5f00ff")
a58=(58 "name" "#5f5f00")
a59=(59 "name" "#5f5f5f")
a60=(60 "name" "#5f5f87")
a61=(61 "name" "#5f5faf")
a62=(62 "name" "#5f5fd7")
a63=(63 "name" "#5f5fff")
a64=(64 "name" "#5f8700")
a65=(65 "name" "#5f875f")
a66=(66 "name" "#5f8787")
a67=(67 "name" "#5f87af")
a68=(68 "name" "#5f87d7")
a69=(69 "name" "#5f87ff")
a70=(70 "name" "#5faf00")
a71=(71 "name" "#5faf5f")
a72=(72 "name" "#5faf87")
a73=(73 "name" "#5fafaf")
a74=(74 "name" "#5fafd7")
a75=(75 "name" "#5fafff")
a76=(76 "name" "#5fd700")
a77=(77 "name" "#5fd75f")
a78=(78 "name" "#5fd787")
a79=(79 "name" "#5fd7af")
a80=(80 "name" "#5fd7d7")
a81=(81 "name" "#5fd7ff")
a82=(82 "name" "#5fff00")
a83=(83 "name" "#5fff5f")
a84=(84 "name" "#5fff87")
a85=(85 "name" "#5fffaf")
a86=(86 "name" "#5fffd7")
a87=(87 "name" "#5fffff")
a88=(88 "name" "#870000")
a89=(89 "name" "#87005f")
a90=(90 "name" "#870087")
a91=(91 "name" "#8700af")
a92=(92 "name" "#8700d7")
a93=(93 "name" "#8700ff")
a94=(94 "name" "#875f00")
a95=(95 "name" "#875f5f")
a96=(96 "name" "#875f87")
a97=(97 "name" "#875faf")
a98=(98 "name" "#875fd7")
a99=(99 "name" "#875fff")
a100=(100 "name" "#878700")
a101=(101 "name" "#87875f")
a102=(102 "name" "#878787")
a103=(103 "name" "#8787af")
a104=(104 "name" "#8787d7")
a105=(105 "name" "#8787ff")
a106=(106 "name" "#87af00")
a107=(107 "name" "#87af5f")
a108=(108 "name" "#87af87")
a109=(109 "name" "#87afaf")
a110=(110 "name" "#87afd7")
a111=(111 "name" "#87afff")
a112=(112 "name" "#87d700")
a113=(113 "name" "#87d75f")
a114=(114 "name" "#87d787")
a115=(115 "name" "#87d7af")
a116=(116 "name" "#87d7d7")
a117=(117 "name" "#87d7ff")
a118=(118 "name" "#87ff00")
a119=(119 "name" "#87ff5f")
a120=(120 "name" "#87ff87")
a121=(121 "name" "#87ffaf")
a122=(122 "name" "#87ffd7")
a123=(123 "name" "#87ffff")
a124=(124 "name" "#af0000")
a125=(125 "name" "#af005f")
a126=(126 "name" "#af0087")
a127=(127 "name" "#af00af")
a128=(128 "name" "#af00d7")
a129=(129 "name" "#af00ff")
a130=(130 "name" "#af5f00")
a131=(131 "name" "#af5f5f")
a132=(132 "name" "#af5f87")
a133=(133 "name" "#af5faf")
a134=(134 "name" "#af5fd7")
a135=(135 "name" "#af5fff")
a136=(136 "name" "#af8700")
a137=(137 "name" "#af875f")
a138=(138 "name" "#af8787")
a139=(139 "name" "#af87af")
a140=(140 "name" "#af87d7")
a141=(141 "name" "#af87ff")
a142=(142 "name" "#afaf00")
a143=(143 "name" "#afaf5f")
a144=(144 "name" "#afaf87")
a145=(145 "name" "#afafaf")
a146=(146 "name" "#afafd7")
a147=(147 "name" "#afafff")
a148=(148 "name" "#afd700")
a149=(149 "name" "#afd75f")
a150=(150 "name" "#afd787")
a151=(151 "name" "#afd7af")
a152=(152 "name" "#afd7d7")
a153=(153 "name" "#afd7ff")
a154=(154 "name" "#afff00")
a155=(155 "name" "#afff5f")
a156=(156 "name" "#afff87")
a157=(157 "name" "#afffaf")
a158=(158 "name" "#afffd7")
a159=(159 "name" "#afffff")
a160=(160 "name" "#d70000")
a161=(161 "name" "#d7005f")
a162=(162 "name" "#d70087")
a163=(163 "name" "#d700af")
a164=(164 "name" "#d700d7")
a165=(165 "name" "#d700ff")
a166=(166 "name" "#d75f00")
a167=(167 "name" "#d75f5f")
a168=(168 "name" "#d75f87")
a169=(169 "name" "#d75faf")
a170=(170 "name" "#d75fd7")
a171=(171 "name" "#d75fff")
a172=(172 "name" "#d78700")
a173=(173 "name" "#d7875f")
a174=(174 "name" "#d78787")
a175=(175 "name" "#d787af")
a176=(176 "name" "#d787d7")
a177=(177 "name" "#d787ff")
a178=(178 "name" "#d7af00")
a179=(179 "name" "#d7af5f")
a180=(180 "name" "#d7af87")
a181=(181 "name" "#d7afaf")
a182=(182 "name" "#d7afd7")
a183=(183 "name" "#d7afff")
a184=(184 "name" "#d7d700")
a185=(185 "name" "#d7d75f")
a186=(186 "name" "#d7d787")
a187=(187 "name" "#d7d7af")
a188=(188 "name" "#d7d7d7")
a189=(189 "name" "#d7d7ff")
a190=(190 "name" "#d7ff00")
a191=(191 "name" "#d7ff5f")
a192=(192 "name" "#d7ff87")
a193=(193 "name" "#d7ffaf")
a194=(194 "name" "#d7ffd7")
a195=(195 "name" "#d7ffff")
a196=(196 "name" "#ff0000")
a197=(197 "name" "#ff005f")
a198=(198 "name" "#ff0087")
a199=(199 "name" "#ff00af")
a200=(200 "name" "#ff00d7")
a201=(201 "name" "#ff00ff")
a202=(202 "name" "#ff5f00")
a203=(203 "name" "#ff5f5f")
a204=(204 "name" "#ff5f87")
a205=(205 "name" "#ff5faf")
a206=(206 "name" "#ff5fd7")
a207=(207 "name" "#ff5fff")
a208=(208 "name" "#ff8700")
a209=(209 "name" "#ff875f")
a210=(210 "name" "#ff8787")
a211=(211 "name" "#ff87af")
a212=(212 "name" "#ff87d7")
a213=(213 "name" "#ff87ff")
a214=(214 "name" "#ffaf00")
a215=(215 "name" "#ffaf5f")
a216=(216 "name" "#ffaf87")
a217=(217 "name" "#ffafaf")
a218=(218 "name" "#ffafd7")
a219=(219 "name" "#ffafff")
a220=(220 "name" "#ffd700")
a221=(221 "name" "#ffd75f")
a222=(222 "name" "#ffd787")
a223=(223 "name" "#ffd7af")
a224=(224 "name" "#ffd7d7")
a225=(225 "name" "#ffd7ff")
a226=(226 "name" "#ffff00")
a227=(227 "name" "#ffff5f")
a228=(228 "name" "#ffff87")
a229=(229 "name" "#ffffaf")
a230=(230 "name" "#ffffd7")
a231=(231 "name" "#ffffff")
a232=(232 "name" "#080808")
a233=(233 "name" "#121212")
a234=(234 "name" "#1c1c1c")
a235=(235 "name" "#262626")
a236=(236 "name" "#303030")
a237=(237 "name" "#3a3a3a")
a238=(238 "name" "#444444")
a239=(239 "name" "#4e4e4e")
a240=(240 "name" "#585858")
a241=(241 "name" "#606060")
a242=(242 "name" "#666666")
a243=(243 "name" "#767676")
a244=(244 "name" "#808080")
a245=(245 "name" "#8a8a8a")
a246=(246 "name" "#949494")
a247=(247 "name" "#9e9e9e")
a248=(248 "name" "#a8a8a8")
a249=(249 "name" "#b2b2b2")
a250=(250 "name" "#bcbcbc")
a251=(251 "name" "#c6c6c6")
a252=(252 "name" "#d0d0d0")
a253=(253 "name" "#dadada")
a254=(254 "name" "#e4e4e4")
a255=(255 "name" "#eeeeee")
colorList=("a0" "a1" "a2" "a3" "a4" "a5" "a6" "a7" "a8" "a9" "a10" "a11" "a12" "a13" "a14" "a15" "a16" "a17" "a18" "a19" "a20" "a21" "a22" "a23" "a24" "a25" "a26" "a27" "a28" "a29" "a30" "a31" "a32" "a33" "a34" "a35" "a36" "a37" "a38" "a39" "a40" "a41" "a42" "a43" "a44" "a45" "a46" "a47" "a48" "a49" "a50" "a51" "a52" "a53" "a54" "a55" "a56" "a57" "a58" "a59" "a60" "a61" "a62" "a63" "a64" "a65" "a66" "a67" "a68" "a69" "a70" "a71" "a72" "a73" "a74" "a75" "a76" "a77" "a78" "a79" "a80" "a81" "a82" "a83" "a84" "a85" "a86" "a87" "a88" "a89" "a90" "a91" "a92" "a93" "a94" "a95" "a96" "a97" "a98" "a99" "a100" "a101" "a102" "a103" "a104" "a105" "a106" "a107" "a108" "a109" "a110" "a111" "a112" "a113" "a114" "a115" "a116" "a117" "a118" "a119" "a120" "a121" "a122" "a123" "a124" "a125" "a126" "a127" "a128" "a129" "a130" "a131" "a132" "a133" "a134" "a135" "a136" "a137" "a138" "a139" "a140" "a141" "a142" "a143" "a144" "a145" "a146" "a147" "a148" "a149" "a150" "a151" "a152" "a153" "a154" "a155" "a156" "a157" "a158" "a159" "a160" "a161" "a162" "a163" "a164" "a165" "a166" "a167" "a168" "a169" "a170" "a171" "a172" "a173" "a174" "a175" "a176" "a177" "a178" "a179" "a180" "a181" "a182" "a183" "a184" "a185" "a186" "a187" "a188" "a189" "a190" "a191" "a192" "a193" "a194" "a195" "a196" "a197" "a198" "a199" "a200" "a201" "a202" "a203" "a204" "a205" "a206" "a207" "a208" "a209" "a210" "a211" "a212" "a213" "a214" "a215" "a216" "a217" "a218" "a219" "a220" "a221" "a222" "a223" "a224" "a225" "a226" "a227" "a228" "a229" "a230" "a231" "a232" "a233" "a234" "a235" "a236" "a237" "a238" "a239" "a240" "a241" "a242" "a243" "a244" "a245" "a246" "a247" "a248" "a249" "a250" "a251" "a252" "a253" "a254" "a255")



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

for colorInformation in ${colorList[@]}; do
	eval colorCode=\$${colorInformation}
	eval colorName=\${${colorInformation}[2]}
	colorSpectrum=$(colorizeBackground $colorCode $colorName)
	printf "${colorSpectrum}"
	printf "\n"
done