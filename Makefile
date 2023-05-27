.PHONY: setup

setup:
	flutter clean
	flutter pub get
	flutter pub run flutter_native_splash:create
	dart run custom_lint

build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs

build_runner_w:
	flutter pub run build_runner watch -d

lint:
	dart run custom_lint

