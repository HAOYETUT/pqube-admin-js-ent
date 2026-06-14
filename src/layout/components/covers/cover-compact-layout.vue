<template>
  <div :style="{ display: 'flex', flexDirection: 'column' }">
    <div
      class="pq-setting-layout-cover-bg-primary"
      :style="{
        height: '14px',
        display: 'flex',
        alignItems: 'center',
        padding: '0 4px'
      }"
    >
      <IconSkeleton :style="{ width: '16px', height: '3px' }" />
      <IconSkeleton
        size="xs"
        :style="{ width: '10px', margin: '0 0 0 auto' }"
      />
      <IconSkeleton size="xs" :style="{ width: '10px', marginLeft: '4px' }" />
      <IconSkeleton size="xs" :style="{ width: '10px', marginLeft: '4px' }" />
      <IconSkeleton
        :style="{ width: '8px', height: '8px', marginLeft: 'auto' }"
      />
    </div>
    <div :style="{ flex: 1, display: 'flex' }">
      <div
        class="pq-setting-layout-cover-bg-light"
        :style="{ width: '14px' }"
      ></div>
      <div
        class="pq-setting-layout-cover-bg-light pq-setting-layout-cover-border-lighter"
        :style="{
          width: '28px',
          borderRightStyle: 'solid',
          borderRightWidth: '1px',
          borderLeftStyle: 'solid',
          borderLeftWidth: '1px'
        }"
      ></div>
    </div>
  </div>
</template>

<script setup>
  import IconSkeleton from './icon-skeleton.vue';
</script>
