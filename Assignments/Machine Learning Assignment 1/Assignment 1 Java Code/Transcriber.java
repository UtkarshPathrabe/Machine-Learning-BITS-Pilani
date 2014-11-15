package edu.cmu.sphinx.demo.transcriber;

import java.net.URL;

import edu.cmu.sphinx.api.Configuration;
import edu.cmu.sphinx.api.SpeechResult;
import edu.cmu.sphinx.api.StreamSpeechRecognizer;
import edu.cmu.sphinx.result.WordResult;

public class Transcriber {

	public static void main(String[] args) throws Exception {
        System.out.println("Loading models...");

        Configuration configuration = new Configuration();

        // Load model from the jar
        configuration.setAcousticModelPath("resource:/WSJ_8gau_13dCep_16k_40mel_130Hz_6800Hz");
        
        configuration.setDictionaryPath("resource:/WSJ_8gau_13dCep_16k_40mel_130Hz_6800Hz/dict/cmudict.0.6d");
        
        configuration.setLanguageModelPath("models/language/en-us.lm.dmp");

        StreamSpeechRecognizer recognizer = 
            new StreamSpeechRecognizer(configuration);
        recognizer.startRecognition(new URL("file:src/apps/edu/cmu/sphinx/demo/assigntest/lecdata.wav").openStream());
        SpeechResult result = recognizer.getResult();
 
        while (result != null) {
        
            System.out.format("Hypothesis: %s\n", result.getHypothesis());
            result = recognizer.getResult();                
            System.out.println("List of recognized words and their times:");
            for (WordResult r : result.getWords()) {
        	System.out.println(r);
            }
        }

        recognizer.stopRecognition();
    }
}
