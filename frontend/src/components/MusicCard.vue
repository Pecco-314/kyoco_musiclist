<template>
  <el-card class="music-card">
    <div class="music-name-and-desc">
      <span class="music-name">{{ music.name }}</span>
      <br />
      <span class="music-desc">{{ music.description }}</span>
    </div>
    <div class="music-edit" @click="onClickEdit">
      <i v-show="isLogin" class="el-icon-edit-outline"></i>
    </div>
    <div class="music-tags">
      <MusicTag
        v-for="tag in music.tags"
        :key="tag.name"
        :model="tag"
        @tagClicked="onTagClicked"
      ></MusicTag>
    </div>
  </el-card>
</template>

<script>
import MusicTag from './MusicTag'
export default {
  name: 'MusicCard',
  data () {
    return {}
  },
  methods: {
    decorateTag (tag) {
      if (tag.type === 'singer') {
        return `🎤 ${tag.name}`
      } else {
        return tag.name
      }
    },
    elTagType (tag) {
      if (tag.type === 'singer') {
        return 'primary'
      } else {
        return 'info'
      }
    },
    onTagClicked (tag) {
      this.$emit('tagClicked', tag.name)
    },
    onClickEdit () {
      this.$emit('editClicked', this.music)
    }
  },
  props: ['music', 'isLogin'],
  components: {
    MusicTag
  }
}
</script>

<style scoped>
.music-name {
  font-size: x-large;
  font-weight: bold;
  color: #444444;
}
.music-desc {
  color: #999999;
}
.music-card {
  margin-top: 16px;
}
.music-tags {
  max-width: 50%;
  white-space: nowrap;
  overflow: auto;
  scrollbar-width: none; /* Firefox */
  -ms-overflow-style: none; /* IE 10+ */
}
::-webkit-scrollbar {
  display: none; /* Chrome Safari */
}
.el-card >>> .el-card__body {
  display: flex;
  align-items: center;
}
.music-name-and-desc {
  display: inline;
}
.music-edit {
  flex: 1;
  margin-left: 10px;
  color: #3980ff;
  font-size: larger;
  cursor: pointer;
}
</style>
