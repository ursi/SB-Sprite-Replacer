**Update:** If you download the `.exe` below, you may find that it doesn't work. I don't know why this is and I don't think I'm ever going to fix it since I haven't used Python in a long time. However, if you know how to use Python you can still use the script. Some day I will get around to making a much better sprite tool.
# Sprite Replacer
~~Instructions are included in~~ instructions for the latest release (download [here](https://github.com/Ursi/SB-Sprite-Replacer/releases/latest)) Are now here.

#### [Available Sprite Packs](https://drive.google.com/drive/folders/1KoxQDlHt7kVwYeeh0UJNXppwqRmm2zCM?usp=sharing)
## Instructions
### Replacing Textures:
- **Step 0:** (Optional) write down the path to where your Steam client textures are located in `textures.txt`.
This will make the program directly upload the new sprites to this folder so you don't have to do it manually.  **WARNING: THIS WILL OVERWRITE YOUR CURRENT SPRITES**
- **Step 1:** Paste the custom sprite packs in the `custom sprites` folder.
- **Step 2:** In `sprite sheets/default` put the texture files you want the sprite packs to be applied to. By default, these are the default sprites
- **Step 2.5:** (Optional) go to the `sr` folder and create a shortuct for `sprite_replacer.exe` and put it in the main folder for easy access.
- **Step 3:** Go to the `sr` folder and run `sprite_replacer.exe`, or run the shortcut you just made.
- **Step 4:** Your custom sprite sheets will be available in `sprite sheets/custom`, and also in your StarBreak texture folder if you did step 0.
		
### Creating Spirte Pakcs:
- **Step 1:** Create a folder for the name of the Sprite Pack.
- **Step 2:** In this folder, create folders for the sprite sheets to which the custom sprites will be applied, e.g., `base.0`.
- **Step 3:** In the folders that correspond to the sprite sheets, place your custom sprites and name them `x,y.png`,
where `x` and `y` represent the number of pixels over and the number of pixels down (starting at 0)
the upper left corner of the image will be when it's placed on the sprite sheet.

## Libraries
[Pillow](https://pillow.readthedocs.io)
