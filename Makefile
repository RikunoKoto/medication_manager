.PHONY: setup

setup:
	flutter clean
	dart run custom_lint
	flutter pub get

build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs

build_runner_w:
	flutter pub run build_runner watch -d

lint:
	dart run custom_lint

