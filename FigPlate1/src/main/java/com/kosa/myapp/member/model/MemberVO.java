package com.kosa.myapp.member.model;

import java.sql.Date;

import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

public class MemberVO {
   @Pattern(regexp="[a-z0-9]{3,10}")
   private String userId;
   @Pattern(regexp="[a-zA-Z°¡-ÆR ]{1,}")
   private String name;
   @Pattern(regexp="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{8,16}$")
   private String password;
   private int   role;
   @Past()
   private Date birthDate;
   private int gender;
   @Pattern(regexp="^[0-9]{10,11}$")
   private String phone;
   private String email;
   
   public String getUserId() {
      return userId;
   }
   public void setUserId(String userId) {
      this.userId = userId;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getPassword() {
      return password;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public int getRole() {
      return role;
   }
   public void setRole(int role) {
      this.role = role;
   }
   public Date getBirthDate() {
      return birthDate;
   }
   public void setBirthDate(Date birthDate) {
      this.birthDate = birthDate;
   }
   public int getGender() {
      return gender;
   }
   public void setGender(int gender) {
      this.gender = gender;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   @Override
   public String toString() {
      return "MemberVO [userId=" + userId + ", name=" + name + ", password=" + password + ", role=" + role
            + ", birthDate=" + birthDate + ", gender=" + gender + ", phone=" + phone + ", email=" + email + "]";
   }
   
}