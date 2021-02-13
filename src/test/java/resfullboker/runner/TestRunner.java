package resfullboker.runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;
import org.junit.runner.Result;
import org.junit.runners.model.RunnerScheduler;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class TestRunner {
    @Test
    public void testRunner(){
        System.setProperty("karate.env", "demo"); // configuracion de ambiente
        Results result = Runner.path("classpath:resfullboker").tags("~@ignore").parallel(1);
        generateReport(result.getReportDir());
    }

    public static void generateReport(String karateOutputPath){
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "RestfulBooker");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths,config);
        reportBuilder.generateReports();
    }
}
