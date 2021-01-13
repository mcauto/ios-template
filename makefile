# OS_VERSION 환경변수 등록 필수
SWIFTLINT = $(shell command -v swiftlint)

PROJECT_NAME = "template"
WORKSPACE = $(shell find . -name "*.xcworkspace")

lint:
ifndef SWIFTLINT
	./install_swiftlint.sh
endif
	swiftlint
.PHONY: lint
