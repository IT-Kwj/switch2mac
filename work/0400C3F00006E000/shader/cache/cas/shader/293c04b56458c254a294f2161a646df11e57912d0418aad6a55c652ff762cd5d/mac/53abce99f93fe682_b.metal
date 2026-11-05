#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* cp_c0 [[id(0)]];
    device _21* cp_s0 [[id(1)]];
    texturecube<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    sampler cp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

static inline __attribute__((always_inline))
void _41(thread const int& _837, thread const int& _838, thread const int& _839, thread const int& _840, thread int& _841, thread int& _842, thread int& _843, thread int& _844, thread int& _845, thread int& _846)
{
    float _849 = as_type<float>(_839) + 0.0;
    bool _851 = _849 != 0.0;
    bool _853 = isnan(_849);
    bool _855 = _851 || _853;
    bool _857 = isnan(0.0);
    bool _859 = _855 || _857;
    int _861 = _837;
    int _863 = _838;
    int _865 = _839;
    int _867 = _859 ? (-1) : 0;
    if (!_859)
    {
        float _869 = as_type<float>(_839) * 1.0;
        _861 = as_type<int>(_869);
    }
    int _871 = _861;
    bool _873 = !_859;
    int _875 = _871;
    int _877 = _871;
    if (!_873)
    {
        float _879 = as_type<float>(_839) + 0.0;
        bool _881 = _879 >= 0.0;
        bool _883 = isnan(_879);
        bool _885 = _881 || _883;
        bool _887 = isnan(0.0);
        bool _889 = _885 || _887;
        _867 = _889 ? (-1) : 0;
        if (!_889)
        {
            _875 = 2147483647;
        }
        int _891 = _875;
        bool _893 = !_889;
        int _895 = _891;
        _877 = _891;
        if (!_893)
        {
            float _897 = abs(as_type<float>(_839));
            float _899 = _897 + 0.0;
            bool _901 = _899 > as_type<float>(0x7f800000u /* inf */);
            bool _903 = isnan(_899);
            bool _905 = _901 || _903;
            bool _907 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _909 = _905 || _907;
            _867 = _909 ? (-1) : 0;
            if (_909)
            {
                float _911 = as_type<float>(_839) + 1.0;
                _895 = as_type<int>(_911);
            }
            int _913 = _895;
            int _915 = _913;
            _877 = _913;
            if (!_909)
            {
                float _917 = abs(as_type<float>(_839));
                float _919 = _917 + (-0.0);
                float _921 = 0.0 + _919;
                bool _923 = _921 != as_type<float>(0x7f800000u /* inf */);
                bool _925 = isnan(_921);
                bool _927 = _923 || _925;
                bool _929 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _931 = _927 || _929;
                _867 = _931 ? (-1) : 0;
                if (!_931)
                {
                    _915 = _839;
                }
                int _933 = _915;
                bool _935 = !_931;
                _877 = _933;
                if (!_935)
                {
                    float _937 = as_type<float>(_839) * 18446744073709551616.0;
                    float _939 = rsqrt(_937);
                    float _941 = _937 * _939;
                    float _943 = _939 * 0.5;
                    float _945 = -_941;
                    float _947 = 0.0 + _945;
                    float _949 = fma(_943, _947, 0.5);
                    float _951 = fma(_941, _949, _941);
                    float _953 = -_951;
                    float _955 = 0.0 + _953;
                    float _957 = fma(_951, _955, _937);
                    float _959 = fma(_943, _957, _951);
                    float _961 = _959 * 2.3283064365386962890625e-10;
                    _877 = as_type<int>(_961);
                    _863 = as_type<int>(_951);
                    _865 = as_type<int>(_947);
                }
            }
        }
    }
    int _963 = _877;
    int _965 = _863;
    int _967 = _865;
    int _969 = _867;
    _841 = _840;
    _842 = 0;
    _843 = _963;
    _844 = _965;
    _845 = _967;
    _846 = _969;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _175 = false;
    float _45 = as_type<float>(gl_WorkGroupID.x);
    int _47 = as_type<int>((*spvDescriptorSet0.cp_c0)._m0[0].y) << 5;
    float _49 = as_type<float>(gl_LocalInvocationID.x);
    float _51 = float(uint(_47));
    float _53 = 1.0 / _51;
    int _55 = as_type<int>(_45) << 5;
    int _57 = _55 + as_type<int>(_49);
    float _59 = float(uint(_57));
    float _61 = 0.0;
    float _63 = 0.0;
    float _65 = 0.0;
    float _67 = 0.0;
    float _69 = 0.0;
    float _71 = 0.0;
    float _73 = 0.0;
    float _75 = 0.0;
    float _77 = 0.0;
    float _79 = 0.0;
    float _81 = 0.0;
    float _83 = 0.0;
    float _85 = 0.0;
    bool _89;
    int _161;
    int _163;
    int _165;
    int _167;
    int _169;
    int _171;
    float _173;
    float _277;
    float _279;
    float _281;
    float _283;
    float _285;
    float _287;
    float _289;
    float _291;
    float _293;
    float _295;
    float _297;
    float _299;
    do
    {
        float _91 = _61;
        float _93 = _63;
        float _95 = _65;
        float _97 = _67;
        float _99 = _69;
        float _101 = _71;
        float _103 = _73;
        float _105 = _75;
        float _107 = _77;
        float _109 = _79;
        float _111 = _81;
        float _113 = _83;
        float _115 = _85;
        float _117 = _59 + _91;
        float _119 = _117 * _53;
        float _121 = fma(_119, 2.0, -1.0);
        float _123 = _119 * 201.0619354248046875;
        float _125 = abs(_121);
        float _127 = -_125;
        float _129 = _127 + 1.0;
        float _131 = abs(_121);
        float _133 = fma(_131, -0.0187292993068695068359375, 0.074261002242565155029296875);
        bool _135 = _121 < 0.0;
        float _137 = float(_135);
        int _139 = as_type<int>(_129) + (-218103808);
        float _141 = abs(_121);
        float _143 = fma(_141, _133, -0.212114393711090087890625);
        bool _145 = uint(_139) >= 1920991232u;
        float _147 = abs(_121);
        float _149 = fma(_147, _143, 1.570728778839111328125);
        bool _151 = !_145;
        if (!_151)
        {
            int _153 = as_type<int>(_143);
            int _155 = _139;
            int _157 = as_type<int>(_129);
            int _159 = 528;
            _41(_153, _155, _157, _159, _161, _163, _165, _167, _169, _171);
            _173 = as_type<float>(_165);
            _175 = true;
        }
        else
        {
            float _177 = rsqrt(_129);
            float _179 = _129 * _177;
            float _181 = _177 * 0.5;
            float _183 = -_179;
            float _185 = 0.0 + _183;
            float _187 = fma(_181, _185, 0.5);
            float _189 = fma(_179, _187, _179);
            float _191 = -_189;
            float _193 = 0.0 + _191;
            float _195 = fma(_189, _193, _129);
            float _197 = fma(_181, _195, _189);
            _173 = _197;
        }
        _175 = false;
        float _199 = _173;
        float _201 = _149 * _199;
        float _203 = _137 * 2.0;
        float _205 = _123 * 0.15915493667125701904296875;
        float _207 = -_203;
        float _209 = fma(_201, _207, _201);
        float _211 = _205 * 6.283185482025146484375;
        float _213 = cos(_211);
        float _215 = fma(_137, 3.1415927410125732421875, _209);
        float _217 = _215 * 0.15915493667125701904296875;
        float _219 = _205 * 6.283185482025146484375;
        float _221 = sin(_219);
        float _223 = _217 * 6.283185482025146484375;
        float _225 = sin(_223);
        float _227 = _217 * 6.283185482025146484375;
        float _229 = cos(_227);
        float _231 = _225 * _213;
        float _233 = _225 * _221;
        float _235 = abs(_231);
        float _237 = abs(_229);
        float _239 = precise::max(_235, _237);
        float _241 = abs(_233);
        float _243 = precise::max(_241, _239);
        float _245 = 1.0 / _243;
        float _247 = -_245;
        float _249 = _233 * _247;
        float _251 = _231 * _245;
        float _253 = _229 * _245;
        float3 _593 = float3(_251, _253, _249);
        float3 _257 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_593, float3(0.0), isnan(_593)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_593, float3(0.0), isnan(_593)), level(0.0)).xyz;
        float _259 = _257.x;
        float _261 = _257.y;
        float _263 = _257.z;
        float _265 = _91 + 0.03125;
        bool _267 = _265 >= 1.0;
        bool _269 = isnan(_265);
        bool _271 = _267 || _269;
        bool _273 = isnan(1.0);
        bool _275 = _271 || _273;
        _277 = fma(_229, _259, _93);
        _279 = fma(_229, _261, _95);
        _281 = fma(_229, _263, _97);
        _283 = fma(_233, _259, _99);
        _285 = fma(_233, _261, _101);
        _287 = fma(_233, _263, _103);
        _289 = _259 + _105;
        _291 = fma(_231, _259, _107);
        _293 = _261 + _109;
        _295 = fma(_231, _261, _111);
        _297 = fma(_231, _263, _113);
        _299 = _263 + _115;
        _89 = !_275;
        _61 = _265;
        _63 = _277;
        _65 = _279;
        _67 = _281;
        _69 = _283;
        _71 = _285;
        _73 = _287;
        _75 = _289;
        _77 = _291;
        _79 = _293;
        _81 = _295;
        _83 = _297;
        _85 = _299;
    } while (_89);
    int _301 = _57 * 48;
    float _303 = _289 * 0.11077845096588134765625;
    float _305 = _293 * 0.11077845096588134765625;
    float _307 = _281 * 0.19187395274639129638671875;
    float _309 = _279 * 0.19187395274639129638671875;
    float _311 = _283 * 0.19187395274639129638671875;
    float _313 = _299 * 0.11077845096588134765625;
    float _315 = _277 * 0.19187395274639129638671875;
    float _317 = _287 * 0.19187395274639129638671875;
    float _319 = _297 * 0.19187395274639129638671875;
    float _321 = _285 * 0.19187395274639129638671875;
    float _323 = _291 * 0.19187395274639129638671875;
    int _325 = _301 + 16;
    float _327 = _295 * 0.19187395274639129638671875;
    int _329 = _301 + 32;
    uint _332 = uint(int(uint(_301) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_332)] = as_type<uint>(_303);
    int _334 = _301 + 4;
    uint _336 = uint(int(uint(_334) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_336)] = as_type<uint>(_305);
    int _338 = _301 + 8;
    uint _340 = uint(int(uint(_338) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_340)] = as_type<uint>(_313);
    int _342 = _301 + 12;
    uint _344 = uint(int(uint(_342) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_344)] = as_type<uint>(_315);
    uint _346 = uint(int(uint(_325) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_346)] = as_type<uint>(_309);
    int _348 = _325 + 4;
    uint _350 = uint(int(uint(_348) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_350)] = as_type<uint>(_307);
    int _352 = _325 + 8;
    uint _354 = uint(int(uint(_352) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_354)] = as_type<uint>(_311);
    int _356 = _325 + 12;
    uint _358 = uint(int(uint(_356) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_358)] = as_type<uint>(_321);
    uint _360 = uint(int(uint(_329) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_360)] = as_type<uint>(_317);
    int _362 = _329 + 4;
    uint _364 = uint(int(uint(_362) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_364)] = as_type<uint>(_323);
    int _366 = _329 + 8;
    uint _368 = uint(int(uint(_366) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_368)] = as_type<uint>(_327);
    int _370 = _329 + 12;
    uint _372 = uint(int(uint(_370) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_372)] = as_type<uint>(_319);
}

