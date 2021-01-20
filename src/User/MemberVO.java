package User;

public class MemberVO {

   private String bn;
   private String pub;
   private String name;
   private String req;
   private String age;
   private String cont;

   
   public MemberVO(){}
   public MemberVO(String bn, String pub, String name, String req, String age, String cont){
      
      this.bn = bn;
      this.pub = pub;
      this.name = name;
      this.req = req;
      this.age = age;      
      this.cont = cont;  
   }
   
   
   public String getBn() {
      return bn;
   }
   public void setBn(String bn) {
      this.bn = bn;
   }
   public String getPub() {
      return pub;
   }
   public void setPub(String pub) {
      this.pub = pub;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getReq() {
      return req;
   }
   public void setReq(String req) {
      this.req = req;
   }
   public String getAge() {
      return age;
   }
   public void setAge(String age) {
      this.age = age;      
   }
public String getCont() {
	return cont;
}
public void setCont(String cont) {
	this.cont = cont;
}
   
}