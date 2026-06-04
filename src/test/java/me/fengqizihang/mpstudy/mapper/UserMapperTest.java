package me.fengqizihang.mpstudy.mapper;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import me.fengqizihang.mpstudy.domain.po.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;
import java.util.List;

@SpringBootTest
class UserMapperTest {

    @Autowired
    private UserMapper userMapper;

    @Test
    void testInsert() {
        User user = new User();
        user.setId(5L);
        user.setUsername("Lucy");
        user.setPassword("123");
        user.setPhone("18688990011");
        user.setBalance(200);
        user.setInfo("{\"age\": 24, \"intro\": \"英文老师\", \"gender\": \"female\"}");
        user.setCreateTime(LocalDateTime.now());
        user.setUpdateTime(LocalDateTime.now());
        userMapper.insert(user);
    }

    @Test
    void testSelectById() {
        User user = userMapper.selectById(5L);
        System.out.println("user = " + user);
    }


    @Test
    void testQueryByIds() {
        List<User> users = userMapper.selectBatchIds(List.of(1L, 2L, 3L, 4L));
        users.forEach(System.out::println);
    }

    @Test
    void testUpdateById() {
        User user = new User();
        user.setId(5L);
        user.setBalance(20000);
        userMapper.updateById(user);
    }

    @Test
    void testDeleteUser() {
        userMapper.deleteById(5L);
    }

    @Test
    void testLambdaQuery() {
        // 需求: 查询名字中包含 "o", 且余额大于等于 1000 的所有用户.
        // 1. 创建条件构造器
        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<User>()
                .like(User::getUsername, "o")
                .ge(User::getBalance, 1000);

        // 2. 执行查询
        List<User> users = userMapper.selectList(wrapper);
        users.forEach(System.out::println);
    }

    @Test
    void testLambdaUpdate() {
        // 需求: 将名字为 "Jack" 的用户, 其余额 (balance) 更新为 2000.
        // 1. 创建更新构造器
        LambdaUpdateWrapper<User> wrapper = new LambdaUpdateWrapper<User>()
                .eq(User::getUsername, "Jack") // WHERE username = 'Jack'
                .set(User::getBalance, 2000);   // SET balance = 2000

        // 2. 执行更新 (这里传入的 null 代表不使用实体类对象更新, 完全依赖 wrapper 中的 set 条件)
        userMapper.update(null, wrapper);
    }

    @Test
    void testCustomSql() {
        // 1. 准备查询条件
        List<Long> ids = List.of(1L, 2L, 4L);
        QueryWrapper<User> wrapper = new QueryWrapper<User>()
                .in("u.id", ids)
                .eq("a.city", "Beijing");

        // 2. 调用自定义 SQL 方法
        List<User> users = userMapper.queryUsersByAddressAndIds(wrapper);
        users.forEach(System.out::println);
    }
}