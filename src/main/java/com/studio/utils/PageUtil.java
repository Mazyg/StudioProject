package com.studio.utils;

import java.util.Vector;

public class PageUtil
{
    public Vector<Integer> paging(int total,int totalPage,int numberPerPage,int page){
        Vector<Integer> pageArr = new Vector<Integer>();
        int start1=1;
        if(page>5){
            start1= page/5*5;
        }
        int num = start1;
        while(!(num > totalPage || num >=start1 +5)){
            pageArr.add(new Integer(num));
            ++num;
        }
        return pageArr;
    }
}
