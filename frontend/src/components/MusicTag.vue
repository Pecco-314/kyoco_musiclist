<template>
  <el-tag
    class="music-tag"
    :type="elTagType"
    :closable="closable"
    @click="onTagClicked"
    @close="handleClose"
  >
    {{ decoratedName }}
  </el-tag>
</template>

<script>
export default {
  name: 'MusicTag',
  computed: {
    decoratedName () {
      if (this.model.type === 'singer') {
        return `🎤 ${this.model.name}`
      } else {
        return this.model.name
      }
    },
    elTagType () {
      if (this.model.type === 'singer') {
        return 'primary'
      } else {
        return 'info'
      }
    }
  },
  methods: {
    onTagClicked () {
      this.$emit('tagClicked', this.model)
    },
    handleClose (tag) {
      this.$emit('close', tag)
    }
  },
  props: ['model', 'closable']
}
</script>

<style scoped>
.music-tag {
  margin-left: 5px;
  cursor: pointer;
}
</style>
