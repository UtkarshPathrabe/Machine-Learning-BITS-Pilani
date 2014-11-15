package it.sauronsoftware.jave;

import java.io.File;

public class VideoToAudio {
	public void convert(){
		File source = new File("D://video.mp4");
		File target = new File("D://audio.wav");
	
		AudioAttributes audio = new AudioAttributes();
		audio.setCodec("pcm_s16le");
		audio.setBitRate(new Integer(256000)); //bitrate = sample size * sample rate = 16bit * 16khz = 256000
		//Channels = 1 implies mono format
		audio.setChannels(new Integer(1));
		//sample rate is 16000Hz or 16KHz
		audio.setSamplingRate(new Integer(16000));
		EncodingAttributes attrs = new EncodingAttributes();
		//wav file format
		attrs.setFormat("wav");
		attrs.setAudioAttributes(audio);
		Encoder encoder = new Encoder();
	
		try {
		    encoder.encode(source, target, attrs);
		} catch (IllegalArgumentException e) {
		    e.printStackTrace();
		} catch (InputFormatException e) {
		    e.printStackTrace();
		} catch (EncoderException e) {
		    e.printStackTrace();
		}
	}
	public static void main(String [] args){
		new VideoToAudio().convert();
	}
}