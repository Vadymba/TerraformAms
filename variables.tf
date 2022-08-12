variable "env" {
  
}

variable "location" {
  default = "westeurope"
}

variable "budget_dollars" {
  type    = number
  default = 5
}

variable "platform_module" {
  default = null
}

variable "source_dir_to_calculation_func" {
  default = "C:\\Users\\vbakalov\\source\\repos\\TestFunction\\TestFunction\\bin\\Release\\net6.0"
}

variable "output_path_calculation_func" {
  default = "function_release.zip"
}
