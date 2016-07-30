package com.tmartsyniak.crud.entity;

import lombok.Data;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

@Data
@Entity
@Table(name = "User")
public class User implements Serializable {

    private static final long serialVersionUID = -4862926644813433707L;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Basic
    @Column(name = "name")
    private String name;
    @Basic
    @Column(name = "age")
    private int age;
    @Basic
    @Column(name = "isAdmin")
    private boolean admin;
    @Basic
    @Column(name = "createdDate", updatable = false)
    private Timestamp createdDate;

    public User() {
        this.createdDate = new Timestamp(new Date().getTime());
    }
}