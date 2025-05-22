package features;

import com.intuit.karate.junit5.Karate;

public class JsonTest {
	@Karate.Test
	Karate delete() {
		// Path to the feature file (relative to this class)
		return Karate.run("deleteapi", "postapi").relativeTo(getClass());
//		return Karate.run().relativeTo(getClass());
	}

//	@Karate.Test
//	Karate getapi() {
//		// Path to the feature file (relative to this class)
//		return Karate.run("getapi").relativeTo(getClass());

//	@Karate.Test
//	Karate testAll() {
//		return Karate.run()
//				.relativeTo(getClass()); 
		// sample should be folder
//				.tags("@sample");
//	}

}