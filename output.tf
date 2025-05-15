output "repository_url" {
  value       = github_repository.repo.html_url
  description = "URL of the created repository"
}