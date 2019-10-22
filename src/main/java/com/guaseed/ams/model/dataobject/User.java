package com.guaseed.ams.model.dataobject;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * @Author: intent
 * @Date: 19-10-22 下午3:29
 */
@Getter
@Setter
@ToString
@TableName(value = "t_user")
public class User implements Serializable {

    private static final long serialVersionUID = -2711196300136752151L;

    @TableId(type = IdType.AUTO)
    private Integer id;
    private String username;
    private String password;
    private String realName;
    private String idNumber;
    private Integer departmentId;
    @TableField(fill = FieldFill.INSERT)
    private long created;
    private String phone;
    private Integer education;
    private String currentAddress;
    private Boolean sex;
    private String remarks;
    private Boolean status;
}
