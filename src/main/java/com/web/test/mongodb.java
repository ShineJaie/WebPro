package com.web.test;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.util.Calendar;

/**
 * MongoDB 测试类
 * Created by admin on 2016/4/25.
 */
public class mongodb {

    public static void main(String[] args) {

        // Connect to a MongoDB instance running on the localhost on the default port 27017
        MongoClient mongoClient = new MongoClient();

        // Once successfully connected, access the test database
        MongoDatabase db = mongoClient.getDatabase("test");

        Document document = new Document();
        document.put("name", "吴仙杰");
        document.put("time", Calendar.getInstance().getTime());
        db.getCollection("insertTest").insertOne(document);
    }

}
