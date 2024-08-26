FROM   java:8
COPY   HelloCICDIMAGE-1.jar HelloCICDIMAGE-1.jar
CMD    ["java" ,"-jar","HelloCICDIMAGE-1.jar"]
