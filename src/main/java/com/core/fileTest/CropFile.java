//package com.core.fileTest;
//
//import javax.imageio.ImageIO;
//import java.awt.*;
//import java.awt.image.BufferedImage;
//import java.io.*;
//import java.util.ArrayList;
//import java.util.List;
//import org.imgscalr.Scalr;
//public class CropFile {
//    public static void main(String[] args) throws FileNotFoundException {
//        BufferedImage img = null;
//        try {
//            img = ImageIO.read(new File("C:\\Users\\kwz50\\Downloads\\raw_image.jpg"));
//        } catch (IOException e) {
//        }
//        System.out.print(img);
//
//        File image = new File("C:\\Users\\kwz50\\Downloads\\raw_image.jpg");
////        File image = new File("/home/photoCache/167584411733390500-1024x768.jpg");//會自動轉換成C:\home\photoCache\167584411733390500-1024x768.jpg，太厲害了
//        System.out.println(image.length());
//        BufferedInputStream input = null;
//        BufferedOutputStream output = null;
//        input = new BufferedInputStream(new FileInputStream(image),10240);
//    }
//
//
//
//
//    public File resizePhoto(String inputPath,String outputPath,int width,int height) throws IOException {
//
//        BufferedImage originalBuffer = ImageIO.read(new File(inputPath));
//        int Xpoint;
//        int Ypoint;
//        int resultW = 0;
//        int resultH = 0;
//        int imagewidth = originalBuffer.getWidth();
//        int imageheight = originalBuffer.getHeight();
//        String fileNameExtension = "jpg";
//        List resultNumber = calculate(width,height,imagewidth,imageheight);
//        //print resultNumber
//        resultW = (int) resultNumber.get(0);
//        resultH = (int) resultNumber.get(1);
//        Xpoint = (int) resultNumber.get(2);
//        Ypoint = (int) resultNumber.get(3);
//// ----------------------------------開始壓縮------------------------------------------------------------------------------
//        BufferedImage rizeBuffer = compressPhoto(originalBuffer,resultW,resultH);
//// ----------------------------------開始切割------------------------------------------------------------------------------
//        rizeBuffer = slice(rizeBuffer,Xpoint,Ypoint,width,height);
////		BufferedImage rizeBuffer = slice(originalBuffer,Xpoint,Ypoint,width,height)
////		BufferedImage rizeBuffer = originalBuffer
//
//        File outputfile = new File(outputPath);
//        ImageIO.write(rizeBuffer,fileNameExtension,outputfile);
//        return outputfile;
//    }
//
//
//    BufferedImage slice(BufferedImage compressBuffer,int Xpoint,int Ypoint,int maxWidth,int maxHeight){
//        BufferedImage afterResizeBuffer = Scalr.crop(compressBuffer,
//                Xpoint,
//                Ypoint,
//                maxWidth,
//                maxHeight,Scalr.OP_ANTIALIAS);
//		return afterResizeBuffer;
//    }
//
//
//    BufferedImage compressPhoto(BufferedImage originalBuffer,int resultW ,int resultH){
//
//        Image reSizedImg = originalBuffer.getScaledInstance(resultW,resultH,Image.SCALE_SMOOTH);
//        BufferedImage rizeBuffer = new BufferedImage(resultW,resultH,originalBuffer.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalBuffer.getType());
//        Graphics2D g = rizeBuffer.createGraphics();
//        g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,RenderingHints.VALUE_INTERPOLATION_BICUBIC);
//        g.setRenderingHint(RenderingHints.KEY_RENDERING,RenderingHints.VALUE_RENDER_QUALITY);
//        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
//        g.drawImage(reSizedImg,0,0,resultW,resultH,null);
//        g.dispose();
//
//        return rizeBuffer;
//    }
//
//
//    List calculate(int maxW,int maxH,int imagewidth,int imageheight){
//        List resultNumber = new ArrayList();
//        int Xpoint;
//        int Ypoint;
//        int resultW = 0;
//        int resultH = 0;
//        int maxWidth =  maxW;
//        int maxHeight = maxH;
//        float physicalRatio = imagewidth / imageheight;
//        float requiredRatio = maxWidth / maxHeight;
//        if (physicalRatio < requiredRatio) {
//            resultW = maxWidth;
//            resultH = Math.round( maxWidth / physicalRatio);
//            Xpoint = (resultW-maxWidth)/2;
//            Ypoint = (resultH-maxHeight)/2;
//        } else {
//            resultH = maxHeight;
//            resultW = Math.round(maxHeight * physicalRatio);
//            Xpoint = (resultW-maxWidth)/2;
//            Ypoint = (resultH-maxHeight)/2;
//        }
//        resultNumber.add(resultW);
//        resultNumber.add(resultH);
//        resultNumber.add(Xpoint);
//        resultNumber.add(Ypoint);
//        return resultNumber;
//    }
//
//
//
//}
