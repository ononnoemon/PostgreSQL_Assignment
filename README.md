# Question:Explain the Primary Key and Foreign Key concepts in PostgreSQL


## Primary Key

**Primary Key** হলো একটি বা একাধিক কলামের সমন্বয় যা প্রতিটি Row **unique** এবং **NOT NULL** করে।

### Why Primary Key?

- প্রতিটি সারির জন্য একটি **ইউনিক আইডেন্টিফায়ার** তৈরি করা।
- **ডুপ্লিকেট** এবং **NULL** মান রাখতে দেয় না।

###  Example:

```sql
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name TEXT,
    Phone INT
);

```
##Foreign Key

**Foreign Key** হলো এমন একটি কলাম  যা অন্য টেবিলের Primary Key-এর সাথে সম্পর্ক তৈরি করে।

### Why Foreign Keys?

একাধিক টেবিলের মধ্যে রিলেশন তৈরি করা


ডেটার referential integrity নিশ্চিত করা — অর্থাৎ, এমন ডেটা ইনসার্ট করা যাবে না যা রেফারেন্স টেবিলে নেই


Example

```sql

CREATE TABLE user (
    user_id SERIAL PRIMARY KEY,
    user_name TEXT
);

CREATE TABLE post (
    post_id SERIAL PRIMARY KEY,
   Post_content TEXT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```


# Question:Explain the purpose of the WHERE clause in a SELECT statement.
#### WHERE clause হল একটি SELECT স্টেটমেন্টের অংশ, যা ডেটাবেস থেকে শুধু নির্দিষ্ট  Condition  পূরণ করা rows  select  korar জন্য ব্যবহৃত হয়


 ## Common Uses of WHERE:
##### Comparison: =, !=, >, <, >=, <=


##### Logical operators: AND, OR, NOT


##### Pattern matching: LIKE, ILIKE


##### Range checking: BETWEEN/AND


##### Set membership: IN


##### Null checking: IS NULL, IS NOT NULL


# How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

Aggregate মানে হচ্ছে — পুরো row ধরে হিসেব করা যেমন: কতজন আছে, মোট যোগফল কত, গড় কত ইত্যাদি।

### COUNT() — কতগুলো রেকর্ড আছে?

```sql SELECT COUNT(*) FROM orders; ``` 


### SUM() — মোট কত?

```sql SELECT SUM(price) FROM orders; ```



### AVG() — গড় কত?
```sql SELECT AVG(price) FROM orders; ```


