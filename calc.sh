#!/bin/bash

calc() {
  if [ $# -eq 2 ] && [ "$2" = "squared" ]; then
    result=$(echo "$1 * $1" | bc -l)
    echo "Result: $result"
    exit 0
  elif [ $# -lt 3 ]; then
    echo "Usage: calc num1 operator num2 or calc num squared"
    exit 1
  fi

  case "$2" in
    "plus"|"+"|"add") operator="+" ;;
    "minus"|"subtract"|"-") operator="-" ;;
    "times"|"x"|"multiplied"|"multiplied by") operator="*" ;;
    "divided"|"divided by"|"/") operator="/" ;;
    "squared") operator="^2" ;;
    *) echo "Unknown operator: $2" && exit 1 ;;
  esac

  result=$(echo "$1 $operator $3" | bc -l)

  echo "Result: $result"
}

calc "$@"
