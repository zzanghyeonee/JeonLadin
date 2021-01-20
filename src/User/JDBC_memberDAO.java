package User;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.sql.Statement;

import java.util.ArrayList;

import User.MemberVO;

public class JDBC_memberDAO {

    /**
     * 필요한 property 선언
     */

    Connection con;
    
    Statement st;
    
    PreparedStatement ps;
    
    ResultSet rs;

    //MySQL

    String driverName= "com.mysql.cj.jdbc.Driver";

    String url = "jdbc:mysql://localhost:3306/user?serverTimezone=UTC";
    
    
    
    //ORACLE


    //String driverName="oracle.jdbc.driver.OracleDriver";


    //String url = " jdbc:oracle:thin:@localhost:1521:ORCL";
    
    //String driverName= "com.mysql.jdbc.Driver";
    
    //String url = "jdbc:mysql://127.0.0.1/jspdb?useSSL=false&serverTimezone=Asia/Seoul\";";

    String id = "root";

    String pwd ="Wkdgus!2";

    /**

     * 로드와 연결을 위한 생성자 작성

     */

    public JDBC_memberDAO(){

        try {
           
            //로드
           
            Class.forName(driverName);

            //연결

            con = DriverManager.getConnection(url,id,pwd);      

        } catch (ClassNotFoundException e) {

            System.out.println(e+"=> 로드 실패");

        } catch (SQLException e) {

            System.out.println(e+"=> 연결 실패");


        }


    }//JDBC_memberDAO()


   


    /**


     * DB닫기 기능 메소드 작성


     */


    public void db_close(){


        try {


            if (rs != null ) rs.close();


            if (ps != null ) ps.close();      


            if (st != null ) st.close();


       
        } catch (SQLException e) {


            System.out.println(e+"=> 닫기 오류");

        }      

    } //db_close


    /**


     * member테이블에 insert하는 메소드 작성


     */


    public int memberInsert(MemberVO vo){


        int result = 0;


        try{


        //실행


            String sql = "INSERT INTO membar VALUES(?,?,?,?,?,?)";



            ps = con.prepareStatement(sql);


            ps.setString(1, vo.getBn());


            ps.setString(2, vo.getPub());


            ps.setString(3, vo.getName());


            ps.setString(4, vo.getAge());


            ps.setString(5, vo.getReq());
            
            
            ps.setString(6, vo.getCont());
            


            result = ps.executeUpdate();


           


        }catch (Exception e){


           


            System.out.println(e + "=> memberInsert fail");


           


        }finally{


            db_close();


        }


       


        return result;


    }//memberInsert


   


    /**


     * member테이블의 모든 레코드 검색하(Select)는 메서드 작성


     */


   


    public ArrayList<MemberVO> getMemberlist(){


        ArrayList<MemberVO> list = new ArrayList<MemberVO>();


        try{//실행


            st = con.createStatement();

            rs = st.executeQuery("select * from membar");

            while(rs.next()){


                MemberVO vo = new MemberVO();

                vo.setBn(rs.getString(1));

                vo.setPub(rs.getString(2));

                vo.setName(rs.getString(3));

                vo.setAge(rs.getString(4));

                vo.setReq(rs.getString(5));
                
                vo.setCont(rs.getString(6));


                list.add(vo);

            }


        }catch(Exception e){          


            System.out.println(e+"=> getMemberlist fail");        


        }finally{          


            db_close();


        }      
        

        return list;


    }//getMemberlist


    /**


     * member테이블의 모든 레코드 검색(Select)하는 메서드 작성


     * (검색필드와 검색단어가 들어왔을때는 where를 이용하여 검색해준다.)


     **/


    public ArrayList<MemberVO> getMemberlist(String keyField, String keyWord){


        ArrayList<MemberVO> list = new ArrayList<MemberVO>();


        try{//실행


            String sql ="select * from membar ";
           

            if(keyWord != null && !keyWord.equals("") ){


                sql +="WHERE "+keyField.trim()+" LIKE '%"+keyWord.trim()+"%' order by bn";


            }else{//모든 레코드 검색


                sql +="order by bn";

            }


            System.out.println("sql = " + sql);


            st = con.createStatement();


            rs = st.executeQuery(sql);

            while(rs.next()){


                MemberVO vo = new MemberVO();

                vo.setBn(rs.getString(1));


                vo.setPub(rs.getString(2));


                vo.setName(rs.getString(3));


                vo.setAge(rs.getString(4));


                vo.setReq(rs.getString(5));
              
                vo.setCont(rs.getString(6));

                list.add(vo);


            }


        }catch(Exception e){          


            System.out.println(e+"=> getMemberlist fail");        


        }finally{          


            db_close();


        }      


        return list;


    }  
    
    public ArrayList<MemberVO> getMembarlist(String name){


        ArrayList<MemberVO> list = new ArrayList<MemberVO>();


        try{//실행
           
            String sql ="select * from membar ";
            
            sql +="WHERE "+ "name" +" LIKE '%"+ name.trim() +"%' order by bn";
//            String sql = "select * from membar where bn = bn ";
//            String sql ="select * from membar ";
           

            st = con.createStatement();


            rs = st.executeQuery(sql);

            while(rs.next()){


                MemberVO vo = new MemberVO();

                vo.setBn(rs.getString(1));


                vo.setPub(rs.getString(2));


                vo.setName(rs.getString(3));


                vo.setAge(rs.getString(4));


                vo.setReq(rs.getString(5));
                

                vo.setCont(rs.getString(6));
                
                list.add(vo);


            }


        }catch(Exception e){          


            System.out.println(e+"=> getMembarlist fail");        

        }finally{          


            db_close();


        }      


        return list;


    }  
    public ArrayList<MemberVO> getMemberlist(String bn){


        ArrayList<MemberVO> list = new ArrayList<MemberVO>();


        try{//실행
           
            String sql ="select * from membar ";
            
            sql +="WHERE "+ "bn" +" LIKE '%"+ bn.trim() +"%' order by bn";
//            String sql = "select * from membar where bn = bn ";
//            String sql ="select * from membar ";
           

            st = con.createStatement();


            rs = st.executeQuery(sql);

            while(rs.next()){


                MemberVO vo = new MemberVO();

                vo.setBn(rs.getString(1));


                vo.setPub(rs.getString(2));


                vo.setName(rs.getString(3));


                vo.setAge(rs.getString(4));


                vo.setReq(rs.getString(5));
                
                
                vo.setCont(rs.getString(6));

                list.add(vo);


            }


        }catch(Exception e){          


            System.out.println(e+"=> getMemberlist fail");        


        }finally{          


            db_close();


        }      


        return list;


    }

    /**


     * member테이블의 ID에 해당하는 레코드 삭제


     */    


    public int delMemberlist(String bn) {

        int result = 0;

        try {// 실행

            ps = con.prepareStatement("delete from membar where bn = ?");

            // ?개수만큼 값 지정

            ps.setString(1, bn.trim());

            result = ps.executeUpdate();  //쿼리 실행으로 삭제된 레코드 수 반환.

        } catch (Exception e) {

            System.out.println(e + "=> delMemberlist fail");


        } finally {

            db_close();

        }


        return result;


    }// delMemberlist  


}//end