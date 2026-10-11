import sys
import yaml

ci_file = ".github/workflows/ci.yaml"

try:
    with open(ci_file, "r", encoding="utf-8") as file:
        workflow = yaml.safe_load(file)

    if not isinstance(workflow, dict):
        raise ValueError("Workflow must be a YAML mapping")

    jobs = workflow.get("jobs", {})

    for job in ("build", "test", "deploy"):
        if job not in jobs:
            raise ValueError(f"Missing required job: {job}")

    print("CI YAML validation successful!")

except Exception as error:
    print(f"CI YAML validation failed: {error}")
    sys.exit(1)
