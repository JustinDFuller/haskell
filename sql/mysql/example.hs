{-# LANGUAGE OverloadedStrings #-}

import Database.MySQL.Simple

main :: IO ()
main = do
    password <- getLine
    conn <- connect defaultConnectInfo { connectPassword = password, connectDatabase = "dev" }
    -- query_ conn "CREATE TABLE emp (EMPNO int, ENAME varchar(250), JOB varchar(25), MGR int, HIREDATE date, SAL int, COMM int, DEPTNO int);"
    -- [Only i] <- query_ conn "INSERT INTO emp (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO) VALUES (7360, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20);"
    [Only i] <- query_ conn "SELECT * FROM emp"
    putStrLn i