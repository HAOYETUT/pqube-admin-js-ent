<template>
  <div class="login-app">
    <div class="login-header">
        <div class="login-logo">
          <img src="@/assets/logo.png" alt="logo" />
          <h1 class="login-title">{{ PROJECT_NAME }}</h1>
        </div>
        <div class="login-tools">
          <div class="login-tool">
            <login-modal :card-model="cardModel" @change="changeCardModel" />
          </div>
          <div class="login-tool">
            <i18n-icon/>
          </div>
          <div ref="darkSwitchRef" class="pq-dark-switch login-tool" >
            <el-switch
              :active-action-icon="MoonOutlined"
              :inactive-action-icon="SunOutlined"
              :model-value="darkMode"
              @update:modelValue="updateDarkMode"
            />
          </div>
        </div>
      </div>
    <div class="login-wrapper" >
      <div class="login-main">
          <pq-card shadow="always" class="login-card">
            <div class="login-cover">
              <h1 class="login-title">{{ PROJECT_NAME }}</h1>
              <h4 class="login-subtitle">界面美观组件丰富的中后台前端解决方案</h4>
            </div>
            <div class="login-body" :class="{'is-left': cardModel === 'card_left'}">
              <pq-text type="heading" style="font-size: 24px; margin-bottom: 18px">
                {{ t('login.title') }}
              </pq-text>
              <pq-segmented
                v-model="tabActive"
                :items="[
                  { label: t('login.passwordType'), value: 1 },
                  { label: t('login.qrcodeType'), value: 2 }
                ]"
                style="margin-bottom: 18px"
                @change="handleTabChange"
              />
              <el-form
                v-if="tabActive == 1"
                ref="formRef"
                size="large"
                :model="form"
                :rules="rules"
                @keyup.enter="submit"
                @submit.prevent=""
              >
                <el-form-item prop="username">
                  <el-input
                    clearable
                    v-model="form.username"
                    :placeholder="t('login.username')"
                    :prefix-icon="UserOutlined"
                  />
                </el-form-item>
                <el-form-item prop="password">
                  <el-input
                    show-password
                    v-model="form.password"
                    :placeholder="t('login.password')"
                    :prefix-icon="LockOutlined"
                  />
                </el-form-item>
                <el-form-item prop="code">
                  <div class="login-captcha-group">
                    <el-input
                      clearable
                      v-model="form.code"
                      :placeholder="t('login.code')"
                      :prefix-icon="ProtectOutlined"
                    />
                    <div class="login-captcha" @click="changeCaptcha">
                      <img v-if="captcha" :src="captcha" />
                    </div>
                  </div>
                </el-form-item>
                <el-form-item>
                  <el-checkbox v-model="form.remember">
                    {{ t('login.remember') }}
                  </el-checkbox>
                </el-form-item>
                <el-form-item>
                  <el-button
                    size="large"
                    type="primary"
                    :loading="loading"
                    style="width: 100%"
                    @click="submit"
                  >
                    {{ t('login.login') }}
                  </el-button>
                </el-form-item>
              </el-form>
              <div v-else class="login-qrcode-group">
                <pq-qr-code-svg
                  :size="180"
                  :margin="2"
                  :value="qrcode"
                  class="login-qrcode"
                />
                <el-link
                  type="primary"
                  underline="never"
                  style="margin-top: 16px; user-select: none"
                  @click="refreshQrCode"
                >
                  <el-icon
                    :size="15"
                    style="transform: translateY(-1px); margin-right: 6px"
                  >
                    <ReloadOutlined />
                  </el-icon>
                  <span>{{ t('login.refreshQrcode') }}</span>
                </el-link>
              </div>
            </div>
          </pq-card>
        </div>
        <PageFooter style="padding-top: 0" />
      
    </div>
  </div>
</template>

<script setup>
  import { ref, reactive, computed } from 'vue';
  import { PqMessage } from 'pq-admin-ent';
  import {
    UserOutlined,
    LockOutlined,
    ProtectOutlined,
    ReloadOutlined,
    MoonOutlined,
    SunOutlined
  } from '@/components/icons';
  import PageFooter from '@/layout/components/page-footer.vue';
  import { useLogin } from '@/utils/use-login';
  import { getCaptcha } from '@/api/login';
  import { useI18n } from 'vue-i18n';
  import { storeToRefs } from 'pinia';
  import { doWithTransition } from '@/utils/common';
  import { useThemeStore } from '@/store/modules/theme';
  import I18nIcon from '@/layout/components/i18n-icon.vue';
  import LoginModal from './login-modle.vue';
  const PROJECT_NAME = import.meta.env.VITE_APP_NAME;

  const { login, checkLogin } = useLogin();
  const themeStore = useThemeStore();
  const { darkMode, weakMode } = storeToRefs(themeStore);
  const { t } = useI18n();

  const tabActive = ref(1);
  const formRef = ref(null);
  const loading = ref(false);
  const cardModel = ref('card_left');

  const changeCardModel = (model) => {
    cardModel.value = model;
  };

  const form = reactive({
    tenantId: 4,
    username: 'admin',
    password: 'admin',
    code: '',
    remember: true
  });

  const rules = computed(() => {
    return {
      username: [{ required: true, message: t('login.username'), trigger: 'blur' }],
      password: [{ required: true, message: t('login.password'), trigger: 'blur' }],
      code: [{ required: true, message: t('login.code'), trigger: 'blur' }]
    };
  });

  const captcha = ref('');
  const text = ref('');
  const qrcode = ref('');
  const darkSwitchRef = ref(null);

  const updateDarkMode = (isDark) => {
    doWithTransition(
      () => themeStore.setValue('darkMode', isDark),
      darkSwitchRef.value?.$el?.querySelector?.('.el-switch__action'),
      weakMode.value ? isDark : !isDark
    );
  };

  const submit = () => {
    formRef.value?.validate((valid) => {
      if (!valid) return;
      if (form.code.toLowerCase() !== text.value) {
        PqMessage.error({ message: '验证码错误', plain: true });
        return;
      }
      loading.value = true;
      login(form).catch(e => {
        loading.value = false;
        PqMessage.error({ message: e.message, plain: true });
        changeCaptcha();
      });
    });
  };

  const changeCaptcha = () => {
    getCaptcha().then(data => {
      captcha.value = data.base64;
      text.value = data.text;
      form.code = data.text;
      formRef.value?.clearValidate();
    }).catch(e => PqMessage.error({ message: e.message, plain: true }));
  };

  const refreshQrCode = () => {
    qrcode.value = `${import.meta.env.VITE_API_URL}/v2/auth/login?code=${Date.now()}`;
  };

  const handleTabChange = (active) => {
    if (active === 2) refreshQrCode();
  };

  checkLogin().catch(() => changeCaptcha());
</script>

<style lang="scss" scoped>
.login-header {
  box-sizing: border-box;
  z-index: 4;
  align-items: center;
  width: 100%;
  padding: 8px 8px 0 16px;
  display: flex;
  position: absolute;
  top: 0;
  left: 0;
  .login-logo {
    display: flex;
    align-items: center;
    img {
      width: 30px;
      height: 30px;
    }
    .login-title {
      margin: 0 0 0 6px;
      font-size: 20px;
      font-weight: 500;
      color: inherit;
    }
  }
  .login-tools {
    box-shadow: 0 0 0 .68px #00000014;
    background: #ffffff47;
    border-radius: 42px;
    align-items: center;
    margin-left: auto;
    padding: 4px 5px;
    display: flex;
    .login-tool {
      min-width: 34px;
      height: 34px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 30px;
      cursor: pointer;
      transition: all .2s;
      &:hover {
        background: #99999926;
      }
    }
  }
}

.login-wrapper {
  min-height: 100vh;
  min-height: 100dvh;
  display: flex;
  flex-direction: column;
  background-image: url('@/assets/login-bg.png');
  background-repeat: no-repeat;
  background-size: 100% 100%;
  .login-main {
    flex: auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 20px;
    box-sizing: border-box;
  }

  .login-card {
    width: 920px;
    max-width: 100%;
    overflow: hidden;

    :deep(.pq-card-body) {
      display: flex;
      padding: 0;
      height: 462px;
      // 两个子元素统一开启过渡
      .login-cover, .login-body {
        transition: transform 0.4s ease;
      }
    }
  }
}

.login-cover {
  flex: 1;
  padding: 32px 8px;
  box-sizing: border-box;
  background-color: #d75b15;
  background-image: url('@/assets/login-img.png');
  background-repeat: no-repeat;
  background-position: bottom;
  background-size: contain;
  text-align: center;
  order: 0;
  transform: translateX(0);
}

.login-body {
  width: 400px;
  flex-shrink: 0;
  padding: 32px 48px 0 48px;
  box-sizing: border-box;
  order: 1;
  transform: translateX(0);

  // 切换顺序
  &.is-left {
    order: -1;
    // 表单跑到左边，封面向右挪400px
    ~ .login-cover {
      transform: translateX(400px);
    }
  }

  :deep(.el-checkbox) .el-checkbox__label {
    color: inherit;
  }
  :deep(.el-input__prefix-inner > .el-icon) {
    margin-right: 12px;
    transform: scale(1.16);
  }
}

/* 验证码 */
.login-captcha-group {
  display: flex;
  align-items: center;
  width: 100%;
  :deep(.el-input) {
    flex: 1;
  }
  .login-captcha {
    width: 108px;
    height: 40px;
    flex-shrink: 0;
    margin-left: 8px;
    border: 1px solid var(--el-border-color);
    border-radius: var(--el-border-radius-base);
    overflow: hidden;
    cursor: pointer;
    img {
      width: 100%;
      height: 100%;
      object-fit: contain;
      display: block;
    }
    &:hover {
      border-color: var(--el-color-primary);
    }
  }
}

.login-title {
  color: rgba(255, 255, 255, 0.98);
  font-size: 28px;
  margin: 0 0 6px;
  font-weight: normal;
  letter-spacing: 1.2px;
}
.login-subtitle {
  color: rgba(255, 255, 255, 0.8);
  font-size: 16px;
  margin: 0;
  letter-spacing: 4px;
}

.login-qrcode-group {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 24px 0;
}
.login-qrcode {
  border: 1px solid #ddd;
  border-radius: var(--el-border-radius-base);
  overflow: hidden;
}

/* 移动端 */
@media screen and (max-width: 680px) {
  .login-wrapper {
    background: #fff;
    .login-main {
      padding: 0;
      display: block;
    }
    .login-card {
      width: 100%;
      box-shadow: none;
      background: none;
      border-radius: 0;
      :deep(.pq-card-body) {
        display: block;
        height: auto;
        .login-cover, .login-body {
          transform: none !important;
          transition: none;
          order: initial !important;
        }
      }
    }
  }
  .login-cover {
    display: none;
    padding: 20px 12px 100px;
    background-size: auto 100px;
  }
  .login-body {
    width: 100%;
    padding-top: 120px;
  }
}
</style>