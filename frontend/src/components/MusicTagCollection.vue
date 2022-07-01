<template>
  <div>
    <MusicTag
      v-for="tag in ownTags"
      :key="tag.name"
      :model="tag"
      closable
      @close="handleClose(tag)"
    ></MusicTag>
    <el-input
      class="input-new-tag"
      v-if="inputVisible"
      v-model="inputValue"
      ref="saveTagInput"
      size="small"
      @keyup.enter.native="handleInputConfirm"
      @blur="handleInputConfirm"
    >
    </el-input>
    <el-button v-else class="button-new-tag" size="small" @click="showInput"
      >+ 新增{{ typename }}</el-button
    >
  </div>
</template>
<script>
import MusicTag from './MusicTag'
export default {
  name: 'MusicTagCollection',
  data () {
    return {
      ownTags: [],
      inputVisible: false,
      inputValue: ''
    }
  },
  watch: {
    tags: {
      handler () {
        this.ownTags = this.tags.filter(tag => tag.type === this.type)
      },
      immediate: true
    }
  },
  props: ['tags', 'type', 'typename'],
  components: {
    MusicTag
  },
  methods: {
    handleClose (tag) {
      this.tags.splice(this.tags.indexOf(tag), 1)
    },

    showInput () {
      this.inputVisible = true
      this.$nextTick(_ => {
        this.$refs.saveTagInput.$refs.input.focus()
      })
    },

    handleInputConfirm () {
      let inputValue = this.inputValue
      if (inputValue) {
        this.tags.push({
          name: inputValue,
          type: this.type
        })
        this.sortTags()
      }
      this.inputVisible = false
      this.inputValue = ''
    },

    sortTags () {
      const TAG_INDEX = { singer: 0, normal: 1 }
      this.tags.sort((t1, t2) => TAG_INDEX[t1.type] - TAG_INDEX[t2.type])
    }
  }
}
</script>
<style scoped>
.el-tag + .el-tag {
  margin-left: 10px;
}
.button-new-tag {
  margin-left: 10px;
  height: 32px;
  line-height: 30px;
  padding-top: 0;
  padding-bottom: 0;
}
.input-new-tag {
  width: 90px;
  margin-left: 10px;
  vertical-align: bottom;
}
</style>
