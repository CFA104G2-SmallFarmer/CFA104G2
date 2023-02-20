package com.core.fileTest;


import com.core.externalPackage.fmsware.AnimatedGifEncoder;
import com.core.externalPackage.fmsware.GifDecoder;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import java.util.List;

public class AnimateGif {
    public static String imagePath = "C:\\Users\\kwz50\\Downloads\\giphy.gif";
    public static String outputPath = "C:\\Users\\kwz50\\Downloads\\giphy2.gif";
    public static String imagePathLinux = "/home/Fontrip/photo/202302/167592406608996054.gif";
    public static String outputPathLinux = "/home/photoCache/167592406608996054.gif";

    public static void main(String[] args) throws IOException {
//        cropGif(imagePath, outputPath,100,100);
//        cropGif(imagePathLinux, outputPathLinux,100,100);
//        test(imagePathLinux);
        overClipTest(imagePath, outputPath);
    }

    /**
     * 圖轉gif
     *
     * @param imageList
     * @param outputPath
     * @throws IOException
     */
    static void imagesToGif(List<BufferedImage> imageList, String outputPath) throws IOException {
        // 逐張拆分後合成
        AnimatedGifEncoder encoder = new AnimatedGifEncoder();
        encoder.start(outputPath);
        encoder.setRepeat(0);
        for (BufferedImage bufferedImage :
                imageList) {
            encoder.setDelay(100);
            int height = bufferedImage.getHeight();
            int width = bufferedImage.getWidth();
            BufferedImage zoomImage = new BufferedImage(width, height, 3);
            Image image = bufferedImage.getScaledInstance(width, height, Image.SCALE_SMOOTH);
            Graphics gc = zoomImage.getGraphics();
            gc.setColor(Color.WHITE);
            gc.drawImage(image, 0, 0, null);
            encoder.addFrame(zoomImage);
        }
        encoder.finish();
        File outFile = new File(outputPath);
        BufferedImage image = ImageIO.read(outFile);
        ImageIO.write(image, outFile.getName(), outFile);
    }

    /**
     * Gif轉圖集
     *
     * @param imagePath
     * @param outputDirPath
     * @throws IOException
     */
    static void gifToImages(String imagePath, String outputDirPath) throws IOException {
        GifDecoder decoder = new GifDecoder();
        int status = decoder.read(imagePath);
        if (status != GifDecoder.STATUS_OK) {
            throw new IOException("read image " + imagePath + " error!");
        }
        for (int i = 0; i < decoder.getFrameCount(); i++) {
            BufferedImage bufferedImage = decoder.getFrame(i);
            File outFile = new File(outputDirPath + i + ".png");
            ImageIO.write(bufferedImage, "png", outFile);
        }
    }

    /**
     * 倒轉gif
     *
     * @param imagePath
     * @param outputPath
     * @throws IOException
     */
    public static void reverseGif(String imagePath, String outputPath) throws IOException {
        GifDecoder decoder = new GifDecoder();
        int status = decoder.read(imagePath);
        if (status != GifDecoder.STATUS_OK) {
            throw new IOException("read image " + imagePath + " error!");
        }
        // 逐張拆分後合成
        AnimatedGifEncoder encoder = new AnimatedGifEncoder();
        encoder.start(outputPath);
        encoder.setRepeat(decoder.getLoopCount());
        for (int i = decoder.getFrameCount() - 1; i >= 0; i--) {
            encoder.setDelay(decoder.getDelay(i));// 設置撥放延遲時間
            BufferedImage bufferedImage = decoder.getFrame(i);
            int height = bufferedImage.getHeight();
            int width = bufferedImage.getWidth();
            BufferedImage zoomImage = new BufferedImage(width, height, bufferedImage.getType());
            Image image = bufferedImage.getScaledInstance(width, height, Image.SCALE_SMOOTH);
            Graphics gc = zoomImage.getGraphics();
            gc.setColor(Color.WHITE);
            gc.drawImage(image, 0, 0, null);
            encoder.addFrame(zoomImage);
        }
        encoder.finish();
        File outFile = new File(outputPath);
        BufferedImage image = ImageIO.read(outFile);
        ImageIO.write(image, outFile.getName(), outFile);
    }

    /**
     * 剪切gif
     *
     * @param imagePath
     * @param outputPath
     * @param width
     * @param height
     * @throws IOException
     */
    public static void cropGif(String imagePath, String outputPath, int width, int height) throws IOException {
        GifDecoder decoder = new GifDecoder();
        int status = decoder.read(imagePath);
        System.out.println(status);
        if (status != GifDecoder.STATUS_OK) {
            throw new IOException("read image " + imagePath + " error!");
        }
        // 逐張拆分後合成
        AnimatedGifEncoder encoder = new AnimatedGifEncoder();
        encoder.start(outputPath);
        encoder.setRepeat(decoder.getLoopCount());
        for (int i = decoder.getFrameCount() - 1; i >= 0; i--) {
            encoder.setDelay(decoder.getDelay(i));
            BufferedImage bufferedImage = decoder.getFrame(i);
            BufferedImage zoomImage = new BufferedImage(width, height, bufferedImage.getType());
            BufferedImage image = bufferedImage.getSubimage(0, 0, width, height);//切割
            Graphics gc = zoomImage.getGraphics();
            gc.setColor(Color.WHITE);//似乎沒有透明底
            gc.drawImage(image, 0, 0, null);
            encoder.addFrame(zoomImage);
        }
        encoder.finish();
        File outFile = new File(outputPath);
        BufferedImage image = ImageIO.read(outFile);
        ImageIO.write(image, outFile.getName(), outFile);
    }



    public static void overClipTest(String imagePath,String outputPath) throws IOException {
        BufferedImage img = ImageIO.read(new File(imagePath));
        BufferedImage image = img.getSubimage(0,0,300,200);
        File outputfile = new File(outputPath);
        ImageIO.write(image,"gif", outputfile);
    }


    public static void test(String name) throws IOException {
        System.out.println(name);
        name = name.trim().toLowerCase();
        if (name.indexOf("file:") < 0 && name.indexOf(":/") <= 0) {
            BufferedInputStream in = new BufferedInputStream(new FileInputStream(name));
            System.out.println("156");
            System.out.println(name);
            System.out.println(in.read());
        } else {
            URL url = new URL(name);
            BufferedInputStream in = new BufferedInputStream(url.openStream());
            System.out.println("160");
            System.out.println(name);
            System.out.println(in.read());
        }
//        this.status = this.read(this.in);
    }




}