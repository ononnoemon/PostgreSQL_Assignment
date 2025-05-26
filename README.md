# 📘 Database Keys: Primary Key & Foreign Key

এই প্রজেক্টে আমরা `Primary Key` এবং `Foreign Key` এর ব্যবহার এবং গুরুত্ব দেখিয়েছি PostgreSQL ব্যবহার করে।

---

## 🔑 Primary Key

**Primary Key** হলো একটি বা একাধিক কলামের সমন্বয় যা প্রতিটি রেকর্ডকে **unique** এবং **NOT NULL** রাখে।

### ✅ Why Primary Key?

- প্রতিটি সারির জন্য একটি **ইউনিক আইডেন্টিফায়ার** তৈরি করে
- **Duplicate** এবং **NULL** মান রাখতে দেয় না

### 🧪 Example:

```sql
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name TEXT,
    phone INT
);
