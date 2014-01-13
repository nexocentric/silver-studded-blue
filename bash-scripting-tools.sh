#!/bin/bash
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
# Dzakuma, Dodzidenu
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
Copyright (c) 2013 Dodzi Y. Dzakuma (http://www.nexocentric.com)

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
# Script Functions
#───────────────────────────────────────────────────────────────────────────────

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
stringToArray()
{
	printf "%s" "$(echo $1 | sed 's/\(.\)/\1 /g')"
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
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

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
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

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
assertInterger()
{
	if [[ $# -lt 1 ]]; then
		return
	fi

	#if the number exists and is maches format
	test "$1" && printf "%d" "$1" > /dev/null;
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
aggregateDirectory()
{
	#getopts settings
	local OPTIND
	local FUNCTION_OPTION_FLAGS="fi:Rrv"
	
	#function settings
	local FUNCTION_USAGE="${FUNCNAME[0]} -${FUNCTION_OPTION_FLAGS} FOLDER PATH"
	local GLOBIGNORE=.:..
	local RECURSIVE_MODE=
	local AGGREGATE_MODE="directories"
	local IGNORED_PATH_LIST=

	#function variables
	local aggregatedContents=
	local directory=
	local directories=
	local functionOptionFlags=
	local functionOptionFlagsWithArguments= #remove the function and rename to optionFlagsWithArguments
	local files=
	local path=

	displayVerboseInformation "These are the passed parameters for this function [$*]"
	#parse get opts
	while getopts $FUNCTION_OPTION_FLAGS functionOption; do
		case "${functionOption}" in
			f )
				AGGREGATE_MODE="files"
				functionOptionFlags="${functionOptionFlags}${functionOption}"
			;;
			# display the script usage menu on help or invalid argments
			h )
				displayVerboseInformation "Function usage:"
				displayVerboseInformation "${FUNCTION_USAGE}"
				return 0
			;;
			i )
				IGNORED_PATH_LIST=(${IGNORED_PATH_LIST[@]} ${OPTARG})
				displayVerboseInformation "Regex [${OPTARG}] added to ignore list"
				displayVerboseInformation "Ignore list is now [${IGNORED_PATH_LIST[*]}]"
				functionOptionFlagsWithArguments="${functionOptionFlagsWithArguments}-${functionOption} ${OPTARG} "
			;;
			#parse the directory recursively
			R | r )
				#displayVerboseInformation "Replacement by individually matching characters has been set."
				RECURSIVE_MODE=1
				functionOptionFlags="${functionOptionFlags}${functionOption}"
				#echo "$functionOptionFlags"
			;;
			#display verbose information
			v )
				displayVerboseInformation "Verbose mode has been enabled."
				functionOptionFlags="${functionOptionFlags}${functionOption}"
			;;
			\? )
				displayVerboseInformation "-%s is an invalid option. \nPlease use the -h flag to display usage information.\n"
				#return 1
			;;
		esac	
	done
	#remove the options that were parsed
	shift $((OPTIND-1))

	#arrange options flags for next run so that it can run smoothly
	if [[ -n "${functionOptionFlags}" ]]; then
		functionOptionFlags="-${functionOptionFlags} "
	fi

	if [[ -n "${functionOptionFlagsWithArguments}" ]]; then
		#the space at the beginning of this string is needed
		functionOptionFlagsWithArguments="${functionOptionFlagsWithArguments}"
	fi
	functionOptionFlags="${functionOptionFlags}${functionOptionFlagsWithArguments}"
	displayVerboseInformation "Flags for the next run ${functionOptionFlags}"

	if [[ $# -lt 1 ]]; then
		echo "invalid directory"
		return
	fi
	directory=$1
	displayVerboseInformation "Ignoring the following regex: ${IGNORED_PATH_LIST[*]}"
	for path in "$directory/"*; do
		statusSpinner "Scanning $directory "
		displayVerboseInformation "Processing [$path]"
		if [[ -n "${IGNORED_PATH_LIST[0]}" ]]; then

			displayVerboseInformation "This is the entire ignore list [${IGNORED_PATH_LIST[*]}]"
			for ignored in "${IGNORED_PATH_LIST[@]}"; do
				displayVerboseInformation "Matching [$ignored] against [$(basename $path)]"
				if [[ "$(basename $path)" =~ $ignored ]]; then
					displayVerboseInformation "Ignored ${path}"
					ignored=
					break
				fi
			done

			#if it's been ignored go to the next loop
			if [[ -z "${ignored}" ]]; then
				continue
			fi
		fi

		#ディレクトリとファイルを別々の配列に保存
		if [[ -f "$path" ]]; then
			#ファイル
			files=("${files[@]}" "$path")
			#echo "started"
		elif [[ -d "$path" ]]; then
			#ディレクトリ
			directories=("${directories[@]}" "$path")
			if [[ -n "${RECURSIVE_MODE}" ]]; then
				#echo "something"
				if [[ ! "${functionOptionFlags}" =~ - ]]; then
					functionOptionFlags="-${functionOptionFlags}"
				fi

				if [[ "${AGGREGATE_MODE}" = "directories" ]]; then
					displayVerboseInformation "Parameter values on recursive call[${functionOptionFlags} $path]"
					directories=("${directories[@]}" $(aggregateDirectory ${functionOptionFlags} "$path"))
				else
					displayVerboseInformation "Parameter values on recursive call[${functionOptionFlags} $path]"
					files=("${files[@]}" $(aggregateDirectory ${functionOptionFlags} "$path"))
				fi
			fi
		fi
	done

	if [[ "${AGGREGATE_MODE}" = "directories" ]]; then
		aggregatedContents="${directories[*]}"
	else
		aggregatedContents="${files[*]}"
	fi
	aggregatedContents=${aggregatedContents// / }
	aggregatedContents=${aggregatedContents/# /}
	printf "%s" "${aggregatedContents}"
}

#===========================================================
# [author]
# Dodzidenu Dzakuma
# [summary]
# [parameters]
# [return]
#===========================================================
regexSafeString()
{
	if [[ $# -ne 1 ]]; then
		return
	fi
	local originalString="$1"

	#clean for basic regular expression
	originalString=${originalString//\\/\\\\}
	originalString=${originalString//$/\\$}
	originalString=${originalString//./\\.}
	originalString=${originalString//\*/\\\*}
	originalString=${originalString//[/\\[}
	originalString=${originalString//]/\\]}
	originalString=${originalString//^/\\^}

	printf "%s" "${originalString}"
}

#===========================================================
# [author]
# Dodzi Y. Dzakuma
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
	set -f

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
				assertInterger "${OPTARG}"
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
	done

	#remove the options that were parsed
	shift $((OPTIND-1))

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
	#clear string for sed

	displayVerboseInformation \
		"Searching [${originalString//$SPACE_PLACEHOLDER/ }] " \
		"for [${searchString//$SPACE_PLACEHOLDER/ }] and replacing " \
		"from [${replacementString//$SPACE_PLACEHOLDER/ }]."
	displayVerboseInformation "[Settings]"
	displayVerboseInformation "Character replace : " 
	displayVerboseInformation "Replace from tail : " " "
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

	#replacement loop
	if [[ -z "${WHOLE_WORD_REPLACE}" ]]; then
		processingString="${originalString}"
		searchCharacters=$(stringToArray "${searchString}")
		for searchCharacter in $searchCharacters; do
			searchCharacter=$(regexSafeString "${searchCharacter}")
			searchCharacter="${searchCharacter////\/}"
			replacementCharacter="${replacementString:$nextReplacementCharacter:1}"
			replacementCharacter="${replacementCharacter////\/}"
			displayVerboseInformation $(printf "Replace[%s]<=>[%s]\n" "${searchCharacter}" "${replacementCharacter}") " "
			processingString=$( \
				printf "%s" "${processingString}" | \
				sed "s/${searchCharacter}/${replacementCharacter}/${REPLACE_ALL_MATCHING}" \
			)
			if [[ $nextReplacementCharacter -eq $((${#replacementString} - 1)) ]]; then #change this to -gt ${#replacementString} for meeting on the 15th
				nextReplacementCharacter=0
			else
				nextReplacementCharacter=$((nextReplacementCharacter + 1))
			fi
		done
		processedString="${processingString}"
	else
		searchString=$(regexSafeString "${searchString}")
		searchString="${searchString////\/}"
		replacementString=$(regexSafeString "${replacementString}")
		replacementString="${replacementString////\/}"
		displayVerboseInformation "STRING FOR SED:[s/${searchString}/${replacementString}/${REPLACE_ALL_MATCHING}]"
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
# function prints the repeated string to standard output.
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

statusSpinner()
{
    local spinnerMessage="$1"
    #had to do this to prevent the printf error
    local spinnerStates=("-" "\\" "|" "/")
    local maximumSpinnerStates=${#spinnerStates[@]}
    local spinnerStatePrefix="${BASH_SOURCE[0]}"
    local nextSpinnerState=
    currentSpinnerState= #this should not be local

    if [[ -z $currentSpinnerState ]]; then
        currentSpinnerState="${spinnerStates[0]}"
    fi

    for (( spinnerState=0; spinnerState<maximumSpinnerStates; spinnerState++ )); do
        nextSpinnerState="${spinnerStates[$spinnerState]}"
        if [[ "$currentSpinnerState" = "$nextSpinnerState" ]]; then
            local statesMax=$((maximumSpinnerStates - 1))
            if [[ $spinnerState -eq $statesMax ]]; then
                currentSpinnerState="${spinnerStates[0]}"
            else
                spinnerState=$((spinnerState + 1))
                currentSpinnerState="${spinnerStates[$spinnerState]}"
            fi
            break
        fi
    done

    printf "%s%s\r" $spinnerMessage $currentSpinnerState >&2
}

dynamicVariable()
{
	local OPTIND
	local FUNCTION_OPTION_FLAGS="hv"
	local functionOption=
	local declareArray=
	local variableName= #not local for a reason
	local variableValue=

	#clean variable name and variable
	#variableName=$(replaceCharacters $variableName )
	#variableValue=$(replaceCharacters $variableName )
	# while getopts $FUNCTION_OPTION_FLAGS functionOption; do
	#         case "${functionOption}" in
	#                 # turn on self testing
	#                 h )
	#                         SCRIPT_SELF_TEST_MODE=1
	#                         break
	#                 ;;
	#                 # display the script usage menu on help or invalid argments
	#                 v )
	#                         displayScriptUsage
	#                         cleanUp 1
	#                         exit
	#                 ;;
	#         esac
	# done        
	
	variableName=$(replaceString -c $1 "!#$%&'()=-~^|\@[]{}+;*:<>,./?" "_")
	displayVerboseInformation "In function $variableName"
	variableValue="$2"
	

	displayVerboseInformation "After declaration"
	eval ${variableName}="${variableValue}"
	displayVerboseInformation ${!variableName}
	displayVerboseInformation $variableName
	

	if [[ "${variableValue}" != "${!variableName}" ]]; then
		displayVerboseInformation "Unable to set variable"
		return 1
	fi
	return 0
}

directoryMonitor()
{
	return
}

#───────────────────────────────────────────────────────────────────────────────
# Function Test
#───────────────────────────────────────────────────────────────────────────────
if [[ $SCRIPT_SELF_TEST_MODE -eq 1 ]]; then

#variables for testing


testRepeatString()
{
	local repeatStringError=$(repeatString "a")
	assertNull "($BASH_SOURCE:${LINENO}) The repeat string function should have failed." "${repeatStringError}"

	repeatStringError=$(repeatString "a" -1)
	assertNull "($BASH_SOURCE:${LINENO}) The repeat string function should have failed." "${repeatStringError}"
	
	local sixCharacterString=$(repeatString "a" 6)
	assertSame "($BASH_SOURCE:${LINENO}) Failed to repeat the character 'a' 6 times." "aaaaaa" "${sixCharacterString}"
	
	local popLyrics="$(repeatString 'Womanizer, ' 2)Womanizer"
	assertSame "($BASH_SOURCE:${LINENO}) Failed to duplicate pop lyrics." "Womanizer, Womanizer, Womanizer" "${popLyrics}"
}

testReplaceString()
{
	local originalString="clean up this lean mess!"
	local symbolsString="?!#$%&'()=-~^|\@[]{}+;*:<>,./_?"
	local replacedString=""

	#help displayed
	replacedString=$(replaceString -hv)
	assertSame "($BASH_SOURCE:${LINENO}) Failed to display help." 0 $?

	#insufficient parameters
	replacedString=$(replaceString -v "${originalString}")
	assertNull "($BASH_SOURCE:${LINENO}) Failed to return null string." "${replacedString}"

	#character replacement single
	replacedString=$(replaceString -vcf "${originalString}" "c")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace first matching character in string." "lean up this lean mess!" "${replacedString}"

	#multiple character replacement single
	replacedString=$(replaceString -vcf "${originalString}" "cup ")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace first matching character in string." "lean this lean mess!" "${replacedString}"

	#multiple character replacement all
	replacedString=$(replaceString -vc "${originalString}" "ethsm")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace all matching characters in string." "clan up i lan !" "${replacedString}"

	#multiple character replacement single
	replacedString=$(replaceString -vcf "${originalString}" "isss" "at")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace single matching characters in string." "clean up that lean meat!" "${replacedString}"

	#multiple character single from tail
	replacedString=$(replaceString -vcft "${originalString}" "ss" "at")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace single matching characters in string from tail." "clean up this lean meat!" "${replacedString}"

	#multiple special character replacement single
	replacedString=$(replaceString -vcf "${symbolsString}" "?{}")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace all matching whole words in string." "!#$%&'()=-~^|\@[]+;*:<>,./_?" "${replacedString}"

	#multiple special character replacement single from tail
	replacedString=$(replaceString -vcft "${symbolsString}" "?[]")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace all matching whole words in string." "?!#$%&'()=-~^|\@{}+;*:<>,./_" "${replacedString}"

	#multiple special character replacement single from tail
	replacedString=$(replaceString -vc "${symbolsString}" "*")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace all matching whole words in string." "?!#$%&'()=-~^|\@[]{}+;:<>,./_?" "${replacedString}"

	#full word replacement single
	replacedString=$(replaceString -vf "${originalString}" "clean" "beam")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace first matching whole word in string." "beam up this lean mess!" "${replacedString}"

	#full word replacement all
	replacedString=$(replaceString -v "${originalString}" "lean ")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace all matching whole words in string." "cup this mess!" "${replacedString}"

	#full word replacement single from tail
	replacedString=$(replaceString -vft "${originalString}" "lean ")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace all matching whole words in string." "clean up this mess!" "${replacedString}"

	#full word special characters
	replacedString=$(replaceString -v "${symbolsString}" "()=-~^|\@[]{}")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace all matching whole words in string." "?!#$%&'+;*:<>,./_?" "${replacedString}"

	#full word special characters from tail
	replacedString=$(replaceString -vt "${symbolsString}" ",./_?")
	assertSame "($BASH_SOURCE:${LINENO}) Failed to replace all matching whole words in string." "?!#$%&'()=-~^|\@[]{}+;*:<>" "${replacedString}"
}

testAggregateDirectory()
{
	local testDirectory="supercalifragilisticexpialidocious"
	mkdir -p ./$testDirectory/super/cali/fragi/listic/expi/ali/docious

	local directories=$(aggregateDirectory -r ./$testDirectory)
	local files=
	local directory=

	for directory in $directories; do
		touch "$directory/random-text-file[1].txt"
		touch "$directory/random-text-document-file[2].doc"
		touch "$directory/random-html-document[3].html"
	done

	#start test
	directories=$(aggregateDirectory -vr ./$testDirectory)
	files=$(aggregateDirectory -vrf ./$testDirectory)

	directories=($directories)
	assertSame "($BASH_SOURCE:${LINENO}) Directory count not equal to 7." 7 ${#directories[@]}
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 21." 21 ${#files[@]}

	directories=$(aggregateDirectory -v ./$testDirectory)
	directories=($directories)
	assertSame "Directory count not equal to 1." 1 ${#directories[@]}

	#ignore tests
	files=$(aggregateDirectory -vfr -i 1 ./$testDirectory)
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 14." 14 ${#files[@]}

	files=$(aggregateDirectory -vfr -i 2 ./$testDirectory)
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 14." 14 ${#files[@]}

	files=$(aggregateDirectory -vfr -i 3 ./$testDirectory)
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 14." 14 ${#files[@]}

	files=$(aggregateDirectory -vfr -i "\.txt" ./$testDirectory)
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 14." 14 ${#files[@]}

	files=$(aggregateDirectory -vfr -i "\.doc" ./$testDirectory)
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 14." 14 ${#files[@]}

	files=$(aggregateDirectory -vfr -i "\.html" ./$testDirectory)
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 14." 14 ${#files[@]}

	files=$(aggregateDirectory -vfr -i text ./$testDirectory)
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 7." 7 ${#files[@]}

	files=$(aggregateDirectory -vfr -i document ./$testDirectory)
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 7." 7 ${#files[@]}

	files=$(aggregateDirectory -vfr -i random ./$testDirectory)
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 0." 0 ${#files[@]}

	files=$(aggregateDirectory -vfr -i 1 -i 2 ./$testDirectory)
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 7." 7 ${#files[@]}

	files=$(aggregateDirectory -vfr -i 1 -i 2 -i 3 ./$testDirectory)
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 0." 0 ${#files[@]}

	#complicated regex ".*do.*(file)\[\d]\.do.*"
	files=$(aggregateDirectory -vfr -i '.*do.*(file)\[[0-9]*]\.do.*' ./$testDirectory)
	files=($files)
	assertSame "($BASH_SOURCE:${LINENO}) File count not equal to 14." 14 ${#files[@]}

	rm -rf ./$testDirectory
}

testDynamicVariable()
{
	local variableName=
	local variableValue=
	local dynamicVariableValue=
	local symbolsString="?!#()=-|\[]{}+;*:<>./_?"

	variableName="supercalifragilisticexpialidocious"
	variableValue=10
	echo $variableName
	dynamicVariable "${variableName}" "${variableValue}"
	dynamicVariableValue=${!variableName}
	assertSame "($BASH_SOURCE:${LINENO}) Dynamically set variable not equal to ${variableValue}." "${variableValue}" "${dynamicVariableValue}"

	variableName="s${symbolsString}s"
	variableValue=50
	echo $variableName
	dynamicVariable "${variableName}" "${variableValue}"
	variableName=$(replaceString -c "${variableName}" "${symbolsString}" "_")
	dynamicVariableValue=${!variableName}
	assertSame "($BASH_SOURCE:${LINENO}) Dynamically set variable not equal to ${variableValue}." "${variableValue}" "${dynamicVariableValue}"
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
	printf "Running single function to debug.\n${$SCRIPT_FUNCTION_TO_DEBUG}\n"
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
export -f stringToArray
export -f assertInterger
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
