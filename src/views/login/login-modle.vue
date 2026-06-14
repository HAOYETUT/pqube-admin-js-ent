<!-- 登录模态 -->
<template>
  <pq-dropdown
    :items="[
    { title: t('login.cardLeft'), command: 'card_left', icon: MenuFoldOutlined },
    { title: t('login.cardRight'), command: 'card_right', icon: MenuUnfoldOutlined }
  ]"
    :model-value="cardModel"
    :placement="placement"
    :menu-style="{ minWidth: '108px' }"
    :popper-options="{
      modifiers: [{ name: 'offset', options: { offset: [0, 5] } }]
    }"
    :icon-props="{
      size: 12,
      style: { fontStyle: 'normal', fontWeight: '600' }
    }"
    style="line-height: inherit"
    @command="changeCardModel"
  >
    <div style="display: flex; align-items: center; height: 100%">
      <el-icon>
        <AutoWidthOne :style="iconStyle" />
      </el-icon>
    </div>
  </pq-dropdown>
</template>

<script setup>
  import { useI18n } from 'vue-i18n';
  import { AutoWidthOne, MenuFoldOutlined, MenuOutlined, MenuUnfoldOutlined } from '@/components/icons';

  defineProps({
    /** placement */
    placement: {
      type: String,
      default: 'bottom'
    },
    /** 登录模态 */
    cardModel: {
      type: String,
      default: 'card_left'
    },
    /** 自定义样式 */
    iconStyle: Object
  });

  const emit = defineEmits(['change']);

  const { t } = useI18n();


  /** 切换登录模态 */
  const changeCardModel = (cardModel) => {
    emit('change', cardModel);
  };
</script>
