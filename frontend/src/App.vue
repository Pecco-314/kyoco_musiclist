<template>
  <div id="app">
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
</style>
