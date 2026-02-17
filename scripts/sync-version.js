#!/usr/bin/env node

const { readFileSync, writeFileSync } = require("fs");
const { join } = require("path");

const root = join(__dirname, "..");
const packageJson = JSON.parse(
  readFileSync(join(root, "package.json"), "utf8")
);
const extensionPath = join(root, "gemini-extension.json");
const extensionJson = JSON.parse(readFileSync(extensionPath, "utf8"));

extensionJson.version = packageJson.version;

writeFileSync(extensionPath, JSON.stringify(extensionJson, null, 2) + "\n");

console.log(`Synced gemini-extension.json to v${packageJson.version}`);
