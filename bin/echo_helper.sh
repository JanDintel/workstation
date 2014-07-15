#!/bin/bash

set -e

info_echo() {
  echo -e "\033[0;36m$1\033[0m"
}

success_echo() {
  echo -e "\033[0;32m$1\033[0m"
}

warning_echo() {
  echo -e "\033[0;33m$1\033[0m"
}

error_echo() {
  echo -e "\033[0;31m$1\033[0m"
}