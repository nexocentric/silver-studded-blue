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

hexCodeList=("#b0bf1a" "#7cb9e8" "#c9ffe5" "#b284be" "#5d8aa8" "#00308f" "#72a0c1" "#af002a" "#f0f8ff" "#e32636" "#c46210" "#efdecd" "#e52b50" "#f19cbb" "#ab274f" "#3b7a57" "#ffbf00" "#ff7e00" "#ff033e" "#9966cc" "#a4c639" "#f2f3f4" "#cd9575" "#665d1e" "#915c83" "#841b2d" "#faebd7" "#008000" "#8db600" "#fbceb1" "#00ffff" "#7fffd4" "#4b5320" "#3b444b" "#8f9779" "#e9d66b" "#b2beb5" "#87a96b" "#ff9966" "#a52a2a" "#fdee00" "#6e7f80" "#568203" "#007fff" "#f0ffff" "#f0ffff" "#89cff0" "#a1caf1" "#f4c2c2" "#fefefa" "#ff91af" "#21abcd" "#fae7b5" "#ffe135" "#006a4e" "#e0218a" "#7c0a02" "#848482" "#98777b" "#bcd4e6" "#9f8170" "#f5f5dc" "#2e5894" "#9c2542" "#ffe4c4" "#3d2b1f" "#967117" "#cae00d" "#bfff00" "#fe6f5e" "#bf4f51" "#000000" "#3d0c02" "#253529" "#3b3c36" "#ffebcd" "#a57164" "#318ce7" "#ace5ee" "#faf0be" "#0000ff" "#1f75fe" "#0093af" "#0087bd" "#0018a8" "#333399" "#0247fe" "#a2a2d0" "#6699cc" "#0d98ba" "#126180" "#8a2be2" "#5072a7" "#4f86f7" "#1c1cf0" "#de5d83" "#79443b" "#0095b6" "#e3dac9" "#cc0000" "#006a4e" "#873260" "#0070ff" "#b5a642" "#cb4154" "#1dacd6" "#66ff00" "#bf94e4" "#d891ef" "#c32148" "#1974d2" "#ff007f" "#08e8de" "#d19fe8" "#f4bbff" "#ff55a3" "#fb607f" "#004225" "#cd7f32" "#737000" "#964b00" "#a52a2a" "#6b4423" "#1b4d3e" "#ffc1cc" "#e7feff" "#f0dc82" "#7bb661" "#480607" "#800020" "#deb887" "#cc5500" "#e97451" "#8a3324" "#bd33a4" "#702963" "#536872" "#5f9ea0" "#91a3b0" "#006b3c" "#ed872d" "#e30022" "#fff600" "#a67b5b" "#4b3621" "#1e4d2b" "#a3c1ad" "#c19a6b" "#efbbcc" "#78866b" "#ffef00" "#ff0800" "#e4717a" "#00bfff" "#592720" "#c41e3a" "#00cc99" "#960018" "#d70040" "#eb4c42" "#ff0038" "#ffa6c9" "#b31b1b" "#56a0d3" "#ed9121" "#00563f" "#062a78" "#703642" "#c95a49" "#92a1cf" "#ace1af" "#007ba7" "#2f847c" "#b2ffff" "#4997d0" "#de3163" "#ec3b83" "#007ba7" "#2a52be" "#6d9bc3" "#007aa5" "#e03c31" "#a0785a" "#f7e7ce" "#36454f" "#232b2b" "#e68fac" "#dfff00" "#7fff00" "#de3163" "#ffb7c5" "#954535" "#de6fa1" "#a8516e" "#aa381e" "#856088" "#7b3f00" "#d2691e" "#ffa700" "#98817b" "#e34234" "#d2691e" "#e4d00a" "#9fa91f" "#7f1734" "#fbcce7" "#0047ab" "#d2691e" "#965a3e" "#6f4e37" "#c4d8e2" "#f88379" "#000000" "#8c92ac" "#b87333" "#da8a67" "#ad6f69" "#cb6d51" "#996666" "#ff3800" "#ff7f50" "#f88379" "#ff4040" "#893f45" "#fbec5d" "#b31b1b" "#6495ed" "#fff8dc" "#fff8e7" "#ffbcd9" "#fffdd0" "#dc143c" "#be0032" "#00ffff" "#00b7eb" "#58427c" "#ffd300" "#ffff31" "#f0e130" "#00008b" "#666699" "#654321" "#5d3954" "#a40000" "#08457e" "#986960" "#cd5b45" "#008b8b" "#536878" "#b8860b" "#a9a9a9" "#013220" "#006400" "#00416a" "#1a2421" "#bdb76b" "#483c32" "#734f96" "#534b4f" "#543d37" "#8b008b" "#a9a9a9" "#003366" "#4a5d23" "#556b2f" "#ff8c00" "#9932cc" "#779ecb" "#03c03c" "#966fd6" "#c23b22" "#e75480" "#003399" "#4f3a3c" "#872657" "#8b0000" "#e9967a" "#560319" "#8fbc8f" "#3c1414" "#8cbed6" "#483d8b" "#2f4f4f" "#177245" "#918151" "#ffa812" "#483c32" "#cc4e5c" "#00ced1" "#d1bea8" "#9400d3" "#9b870c" "#00703c" "#555555" "#d70a53" "#a9203e" "#ef3038" "#e9692c" "#da3287" "#fad6a5" "#b94e48" "#704241" "#c154c1" "#004b49" "#f5c71a" "#9955bb" "#cc00cc" "#d473d4" "#355e3b" "#ffcba4" "#ff1493" "#a95c68" "#843f5b" "#ff9933" "#00bfff" "#4a646c" "#7e5e60" "#66424d" "#ba8759" "#1560bd" "#c19a6b" "#edc9af" "#ea3c53" "#b9f2ff" "#696969" "#9b7653" "#1e90ff" "#d71868" "#85bb65" "#664c28" "#967117" "#00009c" "#e5ccc9" "#efdfbb" "#e1a95f" "#555d50" "#c2b280" "#1b1b1b" "#614051" "#f0ead6" "#1034a6" "#7df9ff" "#ff003f" "#00ffff" "#00ff00" "#6f00ff" "#f4bbff" "#ccff00" "#bf00ff" "#3f00ff" "#8f00ff" "#ffff33" "#50c878" "#6c3082" "#1b4d3e" "#b48395" "#ab4b52" "#563c5c" "#96c8a2" "#44d7a8" "#c19a6b" "#801818" "#b53389" "#de5285" "#f400a1" "#e5aa70" "#4d5d53" "#fdd5b1" "#4f7942" "#ff2800" "#6c541e" "#b22222" "#ce2029" "#e25822" "#fc8eac" "#6b4423" "#f7e98e" "#eedc82" "#a2006d" "#fffaf0" "#ffbf00" "#ff1493" "#ccff00" "#ff004f" "#014421" "#228b22" "#a67b5b" "#856d4d" "#0072bb" "#fd3f92" "#86608e" "#9efd38" "#d473d4" "#fd6c9e" "#811453" "#4e1609" "#c72c48" "#f64a8a" "#77b5fe" "#8806ce" "#ac1e44" "#a6e7ff" "#ff00ff" "#c154c1" "#ff77ff" "#cc397b" "#c74375" "#e48400" "#cc6666" "#dcdcdc" "#e49b0f" "#007f66" "#f8f8ff" "#fe5a1d" "#b06500" "#6082b6" "#e6e8fa" "#00ab66" "#d4af37" "#ffd700" "#85754e" "#996515" "#fcc200" "#ffdf00" "#daa520" "#a8e4a0" "#6f2da8" "#808080" "#808080" "#bebebe" "#465945" "#8c92ac" "#00ff00" "#1cac78" "#008000" "#00a877" "#009f6b" "#00ad43" "#00a550" "#66b032" "#adff2f" "#a99a86" "#00ff7f" "#663854" "#446ccf" "#5218fa" "#e9d66b" "#3fff00" "#c90016" "#da9100" "#808000" "#df73ff" "#aa98a9" "#f400a1" "#f0fff0" "#006db0" "#49796b" "#ff1dce" "#ff69b4" "#355e3b" "#71a6d2" "#fcf75e" "#319177" "#602f6b" "#002395" "#66023c" "#ed2939" "#b2ec5d" "#4c516d" "#138808" "#cd5c5c" "#e3a857" "#6f00ff" "#091f92" "#4b0082" "#002fa7" "#ff4f00" "#ba160c" "#c0362c" "#5a4fcf" "#b3446c" "#f4f0ec" "#009000" "#b2ffff" "#fffff0" "#00a86b" "#9d2933" "#264348" "#5b3256" "#f8de7e" "#d73b3e" "#a50b5e" "#da614e" "#343434" "#f4ca16" "#8ab9f1" "#bdda57" "#29ab87" "#4cbb17" "#7c1c05" "#3ab09e" "#c3b091" "#f0e68c" "#882d17" "#e79fc4" "#354230" "#e8000d" "#087830" "#d6cadd" "#26619c" "#ffff66" "#a9ba9d" "#cf1020" "#b57edc" "#e6e6fa" "#ccccff" "#fff0f5" "#c4c3d0" "#9457eb" "#ee82ee" "#e6e6fa" "#fbaed2" "#967bb6" "#fba0e3" "#7cfc00" "#fff700" "#fffacd" "#cca01d" "#fdff00" "#e3ff00" "#f6eabe" "#fff44f" "#1a1110" "#545aa7" "#fdd5b1" "#add8e6" "#b5651d" "#e66771" "#f08080" "#93ccea" "#f56991" "#e0ffff" "#ff5ccd" "#c8ad7f" "#f984ef" "#fafad2" "#d3d3d3" "#90ee90" "#ffb3de" "#f0e68c" "#d39bcb" "#addfad" "#e6a8d7" "#b19cd9" "#ffb6c1" "#e97451" "#ffa07a" "#ff9999" "#20b2aa" "#87cefa" "#778899" "#b0c4de" "#b38b6d" "#e68fac" "#ffffe0" "#c8a2c8" "#bfff00" "#00ff00" "#32cd32" "#9dc209" "#195905" "#faf0e6" "#c19a6b" "#de6fa1" "#6ca0dc" "#674c47" "#b86d29" "#6c2e1f" "#987456" "#6699cc" "#ffe4cd" "#e62020" "#ff00ff" "#ff55a3" "#ca1f7b" "#d0417e" "#ff0090" "#9f4576" "#aaf0d1" "#f8f4ff" "#c04000" "#fbec5d" "#6050dc" "#0bda51" "#979aaa" "#ff8243" "#74c365" "#880085" "#c32148" "#800000" "#b03060" "#e0b0ff" "#915f6d" "#ef98aa" "#4c9141" "#73c2fb" "#e5b73b" "#66ddaa" "#0000cd" "#e2062c" "#af4035" "#f3e5ab" "#035096" "#1c352d" "#dda0dd" "#ba55d3" "#0067a5" "#9370db" "#bb3385" "#aa4069" "#3cb371" "#80daeb" "#7b68ee" "#c9dc87" "#00fa9a" "#674c47" "#48d1cc" "#79443b" "#d9603b" "#c71585" "#f8b878" "#f8de7e" "#fdbcb4" "#0a7e8c" "#9c7c38" "#e4007c" "#191970" "#004953" "#ffc40c" "#e3f988" "#3eb489" "#f5fffa" "#98ff98" "#ffe4e1" "#faebd7" "#967117" "#73a9c2" "#ae0c00" "#8a9a5b" "#30ba8f" "#997a8d" "#18453b" "#306030" "#c54b8c" "#ffdb58" "#317873" "#f6adc6" "#2a8000" "#fada5e" "#ffdead" "#000080" "#9457eb" "#ffa343" "#fe4164" "#39ff14" "#214fc6" "#d7837f" "#a4dded" "#059033" "#e9ffdb" "#0077be" "#cc7722" "#008000" "#43302e" "#cfb53b" "#563c5c" "#fdf5e6" "#796878" "#673147" "#867e36" "#c08081" "#848482" "#808000" "#6b8e23" "#3c341f" "#9ab973" "#353839" "#b784a7" "#ff7f00" "#ff7538" "#ff5800" "#fb9902" "#ffa500" "#ff9f00" "#ff4500" "#da70d6" "#f2bdcd" "#fb4f14" "#654321" "#414a4c" "#ff6e4a" "#002147" "#990000" "#006600" "#273be2" "#682860" "#bcd4e6" "#afeeee" "#987654" "#af4035" "#9bc4e2" "#ddadaf" "#da8a67" "#abcdef" "#e6be8a" "#eee8aa" "#98fb98" "#dcd0ff" "#f984e5" "#fadadd" "#dda0dd" "#db7093" "#96ded1" "#c9c0bb" "#ecebbd" "#bc987e" "#afeeee" "#db7093" "#78184a" "#009b7d" "#ffefd5" "#e63e62" "#50c878" "#aec6cf" "#836953" "#cfcfc4" "#77dd77" "#f49ac2" "#ffb347" "#dea5a4" "#b39eb5" "#ff6961" "#cb99c9" "#fdfd96" "#800080" "#536878" "#ffe5b4" "#ffcba4" "#ffcc99" "#ffdab9" "#fadfad" "#d1e231" "#eae0c8" "#88d8c0" "#b768a2" "#e6e200" "#ccccff" "#1c39bb" "#00a693" "#32127a" "#d99058" "#f77fbe" "#701c1c" "#cc3333" "#fe28a2" "#ec5800" "#cd853f" "#df00ff" "#000f89" "#123524" "#45b1e8" "#c30b4e" "#fddde6" "#01796f" "#563c5c" "#ffc0cb" "#d74894" "#ffddf4" "#d8b2d1" "#ff9966" "#e7accf" "#f78fa7" "#93c572" "#e5e4e2" "#8e4585" "#dda0dd" "#86608e" "#be4f62" "#ff5a36" "#b0e0e6" "#f58025" "#701c1c" "#003153" "#df00ff" "#cc8899" "#722f37" "#644117" "#ff7518" "#800080" "#9f00c5" "#a020f0" "#69359c" "#9678b6" "#4e5180" "#fe4eda" "#50404d" "#9a4eae" "#51484f" "#436b95" "#e8ccd7" "#8e3a59" "#5d8aa8" "#ff355e" "#fbab60" "#e30b5d" "#915f6d" "#e25098" "#b3446c" "#826644" "#ff33cc" "#e3256b" "#8d4e85" "#ff0000" "#ee204d" "#f2003c" "#c40233" "#ed2939" "#ed1c24" "#fe2712" "#a52a2a" "#860111" "#ff5349" "#e40078" "#c71585" "#a45a52" "#522d80" "#002387" "#777696" "#004040" "#f1a7fe" "#d70040" "#0892d0" "#a76bcf" "#b666d2" "#b03060" "#444c38" "#704241" "#00cccc" "#8a7f80" "#838996" "#ff007f" "#f9429e" "#674846" "#b76e79" "#e32636" "#ff66cc" "#aa98a9" "#c21e56" "#905d5d" "#ab4e52" "#65000b" "#d40000" "#bc8f8f" "#0038a8" "#002366" "#4169e1" "#ca2c92" "#7851a9" "#fada5e" "#ce4676" "#d10056" "#e0115f" "#9b111e" "#ff0028" "#bb6528" "#e18e96" "#a81c07" "#80461b" "#679267" "#32174d" "#b7410e" "#da2c43" "#00563f" "#8b4513" "#ff6700" "#eed202" "#f4c430" "#bcb88a" "#23297a" "#fa8072" "#ff91a4" "#c2b280" "#967117" "#ecd540" "#f4a460" "#967117" "#92000a" "#507d2a" "#0f52ba" "#0067a5" "#cba135" "#ff2400" "#fd0e35" "#ff91af" "#ffd800" "#76ff7a" "#006994" "#2e8b57" "#321414" "#fff5ee" "#ffba00" "#704214" "#8a795d" "#778ba5" "#ffcff1" "#009e60" "#8fd400" "#d98695" "#fc0fc0" "#ff6fff" "#882d17" "#c0c0c0" "#acacac" "#5d89ba" "#c4aead" "#bfc1c2" "#cb410b" "#007474" "#87ceeb" "#cf71af" "#6a5acd" "#708090" "#003399" "#c84186" "#738276" "#933d41" "#100c08" "#fffafa" "#cec8ef" "#893843" "#757575" "#9e1316" "#1d2951" "#807532" "#0070b8" "#d10047" "#e51a4c" "#989898" "#009150" "#e86100" "#f7bfbe" "#e60026" "#00ffff" "#4c2882" "#007f5c" "#0fc0fc" "#a7fc00" "#00ff7f" "#007bb8" "#4682b4" "#cc33cc" "#fada5e" "#990000" "#4f666a" "#e4d96f" "#fc5a8d" "#ffcc33" "#e3ab57" "#fad6a5" "#fd5e53" "#cf6ba9" "#d2b48c" "#f94d00" "#f28500" "#ffcc00" "#e4717a" "#483c32" "#8b8589" "#d0f0c0" "#f88379" "#f4c2c2" "#008080" "#367588" "#99e6b3" "#00827f" "#cf3476" "#cd5700" "#e2725b" "#d8bfd8" "#de6fa1" "#fc89ac" "#0abab5" "#e08d3c" "#dbd7d2" "#eee600" "#ff6347" "#746cc0" "#ffc87c" "#fd0e35" "#808080" "#00755e" "#0073cf" "#417dc1" "#ff878d" "#deaa88" "#b57281" "#40e0d0" "#00ffef" "#a0d6b4" "#fad6a5" "#6f4e37" "#7c4848" "#a67b5b" "#c09999" "#8a496b" "#66023c" "#0033aa" "#d9004c" "#8878c3" "#536895" "#ffb300" "#3cd070" "#120a8f" "#4166f5" "#ff6fff" "#fc6c85" "#635147" "#ffddca" "#5b92e5" "#b78727" "#ffff66" "#014421" "#7b1113" "#ae2029" "#e1ad21" "#004f98" "#990000" "#ffcc00" "#f77f00" "#d3003f" "#f3e5ab" "#f38fa9" "#c5b358" "#c80815" "#43b3ae" "#e34234" "#d9381e" "#a020f0" "#8f00ff" "#7f00ff" "#8601af" "#ee82ee" "#324ab2" "#f75394" "#40826d" "#009698" "#7c9ed9" "#922724" "#9f1d35" "#da1d81" "#cc00ff" "#00ccff" "#ffa089" "#9f00ff" "#004242" "#a4f4f9" "#645452" "#f5deb3" "#ffffff" "#f5f5f5" "#a2add0" "#d470a2" "#ff43a4" "#fc6c85" "#fd5800" "#a75502" "#722f37" "#673147" "#c9a0dc" "#c19a6b" "#738678" "#0f4d92" "#1c2841" "#ffff00" "#fce883" "#efcc00" "#ffd300" "#fedf00" "#ffef00" "#fefe33" "#9acd32" "#ffae42" "#fff000" "#0014a8" "#2c1608" "#39a78e" "#000080" "#0000c8" "#000741" "#001b1c" "#002900" "#002e20" "#003366" "#003399" "#003532" "#003e40" "#004620" "#004816" "#004950" "#0056a7" "#00581a" "#0066cc" "#0066ff" "#0076a3" "#007ba7" "#007ec7" "#007fff" "#009dc4" "#00cccc" "#00ff00" "#00ffff" "#010d1a" "#011635" "#011d13" "#012731" "#01361c" "#01371a" "#013e62" "#013f6a" "#014b43" "#015e85" "#016162" "#016d39" "#017987" "#01826b" "#01a368" "#022d15" "#02402c" "#02478e" "#024e46" "#026395" "#02866f" "#02a4d3" "#03163c" "#032b52" "#036a6e" "#041004" "#041322" "#042e4c" "#044022" "#044259" "#051040" "#051657" "#055989" "#056f57" "#063537" "#069b81" "#06a189" "#073a50" "#080110" "#081910" "#082567" "#088370" "#092256" "#09230f" "#09255d" "#093624" "#095859" "#097f4b" "#0a001c" "#0a480d" "#0a6906" "#0a6f75" "#0b0b0b" "#0b0f08" "#0b1107" "#0b1304" "#0b6207" "#0c0b1d" "#0c0d0f" "#0c1911" "#0c7a79" "#0c8990" "#0d0332" "#0d1117" "#0d1c19" "#0d2e1c" "#0e0e18" "#0e2a30" "#0f2d9e" "#10121d" "#101405" "#105852" "#110c6c" "#123447" "#126b40" "#130000" "#130a06" "#13264d" "#134f19" "#140600" "#1450aa" "#151f4c" "#15736b" "#161928" "#161d10" "#162a40" "#163222" "#16322c" "#163531" "#171f04" "#175579" "#182d09" "#18587a" "#19330e" "#193751" "#1959a8" "#1a1a68" "#1ab385" "#1b0245" "#1b1035" "#1b127b" "#1b1404" "#1b2f11" "#1b3162" "#1b659d" "#1c1208" "#1c1e13" "#1c402e" "#1c7c7d" "#1d6142" "#1e0f04" "#1e1609" "#1e1708" "#1e385b" "#1e433c" "#1e9ab0" "#1f120f" "#1fc2c2" "#20208d" "#202e54" "#204852" "#211a0e" "#220878" "#228b22" "#233418" "#240a40" "#240c02" "#242a1d" "#242e16" "#24500f" "#251607" "#251706" "#251f4f" "#25272c" "#25311c" "#2596d1" "#260368" "#26056a" "#261105" "#261414" "#262335" "#26283b" "#273a81" "#27504b" "#278a5b" "#281e15" "#283a77" "#286acd" "#290c5e" "#292130" "#292319" "#292937" "#297b9a" "#2a0359" "#2a140e" "#2a2630" "#2a380b" "#2b0202" "#2b194f" "#2b3228" "#2c0e8c" "#2c1632" "#2c2133" "#2c8c84" "#2d2510" "#2d383a" "#2d569b" "#2e0329" "#2e1905" "#2e3222" "#2e3f62" "#2ebfd4" "#2f270e" "#2f3cb3" "#2f519e" "#2f5a57" "#2f6168" "#300529" "#301f1e" "#302a0f" "#304b6a" "#30d5c8" "#311c17" "#314459" "#315ba1" "#31728d" "#317d82" "#32293a" "#323232" "#325d52" "#327c14" "#327da0" "#33036b" "#33292f" "#33cc99" "#341515" "#350036" "#350e42" "#350e57" "#353542" "#354e8c" "#363050" "#363534" "#363c0d" "#36747d" "#368716" "#370202" "#371d09" "#37290e" "#373021" "#377475" "#380474" "#381a51" "#383533" "#384555" "#384910" "#394851" "#396413" "#3a0020" "#3a2010" "#3a2a6a" "#3a686c" "#3a6a47" "#3b000b" "#3b0910" "#3b1f1f" "#3b2820" "#3b91b4" "#3c0878" "#3c1206" "#3c1f76" "#3c2005" "#3c3910" "#3c4151" "#3c4443" "#3c493a" "#3d0c02" "#3d7d52" "#3e0480" "#3e1c14" "#3e2b23" "#3e2c1c" "#3e3a44" "#3eabbf" "#3f2109" "#3f2500" "#3f3002" "#3f307f" "#3f4c3a" "#3f583b" "#3f5d53" "#3fc1aa" "#401801" "#40291d" "#403b38" "#403d19" "#405169" "#40a860" "#410056" "#411f10" "#412010" "#413c37" "#414257" "#414c7d" "#41aa78" "#420303" "#423921" "#427977" "#431560" "#433120" "#433e37" "#434c59" "#436a0d" "#44012d" "#441d00" "#444954" "#454936" "#456cac" "#460b41" "#462425" "#465945" "#480404" "#480656" "#481c1c" "#483131" "#49170c" "#492615" "#49371b" "#495400" "#496679" "#497183" "#4a2a04" "#4a3004" "#4a3c30" "#4a4244" "#4a444b" "#4a4e5a" "#4b0082" "#4b5d52" "#4c3024" "#4c4f56" "#4d0135" "#4d0a18" "#4d1e01" "#4d282d" "#4d282e" "#4d3833" "#4d3d14" "#4d400f" "#4d5328" "#4e0606" "#4e2a5a" "#4e3b41" "#4e420c" "#4e4562" "#4e6649" "#4e7f9e" "#4eabd1" "#4f1c70" "#4f2398" "#4f69c6" "#4f9d5d" "#4fa83d" "#504351" "#507096" "#507672" "#514649" "#516e3d" "#517c66" "#51808f" "#52001f" "#520c17" "#523c94" "#533455" "#534491" "#53824b" "#541012" "#544333" "#54534d" "#549019" "#55280c" "#555b10" "#556d56" "#5590d9" "#56b4be" "#578363" "#583401" "#585562" "#587156" "#589aaf" "#591d35" "#592804" "#593737" "#594433" "#5a6e9c" "#5a87a0" "#5b3013" "#5c0120" "#5c0536" "#5c2e01" "#5c5d75" "#5d1e0f" "#5d4c51" "#5d5c58" "#5d5e37" "#5d7747" "#5da19f" "#5e483e" "#5e5d3b" "#5f3d26" "#5f5f6e" "#5f6672" "#5fa777" "#5fb3ac" "#604913" "#605b73" "#606e68" "#6093d1" "#612718" "#615d30" "#61845f" "#622f30" "#623f2d" "#624e9a" "#625119" "#626649" "#639a8f" "#63b76c" "#6456b7" "#646077" "#646463" "#646a54" "#646e75" "#64ccdb" "#651a14" "#652dc1" "#657220" "#65745d" "#65869f" "#660045" "#660099" "#661010" "#66b58f" "#66ff66" "#67032d" "#675fa6" "#676662" "#678975" "#67a712" "#683600" "#685558" "#685e6e" "#692545" "#692d54" "#695f62" "#697e9a" "#6a442e" "#6a5d1b" "#6a6051" "#6b2a14" "#6b3fa0" "#6b4e31" "#6b5755" "#6b8ba2" "#6b8e23" "#6cdae7" "#6d0101" "#6d5e54" "#6d6c6c" "#6d9292" "#6d92a1" "#6e0902" "#6e1d14" "#6e4826" "#6e4b26" "#6e6d57" "#6e7783" "#6f440c" "#6f6a61" "#6f8e63" "#6f9d02" "#6fd0c5" "#704a07" "#704f50" "#706555" "#711a00" "#71291d" "#714693" "#714ab2" "#715d47" "#716338" "#716b56" "#716e10" "#717486" "#718080" "#71d9e2" "#72010f" "#724a2f" "#726d4e" "#727b89" "#731e8f" "#734a12" "#736c9f" "#736d58" "#737829" "#74640d" "#747d63" "#747d83" "#748881" "#749378" "#755a57" "#7563a8" "#76395d" "#7666c6" "#76bd17" "#76d7ea" "#770f05" "#771f1f" "#773f1a" "#776f61" "#778120" "#779e86" "#780109" "#782d19" "#782f16" "#788a25" "#788bba" "#78a39c" "#795d4c" "#796989" "#796a78" "#796d62" "#79deec" "#7a013a" "#7a58c1" "#7a7a7a" "#7a89b8" "#7ac488" "#7b3801" "#7b3f00" "#7b6608" "#7b7874" "#7b7c94" "#7b8265" "#7b9f80" "#7ba05b" "#7c7631" "#7c778a" "#7c7b7a" "#7c7b82" "#7c881a" "#7ca1a6" "#7cb0a1" "#7cb7bb" "#7d2c14" "#7da98d" "#7dc8f7" "#7dd8c6" "#7e3a15" "#7f3a02" "#7f626d" "#7f7589" "#7f76d3" "#7fff00" "#800000" "#800b47" "#80341f" "#803790" "#807e79" "#80b3ae" "#80b3c4" "#80ccea" "#81422c" "#816e71" "#817377" "#819885" "#826f65" "#828685" "#828f72" "#831923" "#837050" "#83aa5d" "#83d0c6" "#843179" "#84a0a0" "#8581d9" "#858470" "#859faf" "#85c4cc" "#863c3c" "#86483c" "#864d1e" "#86560a" "#868974" "#86949f" "#871550" "#87756e" "#877c7b" "#878d91" "#87ab39" "#885342" "#886221" "#888387" "#888d65" "#893456" "#894367" "#897d6d" "#8a73d6" "#8a8360" "#8a8389" "#8a8f8a" "#8b00ff" "#8b0723" "#8b6b0b" "#8b8470" "#8b847e" "#8b8680" "#8b9c90" "#8b9fee" "#8ba690" "#8ba9a5" "#8be6d8" "#8c055e" "#8c472f" "#8c5738" "#8c6495" "#8d0226" "#8d3d38" "#8d3f3f" "#8d7662" "#8d8974" "#8d90a1" "#8da8cc" "#8e0000" "#8e4d1e" "#8e6f70" "#8e775e" "#8e8190" "#8eabc1" "#8f021c" "#8f3e33" "#8f4b0e" "#8f8176" "#8fd6b4" "#900020" "#901e1e" "#907874" "#907b71" "#908d39" "#924321" "#926f5b" "#928573" "#928590" "#93ccea" "#93dfb8" "#944747" "#948771" "#950015" "#956387" "#959396" "#964b00" "#967059" "#9678b6" "#96a8a1" "#96bbab" "#97605d" "#9771b5" "#97cd2d" "#983d61" "#9874d3" "#98811b" "#988d77" "#990066" "#991199" "#991613" "#991b07" "#9999cc" "#9a3820" "#9a6e61" "#9a9577" "#9ac2b8" "#9b4703" "#9b9e8f" "#9c3336" "#9d5616" "#9dacb7" "#9dc209" "#9de093" "#9de5ff" "#9e5302" "#9e5b40" "#9ea587" "#9ea91f" "#9eb1cd" "#9edee0" "#9f381d" "#9f821c" "#9f9f9c" "#9fa0b1" "#9fd7d3" "#9fdd8c" "#a02712" "#a1750d" "#a1adb5" "#a1c50a" "#a1dad7" "#a1e9de" "#a23b6c" "#a26645" "#a2aab3" "#a2aeab" "#a3807b" "#a397b4" "#a3e3ed" "#a4a49d" "#a4a6d3" "#a4af6e" "#a59b91" "#a5cb0c" "#a62f20" "#a65529" "#a68b5b" "#a69279" "#a6a29a" "#a72525" "#a7882c" "#a85307" "#a86515" "#a86b6b" "#a8989b" "#a899e6" "#a8a589" "#a8ae9c" "#a8af8e" "#a8bd9f" "#a8e3bd" "#a9a491" "#a9acb6" "#a9b2c3" "#a9b497" "#a9bdbf" "#a9bef2" "#a9c6c2" "#aa375a" "#aa4203" "#aa8b5b" "#aa8d6f" "#aaa5a9" "#aaa9cd" "#aaabb7" "#aad6e6" "#ab0563" "#ab3472" "#ab917a" "#aba0d9" "#aba196" "#ac8a56" "#ac91ce" "#ac9e22" "#aca494" "#aca586" "#aca59f" "#acb78e" "#accbb1" "#acdd4d" "#ad781b" "#adbed1" "#addfad" "#ade6c4" "#adff2f" "#ae4560" "#ae6020" "#ae809e" "#af4d43" "#af593e" "#af8751" "#af8f2c" "#af9f1c" "#afa09e" "#afb1b8" "#afbdd9" "#b04c6a" "#b05d54" "#b05e81" "#b06608" "#b09a95" "#b0e313" "#b10000" "#b14a0b" "#b1610b" "#b16d52" "#b19461" "#b1e2c1" "#b1f4e7" "#b20931" "#b2a1ea" "#b32d29" "#b35213" "#b38007" "#b3af95" "#b3c110" "#b43332" "#b44668" "#b4cfd3" "#b57edc" "#b5a27f" "#b5b35c" "#b5d2ce" "#b5ecdf" "#b6316c" "#b69d98" "#b6b095" "#b6baa4" "#b6d1ea" "#b6d3bf" "#b78e5c" "#b7a214" "#b7a458" "#b7b1b1" "#b7c3d0" "#b7f0be" "#b81104" "#b8b56a" "#b8c1b1" "#b8c25d" "#b8e0f9" "#b94e48" "#b95140" "#b98d28" "#b9c46a" "#b9c8ac" "#ba0101" "#ba450c" "#ba6f1e" "#ba7f03" "#bab1a2" "#bac7c9" "#baeef9" "#bb3385" "#bb8983" "#bbd009" "#bbd7c1" "#bcc9c2" "#bd5e2e" "#bd978e" "#bdb1a8" "#bdb2a1" "#bdb3c7" "#bdbbd7" "#bdbdc6" "#bdc8b3" "#bdc9ce" "#bdedfd" "#bea6c3" "#beb5b7" "#bede0d" "#bf5500" "#bfb8b0" "#bfbed8" "#bfc921" "#bfdbe2" "#bfff00" "#c02b18" "#c04737" "#c0d3b9" "#c0d8b6" "#c1440e" "#c154c1" "#c1a004" "#c1b7a4" "#c1bab0" "#c1becd" "#c1d7b0" "#c1f07c" "#c26b03" "#c2955d" "#c2bdb6" "#c2cac4" "#c2e8e5" "#c32148" "#c3b091" "#c3bfc1" "#c3c3bd" "#c3cde6" "#c3d1d1" "#c3ddf9" "#c45655" "#c45719" "#c4c4bc" "#c4d0b0" "#c4f4eb" "#c59922" "#c5994b" "#c5dbca" "#c5e17a" "#c62d42" "#c6726b" "#c69191" "#c6a84b" "#c6c3b5" "#c6c8bd" "#c6e610" "#c7031e" "#c71585" "#c7bca2" "#c7c1ff" "#c7c4bf" "#c7c9d5" "#c7cd90" "#c7dde5" "#c88a65" "#c8a528" "#c8aabf" "#c8b568" "#c8e3d7" "#c96323" "#c99415" "#c9a0dc" "#c9b29b" "#c9b35b" "#c9b93b" "#c9c0bb" "#c9d9d2" "#c9ffa2" "#ca3435" "#cabb48" "#cadcd4" "#cae6da" "#cb8fa9" "#cbcab6" "#cbd3b0" "#cbdbd6" "#cccaa8" "#cd5700" "#cd5c5c" "#cd8429" "#cdf4ff" "#ceb98f" "#cebaba" "#cec291" "#cec7a7" "#cfa39d" "#cfdccf" "#cfe5d2" "#cff9f3" "#cffaf4" "#d05f04" "#d06da1" "#d07d12" "#d0bef8" "#d0c0e5" "#d18f1b" "#d1bea8" "#d1c6b4" "#d1d2ca" "#d1d2dd" "#d2691e" "#d27d46" "#d29eaa" "#d2da97" "#d2f6de" "#d2f8b0" "#d3cbba" "#d3cdc5" "#d47494" "#d4b6af" "#d4bf8d" "#d4c4a8" "#d4cd16" "#d4d7d9" "#d4dfe2" "#d4e2fc" "#d54600" "#d591a4" "#d59a6f" "#d5d195" "#d5f6e3" "#d69188" "#d6c562" "#d6cef6" "#d6d6d1" "#d6ffdb" "#d7c498" "#d7d0ff" "#d84437" "#d87c63" "#d8c2d5" "#d8fcfa" "#d94972" "#d99376" "#d9b99b" "#d9d6cf" "#d9dcc1" "#d9e4f5" "#d9f7ff" "#da3287" "#da5b38" "#da6304" "#da6a41" "#da8a67" "#daa520" "#daecd6" "#daf4f0" "#dafaff" "#db5079" "#db9690" "#db995e" "#dbdbdb" "#dbfff8" "#dc4333" "#dcb20c" "#dcb4bc" "#dcd747" "#dcd9d2" "#dcddcc" "#dcedb4" "#dcf0ea" "#ddd6d5" "#ddf9f1" "#de3163" "#de6360" "#dea681" "#deba13" "#dec196" "#decbc6" "#ded4a4" "#ded717" "#dee5c0" "#def5ff" "#dfbe6f" "#dfcd6f" "#dfcfdb" "#dfecda" "#dfff00" "#e0b646" "#e0b974" "#e0c095" "#e0ffff" "#e16865" "#e1bc64" "#e1c0c8" "#e1e6d6" "#e1ead4" "#e1f6e8" "#e25465" "#e2725b" "#e28913" "#e292c0" "#e29418" "#e29cd2" "#e2d8ed" "#e2ebed" "#e2f3ec" "#e30b5c" "#e3bebe" "#e3f5e1" "#e47698" "#e4c2d5" "#e4cfde" "#e4d1c0" "#e4d422" "#e4d5b7" "#e4d69b" "#e4f6e7" "#e4ffd1" "#e5841b" "#e5d7bd" "#e5d8af" "#e5e0e1" "#e5e5e5" "#e5f9f6" "#e64e03" "#e6be8a" "#e6bea5" "#e6d7b9" "#e6e4d4" "#e6f2ea" "#e6f8f3" "#e6ffe9" "#e6ffff" "#e77200" "#e7730a" "#e79f8c" "#e7bcb4" "#e7bf05" "#e7cd8c" "#e7ece6" "#e7f8ff" "#e89928" "#e8b9b3" "#e8e0d5" "#e8ebe0" "#e8f1d4" "#e8f2eb" "#e8f5f2" "#e96e00" "#e97c07" "#e9cecd" "#e9d75a" "#e9e3e3" "#e9f8ed" "#e9fffd" "#ea88a8" "#eaae69" "#eab33b" "#eac674" "#eadab8" "#eae8d4" "#eaf6ee" "#eaf6ff" "#eaf9f5" "#eafffe" "#eb9373" "#ebc2af" "#eca927" "#ecc54e" "#ecc7ee" "#eccdb9" "#ece090" "#ecebbd" "#ecebce" "#ecf245" "#ed0a3f" "#ed7a1c" "#ed989e" "#edb381" "#edcdab" "#eddcb1" "#edea99" "#edf5dd" "#edf5f5" "#edf6ff" "#edf9f1" "#edfc84" "#eec1be" "#eed794" "#eed9c4" "#eededa" "#eee3ad" "#eeeee8" "#eeef78" "#eef0c8" "#eef0f3" "#eef3c3" "#eef4de" "#eef6f7" "#eefdff" "#eeff9a" "#eeffe2" "#ef863f" "#efefef" "#eff2f3" "#f091a9" "#f0d52d" "#f0db7d" "#f0e2ec" "#f0e68c" "#f0eefd" "#f0eeff" "#f0fcea" "#f18200" "#f19bab" "#f1e788" "#f1e9d2" "#f1e9ff" "#f1eec1" "#f1f1f1" "#f1f7f2" "#f1ffad" "#f1ffc8" "#f2552a" "#f2c3b2" "#f2f2f2" "#f2fafa" "#f34723" "#f3ad16" "#f3d69d" "#f3d9df" "#f3e7bb" "#f3e9e5" "#f3edcf" "#f3fb62" "#f3fbd4" "#f3ffd8" "#f4d81c" "#f4ebd3" "#f4f2ee" "#f4f4f4" "#f4f8ff" "#f57584" "#f5c85c" "#f5c999" "#f5d5a0" "#f5e7a2" "#f5e7e2" "#f5e9d3" "#f5edef" "#f5f3e5" "#f5fb3d" "#f5ffbe" "#f653a6" "#f6a4c9" "#f6f0e6" "#f6f7f7" "#f6ffdc" "#f7468a" "#f77703" "#f7b668" "#f7c8da" "#f7dbe6" "#f7f2e1" "#f7f5fa" "#f7faf7" "#f8b853" "#f8c3df" "#f8d9e9" "#f8db9d" "#f8dd5c" "#f8e4bf" "#f8f0e8" "#f8f6f1" "#f8f7dc" "#f8f7fc" "#f8f8f7" "#f8f99c" "#f8facd" "#f8fdd3" "#f95a61" "#f9bf58" "#f9e0ed" "#f9e4bc" "#f9e663" "#f9e6f4" "#f9eaf3" "#f9f8e4" "#f9ff8b" "#f9fff6" "#fa7814" "#fa9d5a" "#fad3a2" "#fadfad" "#fae600" "#faeab9" "#faeccc" "#faf3f0" "#faf7d6" "#fafafa" "#fafde4" "#faffa4" "#fb8989" "#fba129" "#fbac13" "#fbb2a3" "#fbbeda" "#fbceb1" "#fbe7b2" "#fbe870" "#fbe96c" "#fbea8c" "#fbec5d" "#fbf9f9" "#fbffba" "#fc80a5" "#fc9c1d" "#fcc01e" "#fcd667" "#fcd917" "#fcda98" "#fcf4d0" "#fcf4dc" "#fcf8f7" "#fcfbf3" "#fcfeda" "#fcffe7" "#fcfff9" "#fd0e35" "#fd5b78" "#fd7b33" "#fd7c07" "#fd9fa2" "#fdd7e4" "#fde1dc" "#fde295" "#fde910" "#fdf6d3" "#fdf7ad" "#fdfeb8" "#fdffd5" "#fe4c40" "#fe9d04" "#fea904" "#febaad" "#fed33c" "#fed85d" "#fedb8d" "#fee5ac" "#feebf3" "#feefce" "#fef0ec" "#fef2c7" "#fef3d8" "#fef4cc" "#fef4db" "#fef4f8" "#fef5f1" "#fef7de" "#fef8e2" "#fef8ff" "#fef9e3" "#fefced" "#ff00cc" "#ff00ff" "#ff3399" "#ff3f34" "#ff4d00" "#ff4f00" "#ff6037" "#ff6600" "#ff66ff" "#ff681f" "#ff6b53" "#ff6fff" "#ff7034" "#ff7d07" "#ff7f00" "#ff8c69" "#ff9000" "#ff910f" "#ff91a4" "#ff9933" "#ff9980" "#ff9e2c" "#ffa000" "#ffa194" "#ffa500" "#ffab81" "#ffb0ac" "#ffb1b3" "#ffb31f" "#ffb555" "#ffb7d5" "#ffb97b" "#ffbd5f" "#ffc0a8" "#ffc3c0" "#ffc901" "#ffcba4" "#ffcc5c" "#ffcc99" "#ffcd8c" "#ffd1dc" "#ffd2b7" "#ffd38c" "#ffd700" "#ffd8d9" "#ffdcd6" "#ffddaf" "#ffddcd" "#ffddcf" "#ffdeb3" "#ffe1df" "#ffe1f2" "#ffe2c5" "#ffe5a0" "#ffe6c7" "#ffe772" "#ffeac8" "#ffead4" "#ffec13" "#ffedbc" "#ffeed8" "#ffefa1" "#ffefc1" "#ffefec" "#fff0db" "#fff14f" "#fff1b5" "#fff1d8" "#fff1ee" "#fff1f9" "#fff39d" "#fff3f1" "#fff46e" "#fff4ce" "#fff4dd" "#fff4e0" "#fff4e8" "#fff4f3" "#fff5ee" "#fff5f3" "#fff6d4" "#fff6df" "#fff6f5" "#fff8d1" "#fff9e2" "#fff9e6" "#fffaf4" "#fffbdc" "#fffbf9" "#fffc99" "#fffcea" "#fffcee" "#fffde6" "#fffde8" "#fffdf3" "#fffdf4" "#fffee1" "#fffeec" "#fffef0" "#fffef6" "#fffefd" "#ffff99" "#ffffb4")

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

escapeBraces()
{
	local string="${1}"
	string=${string//\{/\\\{}
	string=${string//\}/\\\}}
	printf "%s" "$string"
}

insertFormattingCode()
{
	local string="${1}"
	local tag="<t>"
	local formattingCodeString="${2}"
	local formatting=""
	local backgroundColorization=""
	local textColorization=""
	local formatted="[124578]{0,1}"
	local backgroundColorized="48;5;[0-9]{1,3}"
	local textColorized="38;5;[0-9]{1,3}"
	#local formatCapture="\(^[\\]e\[${formatted}[;|m]\)\(${backgroundColorized}[;|m]\)\(${textColorized}m\)"
	local formatCapture="\(^[\\]e\[${formatted}[;|m]\)"
	local textCapture="\(${textColorized}m\)"
	local backgroundCapture="\(${backgroundColorized}[;|m]\)"
	local sedPosition=(1 2 3)

	#
	if [[ "${string}" =~ $formatted ]]; then
		formatting="\\${sedPosition[0]}"
		unset array[0]
		sedPosition=("${sedPosition[@]}")
		echo "formatted!"
	fi

	#
	if [[ "${string}" =~ $backgroundColorized ]]; then
		backgroundColorization="\\${sedPosition[0]}"
		unset array[0]
		sedPosition=("${sedPosition[@]}")
		echo "background colorized!"
	fi

	#
	if [[ "${string}" =~ $textColorized ]]; then	
		textColorization="\\${sedPosition[0]}"
		unset array[0]
		sedPosition=("${sedPosition[@]}")
		echo "text colorized!"
	fi

	#
	backgroundCapture=$(escapeBraces ${backgroundCapture})
	textCapture=$(escapeBraces ${textCapture})
	formatCapture=$(escapeBraces ${formatCapture})
	splitFormatting="${formatCapture}${backgroundCapture}${textCapture}"

	#
	if [[ "${formattingCodeString}" =~ $backgroundColorized ]]; then
		echo "1"
		string=$( \
		echo "${string}" | \
		sed "s/${formatCapture}/${formatting}${tag}${textColorization}/g" \
	)
	elif [[ "${formattingCodeString}" =~ $textColorized ]]; then
		echo "2"
		string=$( \
		echo "${string}" | \
		sed "s/${formatCapture}/${formatting}${backgroundColorization}${tag}/g" \
	)
	elif [[ "${formattingCodeString}" =~ $formatted ]]; then
		echo "3"
		string=$( \
		echo "${string}" | \
		sed "s/${formatCapture}/${formatting}${tag}${backgroundColorization}${textColorization}/g" \
	)
	fi

	#
	printf "%s\n\n" ${string//$tag/$formattingCodeString}
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

#───────────────────────────────────────────────────────────────────────────────
# Function Test
#───────────────────────────────────────────────────────────────────────────────
if [[ $SCRIPT_SELF_TEST_MODE -eq 1 ]]; then

OpenEscapeSequence()
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
# if [[ ! -d "./shunit2-2.0.3" ]]; then
# 	printf "Downloading test tools for this environment."
# 	curl -L "http://downloads.sourceforge.net/shunit2/shunit2-2.0.3.tgz" | tar zx
# 	. shunit2-2.0.3/src/shell/shunit2
# 	#in an environment where i can't leave testing tools lying around
# 	rm -rf "./shunit2-2.0.3"
# else
# 	#this is probably a development environment
# 	. shunit2-2.0.3/src/shell/shunit2
# fi

fi

for colorHex in ${hexCodeList[@]}; do
	colorRbg=($(rgbValues $colorHex))
	printf "%s\n" "${colorRbg[0]} ${colorRbg[1]} ${colorRbg[2]}" >> "rgb-values.txt"
done
# for colorInformation in ${colorList[@]}; do
# 	eval colorCode=\$${colorInformation}
# 	eval colorName=\${${colorInformation}[$COLOR_NAME]}
# 	eval colorHex=\${${colorInformation}[$COLOR_HEX_CODE]}
# 	colorRbg=($(rgbValues $colorHex))
# 	colorSpectrum=$(colorizeBackground $colorCode $colorName)
# 	printf "${colorSpectrum} %s" "${colorRbg[0]} ${colorRbg[1]} ${colorRbg[2]}"
# 	printf "\n"
# done
# insertFormattingCode "\\e[1mhello" "38;5;20"
# insertFormattingCode "\\e[1;48;5;10;38;5;128mhello" "48;5;200"
# insertFormattingCode "\\e[48;5;10mhello" "38;5;150"
# insertFormattingCode "\\e[38;5;128mhello" "1"
# insertFormattingCode "\\e[1;38;5;128mhello" "48;5;40"
# for colorInformation in ${colorList[@]}; do
# 	eval colorCode=\$${colorInformation}
# 	eval colorName=\${${colorInformation}[$COLOR_NAME]}
# 	colorSpectrum=$(colorizeBackground $colorCode "$colorName")
# 	printf "${colorSpectrum}"
# 	printf "\n"
#done