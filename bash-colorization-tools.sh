#!/bin/bash

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
