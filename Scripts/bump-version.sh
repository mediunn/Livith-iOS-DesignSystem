#!/bin/bash

# LivithDesignSystem 버전 업데이트 스크립트
# 사용법: ./bump-version.sh [major|minor|patch] 또는 ./bump-version.sh 1.2.3

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
VERSION_FILE="$PROJECT_ROOT/LivithDesignSystem/Sources/LivithDesignSystem.swift"

# 현재 버전 추출
CURRENT_VERSION=$(grep 'version = ' "$VERSION_FILE" | sed 's/.*"\(.*\)".*/\1/')

if [ -z "$CURRENT_VERSION" ]; then
    echo "❌ 현재 버전을 찾을 수 없습니다."
    exit 1
fi

echo "📦 LivithDesignSystem 버전 업데이트"
echo "   현재 버전: $CURRENT_VERSION"

# 버전 파싱
IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT_VERSION"

# 새 버전 결정
case "$1" in
    major)
        NEW_VERSION="$((MAJOR + 1)).0.0"
        ;;
    minor)
        NEW_VERSION="$MAJOR.$((MINOR + 1)).0"
        ;;
    patch)
        NEW_VERSION="$MAJOR.$MINOR.$((PATCH + 1))"
        ;;
    "")
        echo ""
        echo "사용법: $0 [major|minor|patch|버전번호]"
        echo "  major: $CURRENT_VERSION → $((MAJOR + 1)).0.0"
        echo "  minor: $CURRENT_VERSION → $MAJOR.$((MINOR + 1)).0"
        echo "  patch: $CURRENT_VERSION → $MAJOR.$MINOR.$((PATCH + 1))"
        exit 0
        ;;
    *)
        # 직접 버전 지정
        if [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
            NEW_VERSION="$1"
        else
            echo "❌ 잘못된 버전 형식입니다: $1"
            echo "   예: 1.2.3 또는 major|minor|patch"
            exit 1
        fi
        ;;
esac

echo "   새 버전: $NEW_VERSION"
echo ""

read -p "버전을 업데이트할까요? (y/N): " CONFIRM
if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
    echo "   취소됨"
    exit 0
fi

# 버전 파일 업데이트 (macOS/Linux 호환)
sed -i.bak "s/version = \"$CURRENT_VERSION\"/version = \"$NEW_VERSION\"/" "$VERSION_FILE"
rm -f "$VERSION_FILE.bak"
echo "✅ 버전 파일 업데이트 완료"

# 커밋 여부 확인
read -p "변경사항을 커밋할까요? (y/N): " COMMIT_CONFIRM
if [ "$COMMIT_CONFIRM" = "y" ] || [ "$COMMIT_CONFIRM" = "Y" ]; then
    git add "$VERSION_FILE"
    git commit -m "[Chore] 버전 $NEW_VERSION으로 업데이트"
    echo "✅ 커밋 완료"

    # 태그 생성 여부 확인
    read -p "태그도 생성할까요? (y/N): " TAG_CONFIRM
    if [ "$TAG_CONFIRM" = "y" ] || [ "$TAG_CONFIRM" = "Y" ]; then
        "$SCRIPT_DIR/create-tag.sh"
    fi
fi

echo ""
echo "🎉 완료! 새 버전: $NEW_VERSION"
