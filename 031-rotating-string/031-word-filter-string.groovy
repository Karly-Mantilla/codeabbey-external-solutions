package com.meetup

import org.springframework.core.io.Resource

import java.util.regex.Matcher
import java.util.regex.Pattern

class WordFilterService extends AbstractService {

	private Node tree = null

	private File dict = null

	public void setDict(Resource dict) {
		this.dict = dict.getFile()
	}

	public void init() {
		this.tree = new Node()
		InputStream is = new FileInputStream(this.dict)
		try {
			Properties prop = new Properties()
			prop.load(new InputStreamReader(is, Const.DEFAULT_ENCODING))
			Enumeration<String> en = (Enumeration<String>) prop.propertyNames()
			while (en.hasMoreElements()) {
				String word = en.nextElement()
				this.insertWord(word, Integer.valueOf(prop.getProperty(word)))
			}
		} catch (UnsupportedEncodingException ex) {
			ex.printStackTrace()
		} catch (IOException ex) {
			ex.printStackTrace()
		} finally {
			if (is != null)
				try {
					is.close()
				} catch (IOException ex) {
					ex.printStackTrace()
				}
		}
	}

	private void insertWord(String word, int level) {
		Node node = this.tree
		for (int i = 0; i < word.length(); i++) {
			node = node.addChar(word.charAt(i))
		}
		node.setEnd(true)
		node.setLevel(level)
	}

	private boolean isPunctuationChar(String c) {
		String regex = "[\\pP\\pZ\\pS\\pM\\pC]"
		Pattern p = Pattern.compile(regex, Pattern.CASE_INSENSITIVE)
		Matcher m = p.matcher(c)
		return m.find()
	}

	private PunctuationOrHtmlFilteredResult filterPunctation(String originalString) {
		StringBuffer filteredString = new StringBuffer()
		ArrayList<Integer> charOffsets = new ArrayList<Integer>()
		for (int i = 0; i < originalString.length(); i++) {
			String c = String.valueOf(originalString.charAt(i))
			if (!isPunctuationChar(c)) {
				filteredString.append(c)
				charOffsets.add(i)
			}
		}
		PunctuationOrHtmlFilteredResult result = new PunctuationOrHtmlFilteredResult()
		result.setOriginalString(originalString)
		result.setFilteredString(filteredString)
		result.setCharOffsets(charOffsets)
		return result
	}

	private PunctuationOrHtmlFilteredResult filterPunctationAndHtml(String originalString) {
		StringBuffer filteredString = new StringBuffer()
		ArrayList<Integer> charOffsets = new ArrayList<Integer>()
		int k = 0
		for (int i = 0; i < originalString.length(); i++) {
			String c = String.valueOf(originalString.charAt(i))
			if (originalString.charAt(i) == '<') {
				for (k = i + 1; k < originalString.length(); k++) {
					if (originalString.charAt(k) == '<') {
						k = i
						break
					}
					if (originalString.charAt(k) == '>') {
						break
					}
				}
				i = k
			} else {
				if (!this.isPunctuationChar(c)) {
					filteredString.append(c)
					charOffsets.add(i)
				}
			}
		}
		PunctuationOrHtmlFilteredResult result = new PunctuationOrHtmlFilteredResult()
		result.setOriginalString(originalString)
		result.setFilteredString(filteredString)
		result.setCharOffsets(charOffsets)
		return result
	}

	private FilteredResult filter(PunctuationOrHtmlFilteredResult pohResult, char replacement) {
		StringBuffer sentence = pohResult.getFilteredString()
		ArrayList<Integer> charOffsets = pohResult.getCharOffsets()
		StringBuffer resultString = new StringBuffer(pohResult.getOriginalString())
		StringBuffer badWords = new StringBuffer()
		int level = 0
		Node node = this.tree
		int start = 0, end = 0
		for (int i = 0; i < sentence.length(); i++) {
			start = i
			end = i
			node = this.tree
			for (int j = i; j < sentence.length(); j++) {
				node = node.findChar(sentence.charAt(j))
				if (node == null) {
					break
				}
				if (node.isEnd()) {
					end = j
					level = node.getLevel()
				}
			}
			if (end > start) {
				for (int k = start; k <= end; k++) {
					resultString.setCharAt(charOffsets.get(k), replacement)
				}
				if (badWords.length() > 0) {
					badWords.append(",")
				}
				badWords.append(sentence.substring(start, end + 1))
				i = end
			}
		}
		FilteredResult result = new FilteredResult()
		result.setOriginalContent(pohResult.getOriginalString())
		result.setFilteredContent(resultString.toString())
		result.setBadWords(badWords.toString())
		result.setLevel(level)
		return result
	}

	/**
	 * ??????????????????
	 * ?????????????????????????????????html????????????????????????
	 * ?????????????????????????????????????????????????????????_???_???_???
	 * @param sentence ?????????????????????
	 * @param replacement ????????????????????????
	 * @return ??????????????????
	 */
	public String simpleFilter(String sentence, char replacement) {
		StringBuffer sb = new StringBuffer()
		Node node = this.tree
		int start = 0, end = 0
		for (int i = 0; i < sentence.length(); i++) {
			start = i
			end = i
			node = tree
			for (int j = i; j < sentence.length(); j++) {
				node = node.findChar(sentence.charAt(j))
				if (node == null) {
					break
				}
				if (node.isEnd()) {
					end = j
				}
			}
			if (end > start) {
				for (int k = start; k <= end; k++) {
					sb.append(replacement)
				}
				i = end
			} else {
				sb.append(sentence.charAt(i))
			}
		}
		return sb.toString()
	}

	/**
	 * ???????????????????????????html????????????????????????????????????????????????????????????????????????????????????????????????html???????????????????????????????????????????????????fuckfont????????????fuck<font>a</font>???????????????****<****>a</font>
	 * @param originalString ?????????????????????
	 * @param replacement ???????????????
	 * @return
	 */
	public FilteredResult filterText(String originalString, char replacement) {
		return this.filter(this.filterPunctation(originalString), replacement)
	}

	/**
	 * html???????????????html??????????????????html?????????????????????????????????????????????<>?????????????????????????????????????????????????????????fuck????????????<a title="fuck">fuck</a>???????????????<a title="fuck">****</a>
	 * @param originalString ?????????????????????
	 * @param replacement ???????????????
	 * @return
	 */
	public FilteredResult filterHtml(String originalString, char replacement) {
		return this.filter(this.filterPunctationAndHtml(originalString), replacement)
	}

	private class PunctuationOrHtmlFilteredResult {

		private String originalString
		private StringBuffer filteredString
		private ArrayList<Integer> charOffsets

		public String getOriginalString() {
			return this.originalString
		}

		public void setOriginalString(String originalString) {
			this.originalString = originalString
		}

		public StringBuffer getFilteredString() {
			return this.filteredString
		}

		public void setFilteredString(StringBuffer filteredString) {
			this.filteredString = filteredString
		}

		public ArrayList<Integer> getCharOffsets() {
			return this.charOffsets
		}

		public void setCharOffsets(ArrayList<Integer> charOffsets) {
			this.charOffsets = charOffsets
		}

	}

	private class Node {

		private Map<String, Node> children = new HashMap<String, Node>(0)
		private boolean isEnd = false
		private int level = 0

		public Node addChar(char c) {
			String cStr = String.valueOf(c)
			Node node = this.children.get(cStr)
			if (node == null) {
				node = new Node()
				this.children.put(cStr, node)
			}
			return node
		}

		public Node findChar(char c) {
			String cStr = String.valueOf(c)
			return this.children.get(cStr)
		}

		public boolean isEnd() {
			return this.isEnd
		}

		public void setEnd(boolean isEnd) {
			this.isEnd = isEnd
		}

		public int getLevel() {
			return this.level
		}

		public void setLevel(int level) {
			this.level = level
		}

	}

	class FilteredResult {

		private Integer level = 0 // ????????????????????????
		private String filteredContent = null // ?????????????????????????????????
		private String badWords = null // ?????????????????????,eg:??????,?????????,GCD
		private String originalContent = null //????????????

		public String getBadWords() {
			return this.badWords
		}

		public void setBadWords(String badWords) {
			this.badWords = badWords
		}

		public FilteredResult() {

		}

		public FilteredResult(String originalContent, String filteredContent, Integer level, String badWords) {
			this.originalContent = originalContent
			this.filteredContent = filteredContent
			this.level = level
			this.badWords = badWords
		}

		public Integer getLevel() {
			return this.level
		}

		public void setLevel(Integer level) {
			this.level = level
		}

		public String getFilteredContent() {
			return this.filteredContent
		}

		public void setFilteredContent(String filteredContent) {
			this.filteredContent = filteredContent
		}

		public String getOriginalContent() {
			return this.originalContent
		}

		public void setOriginalContent(String originalContent) {
			this.originalContent = originalContent
		}

	}

}