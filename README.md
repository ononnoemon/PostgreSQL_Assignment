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


# Question: How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

Aggregate মানে হচ্ছে — পুরো row ধরে হিসেব করা যেমন: কতজন আছে, মোট যোগফল কত, গড় কত ইত্যাদি।

### COUNT() — কতগুলো Row আছে?

```sql 
SELECT COUNT(*) FROM orders;
 ``` 


### SUM() — মোট কত?

```sql 
SELECT SUM(price) FROM orders;
```



### AVG() — গড় কত?
```sql 
SELECT AVG(price) FROM orders;
 ```

# Question: What is PostgreSQL?
PostgreSQL হলো একটি ওপেন সোর্স রিলেশনাল, শক্তিশালী, স্কেলেবল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS), যা data store করার জন্য ব্যবহৃত হয়। এইটি ছোট প্রজেক্ট থেকে শুরু করে এন্টারপ্রাইজ লেভেল পর্যন্ত ব্যবহৃত হয়

# PostgreSQL-এর বৈশিষ্ট্য
#####  অবজেক্ট-রিলেশনাল Support: রিলেশনাল ডেটাবেসের পাশাপাশি অবজেক্ট ওরিয়েন্টেড ফিচারও সাপোর্ট করে
##### ACID কমপ্লায়েন্ট: Atomicity, Consistency, Isolation, Durability — এই চারটি গুণমান পূরণ করে।
##### SQL ও JSON — উভয় ধরণের ডেটা ফর্ম্যাটের সাথে কাজ করতে পারে।

# Question: What is the purpose of a database schema in PostgreSQL?

##### schema একটি ডেটাবেসের ভেতরে অনেকগুলো “folder”-এর মতো কাজ করে , যেখানে আমরা বিভিন্ন ধরনের ডেটা structure আলাদাভাবে সাজিয়ে রাখতে পারি।

##  উদ্দেশ্য ও উপকারিতা

| উদ্দেশ্য/উপকারিতা                      | ব্যাখ্যা                                                                                                     |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
|  **সিকিউরিটি এন্ড এক্সেস কন্ট্রোল** | প্রতিটি স্কিমার আলাদা পারমিশন দেওয়া যায় — কে কোন schema দেখতে বা পরিবর্তন করতে পারবে                         |
|  **ডেটা অর্গানাইজ**                 | বড় প্রজেক্টে একাধিক অংশ থাকলে টেবিলগুলোকে ভাগ করে আলাদাভাবে রাখা যায় (যেমন: `hr`, `finance`, `sales` স্কিমা) |
|  **নেম কনফ্লিক্ট এড়ানো**             | একই নামের টেবিল বা ফাংশন ভিন্ন ভিন্ন স্কিমায় রাখা যায়                                                        |
|  **মডিউলার ডিজাইন**                  | ডেটাবেস ডিজাইন মডিউলার হয় — বুঝতে সহজ ও রক্ষণাবেক্ষণ সহজ হয়                                                  |
|  **টেস্টিং সহজ হয়**                  | একই ডেটাবেসে `production`, `staging`, `test` schema রেখে আলাদাভাবে টেস্ট করা যায়                             |

