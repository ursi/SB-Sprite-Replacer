# Sprite Replacer

### [Available Sprite Packs](https://drive.google.com/drive/folders/1KoxQDlHt7kVwYeeh0UJNXppwqRmm2zCM?usp=sharing)

## Instructions

### Replacing Textures:

- Run `nix develop` to set up the environment.
- (Optional) write down the path to your Steam client textures in `textures.txt`. This will make the program directly upload the new sprites to this directory so you don't have to do it manually.
- Add sprite packs to the `sprite-packs` directory.
- run `build-sheets`
- Your custom sprite sheets will be available in `sprite-sheets/custom`, and also in the directory in `textures.txt` if you specified one.

### Creating Spirte Pakcs:

- **Step 1:** Create a directory for the name of the Sprite Pack.
- **Step 2:** In this directory, create directories for the sprite sheets to which the custom sprites will be applied, e.g., `base.0`.
- **Step 3:** In the directories that correspond to the sprite sheets, place your custom sprites and name them `x,y.png`,
where `x` and `y` represent the number of pixels over and the number of pixels down (starting at 0)
the upper left corner of the image will be when it's placed on the sprite sheet.
