<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="课程编号" prop="coursenum">
        <el-input v-model="dataForm.coursenum" placeholder="课程编号"></el-input>
      </el-form-item>
      <el-form-item label="课程名称" prop="coursename">
        <el-input v-model="dataForm.coursename" placeholder="课程名称"></el-input>
      </el-form-item>
      <el-form-item label="学院编号" prop="collegenum">
        <el-input v-model="dataForm.collegenum" placeholder="学院编号"></el-input>
      </el-form-item>
      <el-form-item label="专业编号" prop="majornum">
        <el-input v-model="dataForm.majornum" placeholder="专业编号"></el-input>
      </el-form-item>
      <el-form-item label="创建时间" prop="createtime">
        <el-input v-model="dataForm.createtime" placeholder="创建时间"></el-input>
      </el-form-item>
      <el-form-item label="创建人" prop="createuser">
        <el-input v-model="dataForm.createuser" placeholder="创建人"></el-input>
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
          coursenum: '',
          coursename: '',
          collegenum: '',
          majornum: '',
          createtime: '',
          createuser: '',
          remark: ''
        },
        dataRule: {
          coursenum: [
            { required: true, message: '课程编号不能为空', trigger: 'blur' }
          ],
          coursename: [
            { required: true, message: '课程名称不能为空', trigger: 'blur' }
          ],
          collegenum: [
            { required: true, message: '学院编号不能为空', trigger: 'blur' }
          ],
          majornum: [
            { required: true, message: '专业编号不能为空', trigger: 'blur' }
          ],
          createtime: [
            { required: true, message: '创建时间不能为空', trigger: 'blur' }
          ],
          createuser: [
            { required: true, message: '创建人不能为空', trigger: 'blur' }
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
            API.course.info(this.dataForm.id).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.coursenum = data.course.coursenum
                this.dataForm.coursename = data.course.coursename
                this.dataForm.collegenum = data.course.collegenum
                this.dataForm.majornum = data.course.majornum
                this.dataForm.createtime = data.course.createtime
                this.dataForm.createuser = data.course.createuser
                this.dataForm.remark = data.course.remark
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
              'coursenum': this.dataForm.coursenum,
              'coursename': this.dataForm.coursename,
              'collegenum': this.dataForm.collegenum,
              'majornum': this.dataForm.majornum,
              'createtime': this.dataForm.createtime,
              'createuser': this.dataForm.createuser,
              'remark': this.dataForm.remark
            }
            var tick = !this.dataForm.id ? API.course.add(params) : API.course.update(params)
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
