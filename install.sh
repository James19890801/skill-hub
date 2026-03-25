#!/bin/bash
# CQ市场 Skill 安装脚本

SKILL_NAME=$1

if [ -z "$SKILL_NAME" ]; then
    echo "用法: ./install.sh <skill-name>"
    echo "示例: ./install.sh legal-contract-risk-detection"
    exit 1
fi

echo "正在安装 Skill: $SKILL_NAME..."

# 创建本地Skill目录
mkdir -p ~/.qoder/skills/$SKILL_NAME

# 从GitHub下载Skill文件
curl -sL "https://raw.githubusercontent.com/James19890801/skill-hub/main/skills/$SKILL_NAME/SKILL.md" -o ~/.qoder/skills/$SKILL_NAME/SKILL.md

if [ $? -eq 0 ]; then
    echo "✓ Skill 安装成功: $SKILL_NAME"
    echo "使用: qoder skill use $SKILL_NAME"
else
    echo "✗ Skill 安装失败，请检查名称是否正确"
    echo "可用Skills列表: https://james19890801.github.io/skill-hub"
fi