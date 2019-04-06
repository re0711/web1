package abc.bbs.message.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MessageExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public MessageExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andTypeIsNull() {
            addCriterion("type is null");
            return (Criteria) this;
        }

        public Criteria andTypeIsNotNull() {
            addCriterion("type is not null");
            return (Criteria) this;
        }

        public Criteria andTypeEqualTo(Integer value) {
            addCriterion("type =", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotEqualTo(Integer value) {
            addCriterion("type <>", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeGreaterThan(Integer value) {
            addCriterion("type >", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("type >=", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeLessThan(Integer value) {
            addCriterion("type <", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeLessThanOrEqualTo(Integer value) {
            addCriterion("type <=", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeIn(List<Integer> values) {
            addCriterion("type in", values, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotIn(List<Integer> values) {
            addCriterion("type not in", values, "type");
            return (Criteria) this;
        }

        public Criteria andTypeBetween(Integer value1, Integer value2) {
            addCriterion("type between", value1, value2, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("type not between", value1, value2, "type");
            return (Criteria) this;
        }

        public Criteria andRecipientidIsNull() {
            addCriterion("recipientId is null");
            return (Criteria) this;
        }

        public Criteria andRecipientidIsNotNull() {
            addCriterion("recipientId is not null");
            return (Criteria) this;
        }

        public Criteria andRecipientidEqualTo(Integer value) {
            addCriterion("recipientId =", value, "recipientid");
            return (Criteria) this;
        }

        public Criteria andRecipientidNotEqualTo(Integer value) {
            addCriterion("recipientId <>", value, "recipientid");
            return (Criteria) this;
        }

        public Criteria andRecipientidGreaterThan(Integer value) {
            addCriterion("recipientId >", value, "recipientid");
            return (Criteria) this;
        }

        public Criteria andRecipientidGreaterThanOrEqualTo(Integer value) {
            addCriterion("recipientId >=", value, "recipientid");
            return (Criteria) this;
        }

        public Criteria andRecipientidLessThan(Integer value) {
            addCriterion("recipientId <", value, "recipientid");
            return (Criteria) this;
        }

        public Criteria andRecipientidLessThanOrEqualTo(Integer value) {
            addCriterion("recipientId <=", value, "recipientid");
            return (Criteria) this;
        }

        public Criteria andRecipientidIn(List<Integer> values) {
            addCriterion("recipientId in", values, "recipientid");
            return (Criteria) this;
        }

        public Criteria andRecipientidNotIn(List<Integer> values) {
            addCriterion("recipientId not in", values, "recipientid");
            return (Criteria) this;
        }

        public Criteria andRecipientidBetween(Integer value1, Integer value2) {
            addCriterion("recipientId between", value1, value2, "recipientid");
            return (Criteria) this;
        }

        public Criteria andRecipientidNotBetween(Integer value1, Integer value2) {
            addCriterion("recipientId not between", value1, value2, "recipientid");
            return (Criteria) this;
        }

        public Criteria andSponsoridIsNull() {
            addCriterion("sponsorId is null");
            return (Criteria) this;
        }

        public Criteria andSponsoridIsNotNull() {
            addCriterion("sponsorId is not null");
            return (Criteria) this;
        }

        public Criteria andSponsoridEqualTo(Integer value) {
            addCriterion("sponsorId =", value, "sponsorid");
            return (Criteria) this;
        }

        public Criteria andSponsoridNotEqualTo(Integer value) {
            addCriterion("sponsorId <>", value, "sponsorid");
            return (Criteria) this;
        }

        public Criteria andSponsoridGreaterThan(Integer value) {
            addCriterion("sponsorId >", value, "sponsorid");
            return (Criteria) this;
        }

        public Criteria andSponsoridGreaterThanOrEqualTo(Integer value) {
            addCriterion("sponsorId >=", value, "sponsorid");
            return (Criteria) this;
        }

        public Criteria andSponsoridLessThan(Integer value) {
            addCriterion("sponsorId <", value, "sponsorid");
            return (Criteria) this;
        }

        public Criteria andSponsoridLessThanOrEqualTo(Integer value) {
            addCriterion("sponsorId <=", value, "sponsorid");
            return (Criteria) this;
        }

        public Criteria andSponsoridIn(List<Integer> values) {
            addCriterion("sponsorId in", values, "sponsorid");
            return (Criteria) this;
        }

        public Criteria andSponsoridNotIn(List<Integer> values) {
            addCriterion("sponsorId not in", values, "sponsorid");
            return (Criteria) this;
        }

        public Criteria andSponsoridBetween(Integer value1, Integer value2) {
            addCriterion("sponsorId between", value1, value2, "sponsorid");
            return (Criteria) this;
        }

        public Criteria andSponsoridNotBetween(Integer value1, Integer value2) {
            addCriterion("sponsorId not between", value1, value2, "sponsorid");
            return (Criteria) this;
        }

        public Criteria andContentIsNull() {
            addCriterion("content is null");
            return (Criteria) this;
        }

        public Criteria andContentIsNotNull() {
            addCriterion("content is not null");
            return (Criteria) this;
        }

        public Criteria andContentEqualTo(String value) {
            addCriterion("content =", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotEqualTo(String value) {
            addCriterion("content <>", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentGreaterThan(String value) {
            addCriterion("content >", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentGreaterThanOrEqualTo(String value) {
            addCriterion("content >=", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentLessThan(String value) {
            addCriterion("content <", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentLessThanOrEqualTo(String value) {
            addCriterion("content <=", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentLike(String value) {
            addCriterion("content like", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotLike(String value) {
            addCriterion("content not like", value, "content");
            return (Criteria) this;
        }

        public Criteria andContentIn(List<String> values) {
            addCriterion("content in", values, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotIn(List<String> values) {
            addCriterion("content not in", values, "content");
            return (Criteria) this;
        }

        public Criteria andContentBetween(String value1, String value2) {
            addCriterion("content between", value1, value2, "content");
            return (Criteria) this;
        }

        public Criteria andContentNotBetween(String value1, String value2) {
            addCriterion("content not between", value1, value2, "content");
            return (Criteria) this;
        }

        public Criteria andCategoryidIsNull() {
            addCriterion("categoryId is null");
            return (Criteria) this;
        }

        public Criteria andCategoryidIsNotNull() {
            addCriterion("categoryId is not null");
            return (Criteria) this;
        }

        public Criteria andCategoryidEqualTo(Integer value) {
            addCriterion("categoryId =", value, "categoryid");
            return (Criteria) this;
        }

        public Criteria andCategoryidNotEqualTo(Integer value) {
            addCriterion("categoryId <>", value, "categoryid");
            return (Criteria) this;
        }

        public Criteria andCategoryidGreaterThan(Integer value) {
            addCriterion("categoryId >", value, "categoryid");
            return (Criteria) this;
        }

        public Criteria andCategoryidGreaterThanOrEqualTo(Integer value) {
            addCriterion("categoryId >=", value, "categoryid");
            return (Criteria) this;
        }

        public Criteria andCategoryidLessThan(Integer value) {
            addCriterion("categoryId <", value, "categoryid");
            return (Criteria) this;
        }

        public Criteria andCategoryidLessThanOrEqualTo(Integer value) {
            addCriterion("categoryId <=", value, "categoryid");
            return (Criteria) this;
        }

        public Criteria andCategoryidIn(List<Integer> values) {
            addCriterion("categoryId in", values, "categoryid");
            return (Criteria) this;
        }

        public Criteria andCategoryidNotIn(List<Integer> values) {
            addCriterion("categoryId not in", values, "categoryid");
            return (Criteria) this;
        }

        public Criteria andCategoryidBetween(Integer value1, Integer value2) {
            addCriterion("categoryId between", value1, value2, "categoryid");
            return (Criteria) this;
        }

        public Criteria andCategoryidNotBetween(Integer value1, Integer value2) {
            addCriterion("categoryId not between", value1, value2, "categoryid");
            return (Criteria) this;
        }

        public Criteria andBbsidIsNull() {
            addCriterion("bbsId is null");
            return (Criteria) this;
        }

        public Criteria andBbsidIsNotNull() {
            addCriterion("bbsId is not null");
            return (Criteria) this;
        }

        public Criteria andBbsidEqualTo(Integer value) {
            addCriterion("bbsId =", value, "bbsid");
            return (Criteria) this;
        }

        public Criteria andBbsidNotEqualTo(Integer value) {
            addCriterion("bbsId <>", value, "bbsid");
            return (Criteria) this;
        }

        public Criteria andBbsidGreaterThan(Integer value) {
            addCriterion("bbsId >", value, "bbsid");
            return (Criteria) this;
        }

        public Criteria andBbsidGreaterThanOrEqualTo(Integer value) {
            addCriterion("bbsId >=", value, "bbsid");
            return (Criteria) this;
        }

        public Criteria andBbsidLessThan(Integer value) {
            addCriterion("bbsId <", value, "bbsid");
            return (Criteria) this;
        }

        public Criteria andBbsidLessThanOrEqualTo(Integer value) {
            addCriterion("bbsId <=", value, "bbsid");
            return (Criteria) this;
        }

        public Criteria andBbsidIn(List<Integer> values) {
            addCriterion("bbsId in", values, "bbsid");
            return (Criteria) this;
        }

        public Criteria andBbsidNotIn(List<Integer> values) {
            addCriterion("bbsId not in", values, "bbsid");
            return (Criteria) this;
        }

        public Criteria andBbsidBetween(Integer value1, Integer value2) {
            addCriterion("bbsId between", value1, value2, "bbsid");
            return (Criteria) this;
        }

        public Criteria andBbsidNotBetween(Integer value1, Integer value2) {
            addCriterion("bbsId not between", value1, value2, "bbsid");
            return (Criteria) this;
        }

        public Criteria andDateIsNull() {
            addCriterion("date is null");
            return (Criteria) this;
        }

        public Criteria andDateIsNotNull() {
            addCriterion("date is not null");
            return (Criteria) this;
        }

        public Criteria andDateEqualTo(Date value) {
            addCriterion("date =", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotEqualTo(Date value) {
            addCriterion("date <>", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThan(Date value) {
            addCriterion("date >", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThanOrEqualTo(Date value) {
            addCriterion("date >=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThan(Date value) {
            addCriterion("date <", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThanOrEqualTo(Date value) {
            addCriterion("date <=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateIn(List<Date> values) {
            addCriterion("date in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotIn(List<Date> values) {
            addCriterion("date not in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateBetween(Date value1, Date value2) {
            addCriterion("date between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotBetween(Date value1, Date value2) {
            addCriterion("date not between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andReadtypeIsNull() {
            addCriterion("readType is null");
            return (Criteria) this;
        }

        public Criteria andReadtypeIsNotNull() {
            addCriterion("readType is not null");
            return (Criteria) this;
        }

        public Criteria andReadtypeEqualTo(Integer value) {
            addCriterion("readType =", value, "readtype");
            return (Criteria) this;
        }

        public Criteria andReadtypeNotEqualTo(Integer value) {
            addCriterion("readType <>", value, "readtype");
            return (Criteria) this;
        }

        public Criteria andReadtypeGreaterThan(Integer value) {
            addCriterion("readType >", value, "readtype");
            return (Criteria) this;
        }

        public Criteria andReadtypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("readType >=", value, "readtype");
            return (Criteria) this;
        }

        public Criteria andReadtypeLessThan(Integer value) {
            addCriterion("readType <", value, "readtype");
            return (Criteria) this;
        }

        public Criteria andReadtypeLessThanOrEqualTo(Integer value) {
            addCriterion("readType <=", value, "readtype");
            return (Criteria) this;
        }

        public Criteria andReadtypeIn(List<Integer> values) {
            addCriterion("readType in", values, "readtype");
            return (Criteria) this;
        }

        public Criteria andReadtypeNotIn(List<Integer> values) {
            addCriterion("readType not in", values, "readtype");
            return (Criteria) this;
        }

        public Criteria andReadtypeBetween(Integer value1, Integer value2) {
            addCriterion("readType between", value1, value2, "readtype");
            return (Criteria) this;
        }

        public Criteria andReadtypeNotBetween(Integer value1, Integer value2) {
            addCriterion("readType not between", value1, value2, "readtype");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}