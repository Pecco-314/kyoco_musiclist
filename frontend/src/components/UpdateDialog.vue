<template>
  <el-dialog v-drag :visible.sync="visible" :title="title" @close="close">
    <el-form ref="musicform" :model="musicform" label-width="80px">
      <el-form-item label="歌曲名称">
        <el-input v-model="musicform.name"></el-input>
      </el-form-item>
      <el-form-item label="歌曲描述">
        <el-input v-model="musicform.description"></el-input>
      </el-form-item>
      <el-form-item label="歌手">
        <MusicTagCollection
          :tags="musicform.tags"
          :type="'singer'"
          :typename="'歌手'"
        ></MusicTagCollection>
      </el-form-item>
      <el-form-item label="标签">
        <MusicTagCollection
          :tags="musicform.tags"
          :type="'normal'"
          :typename="'标签'"
        ></MusicTagCollection>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-popconfirm
        @confirm="deleteMusic"
        title="确定要删除吗？"
        icon-color="red"
      >
        <el-button slot="reference" type="danger" v-show="this.music.id !== null">删除歌曲</el-button>
      </el-popconfirm>
      <el-button type="primary" @click="submit">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
import MusicTag from './MusicTag'
import MusicTagCollection from './MusicTagCollection'

export default {
  name: 'UpdateDialog',
  data () {
    return {
      musicform: null
    }
  },
  methods: {
    close () {
      this.$emit('close')
    },
    submit () {
      this.$emit('submit', this.musicform)
    },
    deleteMusic () {
      this.$emit('deleteMusic', this.musicform.id)
    }
  },
  watch: {
    music: {
      handler () {
        this.musicform = JSON.parse(JSON.stringify(this.music))
      },
      immediate: true
    }
  },
  computed: {
    title () {
      if (this.music.id === null) {
        return '添加歌曲'
      } else {
        return '修改歌曲信息'
      }
    }
  },
  props: ['visible', 'music'],
  components: {
    MusicTag,
    MusicTagCollection
  }
}
</script>

<style scoped>
.wrong-password-hint {
  color: #f56c6c;
  margin-top: 4px;
}
</style>
