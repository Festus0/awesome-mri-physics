#!/usr/bin/env bash
set -e

REPO_DIR="awesome-mri-physics"
OUT_ZIP="${REPO_DIR}.zip"

TMP_DIR="$(mktemp -d)"
mkdir -p "${TMP_DIR}/${REPO_DIR}"

rsync -av \
  --exclude ".git" \
  --exclude ".DS_Store" \
  --exclude "*.zip" \
  ./ "${TMP_DIR}/${REPO_DIR}/"

cd "${TMP_DIR}"
zip -r "${OUT_ZIP}" "${REPO_DIR}" >/dev/null
mv "${OUT_ZIP}" "$OLDPWD/"
cd "$OLDPWD"

rm -rf "${TMP_DIR}"
echo "Wrote ${OUT_ZIP}"
