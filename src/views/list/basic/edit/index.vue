<template>
  <div>
    <pq-card style="border-radius: 0">
      <pq-text type="heading" size="lg">修改用户</pq-text>
      <pq-text type="placeholder" style="margin-top: 6px">
        修改用户基本信息后点击保存按钮
      </pq-text>
    </pq-card>
    <pq-page>
      <pq-card>
        <pq-loading :loading="loading">
          <edit-form v-if="user" :data="user" />
        </pq-loading>
      </pq-card>
    </pq-page>
  </div>
</template>

<script setup>
  import { ref } from 'vue';
  import { useRoute } from 'vue-router';
  import { PqMessage } from 'pq-admin-ent';
  import { usePageTab } from '@/utils/use-page-tab';
  import EditForm from '../components/edit-form.vue';
  import { getUser } from '@/api/system/user';

  defineOptions({ name: 'ListBasicEdit' });

  const { setPageTabTitle } = usePageTab();
  const route = useRoute();
  const userId = Number(route.params.id);

  /** 查询状态 */
  const loading = ref(true);

  /** 用户信息 */
  const user = ref();

  /** 查询用户信息 */
  const query = () => {
    if (!userId || isNaN(userId)) {
      return;
    }
    getUser(userId)
      .then((data) => {
        loading.value = false;
        user.value = data;
        // 修改页签标题
        setPageTabTitle(`修改用户[${user.value.nickname}]`);
      })
      .catch((e) => {
        PqMessage.error({ message: e.message, plain: true });
      });
  };

  query();
</script>
