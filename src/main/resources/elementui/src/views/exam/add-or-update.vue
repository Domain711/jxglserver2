<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="学院编号" prop="collegenum">
        <el-input v-model="dataForm.collegenum" placeholder="学院编号"></el-input>
      </el-form-item>
      <el-form-item label="专业编号" prop="majornum">
        <el-input v-model="dataForm.majornum" placeholder="专业编号"></el-input>
      </el-form-item>
      <el-form-item label="课程编号" prop="coursenum">
        <el-input v-model="dataForm.coursenum" placeholder="课程编号"></el-input>
      </el-form-item>
      <el-form-item label="班级编号" prop="gradenum">
        <el-input v-model="dataForm.gradenum" placeholder="班级编号"></el-input>
      </el-form-item>
      <el-form-item label="学生学号" prop="studentnum">
        <el-input v-model="dataForm.studentnum" placeholder="学生学号"></el-input>
      </el-form-item>
      <el-form-item label="考试成绩" prop="score">
        <el-input v-model="dataForm.score" placeholder="考试成绩"></el-input>
      </el-form-item>
      <el-form-item label="录入时间" prop="createtime">
        <el-input v-model="dataForm.createtime" placeholder="录入时间"></el-input>
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
          collegenum: '',
          majornum: '',
          coursenum: '',
          gradenum: '',
          studentnum: '',
          score: '',
          createtime: '',
          remark: ''
        },
        dataRule: {
          collegenum: [
            { required: true, message: '学院编号不能为空', trigger: 'blur' }
          ],
          majornum: [
            { required: true, message: '专业编号不能为空', trigger: 'blur' }
          ],
          coursenum: [
            { required: true, message: '课程编号不能为空', trigger: 'blur' }
          ],
          gradenum: [
            { required: true, message: '班级编号不能为空', trigger: 'blur' }
          ],
          studentnum: [
            { required: true, message: '学生学号不能为空', trigger: 'blur' }
          ],
          score: [
            { required: true, message: '考试成绩不能为空', trigger: 'blur' }
          ],
          createtime: [
            { required: true, message: '录入时间不能为空', trigger: 'blur' }
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
            API.exam.info(this.dataForm.id).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.collegenum = data.exam.collegenum
                this.dataForm.majornum = data.exam.majornum
                this.dataForm.coursenum = data.exam.coursenum
                this.dataForm.gradenum = data.exam.gradenum
                this.dataForm.studentnum = data.exam.studentnum
                this.dataForm.score = data.exam.score
                this.dataForm.createtime = data.exam.createtime
                this.dataForm.remark = data.exam.remark
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
              'collegenum': this.dataForm.collegenum,
              'majornum': this.dataForm.majornum,
              'coursenum': this.dataForm.coursenum,
              'gradenum': this.dataForm.gradenum,
              'studentnum': this.dataForm.studentnum,
              'score': this.dataForm.score,
              'createtime': this.dataForm.createtime,
              'remark': this.dataForm.remark
            }
            var tick = !this.dataForm.id ? API.exam.add(params) : API.exam.update(params)
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
