# 🚀 Quick Start Guide - Download YouTube Playlists on Linux

## ⚡ One-Command Download

**For MP3 Audio:**
```bash
yt-dlp --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 --extractor-args youtube:player_client=android "PLAYLIST_URL"
```

**For Video (MP4):**
```bash
yt-dlp --yes-playlist --extractor-args youtube:player_client=android "PLAYLIST_URL"
```

## 🎯 What You Need

1. **yt-dlp** (automatically installed by our script)
2. **Playlist URL** from YouTube
3. **Terminal/Command line**

## 📱 How to Use

### Option 1: Use the Script (Easiest)
```bash
./download_playlist.sh "YOUR_PLAYLIST_URL"
```

### Option 2: Manual Command
```bash
yt-dlp --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 --extractor-args youtube:player_client=android "YOUR_PLAYLIST_URL"
```

## 🔧 If yt-dlp is not installed

```bash
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o yt-dlp
chmod +x yt-dlp
./yt-dlp --yes-playlist --extract-audio --audio-format mp3 --audio-quality 0 --extractor-args youtube:player_client=android "PLAYLIST_URL"
```

## 📁 File Organization

Files are automatically organized into `Downloaded_MP3s/` folder.

## ✅ Successfully Tested

- ✅ Classical Music Playlist (100 files)
- ✅ Bulgarian Folk Dances (26 files)
- ✅ Total: 126 MP3 files, ~750 MB

## 🚨 Troubleshooting

**Always use the Android client method** (`--extractor-args youtube:player_client=android`) to avoid bot detection issues.

---

**Remember**: Replace `"PLAYLIST_URL"` with your actual YouTube playlist URL!
