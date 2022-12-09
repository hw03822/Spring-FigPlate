

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class JDBCEncriptor {
	public static void main(String[] args) {
		StandardPBEStringEncryptor enc = new StandardPBEStringEncryptor();
		enc.setPassword("gpdnjsld");
		System.out.println(enc.encrypt("oracle.jdbc.OracleDriver"));
		System.out.println(enc.encrypt("jdbc:oracle:thin:@localhost:1521:xe"));
		System.out.println(enc.encrypt("hr")); // database id
		System.out.println(enc.encrypt("hr")); // database password
	}
}
