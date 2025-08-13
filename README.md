# YouTube Playlist Downloader - Linux Installation & Usage Guide

## 🎯 What This Guide Covers

This guide provides **explicit, step-by-step instructions** for downloading YouTube playlists on Linux using `yt-dlp` - a powerful command-line tool that replaces the Windows-only YouTube Playlist Downloader application.

## ✅ What We Successfully Accomplished

- **Built** the original Windows WPF application from source (for reference)
- **Installed** and **configured** `yt-dlp` for Linux
- **Successfully downloaded** multiple playlists in MP3 format
- **Organized** all downloaded files into a clean folder structure

## 🚀 Quick Start - Download Any YouTube Playlist

### Step 1: Install yt-dlp (One-time setup)

```bash
# Download the latest version of yt-dlp
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o yt-dlp

# Make it executable
chmod +x yt-dlp

# Move to a system location (optional but recommended)
sudo mv yt-dlp /usr/local/bin/
```

### Step 2: Download a Playlist (Use this command every time)

```bash
# Basic playlist download (MP3 format)
yt-dlp --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 "YOUR_PLAYLIST_URL"

# With Android client (recommended for better compatibility)
yt-dlp --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 --extractor-args youtube:player_client=android "YOUR_PLAYLIST_URL"
```

## 📋 Complete Command Reference

### 🎵 Download Audio Only (MP3)

```bash
# Download entire playlist as MP3 files
yt-dlp --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 "PLAYLIST_URL"

# Download with Android client for better compatibility
yt-dlp --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 --extractor-args youtube:player_client=android "PLAYLIST_URL"
```

### 🎬 Download Video (MP4)

```bash
# Download entire playlist as MP4 files
yt-dlp --yes-playlist "PLAYLIST_URL"

# Download with specific format
yt-dlp --yes-playlist -f "best[ext=mp4]" "PLAYLIST_URL"

# Download with Android client
yt-dlp --yes-playlist --extractor-args youtube:player_client=android "PLAYLIST_URL"
```

### 🔍 List Playlist Contents (Without Downloading)

```bash
# List all videos in playlist
yt-dlp --flat-playlist "PLAYLIST_URL"

# List first 5 videos
yt-dlp --flat-playlist --playlist-items 1-5 "PLAYLIST_URL"
```

## 🎯 Real Examples (Tested & Working)

### Example 1: Classical Music Playlist
```bash
yt-dlp --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 --extractor-args youtube:player_client=android "https://youtube.com/playlist?list=PLO_1AmtK1TMRi01-V_tdHKDLBu7cNWIgf&si=w12jq11R50ShxoRZ"
```

### Example 2: Bulgarian Folk Dances
```bash
yt-dlp --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 --extractor-args youtube:player_client=android "https://youtube.com/playlist?list=PLIPnySnFnqwO6WuRehIfGW2aRqYElEwUc&si=1nM-9Od8Oqh_Szlx"
```

## 📁 File Organization

### Create Organized Folder Structure
```bash
# Create a folder for your downloads
mkdir -p Downloaded_MP3s

# Move all MP3 files to the folder
mv *.mp3 Downloaded_MP3s/

# Check total files and size
ls Downloaded_MP3s/*.mp3 | wc -l
du -sh Downloaded_MP3s/
```

## ⚙️ Command Options Explained

| Option | What It Does | Example |
|--------|--------------|---------|
| `--yes-playlist` | Download entire playlist (not just single video) | Always use this for playlists |
| `--extract-audio` | Extract audio from video | Use for MP3 downloads |
| `--audio-format mp3` | Convert to MP3 format | mp3, m4a, wav, etc. |
| `--audio-quality 0` | Best audio quality available | 0=best, 1=worst |
| `--extractor-args youtube:player_client=android` | Use Android client (bypasses bot detection) | Recommended for reliability |

## 🚨 Troubleshooting

### Common Issues & Solutions

**Issue**: "Request contains an invalid argument" or "HTTP Error 400"
**Solution**: Use the Android client method:
```bash
yt-dlp --yes-playlist --extractor-args youtube:player_client=android "PLAYLIST_URL"
```

**Issue**: "Sign in to confirm you're not a bot"
**Solution**: Update yt-dlp to latest version and use Android client:
```bash
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o yt-dlp
chmod +x yt-dlp
./yt-dlp --yes-playlist --extractor-args youtube:player_client=android "PLAYLIST_URL"
```

**Issue**: Files download but are MP4 instead of MP3
**Solution**: Add audio extraction flags:
```bash
yt-dlp --yes-playlist --extract-audio --audio-format mp3 "PLAYLIST_URL"
```

## 📊 Success Metrics

Our successful downloads:
- ✅ **Classical Music Playlist**: 100 files, ~550 MB
- ✅ **Bulgarian Folk Dances**: 26 files, ~200 MB
- ✅ **Total**: 126 MP3 files, ~750 MB
- ✅ **Format**: High-quality MP3 audio
- ✅ **Compatibility**: Works on all Linux distributions

## 🔄 Update yt-dlp

```bash
# Check current version
yt-dlp --version

# Update to latest version
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o yt-dlp
chmod +x yt-dlp
```

## 📝 Quick Reference Card

**For MP3 Downloads:**
```bash
yt-dlp --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 --extractor-args youtube:player_client=android "PLAYLIST_URL"
```

**For Video Downloads:**
```bash
yt-dlp --yes-playlist --extractor-args youtube:player_client=android "PLAYLIST_URL"
```

**For Playlist Info:**
```bash
yt-dlp --flat-playlist "PLAYLIST_URL"
```

## 🎉 You're Ready!

With these instructions, you can now download any YouTube playlist on Linux using simple terminal commands. The `yt-dlp` tool is more powerful and reliable than the original Windows application, and it works natively on Linux.

**Remember**: Always use the Android client method (`--extractor-args youtube:player_client=android`) for the best compatibility and to avoid bot detection issues.

---

*This guide was created after successfully downloading multiple playlists and organizing 126+ MP3 files on Linux using yt-dlp.*

