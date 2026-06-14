<!-- 主题设置抽屉 -->
<template>
  <div class="pq-setting-item">
    <div class="pq-setting-item-title">{{ title }}</div>
    <div class="pq-setting-item-control">
      <slot></slot>
    </div>
  </div>
</template>

<script setup>
  defineProps({
    title: String
  });
</script>
