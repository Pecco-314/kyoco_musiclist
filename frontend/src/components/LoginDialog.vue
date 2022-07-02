<template>
  <el-dialog v-drag :visible.sync="visible" title="管理歌单" @close="close">
    <el-input
      v-model="password"
      placeholder="请输入密码"
      show-password
    ></el-input>
    <div class="wrong-password-hint" v-show="wrongPassword">密码错误</div>
    <span slot="footer" class="dialog-footer">
      <el-button type="primary" @click="login">确 定</el-button>
    </span>
  </el-dialog>
</template>

<script>
import axios from 'axios'
import { Code } from '../constants/code'
import { Util } from '../util'

export default {
  name: 'LoginDialog',
  data () {
    return {
      password: '',
      wrongPassword: false
    }
  },
  methods: {
    login () {
      axios
        .post(`/api/login`, { password: this.password })
        .then(response => {
          if (response.data.code === Code.OK) {
            this.$emit('login')
            this.close()
            this.$message({
              message: '登录成功',
              type: 'success'
            })
          } else if (response.data.code === Code.WRONG_PASSWORD) {
            this.wrongPassword = true
          } else {
            Util.error(this, response.data)
          }
        })
        .catch(error => Util.error(this, error))
    },
    close () {
      this.password = ''
      this.wrongPassword = false
      this.$emit('close')
    }
  },
  props: ['visible']
}
</script>

<style scoped>
.wrong-password-hint {
  color: #f56c6c;
  margin-top: 4px;
}
</style>
