package com.tendu.model;

import java.util.ArrayList;
import java.util.List;

public class Page {

    private Integer index = 1;
    private Integer maxRow = 3;
    private Integer start;
    private Integer totalRow;
    private Integer totalPage;

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public Integer getMaxRow() {
        return maxRow;
    }

    public void setMaxRow(Integer maxRow) {
        this.maxRow = maxRow;
    }

    public Integer getStart() {
        return (this.index - 1) * maxRow;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getTotalRow() {
        return totalRow;
    }

    public void setTotalRow(Integer totalRow) {
        this.totalRow = totalRow;
    }

    public Integer getTotalPage() {
        return (int)Math.ceil(this.totalRow * 1.0 /this.maxRow);
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<Integer> pageList(){
        List<Integer> list = new ArrayList<>();

        // 取当前页附近两个
        // 如果index <= 0
        if(this.index <= 0){
            list.add(1);
            list.add(2);
            return list;
        }

        // 奇数 取后一个
        if(this.index%2 == 1){
            System.out.println(this.index);
            list.add(this.index);

            if(this.index <= this.getTotalPage())
                list.add(this.index+1);
            return list;
        }else{
            // 偶数取前一个
            if(this.index > 0)
                list.add(this.index - 1);
            list.add(this.index);
            return list;
        }
    }

    @Override
    public String toString() {
        return "Page{" +
                "index=" + index +
                ", maxRow=" + maxRow +
                ", start=" + start +
                ", totalRow=" + totalRow +
                ", totalPage=" + totalPage +
                '}';
    }
}
