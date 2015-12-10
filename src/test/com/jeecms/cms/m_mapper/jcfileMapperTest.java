package test.com.jeecms.cms.m_entity; 

import com.jeecms.cms.m_entity.jcfile;
import com.jeecms.cms.m_mapper.jcfileMapper;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/** 
* jcfile Tester. 
* 
* @author <Authors name> 
* @since <pre>ʮ���� 5, 2015</pre> 
* @version 1.0 
*/

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {  "classpath:config/application-context.xml" , "classpath:config/spring-mybatis.xml"})
public class jcfileMapperTest {
    @Autowired
    jcfileMapper jcfilemapper;

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    /**
     *
     * Method: getFilePath()
     *
     */
    @Test
    public void testGetFilePath() throws Exception {
        boolean isTest = false;

        jcfile jc = jcfilemapper.selectByPrimaryKey("/u/cms/www/09093304hc6x.jpg");
        if (jc.getFileName() == "09093304hc6x.jpg")
            isTest = true;
    }



} 
