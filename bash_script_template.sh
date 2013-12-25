#!/bin/bash
#///////////////////////////////////////////////////////////////////////////////
# [作成者]
# Dzakuma, Dodzidenu
# [概要]
# 
#///////////////////////////////////////////////////////////////////////////////

#-------------------------------------------------------------------------------
# Script Settings
#-------------------------------------------------------------------------------
SCRIPT_NAME="Script Template"
SCRIPT_VERSION="1.00"

#-------------------------------------------------------------------------------
# Script Control Functions
#-------------------------------------------------------------------------------

#╔══════════════════════════════════════════╗
#║
#╚══════════════════════════════════════════╝
# █
#                                                                      ▉
#  ╔══╦══╗  ┌──┬──┐  ╭──┬──╮  ╭──┬──╮  ┏━━┳━━┓  ┎┒┏┑   ╷  ╻ ┏┯┓ ┌┰┐    ▊ ╱╲╱╲╳╳╳
#  ║┌─╨─┐║  │╔═╧═╗│  │╒═╪═╕│  │╓─╁─╖│  ┃┌─╂─┐┃  ┗╃╄┙  ╶┼╴╺╋╸┠┼┨ ┝╋┥    ▋ ╲╱╲╱╳╳╳
#  ║│╲ ╱│║  │║   ║│  ││ │ ││  │║ ┃ ║│  ┃│ ╿ │┃  ┍╅╆┓   ╵  ╹ ┗┷┛ └┸┘    ▌ ╱╲╱╲╳╳╳
#  ╠╡ ╳ ╞╣  ├╢   ╟┤  ├┼─┼─┼┤  ├╫─╂─╫┤  ┣┿╾┼╼┿┫  ┕┛┖┚     ┌┄┄┐ ╎ ┏┅┅┓ ┋ ▍ ╲╱╲╱╳╳╳
#  ║│╱ ╲│║  │║   ║│  ││ │ ││  │║ ┃ ║│  ┃│ ╽ │┃  ░░▒▒▓▓██ ┊  ┆ ╎ ╏  ┇ ┋ ▎
#  ║└─╥─┘║  │╚═╤═╝│  │╘═╪═╛│  │╙─╀─╜│  ┃└─╂─┘┃  ░░▒▒▓▓██ ┊  ┆ ╎ ╏  ┇ ┋ ▏
#  ╚══╩══╝  └──┴──┘  ╰──┴──╯  ╰──┴──╯  ┗━━┻━━┛  ▗▄▖▛▀▜   └╌╌┘ ╎ ┗╍╍┛ ┋  ▁▂▃▄▅▆▇█
#                                               ▝▀▘▙▄▟
#
#

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

#===========================================================
# [author]
# Dzakuma, Dodzidenu
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
	printf "	[-h] : display this message\n"
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

#-------------------------------------------------------------------------------
# Script Options Parsing
#-------------------------------------------------------------------------------
while getopts ":h:" scriptOption; do
	case "${scriptOption}" in
		# display the script usage menu on help or invalid argments
		h | *)
			displayScriptUsage
			cleanUp 1
			exit 0
			;;
	esac
done

#-------------------------------------------------------------------------------
# Safety Checks
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Script Functions
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Main
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Script Clean Up
#-------------------------------------------------------------------------------
cleanUp
