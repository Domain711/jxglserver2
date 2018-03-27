<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="科研名称" prop="achievementsname">
        <el-input v-model="dataForm.achievementsname" placeholder="科研名称"></el-input>
      </el-form-item>
      <el-form-item label="科研简介" prop="achievementsdesc">
        <el-input v-model="dataForm.achievementsdesc" placeholder="科研简介"></el-input>
      </el-form-item>
      <el-form-item label="附件名称" prop="attachname">
        <el-input v-model="dataForm.attachname" placeholder="附件名称"></el-input>
      </el-form-item>
      <el-form-item label="创建人" prop="createuser">
        <el-input v-model="dataForm.createuser" placeholder="创建人"></el-input>
      </el-form-item>
      <el-form-item label="创建时间" prop="createtime">
        <el-input v-model="dataForm.createtime" placeholder="创建时间"></el-input>
      </el-form-item>
      <el-form-item label="备注" prop="remark">
        <el-input v-model="dataForm.remark" placeholder="备注"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  import API from '@/api'
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          achievementsname: '',
          achievementsdesc: '',
          attachname: '',
          createuser: '',
          createtime: '',
          remark: ''
        },
        dataRule: {
          achievementsname: [
            { required: true, message: '科研名称不能为空', trigger: 'blur' }
          ],
          achievementsdesc: [
            { required: true, message: '科研简介不能为空', trigger: 'blur' }
          ],
          attachname: [
            { required: true, message: '附件名称不能为空', trigger: 'blur' }
          ],
          createuser: [
            { required: true, message: '创建人不能为空', trigger: 'blur' }
          ],
          createtime: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
          ],
          remark: [
            { required: true, message: '备注不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            API.achievements.info(this.dataForm.id).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.achievementsname = data.achievements.achievementsname
                this.dataForm.achievementsdesc = data.achievements.achievementsdesc
                this.dataForm.attachname = data.achievements.attachname
                this.dataForm.createuser = data.achievements.createuser
                this.dataForm.createtime = data.achievements.createtime
                this.dataForm.remark = data.achievements.remark
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            var params = {
              'id': this.dataForm.id || undefined,
              'achievementsname': this.dataForm.achievementsname,
              'achievementsdesc': this.dataForm.achievementsdesc,
              'attachname': this.dataForm.attachname,
              'createuser': this.dataForm.createuser,
              'createtime': this.dataForm.createtime,
              'remark': this.dataForm.remark
            }
            var tick = !this.dataForm.id ? API.achievements.add(params) : API.achievements.update(params)
            tick.then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>
