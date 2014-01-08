#!/bin/bash
#═══════════════════════════════════════════════════════════════════════════════
# [work]
# Silver-Studded-Blue BASH Scripting Tools
# [copyright]
# (c) 2013 Dodzi Y. Dzakuma (http://www.nexocentric.com)
#     See copyright at footer for more information.
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
SCRIPT_OPTION_FLAGS="D:d:hTtVv"
SCRIPT_SELF_TEST_MODE=0
SCRIPT_DEBUG_MODE=0
SCRIPT_FUNCTION_TO_DEBUG=
SCRIPT_VERBOSE_MODE=0

#───────────────────────────────────────────────────────────────────────────────
# Script Control Functions
#───────────────────────────────────────────────────────────────────────────────

#===========================================================
# [author]
# Dzakuma, Dodzidenu
# [summary]
# [parameters]
# [return]
#===========================================================
displayScriptHeader()
{
	#you want to make something like this
	#================================================#
	# SCRIPT_NAME SCRIPT_VERSION SCRIPT_VERSION_NAME #
	#================================================#
	return 0
}
 
#===========================================================
# [author]
# Dzakuma, Dodzidenu
# [summary]
# [parameters]
# [return]
#===========================================================
displayScriptLicense()
{
	#MIT something somethimg something...
	return 0
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
	if [[ $# -lt 1 ]]; then
		return
	fi
	printf "%s\n" "$*" >&2
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# This function repeats a string N number of times.
# [parameters]
# 1) The string to be repeated
# 2) The number of times to repeat the string
# [return]
# 1) If no errors occur during string repetition this 
#    function prints the repeated string to standard output.
# 2) Blank on error.
#===========================================================
repeatString()
{
	local string=
	local maxRepetitions=
	local generatedString=

	#check that string passed
	if [[ $# -ne 2 ]]; then
		return
	fi

	#assign positional parameters
	string="$1"
	maxRepetitions=$2

	#check that number passed
	if [[ ! $2 -gt 0 ]]; then
		return
	fi

	#generate string
	for ((repetition=0; repetition<$maxRepetitions; repetition++)); do
		generatedString="${generatedString}${string}"
	done
	
	#display generated string
	printf "%s" "${generatedString}"
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
        clear
        printf "=============================================\n"
        printf "%s %s\n" "${SCRIPT_NAME}" "${SCRIPT_VERSION}"
        printf "%s\n\n" "----------------------------------------------"
        printf "Synopsis:\n"
        printf "%s [-h]\n"
        printf "\n"
        printf "Usage:\n"
        printf "[] are used to designate optional fields\n"
        printf "\n"
        printf "Flags:\n"
        printf "        [-h] : display this message\n"
        printf "\n"
        printf "=============================================\n\n"
}

#===========================================================
# [author]
# Dzakuma, Dodzidenu
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
		D | d )
			SCRIPT_DEBUG_MODE=1
			SCRIPT_FUNCTION_TO_DEBUG="${OPTARG}"
			break
		;;
		# turn on self testing
		T | t )
			SCRIPT_SELF_TEST_MODE=1
			break
		;;
		# display the script usage menu on help or invalid argments
		h | V )
			displayScriptHeader
			if [[ "${scriptOption}" = "V" ]]; then
				exit
			fi
			displayScriptUsage
			cleanUp 1
			exit
		;;
		# verbose mode
		v )
						
		;;
	esac
	#remove parsed options from the list
	shift $((OPTIND-1))
done

#───────────────────────────────────────────────────────────────────────────────
# Script Functions
#───────────────────────────────────────────────────────────────────────────────

stringToArray()
{
	printf "%s"	"$(echo $1 | sed 's/\(.\)/\1 /g')"
}

displayFunctionSummary()
{
	#getopts settings
	local OPTIND
	local FUNCTION_NAME="$1"
	local FUNCTION_OPTION_FLAGS="$2"
	shift 2 # so that it starts running like a normal function

	#FUNCTION_OPTION_FLAGS=$(printf "%s" "${FUNCTION_OPTION_FLAGS}" | sed s/-//g)
	
	#function variables
	local unformatedOptions=$(stringToArray "${FUNCTION_OPTION_FLAGS}")
	local functionOption=

	echo "${unformatedOptions[@]}"
	FUNCTION_OPTION_FLAGS=
	#parse the options like each one is required
	for option in ${unformatedOptions[@]}; do
		FUNCTION_OPTION_FLAGS="${FUNCTION_OPTION_FLAGS}${option}:"
	done
	echo "${FUNCTION_OPTION_FLAGS[@]}"
	echo $#

	#parse get opts
	while getopts $FUNCTION_OPTION_FLAGS functionOption; do
		case "${functionOption}" in
			* )
				printf "%s %s\n" "-${functionOption}" "${OPTARG}"
			;;
		esac
		#remove the options that were parsed
		shift $((OPTIND-1))
	done

	for requiredParameter in "$@"; do
		printf "<%s>\n" "${requiredParameter}"
	done
}

reverseString()
{
	if [[ $# -lt 1 ]]; then
		return
	fi

	reversedString="$1"
	len=${#reversedString}
	for ((i=1;i<len;i++)); do reversedString=$reversedString${reversedString: -i*2:1}; done; reversedString=${reversedString:len-1}
	printf "%s" "${reversedString}"
}

isInteger()
{
	if [[ $# -lt 1 ]]; then
		return
	fi

	#if the number exists and is maches format
	test "$1" && printf "%d" "$1" > /dev/null;
}

ignoredFile()
{
	#変数宣言
	local fileName=$1
 
	#ファイルは指定されていなかった
	if [[ -z $fileName ]]; then
		printf "ファイル名はしてされていない\n"
		exit 1
	fi
 
	#ファイルリストを確認する
	for ignored in "${INGNORE_LIST[@]}"; do
		#無視リストに入っているかを確認
		if [[ "$fileName" =~ $ignored ]]; then
			#このファイルはtarしてはいけない			
			return $INGNORE_FILE
		fi
	done
 
	#このファイルはtarしてもよし
	return $ADD_FILE
}

aggregateDirectory()
{
	#getopts settings
	local OPTIND
	local FUNCTION_OPTION_FLAGS="fiRrv"
	
	#function settings
	local FUNCTION_USAGE="${FUNCNAME[0]} -${FUNCTION_OPTION_FLAGS} FOLDER PATH"
	local GLOBIGNORE=.:..
	local RECURSIVE_MODE=
	local AGGREGATE_MODE="directories"

	#function variables
	local aggregatedContents=
	local directory=
	local directories=
	local functionOptionFlags=
	local files=
	local path=

	#parse get opts
	while getopts $FUNCTION_OPTION_FLAGS functionOption; do
		case "${functionOption}" in
			f )
				functionOptionFlags="${functionOptionFlags}${OPTARG}"
				AGGREGATE_MODE="files"
			;;
			# display the script usage menu on help or invalid argments
			h )
				displayVerboseInformation "Function usage:" 
				displayVerboseInformation "${FUNCTION_USAGE}"
				return 0
			;;
			#parse the directory recursively
			R | r )
				displayVerboseInformation "Replacement by individually matching characters has been set."
				RECURSIVE_MODE=1
				functionOptionFlags="${functionOptionFlags}${OPTARG}"
			;;
			# #display verbose information
			v )
				displayVerboseInformation "Verbose mode has been enabled."
			;;
			\? )
				printf "-%s is an invalid option. \nPlease use the -h flag to display usage information.\n" "$OPTARG"
				return 1
			;;
		esac
		#remove the options that were parsed
		shift $((OPTIND-1))
	done

	if [[ $# -lt 1 ]]; then
		return
	fi
 
	for path in "$directory/"*; do
 
		#無視すべきファイルを確認する
		#ignoredFile "$path"
		# if [[ $? -eq $INGNORE_FILE ]]; then
		# 	printf "\n$pathを無視した\n無視リストにはいていた\nご確認ください\n\n"
		# 	continue
		# fi
 
		#ディレクトリとファイルを別々の配列に保存
		if [[ -f "$path" ]]; then
			#ファイル
			files=("${files[@]}" "$path")
		elif [[ -d "$path" ]]; then
			#ディレクトリ
			directories=("${directories[@]}" "$path")
			if [[ -n "${RECURSIVE_MODE}" ]]; then
				if [[ -n "${functionOptionFlags}" ]]; then
					functionOptionFlags="-${functionOptionFlags}"
				fi
				$(aggregateDirectory "${functionOptionFlags}" "${path}")
			fi
		fi
	done

	aggregatedContents=${!AGGREGATE_MODE}
	printf "%s" "${aggregatedContents[@]}"
}

#===========================================================
# [author]
# Dodzidenu Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
replaceString()
{
	#getopts settings
	local OPTIND
	local FUNCTION_OPTION_FLAGS="cfhn:tv"
	local FUNCTION_USAGE="${FUNCNAME[0]} -${FUNCTION_OPTION_FLAGS} STRING SEARCH-STRING [REPLACEMENT STRING]"

	#function constants
	local HEAD_REPLACE=1
	local WHOLE_WORD_REPLACE=1 #default is on
	local REPLACE_ALL_MATCHING="g"
	local SPACE_PLACEHOLDER="█" #this character will no normally appear in strings
	local REPLACE_NTH_INSTANCE=0

	#function variables
	local functionOption=
	local originalString=
	local searchString=
	local searchCharacters=
	local replacementString= #will delete characters/words by default
	local processedString=
	local character=
	local processingString=
	local nextReplacementCharacter=0
	local extractionStart=
	local extractionFinish=

	#parse get opts
	while getopts $FUNCTION_OPTION_FLAGS functionOption; do
		case "${functionOption}" in
			#replace by character and not by whole word
			c )
				displayVerboseInformation "Replacement by individually matching characters has been set."
				WHOLE_WORD_REPLACE=
			;;
			#replace first instance only
			f )
				displayVerboseInformation "Only the first match will be replaced."
				REPLACE_ALL_MATCHING= #turn off all replacement
			;;
			# display the script usage menu on help or invalid argments
			h )
				displayVerboseInformation "Function usage:" 
				displayVerboseInformation "${FUNCTION_USAGE}"
				return 0
			;;
			# replace the nth instance of match
			n )
				isInteger "${OPTARG}"
				if [[ $? -ne 0 ]]; then
					displayVerboseInformation "Invalid argument for -n ${OPTARG}"
					displayVerboseInformation "Function usage:" 
					displayVerboseInformation "${FUNCTION_USAGE}"
				fi
				#OPTARG has been determined a safe integer so use it as such
				REPLACE_NTH_INSTANCE=$OPTARG
			;;
			#start replacement from tail
			t )
				displayVerboseInformation "Replacement will begin from tail."
				HEAD_REPLACE=
			;;
			# #display verbose information
			v )
				displayVerboseInformation "Verbose mode has been enabled."
			;;
			\? )
				printf "-%s is an invalid option. \nPlease use the -h flag to display usage information.\n" "$OPTARG"
				return 1
			;;
		esac
		#remove the options that were parsed
		shift $((OPTIND-1))
	done

	if [[ $# -eq 3 ]]; then
		replacementString=$3
		replacementString=${replacementString// /$SPACE_PLACEHOLDER}
	fi
	
	if [[ $# -ge 2 ]]; then
		searchString=$2
		searchString=${searchString// /$SPACE_PLACEHOLDER}
	fi
	originalString=$1
	originalString=${originalString// /$SPACE_PLACEHOLDER}

	displayVerboseInformation \
		"Searching [${originalString//$SPACE_PLACEHOLDER/ }] " \
		"for [${searchString//$SPACE_PLACEHOLDER/ }] and replacing " \
		"from [${replacementString//$SPACE_PLACEHOLDER/ }]." 
	displayVerboseInformation "[Settings]"
	displayVerboseInformation "Character replace  : " \
	displayVerboseInformation "Replace from tail  : " \
	displayVerboseInformation "First match replace: "
	displayVerboseInformation ""

	#safety checks
	if [[ -z "${originalString}" ]] || [[ -z "${searchString}" ]]; then
		return
	fi

	#reverse string for reverse lookup
	if [[ -z "${HEAD_REPLACE}" ]]; then
		originalString=$(reverseString $originalString)
		searchString=$(reverseString $searchString)
		if [[ -n "${replacementString}" ]]; then
			replacementString=$(reverseString $replacementString)
		fi
	fi

	#

	#replacement loop
	if [[ -z "${WHOLE_WORD_REPLACE}" ]]; then
		processingString="${originalString}"
		searchCharacters=$(stringToArray "${searchString}")
		for character in $searchCharacters; do
			processingString=$( \
				printf "%s" "${processingString}" | \
				sed "s/${character}/${replacementString:$nextReplacementCharacter:1}/${REPLACE_ALL_MATCHING}" \
			)
			if [[ $nextReplacementCharacter -eq $((${#replacementString} - 1)) ]]; then #change this to -gt ${#replacementString} for meeting on the 15th
				nextReplacementCharacter=0
			else
				nextReplacementCharacter=$((nextReplacementCharacter + 1))
			fi
		done
		processedString="${processingString}"
	else
		processedString=$( \
			printf "%s" "${originalString}" | \
			sed "s/${searchString}/${replacementString}/${REPLACE_ALL_MATCHING}" \
		)
	fi

	if [[ "${originalString}" = "processedString" ]]; then
		displayVerboseInformation "No matches found in string."
	fi

	#reverse string for reverse lookup
	if [[ -z "${HEAD_REPLACE}" ]]; then
		processedString=$(reverseString $processedString)
	fi

	processedString=${processedString//$SPACE_PLACEHOLDER/ }
	printf "%s" "${processedString}"
}

# dynamicVariable()
# {
# 	local OPTIND
# 	local FUNCTION_OPTION_FLAGS="ah"
# 	local functionOption=
# 	local declareArray=
# 	local variableName=
# 	local variableValue=

# 	#clean variable name and variable
# 	variableName=$(replaceCharacters $variableName )
# 	variableValue=$(replaceCharacters $variableName )
# 	while getopts $FUNCTION_OPTION_FLAGS functionOption; do
# 		case "${functionOption}" in
# 			# turn on self testing
# 			a )
# 				SCRIPT_SELF_TEST_MODE=1
# 				break
# 			;;
# 			# display the script usage menu on help or invalid argments
# 			h )
# 				displayScriptUsage
# 				cleanUp 1
# 				exit
# 			;;
# 		esac
# 	done	
	
# 	if [[ -n $declareArray ]]; then
		
# 	fi
	
# 	if [[]]; then
# 		declare $declareArray "${variableName}"="${variableValue}"
# 	else
	
# 	fi
	
# 	return 0
# }


TABLE_VARIABLE_STEM="_table_column_"
addDynamicTableData()
{
        local tableName="$1" #you might want to use sed to make sure that you're not
        ##using sysmbols that can't be used in as a variable
        shift
        local rowDataList="$@"
        local columnIndex=0

        for cellData in "${rowDataList[@]}"; do
                dynamicVariable -a "${tableName}${TABLE_VARIABLE_STEM}${columnIndex}" "${cellData}"
                columnIndex=$((columnIndex++))
        done
}

displayDynamicTable()
{
        local columnDataVariablePrefix="$1${TABLE_VARIABLE_STEM}"
        local columnCount=0

        #get the number of columns to be displayed
        while [[ -n $(dynamicVariable -p "${columnDataVariablePrefix}${columnCount}") ]]; do
                $((columnCount++))
        done
}

#───────────────────────────────────────────────────────────────────────────────
# Function Test
#───────────────────────────────────────────────────────────────────────────────
if [[ $SCRIPT_SELF_TEST_MODE -eq 1 ]]; then

testRepeatString()
{
	local repeatStringError=$(repeatString "a")
	assertNull "The repeat string function should have failed." "${repeatStringError}"

	repeatStringError=$(repeatString "a" -1)
	assertNull "The repeat string function should have failed." "${repeatStringError}"
	
	local sixCharacterString=$(repeatString "a" 6)
	assertSame "Failed to repeat the character 'a' 6 times." "aaaaaa" "${sixCharacterString}"
	
	local popLyrics="$(repeatString 'Womanizer, ' 2)Womanizer"
	assertSame "Failed to duplicate pop lyrics." "Womanizer, Womanizer, Womanizer" "${popLyrics}"
}

testReplaceString()
{
	local originalString="clean up this lean mess!"
	local replacedString=""

	#help displayed
	replacedString=$(replaceString -hv)
	assertSame "Failed to display help." 0 $?

	#insufficient parameters
	replacedString=$(replaceString -v "${originalString}")
	assertNull "Failed to return null string." "${replacedString}"

	#character replacement single
	replacedString=$(replaceString -vcf "${originalString}" "c")
	assertSame "Failed to replace first matching character in string." "lean up this lean mess!" "${replacedString}"

	#multiple character replacement single
	replacedString=$(replaceString -vcf "${originalString}" "cup ")
	assertSame "Failed to replace first matching character in string." "lean this lean mess!" "${replacedString}"

	#multiple character replacement all
	replacedString=$(replaceString -vc "${originalString}" "ethsm")
	assertSame "Failed to replace all matching characters in string." "clan up i lan !" "${replacedString}"

	#multiple character replacement all
	replacedString=$(replaceString -vcf "${originalString}" "isss" "at")
	assertSame "Failed to replace single matching characters in string." "clean up that lean meat!" "${replacedString}"

	#multiple character single from tail
	replacedString=$(replaceString -vcft "${originalString}" "ss" "at")
	assertSame "Failed to replace single matching characters in string from tail." "clean up this lean meat!" "${replacedString}"

	#full word replacement single
	replacedString=$(replaceString -vf "${originalString}" "clean" "beam")
	assertSame "Failed to replace first matching whole word in string." "beam up this lean mess!" "${replacedString}"

	#full word replacement all
	replacedString=$(replaceString "${originalString}" "lean ")
	assertSame "Failed to replace all matching whole words in string." "cup this mess!" "${replacedString}"

	#full word replacement single from tail
	replacedString=$(replaceString -vft "${originalString}" "lean ")
	assertSame "Failed to replace all matching whole words in string." "clean up this mess!" "${replacedString}"
}

#this is an xUnit family testing framework for shell files
. shunit2-2.0.3/src/shell/shunit2

fi

if [[ $SCRIPT_DEBUG_MODE -eq 1 ]]; then
	printf "Start debugging scripts.\n"
	#this right now is unsafe!!
	eval $SCRIPT_FUNCTION_TO_DEBUG
	exit 0
fi
#───────────────────────────────────────────────────────────────────────────────
# Function Exports
#───────────────────────────────────────────────────────────────────────────────
export -f isInteger
export -f displayFunctionSummary
export -f repeatString
export -f reverseString
export -f replaceString

#═══════════════════════════════════════════════════════════════════════════════
# The MIT License (MIT)
#
# Copyright (c) 2013 Dodzi Y. Dzakuma (http://www.nexocentric.com)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#═══════════════════════════════════════════════════════════════════════════════