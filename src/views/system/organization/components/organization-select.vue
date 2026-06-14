<!-- 机构选择下拉框 -->
<template>
  <el-tree-select
    clearable
    filterable
    :data="data"
    check-strictly
    default-expand-all
    node-key="organizationId"
    :props="{ label: 'organizationName' }"
    :placeholder="placeholder"
    v-model="model"
    class="pq-fluid"
    :popper-options="{ strategy: 'fixed' }"
  />
</template>

<script setup>
  import { ref } from 'vue';
  import { PqMessage, toTree } from 'pq-admin-ent';
  import { listOrganizations } from '@/api/system/organization';

  defineProps({
    /** 提示信息 */
    placeholder: {
      type: String,
      default: '请选择所属机构'
    }
  });

  /** 选中的机构 */
  const model = defineModel({ type: [Number, String] });

  /** 机构数据 */
  const data = ref([]);

  /** 获取机构数据 */
  listOrganizations()
    .then((list) => {
      data.value = toTree({
        data: list,
        idField: 'organizationId',
        parentIdField: 'parentId'
      });
    })
    .catch((e) => {
      PqMessage.error({ message: e.message, plain: true });
    });
</script>
