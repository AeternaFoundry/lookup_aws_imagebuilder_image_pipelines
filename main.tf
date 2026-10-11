data "aws_imagebuilder_image_pipelines" "imagebuilder_image_pipelines_lookup" {
  for_each = var.imagebuilder_image_pipelines_lookup

  region = each.value.region

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

