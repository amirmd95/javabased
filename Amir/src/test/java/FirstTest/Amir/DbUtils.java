package FirstTest.Amir;
import java.util.List;
import java.util.Map;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

public class DbUtils {
 private final JdbcTemplate jdbc;

 public DbUtils(Map<String, Object> var1) {
     String var2 = (String)var1.get("url");
     String var3 = (String)var1.get("username");
     String var4 = (String)var1.get("password");
     String var5 = (String)var1.get("driverClassName");
     DriverManagerDataSource var6 = new DriverManagerDataSource();
     var6.setDriverClassName(var5);
     var6.setUrl(var2);
     var6.setUsername(var3);
     var6.setPassword(var4);
     this.jdbc = new JdbcTemplate(var6);
 }

 public Object readValue(String var1) {
     return this.jdbc.queryForObject(var1, Object.class);
 }

 public Map<String, Object> readRow(String var1) {
     return this.jdbc.queryForMap(var1);
 }

 public List<Map<String, Object>> readRows(String var1) {
     return this.jdbc.queryForList(var1);
 }
}
