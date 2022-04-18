package features;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	
	@Karate.Test
	Karate putAPIcall(){
		return Karate.run("putAPIcall").relativeTo(getClass());
		
	}	@Karate.Test
	Karate deleteAPIcall(){
		return Karate.run("deleteAPI").relativeTo(getClass());
		
	}	
	
	@Karate.Test
	Karate postAPIcall(){
		return Karate.run("randomString").relativeTo(getClass());
		
	}	
}
