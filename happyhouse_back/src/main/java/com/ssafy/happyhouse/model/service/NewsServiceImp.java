package com.ssafy.happyhouse.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.News;

@Service
public class NewsServiceImp implements NewsService{
	

	@Override
	public List<News> getNews() {
		
		String url = "https://news.naver.com/main/list.naver?mode=LS2D&mid=shm&sid2=260&sid1=101&date=20220526&page=1";
		Document doc;
		List<News> rnews = new ArrayList<News>();
		try {
			doc = Jsoup.connect(url).get();
			Elements elements = doc.getElementsByAttributeValue("class", "list_body newsflash_body");
			Element element = elements.get(0);
			Elements photoElements = element.getElementsByAttributeValue("class", "photo");
			
			for (int i = 0; i < photoElements.size(); i++) {
				
				Element articleElement = photoElements.get(i);
				Elements aElements = articleElement.select("a");
				Element aElement = aElements.get(0);
				
				String articleUrl = aElement.attr("href");
				
				Element imgElement = aElement.select("img").get(0);
				String imgUrl = imgElement.attr("src");
				String title = imgElement.attr("alt");
				
//				Document subDoc = Jsoup.connect(articleUrl).get();
//				Element contentElement = subDoc.getElementById("newsct_article");
//				String content = contentElement.text();
				
				News rsnews = new News(title, articleUrl, imgUrl);
				
				rnews.add(rsnews);
//            System.out.println("제목 : " + title);
//          System.out.println("콘텐츠 : " + content);
//            System.out.println("뉴스 url : "+articleUrl);
//            System.out.println("이미지 url : "+imgUrl);
//            System.out.println();	
				return rnews;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rnews;
		
	}
	
}
