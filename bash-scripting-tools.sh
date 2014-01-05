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
SCRIPT_OPTION_FLAGS="DdhTtVv"
SCRIPT_SELF_TEST=0
SCRIPT_DEBUG=0

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
			SCRIPT_DEBUG=1
			break
		;;
		h )
			displayScriptHeader
			displayScriptUsage
			cleanUp 1
			exit
		;;
		# turn on self testing
		T | t )
			SCRIPT_SELF_TEST=1
			break
		;;
		# display the script usage menu on help or invalid argments
		V | v )
			displayScriptHeader
			if [[ "${scriptOption}" = "v" ]]; then
				exit
			fi
			displayScriptUsage
			cleanUp 1
			exit
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
# Dzakuma, Dodzidenu
# [summary]
# [parameters]
# [return]
#===========================================================
replaceString()
{
	#getopts settings
	local OPTIND
	local FUNCTION_OPTION_FLAGS="chtv1"
	local FUNCTION_USAGE="${FUNCNAME}"

	#evaluation for the next three defines will be based on
	#whether the string is empty or not
	local HEAD_REPLACE=1
	local WHOLE_WORD_REPLACE=1 #default is on
	local REPLACE_ALL_MATCHING="g"
	local REPLACEMENT_DIRECTION="#%" #front/tail
	local SPACE_PLACEHOLDER="█"
	local functionOption=
	local originalString=
	local searchString=
	local searchCharacters=
	local replacementString= #will delete characters/words by default
	local processedString=
	local newString=
	local characterList=
	local character=
	local processingString=

	#probably need getopts as you need to decide
	#if you want whole string replacement or something else
	#replacement of letters in string
	#replacement of whole words in string
	#-c for characters
	#else whole word
	#if replacement characters is a list
	#will replace the characters one by one changing
	#on different iterations
	#-1 for first repetition whole word is one word
	#otherwise character is one loop through????? possible??? maybe not possible for
	#characters
	#-t from tail
	while getopts $FUNCTION_OPTION_FLAGS functionOption; do
		case "${functionOption}" in
			#replace by character and not by whole word
			c )
				WHOLE_WORD_REPLACE=
			;;
			# display the script usage menu on help or invalid argments
			h )
				printf "%s\n" "${FUNCTION_USAGE}"
				return
			;;
			#start replacement from tail
			t )
				HEAD_REPLACE=
			;;
			# #display verbose information
			# v )
			# 	printf "%s\n" "BASS, BASS, BASS"
			# ;;
			# #replace first instance only
			1 )
				REPLACE_ALL_MATCHING= #turn off all replacement
			;;
			# * )
			# 	#get non option args
			# 	if [[ -z originalString ]]; then
			# 		originalString="$OPTARG"
			# 	elif [[ -z searchString ]]; then
			# 		searchString="$OPTARG"
			# 	else
			# 		replacementString="$OPTARG"
			# 	fi
			# ;;
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
	# processingString="/${searchString}/${replacementString}"
	# while [[ -n "${processingString}" ]]; do
	# 	originalString=${originalString$processingString}
	if [[ -z "${WHOLE_WORD_REPLACE}" ]]; then
		processingString="${originalString}"
		searchCharacters=$(stringToArray "${searchString}")
		#printf "{%s}" "$searchCharacters"
		for character in $searchCharacters; do
			processingString=$( \
				printf "%s" "${processingString}" | \
				sed "s/${character}/${replacementString}/${REPLACE_ALL_MATCHING}" \
			)
		done
		processedString="${processingString}"
	else
		processedString=$( \
			printf "%s" "${originalString}" | \
			sed "s/${searchString}/${replacementString}/${REPLACE_ALL_MATCHING}" \
		)
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
# 				SCRIPT_SELF_TEST=1
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
if [[ $SCRIPT_SELF_TEST -eq 1 ]]; then

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

	#insufficient parameters
	replacedString=$(replaceString "${originalString}")
	assertNull "Failed to return null string." "${replacedString}"

	#character replacement single
	replacedString=$(replaceString -c1 "${originalString}" "c")
	assertSame "Failed to replace first matching character in string." "lean up this lean mess!" "${replacedString}"

	#multiple character replacement single
	replacedString=$(replaceString -c1 "${originalString}" "cup ")
	assertSame "Failed to replace first matching character in string." "lean this lean mess!" "${replacedString}"

	#multiple character replacement all
	replacedString=$(replaceString -c "${originalString}" "ethsm")
	assertSame "Failed to replace all matching characters in string." "clan up i lan !" "${replacedString}"

	#multiple character replacement all from tail
	replacedString=$(replaceString -c1t "${originalString}" "ss")
	assertSame "Failed to replace first matching character in string." "clean up this lean me!" "${replacedString}"

	#full word replacement single
	replacedString=$(replaceString -1 "${originalString}" "clean" "beam")
	assertSame "Failed to replace first matching whole word in string." "beam up this lean mess!" "${replacedString}"

	#full word replacement all
	replacedString=$(replaceString "${originalString}" "lean ")
	assertSame "Failed to replace all matching whole words in string." "cup this mess!" "${replacedString}"

	#full word replacement single from tail
	replacedString=$(replaceString -1t "${originalString}" "lean ")
	assertSame "Failed to replace all matching whole words in string." "clean up this mess!" "${replacedString}"
}

#this is an xUnit family testing framework for shell files
. shunit2-2.0.3/src/shell/shunit2

fi

if [[ $SCRIPT_DEBUG -eq 1 ]]; then
	printf "Start debug scripts.\n"

	debugOutput=$(replaceString -c "something" "some" "nothing")

	exit 0
fi
#───────────────────────────────────────────────────────────────────────────────
# Function Exports
#───────────────────────────────────────────────────────────────────────────────
export -f repeatString

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
