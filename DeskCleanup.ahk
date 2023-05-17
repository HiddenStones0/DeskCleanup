#NoEnv
#Persistent

; Define the paths for Desktop and Documents folders
Desktop := A_Desktop
Documents := A_MyDocuments 

; Define the file types and their corresponding directories
documents_exts := [".doc", ".docx", ".txt", ".pdf", ".xls", ".xlsx", ".ppt", ".pptx"]
images_exts := [".jpg", ".jpeg", ".png", ".gif", ".bmp", ".svg", ".ico"]
audio_exts := [".mp3", ".wav", ".flac", ".m4a", ".wma"]
video_exts := [".mp4", ".mkv", ".flv", ".mpeg", ".mov", ".wmv"]
sbs_exts := [".sbs"]
blend_exts := [".blend"]

folders := {documents: documents_exts, images: images_exts, audio: audio_exts, video: video_exts, sbs_files: sbs_exts, blender_files: blend_exts}

; Create the directories in Documents folder if they don't already exist
for folder, exts in folders {
    FileCreateDir, % Documents . "\" . folder
}

; Move the files from Desktop to their respective directories in Documents
for folder, exts in folders {
    for index, ext in exts {
        Loop, %Desktop%\*%ext%
        {
            FileMove, %A_LoopFileLongPath%, % Documents . "\" . folder
        }
    }
}

ExitApp
