# OS_VERSION 환경변수 등록 필수
SWIFTLINT = $(shell command -v swiftlint)

lint:
ifndef SWIFTLINT
	./install_swiftlint.sh
endif
	swiftlint
.PHONY: lint

XCPRETTY = $(shell command -v xcpretty)
PROJECT_NAME = template
WORKSPACE = $(shell find . -name "*.xcworkspace")
EMULATOR = iPhone 12 mini
OS_VERSION = 14.2

build:
ifndef XCPRETTY
	$(error xcpretty를 설치하세요)
endif
	set -o pipefail && xcodebuild \
	-workspace ${WORKSPACE} \
	-configuration Debug \
	-scheme ${PROJECT_NAME} \
	-destination 'platform=iOS Simulator,OS=${OS_VERSION},name=${EMULATOR}' \
	-enableCodeCoverage YES \
	build test \
	CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO ONLY_ACTIVE_ARCH=YES | xcpretty
.PHONY: build
