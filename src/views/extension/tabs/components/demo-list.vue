<template>
  <div style="padding: 10px 0">
    <template v-for="(d, i) in data" :key="i">
      <el-divider v-if="i > 0" border-style="dashed" style="margin: 0" />
      <div style="padding: 8px 0; display: flex">
        <pq-ellipsis class="demo-tab-item-title">{{ d.title }}</pq-ellipsis>
        <pq-text type="placeholder">{{ d.date }}</pq-text>
      </div>
    </template>
  </div>
</template>

<script setup>
  import { ref } from 'vue';

  const props = defineProps({
    type: {
      type: Number,
      required: true
    }
  });

  const data = ref(
    (() => {
      return Array.from({ length: 4 - props.type }).map((_, i) => {
        return {
          title: `PqAdmin新版本发布, 欢迎体验 ${props.type + 1}-${i + 1}`,
          date: '2023-05-20'
        };
      });
    })()
  );
</script>

<style lang="scss" scoped>
  .demo-tab-item-title {
    flex: 1;
    cursor: pointer;
    transition: color 0.3s;

    &:hover {
      color: var(--el-color-primary);
    }
  }
</style>
