package me.fengqizihang.mpstudy.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.fengqizihang.mpstudy.domain.po.User;
import me.fengqizihang.mpstudy.mapper.UserMapper;
import me.fengqizihang.mpstudy.service.IUserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
}
