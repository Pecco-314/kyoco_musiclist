<template>
  <div>
    <div class="kyoco">
      <div class="kyoco-avatar-wrapper">
        <el-avatar
          src="/static/images/avatar2.jpg"
          class="kyoco-avatar"
        ></el-avatar>
      </div>
      <div class="introduction">
        哎呦才不是幼稚鬼呐，也叫元宵、元宝，是在Bilibili直播的个人势歌势虚拟主播<br />
        直播时间：周二到周日18:00<br />
        个人空间：<el-link
          href="https://space.bilibili.com/27368927/"
          type="primary"
          >元宵的个人空间</el-link
        >
        <br />
        直播间：<el-link
          href="https://live.bilibili.com/2857901/"
          type="primary"
          >元宵的直播间</el-link
        >
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'About'
}
</script>

<style scoped>
.kyoco {
  margin-top: 16px;
  width: 80vw;
  max-width: 800px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-flow: wrap;
}
.kyoco-avatar-wrapper {
  display: inline-block;
  margin: 16px 16px 0px 16px;
}
.kyoco-avatar {
  height: 128px;
  width: 128px;
}
.introduction {
  display: inline-block;
  margin: 16px 16px 0px 16px;
}
</style>
