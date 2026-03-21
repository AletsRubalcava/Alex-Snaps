const sharp = require("sharp");
const fs = require("fs");
const path = require("path");

const inputDir = path.join(__dirname, "../../data/import");
const outputDir = path.join(__dirname, "../../data/tmp");

fs.mkdirSync(outputDir, {recursive: true});

fs.readdirSync(inputDir).forEach(async (file) => {
    if(file.endsWith(".jpg") || file.endsWith(".jpeg")) {
        const inputPath = path.join(inputDir, file);
        const outputPath = path.join(outputDir, file.replace(/\.(jpg|jpeg)/,".webp"));

        await sharp(inputPath)
        .resize({width: 2048, withoutEnlargement: true})
        .webp({quality: 80})
        .toFile(outputPath);
    }
});