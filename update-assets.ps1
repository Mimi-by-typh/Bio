# PowerShell script to help update avatar and music
# Run this script from the project root

Write-Host "=== Avatar & Music Updater ===" -ForegroundColor Cyan
Write-Host ""

$staticDir = Join-Path $PSScriptRoot "static"

# Instructions for avatar
Write-Host "📸 AVATAR UPDATE:" -ForegroundColor Yellow
Write-Host "Please save the pink-haired anime character image as:"
Write-Host "   $staticDir\avatar.webp" -ForegroundColor Green
Write-Host ""

# Instructions for music
Write-Host "🎵 MUSIC UPDATE:" -ForegroundColor Yellow
Write-Host "1. Visit: https://never-goodbye-i-hait-it.skysound7.com/" -ForegroundColor Cyan
Write-Host "2. Download the MP3 file"
Write-Host "3. Save it as:"
Write-Host "   $staticDir\track.mp3" -ForegroundColor Green
Write-Host ""
Write-Host "   (This will replace the current track)" -ForegroundColor Gray
Write-Host ""

# Check if files exist
if (Test-Path "$staticDir\avatar.webp") {
    Write-Host "✓ avatar.webp exists" -ForegroundColor Green
} else {
    Write-Host "✗ avatar.webp not found" -ForegroundColor Red
}

if (Test-Path "$staticDir\track.mp3") {
    Write-Host "✓ track.mp3 exists" -ForegroundColor Green
} else {
    Write-Host "✗ track.mp3 not found" -ForegroundColor Red
}

Write-Host ""
Write-Host "After updating files, refresh the browser (Ctrl+R)" -ForegroundColor Cyan
