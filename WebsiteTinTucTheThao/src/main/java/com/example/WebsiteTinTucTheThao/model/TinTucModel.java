/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.WebsiteTinTucTheThao.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "tinTuc")
public class TinTucModel implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "tieuDe",columnDefinition = "nvarchar(150)")
    private String tieuDe;
    @Column(name = "tomTat",columnDefinition = "text")
    private String tomTat;
    @Column(name = "noiDung",columnDefinition = "text")
    private String noiDung;
    @Column(name = "ngayTao")
    private Date ngayTao = new Date();
    private String hinh;
    
    @ManyToOne
    @JoinColumn(name = "taiKhoan_Id")
    private TaiKhoanModel taiKhoan;
    
    @ManyToOne
    @JoinColumn(name = "theLoai_Id")
    private TheLoaiModel theLoai;
}
