#!/bin/bash

# YouTube Playlist Downloader Script
# Usage: ./download_playlist.sh "PLAYLIST_URL"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🎵 YouTube Playlist Downloader Script 🎵${NC}"
echo "================================================"

# Check if URL is provided
if [ -z "$1" ]; then
    echo -e "${RED}❌ Error: Please provide a playlist URL${NC}"
    echo "Usage: ./download_playlist.sh \"PLAYLIST_URL\""
    echo "Example: ./download_playlist.sh \"https://youtube.com/playlist?list=...\""
    exit 1
fi

PLAYLIST_URL="$1"

echo -e "${YELLOW}📥 Downloading playlist:${NC}"
echo "$PLAYLIST_URL"
echo ""

# Check if yt-dlp is available
if ! command -v yt-dlp &> /dev/null; then
    echo -e "${RED}❌ yt-dlp not found. Installing...${NC}"
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o yt-dlp
    chmod +x yt-dlp
    echo -e "${GREEN}✅ yt-dlp installed successfully${NC}"
    YT_DLP="./yt-dlp"
else
    YT_DLP="yt-dlp"
    echo -e "${GREEN}✅ yt-dlp found in system${NC}"
fi

echo ""
echo -e "${YELLOW}🚀 Starting download...${NC}"
echo ""

# Download the playlist as MP3
$YT_DLP --yes-playlist \
         --extract-audio \
         --audio-format mp3 \
         --audio-quality 0 \
         --extractor-args youtube:player_client=android \
         "$PLAYLIST_URL"

echo ""
echo -e "${GREEN}✅ Download completed!${NC}"
echo ""

# Create organized folder if it doesn't exist
if [ ! -d "Downloaded_MP3s" ]; then
    mkdir -p Downloaded_MP3s
    echo -e "${BLUE}📁 Created Downloaded_MP3s folder${NC}"
fi

# Move MP3 files to organized folder
MP3_COUNT=$(ls *.mp3 2>/dev/null | wc -l)
if [ $MP3_COUNT -gt 0 ]; then
    mv *.mp3 Downloaded_MP3s/ 2>/dev/null
    echo -e "${GREEN}📁 Moved $MP3_COUNT MP3 files to Downloaded_MP3s folder${NC}"
    
    # Show folder info
    echo ""
    echo -e "${BLUE}📊 Download Summary:${NC}"
    echo "Total files: $(ls Downloaded_MP3s/*.mp3 2>/dev/null | wc -l)"
    echo "Total size: $(du -sh Downloaded_MP3s/ 2>/dev/null | cut -f1)"
    echo "Location: $(pwd)/Downloaded_MP3s/"
else
    echo -e "${YELLOW}⚠️  No MP3 files found to organize${NC}"
fi

echo ""
echo -e "${GREEN}🎉 All done! Your playlist has been downloaded and organized.${NC}"
