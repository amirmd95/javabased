package util;


import com.intuit.karate.Results;
import com.intuit.karate.junit4.Karate;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import static org.junit.Assert.*;
import org.junit.BeforeClass;
import org.junit.Test;



/**
*
* @author pthomas3
*/
//important: do not use @RunWith(Karate.class) !
public class TestRunner {
   
   @Test
   public void testParallel() {
       
       Results results = Runner.parallel(getClass(), 5);
       generateReport(results.getReportDir());
       assertTrue(results.getErrorMessages(), results.getFailCount() == 0);        
   }
   
   public static void generateReport(String karateOutputPath) {        
	   Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
       List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
       jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
       Configuration config = new Configuration(new File("target"), "Amir");
       ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
       reportBuilder.generateReports();       
   }
   
}





