<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="题目类型编号" prop="questiontype">
        <el-input v-model="dataForm.questiontype" placeholder="题目类型编号"></el-input>
      </el-form-item>
      <el-form-item label="题目类型名称" prop="questionname">
        <el-input v-model="dataForm.questionname" placeholder="题目类型名称"></el-input>
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
          questiontype: '',
          questionname: '',
          remark: ''
        },
        dataRule: {
          questiontype: [
            { required: true, message: '题目类型编号不能为空', trigger: 'blur' }
          ],
          questionname: [
            { required: true, message: '题目类型名称不能为空', trigger: 'blur' }
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
            API.questiontype.info(this.dataForm.id).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.questiontype = data.questiontype.questiontype
                this.dataForm.questionname = data.questiontype.questionname
                this.dataForm.remark = data.questiontype.remark
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
              'questiontype': this.dataForm.questiontype,
              'questionname': this.dataForm.questionname,
              'remark': this.dataForm.remark
            }
            var tick = !this.dataForm.id ? API.questiontype.add(params) : API.questiontype.update(params)
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
