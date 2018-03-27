<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="计划名称" prop="lessonplanname">
        <el-input v-model="dataForm.lessonplanname" placeholder="计划名称"></el-input>
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
          lessonplanname: '',
          attachname: '',
          createuser: '',
          createtime: '',
          remark: ''
        },
        dataRule: {
          lessonplanname: [
            { required: true, message: '计划名称不能为空', trigger: 'blur' }
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
            API.lessonplan.info(this.dataForm.id).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.lessonplanname = data.lessonplan.lessonplanname
                this.dataForm.attachname = data.lessonplan.attachname
                this.dataForm.createuser = data.lessonplan.createuser
                this.dataForm.createtime = data.lessonplan.createtime
                this.dataForm.remark = data.lessonplan.remark
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
              'lessonplanname': this.dataForm.lessonplanname,
              'attachname': this.dataForm.attachname,
              'createuser': this.dataForm.createuser,
              'createtime': this.dataForm.createtime,
              'remark': this.dataForm.remark
            }
            var tick = !this.dataForm.id ? API.lessonplan.add(params) : API.lessonplan.update(params)
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
