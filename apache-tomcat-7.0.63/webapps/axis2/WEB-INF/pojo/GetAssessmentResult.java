import java.util.*;
public class GetAssessmentResult {
	public String generate(String ltaresult, String obdresult) {
		int ltaresultint = Integer.parseInt(ltaresult);
		int obdresultint = Integer.parseInt(obdresult);
		int overallresult = 7*ltaresultint + 3*obdresultint;
		if (overallresult<=10){
			return "pass";
		}else if (overallresult>10&&overallresult<=20){
			return "average";
		}else{
			return "fail";
		}
	}
}