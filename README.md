# earnWithFun
this web app is just for fun, not executed. 

# 💰 EarnWithFun

**EarnWithFun** is a referral-based reward and earning web application that allows users to generate income by inviting others to register and purchase a subscription plan. It features a multi-level referral system, bonus logic, and a gamified withdrawal process.

---

## 🚀 Features

### 👥 User Module
- Sign-up with referral code (mandatory for bonuses)
- Login with email/phone and password
- Profile section with referral code, current plan, earnings, and rewards

### 💳 Payment Plan
- Select payment plan to activate referral code
- > ₹150: 40% bonus on self-plan
- ≤ ₹150: No bonus on self-plan

### 🔗 Referral System
- **Direct Referral Bonuses:**
  - ≤ ₹150 plan: 30% bonus
  - > ₹150 plan: 25% bonus
  - 10% reward points on direct referral’s payment
- **Indirect Referral Bonus:**
  - 10% from level 2 referrals
- Bonus is capped based on the user’s own plan

### 🏆 Reward Points
- Earn 10% reward points on direct referrals
- Can be claimed only after 5 successful referrals

### 💰 Withdrawals
- Withdraw via withdrawal page
- Plan > ₹150 → minimum withdrawal = 85% of plan
- Plan ≤ ₹150 → minimum withdrawal = ₹100
- Claimed reward points are added after 5 referrals

---

## 🧱 Tech Stack

| Layer       | Technology              |
|-------------|--------------------------|
| Frontend    | JSP, HTML, CSS, JavaScript, Bootstrap |
| Backend     | Spring Boot, Java, Hibernate    |
| Database    | MySQL / PostgreSQL / Oracle      |
| Auth        | JWT / Spring Security    |
| Payments    | Razorpay / Stripe / Paytm (Test mode supported) |

---

**Future Enhancements**
QR-based referral sharing
Wallet and transaction history
Admin dashboard for managing withdrawals
Push/email notifications
Mobile App (React Native / Flutter)


