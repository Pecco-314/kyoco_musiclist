<template>
  <el-dialog
    v-drag
    :visible.sync="visible"
    title="管理员登录"
    @close="close"
    class="my-dialog"
  >
    <el-input
      class="my-input"
      v-model="password"
      placeholder="请输入密码"
      show-password
    ></el-input>
    <div class="wrong-password-hint" v-show="countTry">{{errorMessage}}</div>
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
      countTry: 0,
      maxTry: 5,
      errorMessage: ''
    }
  },
  computed: {
    remainTry () {
      return this.maxTry - this.countTry
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
            this.countTry = 0
            this.$message({
              message: '登录成功',
              type: 'success'
            })
          } else if (response.data.code === Code.WRONG_PASSWORD) {
            this.countTry = response.data.data.countTry
            this.errorMessage = `密码错误（你还可以尝试${this.remainTry}次）`
          } else if (response.data.code === Code.MAX_PASSWORD_TRY) {
            this.countTry = this.maxTry
            this.errorMessage = response.data.message
          } else {
            Util.error(this, response.data)
          }
        })
        .catch(error => Util.error(this, error))
    },
    close () {
      this.password = ''
      this.countTry = 0
      this.errorMessage = ''
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
