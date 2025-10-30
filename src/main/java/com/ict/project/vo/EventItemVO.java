package com.ict.project.vo;

import jakarta.xml.bind.annotation.XmlAccessType;
import jakarta.xml.bind.annotation.XmlAccessorType;
import jakarta.xml.bind.annotation.XmlElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class EventItemVO {
	   @XmlElement(name = "title")
	    private String title;

	    @XmlElement(name = "alternativeTitle")
	    private String alternativeTitle;

	    @XmlElement(name = "creator")
	    private String creator;

	    @XmlElement(name = "regDate")
	    private String regDate;

	    @XmlElement(name = "collectionDb")
	    private String collectionDb;

	    @XmlElement(name = "subjectCategory")
	    private String subjectCategory;

	    @XmlElement(name = "subjectKeyword")
	    private String subjectKeyword;

	    @XmlElement(name = "extent")
	    private String extent;

	    @XmlElement(name = "description")
	    private String description;

	    @XmlElement(name = "spatialCoverage")
	    private String spatialCoverage;

	    @XmlElement(name = "temporalCoverage")
	    private String temporalCoverage;

	    @XmlElement(name = "person")
	    private String person;

	    @XmlElement(name = "language")
	    private String language;

	    @XmlElement(name = "sourceTitle")
	    private String sourceTitle;

	    @XmlElement(name = "referenceIdentifier")
	    private String referenceIdentifier;

	    @XmlElement(name = "rights")
	    private String rights;

	    @XmlElement(name = "copyrightOthers")
	    private String copyrightOthers;

	    @XmlElement(name = "url")
	    private String url;

	    @XmlElement(name = "contributor")
	    private String contributor;

	    @XmlElement(name = "eventPeriod")
	    private String eventPeriod;

	    // ✅ Getter/Setter
	    public String getTitle() { return title; }
	    public void setTitle(String title) { this.title = title; }

	    public String getAlternativeTitle() { return alternativeTitle; }
	    public void setAlternativeTitle(String alternativeTitle) { this.alternativeTitle = alternativeTitle; }

	    public String getCreator() { return creator; }
	    public void setCreator(String creator) { this.creator = creator; }

	    public String getRegDate() { return regDate; }
	    public void setRegDate(String regDate) { this.regDate = regDate; }

	    public String getCollectionDb() { return collectionDb; }
	    public void setCollectionDb(String collectionDb) { this.collectionDb = collectionDb; }

	    public String getSubjectCategory() { return subjectCategory; }
	    public void setSubjectCategory(String subjectCategory) { this.subjectCategory = subjectCategory; }

	    public String getSubjectKeyword() { return subjectKeyword; }
	    public void setSubjectKeyword(String subjectKeyword) { this.subjectKeyword = subjectKeyword; }

	    public String getExtent() { return extent; }
	    public void setExtent(String extent) { this.extent = extent; }

	    public String getDescription() { return description; }
	    public void setDescription(String description) { this.description = description; }

	    public String getSpatialCoverage() { return spatialCoverage; }
	    public void setSpatialCoverage(String spatialCoverage) { this.spatialCoverage = spatialCoverage; }

	    public String getTemporalCoverage() { return temporalCoverage; }
	    public void setTemporalCoverage(String temporalCoverage) { this.temporalCoverage = temporalCoverage; }

	    public String getPerson() { return person; }
	    public void setPerson(String person) { this.person = person; }

	    public String getLanguage() { return language; }
	    public void setLanguage(String language) { this.language = language; }

	    public String getSourceTitle() { return sourceTitle; }
	    public void setSourceTitle(String sourceTitle) { this.sourceTitle = sourceTitle; }

	    public String getReferenceIdentifier() { return referenceIdentifier; }
	    public void setReferenceIdentifier(String referenceIdentifier) { this.referenceIdentifier = referenceIdentifier; }

	    public String getRights() { return rights; }
	    public void setRights(String rights) { this.rights = rights; }

	    public String getCopyrightOthers() { return copyrightOthers; }
	    public void setCopyrightOthers(String copyrightOthers) { this.copyrightOthers = copyrightOthers; }

	    public String getUrl() { return url; }
	    public void setUrl(String url) { this.url = url; }

	    public String getContributor() { return contributor; }
	    public void setContributor(String contributor) { this.contributor = contributor; }

	    public String getEventPeriod() { return eventPeriod; }
	    public void setEventPeriod(String eventPeriod) { this.eventPeriod = eventPeriod; }
}
