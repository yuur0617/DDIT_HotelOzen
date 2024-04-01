package kr.or.ddit.jasypt;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Properties;

import javax.inject.Inject;
import javax.inject.Named;

import org.jasypt.encryption.pbe.PBEStringEncryptor;
import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class JasyptTest extends AbstractRootContextTest{

	@Inject
	@Named("dbInfo")
	Properties dbinfo;
	
	@Inject
	PBEStringEncryptor encryptor;
	
	
	@Test
	void test() {
		dbinfo.forEach((k, v)->{
			String value = encryptor.encrypt(v.toString());
			log.info("{}=ENC({})",k,value);
		});
	}

}
