<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="编号" prop="num">
        <el-input v-model="dataForm.num" placeholder="编号"></el-input>
      </el-form-item>
      <el-form-item label="试卷类型" prop="papertype">
        <el-input v-model="dataForm.papertype" placeholder="试卷类型"></el-input>
      </el-form-item>
      <el-form-item label="试卷内容" prop="content">
        <el-input v-model="dataForm.content" placeholder="试卷内容"></el-input>
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
          num: '',
          papertype: '',
          content: ''
        },
        dataRule: {
          num: [
            { required: true, message: '编号不能为空', trigger: 'blur' }
          ],
          papertype: [
            { required: true, message: '试卷类型不能为空', trigger: 'blur' }
          ],
          content: [
            { required: true, message: '试卷内容不能为空', trigger: 'blur' }
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
            API.paperq.info(this.dataForm.id).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.num = data.paperq.num
                this.dataForm.papertype = data.paperq.papertype
                this.dataForm.content = data.paperq.content
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
              'num': this.dataForm.num,
              'papertype': this.dataForm.papertype,
              'content': this.dataForm.content
            }
            var tick = !this.dataForm.id ? API.paperq.add(params) : API.paperq.update(params)
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
