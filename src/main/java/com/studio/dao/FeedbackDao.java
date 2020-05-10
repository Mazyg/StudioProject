package com.studio.dao;

import com.studio.domian.Feedback;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FeedbackDao {

    @Insert("insert into feedback(uid,content,address) values( '${uid}' , '${content}' , '${address}' )")
    public boolean addFeedBack(Feedback feedback);

    @Select("select * from feedback")
    List<Feedback> getAllFeedback();


}
