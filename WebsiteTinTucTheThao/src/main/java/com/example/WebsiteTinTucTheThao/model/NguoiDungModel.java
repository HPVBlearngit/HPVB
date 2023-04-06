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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name = "nguoiDung")
public class NguoiDungModel implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "hoTen",columnDefinition = "nvarchar(50)")
    private String hoTen;
    private Boolean gioiTinh;
    @Column(name = "ngaySinh",columnDefinition = "date")
    private Date ngaySinh;
    @Column(columnDefinition = "varchar(100)")
    private String email;
    @Column(name = "soDT",columnDefinition = "varchar(15)")
    private String soDT;
    
//    @OneToMany(mappedBy = "nguoiDung")
//    private Collection<TaiKhoanModel> taiKhoans;
}
