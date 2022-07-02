<template>
          <el-main class="main">
        <LoginDialog
          :visible="loginDialogVisible"
          @login="onLogin"
          @close="onCloseLoginDialog"
        />
        <UpdateDialog
          :visible="updateDialogVisible"
          @submit="onSubmitUpdate"
          @deleteMusic="onDelete"
          @close="onCloseUpdateDialog"
          :music="currentMusic"
        />
        <el-input
          v-model="input"
          placeholder="搜索歌曲..."
          prefix-icon="el-icon-search"
          class="lineinput"
        ></el-input>
        <el-skeleton
          :rows="6"
          animated
          v-show="loading"
          class="musiclist-skeleton"
        />
        <div v-for="music in musiclist" :key="music.id">
          <MusicCard
            :music="music"
            :isLogin="isLogin"
            @tagClicked="updateInput"
            @editClicked="editMusic"
          />
        </div>
        <el-button
          icon="el-icon-plus"
          type="primary"
          circle
          class="add-music-button"
          @click="onAddMusicButtonClicked"
        ></el-button>
      </el-main>
</template>

<script>

import axios from 'axios'
import MusicCard from './MusicCard'
import LoginDialog from './LoginDialog'
import UpdateDialog from './UpdateDialog'
import { Music } from '../models/music'
import { Code } from '../constants/code'
import { Util } from '../util'

export default {
  name: 'MusicList',
  data () {
    return {
      input: '',
      musiclist: [],
      loading: true,
      isLogin: false,
      loginDialogVisible: false,
      updateDialogVisible: false,
      currentMusic: new Music()
    }
  },
  methods: {
    updateMusicList (kw = '') {
      this.musiclist = []
      this.loading = true
      axios
        .get(`/api/musiclist?kw=${kw}`)
        .then(response => {
          this.loading = false
          if (response.data.code === Code.OK) {
            this.musiclist = response.data.data
          } else {
            Util.error(this, response.data)
          }
        })
        .catch(error => Util.error(this, error))
    },
    updateInput (input) {
      this.input = input
    },
    onAddMusicButtonClicked () {
      if (!this.isLogin) {
        this.loginDialogVisible = true
      } else {
        this.addMusic()
      }
    },
    onLogin () {
      this.isLogin = true
    },
    onCloseLoginDialog () {
      this.loginDialogVisible = false
    },
    onCloseUpdateDialog () {
      this.updateDialogVisible = false
    },
    ping () {
      axios
        .get(`/api/ping`)
        .then(response => {
          this.isLogin = response.data.data.isLogin
        })
        .catch(error => console.error(error))
    },
    editMusic (music) {
      this.currentMusic = music
      this.updateDialogVisible = true
    },
    addMusic () {
      this.currentMusic = new Music()
      this.updateDialogVisible = true
    },
    onSubmitUpdate (music) {
      axios
        .put(`/api/music`, music)
        .then(response => {
          if (response.data.code === Code.OK) {
            let message
            if (music.id === null) {
              music.id = response.data.data.id
              this.musiclist.push(music)
              message = '添加歌曲成功'
            } else {
              message = '修改歌曲信息成功'
            }
            Object.assign(this.currentMusic, music)
            this.$message({
              message: message,
              type: 'success'
            })
            this.onCloseUpdateDialog()
          } else {
            Util.error(this, response.data)
          }
        })
        .catch(error => Util.error(this, error))
    },
    onDelete (id) {
      axios
        .delete(`/api/music/${id}`)
        .then(response => {
          if (response.data.code === Code.OK) {
            this.musiclist.splice(
              this.musiclist.findIndex(music => music.id === id),
              1
            )
            this.currentMusic = new Music()
            this.$message({
              message: '删除歌曲成功',
              type: 'success'
            })
            this.onCloseUpdateDialog()
          } else {
            Util.error(this, response.data)
          }
        })
        .catch(error => Util.error(this, error))
    }
  },
  mounted () {
    this.ping()
    this.updateMusicList()
  },
  watch: {
    input: function (kw) {
      return this.updateMusicList(kw)
    }
  },
  components: {
    MusicCard,
    LoginDialog,
    UpdateDialog
  }
}
</script>

<style scoped>

.main {
  max-width: 1000px;
  width: 95vw;
}
.lineinput input {
  border-style: none;
  border-bottom-style: solid;
  border-radius: 0;
  border-bottom-width: 2px;
  background: inherit;
}
.musiclist-skeleton {
  margin-top: 16px;
}
.add-music-button {
  position: fixed;
  right: 5%;
  bottom: 5%;
}
input {
  font-size: 16px !important;
}
.el-dialog {
  max-width: 600px !important;
  width: 80vw !important;
}
</style>
