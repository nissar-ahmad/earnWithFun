package com.earnwithfun.dao;

import com.earnwithfun.entity.PaymentDetail;
import com.earnwithfun.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;
import java.util.List;

@Component
public class UserDaoImpl{

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Transactional(Transactional.TxType.REQUIRES_NEW)
    public void createUser(User user) {
        this.hibernateTemplate.save(user);
    }

    public User getUserByUserNameAndPassword(String username, String password) {
        String query = "select u from User u where u.username = ?0 and u.password = ?1";
        Object[] queryParam = {username, password};
        List<User> users = (List<User>) this.hibernateTemplate.find(query, queryParam);
        return users.isEmpty() ? null : users.get(0);
    }

    public User getUserByPaymentCode(String paymentCode) {
        String query = "select u from User u where u.paymentCode = ?0";
        Object[] queryParam = {paymentCode};
        List<User> users = (List<User>) this.hibernateTemplate.find(query, queryParam);
        return users.isEmpty() ? null : users.get(0);
    }

    public User getUserByUserName(String username) {
        String query = "select u from User u where u.username = ?0";
        Object[] queryParam = {username};
        List<User> users = (List<User>) this.hibernateTemplate.find(query, queryParam);
        return users.isEmpty() ? null : users.get(0);
    }

    @Transactional(Transactional.TxType.REQUIRES_NEW)
    public void updateUser(User user) {
        this.hibernateTemplate.update(user);
    }

    public User getAdminUser(User user) {
        String query = "select u from User u where u.username = ?0 and u.password = ?1 and isAdminUser= ?2";
        Object[] queryParam = {user.getUsername().trim(), user.getPassword().trim(), 'Y'};
        List<User> users = (List<User>) this.hibernateTemplate.find(query, queryParam);
        return users.isEmpty() ? null : users.get(0);
    }

    public List<PaymentDetail> gePaymentDetails(User user) {
        String query = "select p from PaymentDetail p where p.username = ?0 order by id desc";
        Object[] queryParam = {user.getUsername()};
        return (List<PaymentDetail>) this.hibernateTemplate.find(query, queryParam);
    }

    public List<User> getUserRequestedForWithdraw() {
        String query = "select u from User u where u.withdrawRequest = ?0";
        Object[] queryParam = {'Y'};
        return (List<User>) this.hibernateTemplate.find(query, queryParam);
    }

    public List<User> getReferredUsers() {
            String query = "select u from User u where u.referralRequest = ?0";
            Object[] queryParam = {'Y'};
            return (List<User>) this.hibernateTemplate.find(query, queryParam);
    }

    public User getUserByReferralCode(String referralCode) {
        String query = "select u from User u where u.referralCode = ?0";
        Object[] queryParam = {referralCode};
        List<User> users = (List<User>) this.hibernateTemplate.find(query, queryParam);
        return users.isEmpty() ? null : users.get(0);
    }

    @Transactional(Transactional.TxType.REQUIRES_NEW)
    public void createPayment(PaymentDetail paymentDetail) {
        this.hibernateTemplate.save(paymentDetail);
    }

    public User getUserById(Long userId) {
        return this.hibernateTemplate.get(User.class, userId);
    }

    public Object getUsersCount() {
        String query = "select count(1) from User";
        Object[] queryParam = {};
        List<?> count = this.hibernateTemplate.find(query, queryParam);
        return count.isEmpty() ? 0 : count.get(0);
    }

    public List<User> getPaymentPlanChangeUsers() {
        String query = "select u from User u where u.isPaymentUpdateRequest = ?0";
        Object[] queryParam = {'Y'};
        return (List<User>) this.hibernateTemplate.find(query, queryParam);
    }

    public User getAdminUserByFlag() {
        String query = "select u from User u where u.role= ?0";
        Object[] queryParam = {"ROLE_ADMIN"};
        List<User> users = (List<User>) this.hibernateTemplate.find(query, queryParam);
        return users.isEmpty() ? null : users.get(0);
    }
}
