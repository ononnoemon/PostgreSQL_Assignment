# Question:Explain the Primary Key and Foreign Key concepts in PostgreSQL


## Primary Key

**Primary Key** হলো একটি বা একাধিক কলামের সমন্বয় যা প্রতিটি রেকর্ডকে **unique** এবং **NOT NULL** করে।

### ✅ Why Primary Key?

- প্রতিটি সারির জন্য একটি **ইউনিক আইডেন্টিফায়ার** তৈরি করা।
- **ডুপ্লিকেট** এবং **NULL** মান রাখতে দেয় না।

### 🧪 Example:

```sql
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name TEXT,
    Phone INT
);


##Foreign Key

**Foreign Key** হলো এমন একটি কলাম  যা অন্য টেবিলের Primary Key-এর সাথে সম্পর্ক তৈরি করে।

Why Foreign Keys?

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
