/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.WebsiteTinTucTheThao.model;

import java.io.Serializable;
import java.util.Collection;
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

/**
 *
 * @author dovan
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "taiKhoan")
public class TaiKhoanModel implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "tenDangNhap",columnDefinition = "nvarchar(50)")
    private String tenDangNhap;
    @Column(name = "matKhau",columnDefinition = "varchar(50)")
    private String matKhau;
    @Column(name = "ngayDK")
    private Date ngayDK = new Date();
    @Column(name = "loaiTK")
    private Integer loaiTK = 1;
    
    @ManyToOne
    @JoinColumn(name = "nguoiDungId")
    private NguoiDungModel nguoiDung;
    
//    @OneToMany(mappedBy = "taiKhoan")
//    private Collection<TinTucModel> tinTucs;
}
