<template>
  <div id="app">
    <el-image class="bg-kyoco" src="/static/images/bg.png">
    </el-image>
    <el-container class="container">
      <el-header>
        <el-menu
          :default-active="activeIndex"
          mode="horizontal"
          class="navmenu"
          router
        >
          <el-menu-item index="musiclist">
            <i class="el-icon-notebook-2"></i>
            <span slot="title">歌单</span>
          </el-menu-item>
          <el-menu-item index="about">
            <i class="el-icon-info"></i>
            <span slot="title">关于</span>
          </el-menu-item>
        </el-menu>
      </el-header>
      <router-view />
      <el-footer>
        <el-divider />
        <el-link type="info" href="https://beian.miit.gov.cn/">蜀ICP备2022018309号-1</el-link>
      </el-footer>
    </el-container>
  </div>
</template>

<script>
export default {
  name: 'App',
  computed: {
    activeIndex () {
      return this.$router.currentRoute.name
    }
  },
  created () {
    if (this.$cookies.get('noHint') !== 'true') {
      this.$confirm('这是元宵的歌单网站，列出了元宵会唱的歌曲。<del>（虽然可能有些以前会唱但是忘了）</del><br />只要<strong>点击卡片上的歌名</strong>就可以复制，然后到直播间粘贴就可以点歌了！<br />另外可以使用搜索功能按照歌名、歌手、标签来筛选歌曲。', '提示', {
        dangerouslyUseHTMLString: true,
        cancelButtonText: '好的',
        confirmButtonText: '不再提醒'
      }).then(() => {
        this.$cookies.set('noHint', 'true')
      })
    }
  }
}
</script>

<style>
body {
  background-color: #fffffc;
}
.container {
  display: flex;
  align-items: center;
}
.navmenu {
  background-color: rgb(0, 0, 0, 0) !important;
}
.my-dialog .el-dialog {
  max-width: 600px;
  width: 80vw;
}
.my-input input {
  font-size: 16px;
}
.bg-kyoco {
  position: absolute!important;
  transform: rotate(180deg);
  width: 10vw;
  min-width: 70px;
}
@media screen and (max-width: 750px) {
  .el-message-box {
    width: 75% !important;
  }
}
</style>
