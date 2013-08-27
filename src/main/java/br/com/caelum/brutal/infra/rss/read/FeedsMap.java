package br.com.caelum.brutal.infra.rss.read;

import static java.lang.Integer.valueOf;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import br.com.caelum.vraptor.environment.Environment;
import br.com.caelum.vraptor4.ioc.ApplicationScoped;

@ApplicationScoped
public class FeedsMap {

	private Map<String, RSSFeed> hashMap = new HashMap<String, RSSFeed>();
	@Inject private FeedReader feedReader;
	@Inject	private Environment env;
	
	public void putOrUpdate(String feedBaseKey){
		hashMap.remove(feedBaseKey);
		String uri = env.get(feedBaseKey+".url");
		Integer numberOfItems = valueOf(env.get(feedBaseKey+".items"));
		RSSFeed feed = feedReader.read(uri, numberOfItems);
		hashMap.put(feedBaseKey, feed);
	}
	
	public RSSFeed get(String feedBaseKey){
		return hashMap.get(feedBaseKey);
	}
	
}