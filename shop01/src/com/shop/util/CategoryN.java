package com.shop.util;

import java.util.ArrayList;
import java.util.List;

public class CategoryN {
    private Long categoryId;

    private Long parentId;

    private String name;

    private List<CategoryN> children;

    public CategoryN() {
        this.categoryId = 1L;
        this.name = "全部商品";
        this.children = new ArrayList<CategoryN>();
    }

    public CategoryN(Long categoryId, Long parentId, String name) {
        this.categoryId = categoryId;
        this.parentId = parentId;
        this.name = name;
        this.children = new ArrayList<CategoryN>();
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<CategoryN> getChildren() {
        return children;
    }

    public void setChildren(List<CategoryN> children) {
        this.children = children;
    }

    public void addChild(CategoryN node) {
        this.children.add(node);
    }

    @Override
    public String toString() {
        return "CategoryNode{" +
                "categoryId=" + categoryId +
                ", parentId=" + parentId +
                ", name='" + name + '\'' +
                ", children=" + children.size() +
                '}';
    }
}
