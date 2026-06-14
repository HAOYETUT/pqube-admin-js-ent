<template>
  <pq-page flex-table="auto" hide-footer :multi-card="false">
    <pq-card flex-table="auto" :body-style="{ padding: 0 }">
      <pro-crud-builder v-model="config" />
    </pq-card>
  </pq-page>
</template>

<script setup>
  import { ref } from 'vue';
  import ProCrudBuilder from '@/components/ProCrudBuilder/index.vue';

  defineOptions({ name: 'ListBuild' });

  const config = ref({});
</script>
