<!-- 全局页脚 -->
<template>
  <pq-text type="placeholder" class="pq-footer">
    <el-space :size="24">
      <el-link underline="never" href="橘子汽水" target="_blank">
        {{ t('layout.footer.website') }}
      </el-link>
      <el-link
        underline="never"
        href="https://zcn16diyhiu4.feishu.cn/wiki/UPDcw6LyviB7brk4ClKcfKNNnz6?from=from_copylink"
        target="_blank"
      >
        {{ t('layout.footer.document') }}
      </el-link>
    </el-space>
    <div>{{ t('layout.footer.copyright') }}</div>
  </pq-text>
</template>

<script setup>
  import { useI18n } from 'vue-i18n';

  const { t } = useI18n();
</script>
