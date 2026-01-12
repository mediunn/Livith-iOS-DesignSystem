.PHONY: version tag bump-major bump-minor bump-patch build generate clean help

# 기본 명령어
help:
	@echo "LivithDesignSystem 명령어"
	@echo ""
	@echo "  make version      - 현재 버전 확인"
	@echo "  make tag          - 현재 버전으로 태그 생성"
	@echo "  make bump-patch   - 패치 버전 업 (1.0.0 → 1.0.1)"
	@echo "  make bump-minor   - 마이너 버전 업 (1.0.0 → 1.1.0)"
	@echo "  make bump-major   - 메이저 버전 업 (1.0.0 → 2.0.0)"
	@echo ""
	@echo "  make generate     - Tuist 프로젝트 생성"
	@echo "  make build        - 빌드"
	@echo "  make clean        - 클린"

# 버전 확인
version:
	@grep 'version = ' LivithDesignSystem/Sources/LivithDesignSystem.swift | sed 's/.*"\(.*\)".*/\1/'

# 태그 생성
tag:
	@./Scripts/create-tag.sh

# 버전 업데이트
bump-patch:
	@./Scripts/bump-version.sh patch

bump-minor:
	@./Scripts/bump-version.sh minor

bump-major:
	@./Scripts/bump-version.sh major

# Tuist 명령어
generate:
	tuist generate

build:
	tuist build LivithDesignSystem

clean:
	tuist clean
