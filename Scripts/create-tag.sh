#!/bin/bash

# LivithDesignSystem 버전 기반 태그 생성 스크립트

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
VERSION_FILE="$PROJECT_ROOT/LivithDesignSystem/Sources/LivithDesignSystem.swift"

# 버전 추출
VERSION=$(grep 'version = ' "$VERSION_FILE" | sed 's/.*"\(.*\)".*/\1/')

if [ -z "$VERSION" ]; then
    echo "❌ 버전을 찾을 수 없습니다."
    exit 1
fi

TAG_NAME="v$VERSION"

echo "📦 LivithDesignSystem 태그 생성"
echo "   버전: $VERSION"
echo "   태그: $TAG_NAME"
echo ""

# 이미 존재하는 태그인지 확인
if git rev-parse "$TAG_NAME" >/dev/null 2>&1; then
    echo "⚠️  태그 '$TAG_NAME'가 이미 존재합니다."
    read -p "삭제하고 다시 생성할까요? (y/N): " CONFIRM
    if [ "$CONFIRM" = "y" ] || [ "$CONFIRM" = "Y" ]; then
        git tag -d "$TAG_NAME"
        echo "   기존 태그 삭제됨"
    else
        echo "   취소됨"
        exit 0
    fi
fi

# 워킹 디렉터리 변경 사항 확인
if ! git diff-index --quiet HEAD --; then
    echo "⚠️  커밋되지 않은 변경 사항이 있습니다."
    git status -sb
    read -p "이 상태에서 태그를 생성할까요? (y/N): " DIRTY_CONFIRM
    if [ "$DIRTY_CONFIRM" != "y" ] && [ "$DIRTY_CONFIRM" != "Y" ]; then
        echo "   태그 생성이 취소되었습니다."
        exit 1
    fi
fi

# 태그 생성
git tag -a "$TAG_NAME" -m "Release $VERSION"
echo "✅ 태그 '$TAG_NAME' 생성 완료"

# 푸시 여부 확인
read -p "원격에 푸시할까요? (y/N): " PUSH_CONFIRM
if [ "$PUSH_CONFIRM" = "y" ] || [ "$PUSH_CONFIRM" = "Y" ]; then
    git push origin "$TAG_NAME"
    echo "✅ 태그 '$TAG_NAME' 푸시 완료"
else
    echo "💡 나중에 푸시하려면: git push origin $TAG_NAME"
fi
