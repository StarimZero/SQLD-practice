create user java identified by pass; /* 사용자 생성 */
drop user java; /* 사용자 삭제 */
grant connect, resource, dba to java; /* 권한 부여  */

create user product identified by pass; /* product라는 사용자 생성*/
grant connect, resource, dba to product;/* product라는 사용자에게 권한주기 */