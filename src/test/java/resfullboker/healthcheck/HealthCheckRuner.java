package resfullboker.healthcheck;
import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@KarateOptions(features = "classpath:resfullboker/healthcheck/HealthCheck.feature")
public class HealthCheckRuner {
}
