

class Handler;

// Comment ANY of commented lines to fix segmentation fault on android-clang-x86 with ndk-r15c

class Boo
{
public:
	Boo& foo(bool (Handler::*handler)())
	{
		return *this;
	}

	void (Handler::*a)() = nullptr; // comment to fix
	bool (Handler::*b)() = nullptr; // comment to fix
};

static const auto boo01 =
	Boo()
		.foo(nullptr) // comment to fix
		;


int main()
{
	return 0;
}
