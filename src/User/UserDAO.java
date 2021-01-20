package User;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDAO {

	// dao : 데이터베이스 접근 객체의 약자로서

	// 실질적으로 db에서 회원정보 불러오거나 db에 회원정보 넣을때

	private Connection conn; // connection:db에접근하게 해주는 객체

	private PreparedStatement pstmt;

	private ResultSet rs;
	
	private static UserDAO instance;

	// mysql에 접속해 주는 부분

	public UserDAO() { // 생성자 실행될때마다 자동으로 db연결이 이루어 질 수 있도록함

		try {

			String dbURL = "jdbc:mysql://localhost:3306/user?serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된 mysql주소

			String dbID = "root";

			String dbPassword = "Wkdgus!2";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace(); // 오류가 무엇인지 출력

		}

	}
	
	public static UserDAO getInstance(){
        if(instance==null)
            instance=new UserDAO();
        return instance;
    }

	// 로그인을 시도하는 함수****

	public int login(String userID, String userPassword) {

		String SQL = "SELECT userPassword FROM user WHERE userID = ?";

		try {

			// pstmt : prepared statement 정해진 sql문장을 db에 삽입하는 형식으로 인스턴스가져옴

			pstmt = conn.prepareStatement(SQL);

			// sql인젝션 같은 해킹기법을 방어하는것... pstmt을 이용해 하나의 문장을 미리 준비해서(물음표사용)

			// 물음표해당하는 내용을 유저아이디로, 매개변수로 이용.. 1)존재하는지 2)비밀번호무엇인지

			pstmt.setString(1, userID);

			// rs:result set 에 결과보관

			rs = pstmt.executeQuery();

			// 결과가 존재한다면 실행

			if (rs.next()) {

				// 패스워드 일치한다면 실행

				if (rs.getString(1).equals(userPassword)) {

					return 1; // 라긴 성공

				} else

					return 0; // 비밀번호 불일치

			}

			return -1; // 아이디가 없음 오류

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -2; // 데이터베이스 오류를 의미

	}
	
	public int join(User user) {

		String SQL = "INSERT INTO user VALUES (?,?,?,?,?)";

		try {

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user.getUserID());

			pstmt.setString(2, user.getUserPassword());

			pstmt.setString(3, user.getUserName());

			pstmt.setString(4, user.getUserGender());

			pstmt.setString(5, user.getUserEmail());

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // DB 오류

	}
	
    public User getUserInfo(String id) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User member = null;
 
        try {
            // 쿼리
        	String sql = "select * from USER where userID=?";
 
			String dbURL = "jdbc:mysql://localhost:3306/user?serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된 mysql주소

			String dbID = "root";

			String dbPassword = "Wkdgus!2";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // 회원정보를 DTO에 담는다.
            {
                
                // 자바빈에 정보를 담는다.
                member = new User();
                member.setUserID(rs.getString("userID"));
                member.setUserPassword(rs.getString("userPassword"));
                member.setUserName(rs.getString("userName"));
                member.setUserGender(rs.getString("userGender"));
                member.setUserEmail(rs.getString("userEmail"));
            }
 
            return member;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    }    // end getUserInfo
    
    
    /**
     * 회원정보를 수정한다.
     * @param member 수정할 회원정보를 담고있는 TO
     * @throws SQLException
     */
    public void updateMember(User member) throws SQLException{
        
        Connection conn = null;
        PreparedStatement pstmt = null;
 
        try {
        	String sql = "update USER set userPassword=?, userEmail=? where userID=?";
 
			String dbURL = "jdbc:mysql://localhost:3306/user?serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된 mysql주소

			String dbID = "root";

			String dbPassword = "Wkdgus!2";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
            pstmt = conn.prepareStatement(sql);
 
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            pstmt.setString(1, member.getUserPassword());
            pstmt.setString(2, member.getUserEmail());
            pstmt.setString(3, member.getUserID());
 
            pstmt.executeUpdate();
            // 완료시 커밋
            conn.commit(); 
                        
        } catch (Exception sqle) {
            conn.rollback(); // 오류시 롤백
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end updateMember
    
    
    /**
     * 회원정보를 삭제한다.
     * @param id 회원정보 삭제 시 필요한 아이디
     * @param pw 회원정보 삭제 시 필요한 비밀번호
     * @return x : deleteMember() 수행 후 결과값
     */
    @SuppressWarnings("resource")
    public int deleteMember(String id, String pw) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbpw = ""; // DB상의 비밀번호를 담아둘 변수
        int x = -1;
 
        try {
            // 비밀번호 조회
        	String sql1 = "select userPassword from USER where userID=?";
 
            // 회원 삭제
        	String sql2 = "delete from USER where userID=?";
 
			String dbURL = "jdbc:mysql://localhost:3306/user?serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된 mysql주소

			String dbID = "root";

			String dbPassword = "Wkdgus!2";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
 
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            // 1. 아이디에 해당하는 비밀번호를 조회한다.
            pstmt = conn.prepareStatement(sql1);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) 
            {
                dbpw = rs.getString("userPassword");
                if (dbpw.equals(pw)) // 입력된 비밀번호와 DB비번 비교
                {
                    // 같을경우 회원삭제 진행
                    pstmt = conn.prepareStatement(sql2);
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
                    conn.commit(); 
                    x = 1; // 삭제 성공
                } else {
                    x = 0; // 비밀번호 비교결과 - 다름
                }
            }
 
            return x;
 
        } catch (Exception sqle) {
            try {
                conn.rollback(); // 오류시 롤백
            } catch (SQLException e) {
                e.printStackTrace();
            }
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end deleteMember
    



}
