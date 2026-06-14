<template>
  <pq-page flex-table="auto" hide-footer :multi-card="false">
    <pq-card flex-table="auto" :body-style="{ padding: 0 }">
      <pro-form-builder
        v-model="config"
        @previewFormSubmit="handlePreviewFormSubmit"
      />
    </pq-card>
  </pq-page>
</template>

<script setup>
  import { ref } from 'vue';
  import ProFormBuilder from '@/components/ProFormBuilder/index.vue';

  defineOptions({ name: 'FormBuild' });

  /** 表单配置数据 */
  const config = ref({});

  /** 预览表单提交事件 */
  const handlePreviewFormSubmit = (data) => {
    console.log(data);
  };
</script>
