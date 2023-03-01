//package com.core.fileTest;
//
//
//
//import java.awt.*;
//import java.awt.image.BufferedImage;
//import java.io.*;
//import java.util.List;
//import javax.imageio.ImageIO;
//import javax.imageio.ImageReader;
//import javax.imageio.stream.FileImageOutputStream;
//import javax.imageio.stream.ImageInputStream;
//import javax.imageio.stream.ImageOutputStream;
//import javax.swing.*;
//
//import com.core.fileTest.gif.AnimatedGifEncoder;
//import com.core.fileTest.gif.GifDecoder;
//import com.core.fileTest.gif.GifUtil;
//import org.apache.commons.imaging.ImageReadException;
//import org.apache.commons.imaging.Imaging;
//import org.apache.commons.imaging.common.ImageMetadata;
//import org.apache.commons.imaging.formats.gif.GifImageMetadata;
//import org.apache.commons.imaging.formats.gif.GifImageParser;
//
//public class CropGif {
//    public static String oriPath = "C:\\Users\\kwz50\\Downloads\\giphy.gif";
//    public static String desPath = "C:\\Users\\kwz50\\Downloads\\giphy2.gif";
//
//    public static void main(String[] args) throws IOException {
//////  -------------------------------------------------------------------
////        // 整個圖壞掉
////        File in = new File(oriPath);
////        File out = new File(desPath);
////        GifUtil myGif = new GifUtil();
////        myGif.gifInputToOutput(in,out);
//////  -------------------------------------------------------------------
//
//
//////        存出來也是不會動
////        BufferedImage img = ImageIO.read(new File("C:\\Users\\kwz50\\Downloads\\giphy.gif"));
////        BufferedImage bi = new BufferedImage(img.getWidth(null),img.getHeight(null),BufferedImage.TYPE_INT_RGB);
////        Graphics2D g2 = bi.createGraphics();
////        g2.drawImage(img, 0, 0, null);
////        g2.dispose();
////        ImageIO.write(bi, "gif", new File("C:\\Users\\kwz50\\Downloads\\giphy2.gif"));
//
//////  -------------------------------------------------------------------
//
//
//
//
//
//
//
////        廢物
////        Image image = new ImageIcon(oriPath);
////        int width = 1000;
////        int height = 1000;
//////        image.setImage(image.getImage().getScaledInstance(width, height, Image.SCALE_DEFAULT));
//////        System.out.println(image);
//////
//////
//////        BufferedImage bufferedImage= new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
//////        image.getImage().getGraphics().drawImage(image.getImage(), 0, 0, null);
//////        ImageIO.write(bufferedImage, "jpg", new File(desPath));
//
//
//
//
//////  -------------------------------------------------------------------
//////        切割成細分圖檔，切出來怪怪的
////        try {
////            ImageReader reader = ImageIO.getImageReadersByFormatName("gif").next();
////            File input = new File(oriPath);
////            ImageInputStream stream = ImageIO.createImageInputStream(input);
////            reader.setInput(stream);
////
////            int count = reader.getNumImages(true);
////            for (int index = 0; index < count; index++) {
////                BufferedImage frame = reader.read(index);
////                File outputFile = new File("C:\\Users\\kwz50\\Downloads\\giphy"+index+".gif");
////                ImageIO.write(frame, "gif", outputFile);
////            }
////        } catch (IOException ex) {
////            // An I/O problem has occurred
////        }
//
//////  -------------------------------------------------------------------
//
////        //  切出來的圖有問題，還是不會動
////        try {
////            // Input GIF file
////            File inputFile = new File("C:\\Users\\kwz50\\Downloads\\giphy.gif");
////
////            // Get metadata from input file
////            ImageMetadata metadata = Imaging.getMetadata(inputFile);
////            GifImageMetadata gifMetadata = (GifImageMetadata) metadata;
////
////            // Create a GifImageParser to parse the input GIF file
////            GifImageParser parser = new GifImageParser();
////
//////            System.out.println(parser.getAllBufferedImages(inputFile));
////
////            List<BufferedImage> frames = parser.getAllBufferedImages(inputFile);
////
////            // Crop each frame of the GIF
////            int x = 0, y = 0, width = 100, height = 100;
////            for (int i = 0; i < frames.size(); i++) {
////                BufferedImage frame = frames.get(i);
////                frame = frame.getSubimage(x, y, width, height);
////                frames.set(i,frame) ;
////            }
////
////            // Write the cropped GIF to a new file
////            File outputFile = new File("C:\\Users\\kwz50\\Downloads\\giphy2.gif");
////            ImageIO.write(frames.get(0), "gif", outputFile);
////            for (int i = 1; i < frames.size(); i++) {
////                ImageIO.write(frames.get(i), "gif", outputFile);
////            }
////        } catch (ImageReadException | IOException e) {
////            System.out.println("Error: " + e.getMessage());
////        }
//
//////  -------------------------------------------------------------------
//
//
//
//    }
//
//
//}
