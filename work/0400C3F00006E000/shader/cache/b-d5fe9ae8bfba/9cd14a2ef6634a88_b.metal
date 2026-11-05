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
void _41(thread const int& _886, thread const int& _887, thread const int& _888, thread const int& _889, thread int& _890, thread int& _891, thread int& _892, thread int& _893, thread int& _894, thread int& _895)
{
    float _898 = as_type<float>(_888) + 0.0;
    bool _900 = _898 != 0.0;
    bool _902 = isnan(_898);
    bool _904 = _900 || _902;
    bool _906 = isnan(0.0);
    bool _908 = _904 || _906;
    int _910 = _886;
    int _912 = _887;
    int _914 = _888;
    int _916 = _908 ? (-1) : 0;
    if (!_908)
    {
        float _918 = as_type<float>(_888) * 1.0;
        _910 = as_type<int>(_918);
    }
    int _920 = _910;
    bool _922 = !_908;
    int _924 = _920;
    int _926 = _920;
    if (!_922)
    {
        float _928 = as_type<float>(_888) + 0.0;
        bool _930 = _928 >= 0.0;
        bool _932 = isnan(_928);
        bool _934 = _930 || _932;
        bool _936 = isnan(0.0);
        bool _938 = _934 || _936;
        _916 = _938 ? (-1) : 0;
        if (!_938)
        {
            _924 = 2147483647;
        }
        int _940 = _924;
        bool _942 = !_938;
        int _944 = _940;
        _926 = _940;
        if (!_942)
        {
            float _946 = abs(as_type<float>(_888));
            float _948 = _946 + 0.0;
            bool _950 = _948 > as_type<float>(0x7f800000u /* inf */);
            bool _952 = isnan(_948);
            bool _954 = _950 || _952;
            bool _956 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _958 = _954 || _956;
            _916 = _958 ? (-1) : 0;
            if (_958)
            {
                float _960 = as_type<float>(_888) + 1.0;
                _944 = as_type<int>(_960);
            }
            int _962 = _944;
            int _964 = _962;
            _926 = _962;
            if (!_958)
            {
                float _966 = abs(as_type<float>(_888));
                float _968 = _966 + (-0.0);
                float _970 = 0.0 + _968;
                bool _972 = _970 != as_type<float>(0x7f800000u /* inf */);
                bool _974 = isnan(_970);
                bool _976 = _972 || _974;
                bool _978 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _980 = _976 || _978;
                _916 = _980 ? (-1) : 0;
                if (!_980)
                {
                    _964 = _888;
                }
                int _982 = _964;
                bool _984 = !_980;
                _926 = _982;
                if (!_984)
                {
                    float _986 = as_type<float>(_888) * 18446744073709551616.0;
                    float _988 = rsqrt(_986);
                    float _990 = _986 * _988;
                    float _992 = _988 * 0.5;
                    float _994 = -_990;
                    float _996 = 0.0 + _994;
                    float _998 = fma(_992, _996, 0.5);
                    float _1000 = fma(_990, _998, _990);
                    float _1002 = -_1000;
                    float _1004 = 0.0 + _1002;
                    float _1006 = fma(_1000, _1004, _986);
                    float _1008 = fma(_992, _1006, _1000);
                    float _1010 = _1008 * 2.3283064365386962890625e-10;
                    _926 = as_type<int>(_1010);
                    _912 = as_type<int>(_1000);
                    _914 = as_type<int>(_996);
                }
            }
        }
    }
    int _1012 = _926;
    int _1014 = _912;
    int _1016 = _914;
    int _1018 = _916;
    _890 = _889;
    _891 = 0;
    _892 = _1012;
    _893 = _1014;
    _894 = _1016;
    _895 = _1018;
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
        float _123 = _119 * 100.53096771240234375;
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
        float3 _609 = float3(_251, _253, _249);
        float3 _257 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_609, float3(0.0), isnan(_609)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_609, float3(0.0), isnan(_609)), level(0.0)).xyz;
        float _259 = _257.x;
        float _261 = _257.y;
        float _263 = _257.z;
        float _265 = _91 + 0.0625;
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
    int _301 = _57 << 4;
    float _303 = _299 * 0.22155688703060150146484375;
    float _305 = _281 * 0.3837479054927825927734375;
    float _307 = _289 * 0.22155688703060150146484375;
    float _309 = _293 * 0.22155688703060150146484375;
    float _311 = _279 * 0.3837479054927825927734375;
    float _313 = _285 * 0.3837479054927825927734375;
    float _315 = _297 * 0.3837479054927825927734375;
    float _317 = _277 * 0.3837479054927825927734375;
    float _319 = _283 * 0.3837479054927825927734375;
    float _321 = _291 * 0.3837479054927825927734375;
    float _323 = _287 * 0.3837479054927825927734375;
    int _325 = _301 + 8192;
    float _327 = _295 * 0.3837479054927825927734375;
    int _329 = _301 + 16384;
    uint _332 = uint(int(uint(_301) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_332)] = as_type<uint>(_307);
    int _334 = _301 + 4;
    uint _336 = uint(int(uint(_334) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_336)] = as_type<uint>(_309);
    int _338 = _301 + 8;
    uint _340 = uint(int(uint(_338) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_340)] = as_type<uint>(_303);
    int _342 = _301 + 12;
    uint _344 = uint(int(uint(_342) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_344)] = 1065353216u;
    int _346 = _301 + 24576;
    uint _348 = uint(int(uint(_325) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_348)] = as_type<uint>(_317);
    int _350 = _325 + 4;
    uint _352 = uint(int(uint(_350) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_352)] = as_type<uint>(_311);
    int _354 = _325 + 8;
    uint _356 = uint(int(uint(_354) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_356)] = as_type<uint>(_305);
    int _358 = _325 + 12;
    uint _360 = uint(int(uint(_358) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_360)] = 1065353216u;
    uint _362 = uint(int(uint(_329) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_362)] = as_type<uint>(_319);
    int _364 = _329 + 4;
    uint _366 = uint(int(uint(_364) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_366)] = as_type<uint>(_313);
    int _368 = _329 + 8;
    uint _370 = uint(int(uint(_368) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_370)] = as_type<uint>(_323);
    int _372 = _329 + 12;
    uint _374 = uint(int(uint(_372) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_374)] = 1065353216u;
    uint _376 = uint(int(uint(_346) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_376)] = as_type<uint>(_321);
    int _378 = _346 + 4;
    uint _380 = uint(int(uint(_378) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_380)] = as_type<uint>(_327);
    int _382 = _346 + 8;
    uint _384 = uint(int(uint(_382) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_384)] = as_type<uint>(_315);
    int _386 = _346 + 12;
    uint _388 = uint(int(uint(_386) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_388)] = 1065353216u;
}

