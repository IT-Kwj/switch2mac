#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _29
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c5 [[id(1)]];
    constant _16* cp_c6 [[id(2)]];
    constant _16* cp_c3 [[id(3)]];
    constant _16* cp_c4 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    texture2d_array<float> cp_t_tcb_8 [[id(6)]];
    sampler cp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_A [[id(8)]];
    sampler cp_t_tcb_ASmplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _5293, thread const int& _5294, constant _10& support_buffer)
{
    int _5297 = 1 + _5294;
    float _5299 = support_buffer._m5[_5297].x;
    bool _5301 = _5299 == 1.0;
    if (_5301)
    {
        return _5293;
    }
    float _5303 = float(_5293);
    float _5305 = _5303 * _5299;
    int _5307 = int(_5305);
    return _5307;
}

static inline __attribute__((always_inline))
void _56(thread const int& _4980, thread const int& _4981, thread const int& _4982, thread const int& _4983, thread const int& _4984, thread int& _4985, thread int& _4986, thread int& _4987, thread int& _4988, thread int& _4989, thread int& _4990)
{
    float _4993 = as_type<float>(_4982) + 0.0;
    bool _4995 = _4993 != 0.0;
    bool _4997 = isnan(_4993);
    bool _4999 = _4995 || _4997;
    bool _5001 = isnan(0.0);
    bool _5003 = _4999 || _5001;
    int _5005 = as_type<int>(_4993);
    int _5007 = _4981;
    int _5009 = _4984;
    int _5011 = _5003 ? (-1) : 0;
    if (!_5003)
    {
        float _5013 = as_type<float>(_4982) * 1.0;
        _5005 = as_type<int>(_5013);
    }
    int _5015 = _5005;
    bool _5017 = !_5003;
    int _5019 = _5015;
    if (!_5017)
    {
        float _5021 = as_type<float>(_4982) + 0.0;
        bool _5023 = _5021 >= 0.0;
        bool _5025 = isnan(_5021);
        bool _5027 = _5023 || _5025;
        bool _5029 = isnan(0.0);
        bool _5031 = _5027 || _5029;
        int _5033 = as_type<int>(_5021);
        _5011 = _5031 ? (-1) : 0;
        if (!_5031)
        {
            _5033 = 2147483647;
        }
        int _5035 = _5033;
        bool _5037 = !_5031;
        _5019 = _5035;
        if (!_5037)
        {
            float _5039 = as_type<float>(_4982) + 0.0;
            bool _5041 = _5039 > as_type<float>(0x7f800000u /* inf */);
            bool _5043 = isnan(_5039);
            bool _5045 = _5041 || _5043;
            bool _5047 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _5049 = _5045 || _5047;
            int _5051 = as_type<int>(_5039);
            _5011 = _5049 ? (-1) : 0;
            if (_5049)
            {
                float _5053 = as_type<float>(_4982) + 1.0;
                _5051 = as_type<int>(_5053);
            }
            int _5055 = _5051;
            _5019 = _5055;
            if (!_5049)
            {
                float _5057 = 0.0 + as_type<float>(_4982);
                bool _5059 = _5057 != as_type<float>(0x7f800000u /* inf */);
                bool _5061 = isnan(_5057);
                bool _5063 = _5059 || _5061;
                bool _5065 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _5067 = _5063 || _5065;
                int _5069 = as_type<int>(_5057);
                _5011 = _5067 ? (-1) : 0;
                if (!_5067)
                {
                    _5069 = _4982;
                }
                int _5071 = _5069;
                bool _5073 = !_5067;
                _5019 = _5071;
                if (!_5073)
                {
                    float _5075 = as_type<float>(_4982) * 18446744073709551616.0;
                    float _5077 = rsqrt(_5075);
                    float _5079 = _5075 * _5077;
                    float _5081 = _5077 * 0.5;
                    float _5083 = -_5079;
                    float _5085 = 0.0 + _5083;
                    float _5087 = fma(_5081, _5085, 0.5);
                    float _5089 = fma(_5079, _5087, _5079);
                    float _5091 = -_5089;
                    float _5093 = 0.0 + _5091;
                    float _5095 = fma(_5089, _5093, _5075);
                    float _5097 = fma(_5081, _5095, _5089);
                    float _5099 = _5097 * 2.3283064365386962890625e-10;
                    _5019 = as_type<int>(_5099);
                    _5007 = as_type<int>(_5085);
                    _5009 = as_type<int>(_5089);
                }
            }
        }
    }
    int _5101 = _5019;
    int _5103 = _5007;
    int _5105 = _5009;
    int _5107 = _5011;
    _4985 = _5101;
    _4986 = _4983;
    _4987 = 0;
    _4988 = _5103;
    _4989 = _5105;
    _4990 = _5107;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1577 = false;
    bool _1123 = false;
    bool _717 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_72)
    {
        return;
    }
    int _74 = _68 & 31;
    bool _76 = _74 == 0;
    bool _78 = uint(_74) < 32u;
    int _80 = 32 - _74;
    int _82 = _74 - 32;
    int _84 = 1 << _74;
    uint _87 = uint(int(uint(0) >> uint(_80)));
    int _89 = _84 | int(_87);
    int _91 = _76 ? 1 : _89;
    bool _93 = uint(_82) < 32u;
    int _95 = 0 << _82;
    int _97 = _93 ? _95 : 0;
    float _99 = _78 ? as_type<float>(_91) : as_type<float>(_97);
    int _101 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _103 = _101 + 32;
    uint _105 = uint(int(uint(_103) >> uint(2)));
    uint _107 = uint(int(uint(int(_105)) >> uint(2)));
    int _109 = int(_105) & 3;
    float _111 = (*spvDescriptorSet0.cp_c5)._m0[int(_107)][_109];
    int _113 = _101 + 36;
    uint _115 = uint(int(uint(_113) >> uint(2)));
    uint _117 = uint(int(uint(int(_115)) >> uint(2)));
    int _119 = int(_115) & 3;
    float _121 = (*spvDescriptorSet0.cp_c5)._m0[int(_117)][_119];
    int _123 = as_type<int>(_99) & as_type<int>(_111);
    bool _125 = _123 != 0;
    int _127 = as_type<int>(_99) & as_type<int>(_121);
    bool _129 = _127 != 0;
    float _131 = 0.0;
    float _133 = 0.0;
    float _135 = _111;
    float _137 = _99;
    if (!_125)
    {
        _131 = 0.0;
        _133 = 0.0;
    }
    float _139 = _131;
    float _141 = _133;
    float _143 = 0.0;
    float _145 = _139;
    float _147 = _141;
    if (!_125)
    {
        _143 = 0.0;
    }
    float _149 = _143;
    float _151 = 0.0;
    float _153 = _149;
    if (!_125)
    {
        _151 = 0.0;
        _135 = 0.0;
    }
    float _155 = _151;
    float _157 = _135;
    float _159 = 0.0;
    float _161 = _155;
    float _163 = _157;
    if (!_125)
    {
        _159 = 0.0;
    }
    float _165 = _159;
    float _167 = 0.0;
    float _169 = _165;
    if (!_125)
    {
        _167 = 0.0;
    }
    float _171 = _167;
    float _173 = 0.0;
    float _175 = _171;
    if (!_125)
    {
        _173 = 0.0;
    }
    float _177 = _173;
    float _179 = _177;
    if (!_125)
    {
        _137 = 0.0;
    }
    float _181 = _137;
    bool _183 = !_125;
    float _185 = _181;
    if (!_183)
    {
        uint _187 = uint(int(uint(_101) >> uint(2)));
        uint _189 = uint(int(uint(int(_187)) >> uint(2)));
        int _191 = int(_187) & 3;
        float _193 = (*spvDescriptorSet0.cp_c5)._m0[int(_189)][_191];
        int _195 = int(_187) + 1;
        uint _197 = uint(int(uint(_195) >> uint(2)));
        int _199 = _195 & 3;
        float _201 = (*spvDescriptorSet0.cp_c5)._m0[int(_197)][_199];
        int _203 = _68;
        int _205 = 0;
        int _207 = _58(_203, _205, (*spvDescriptorSet0.support_buffer));
        int _209 = as_type<int>(_193);
        int _211 = 0;
        int _213 = _58(_209, _211, (*spvDescriptorSet0.support_buffer));
        int3 _2243 = int3(_207, _213, 1);
        float3 _217 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2243.xy), uint(_2243.z), 0).xyz;
        float _219 = _217.x;
        float _221 = _217.y;
        float _223 = _217.z;
        int _225 = _68;
        int _227 = 0;
        int _229 = _58(_225, _227, (*spvDescriptorSet0.support_buffer));
        int _231 = as_type<int>(_201);
        int _233 = 0;
        int _235 = _58(_231, _233, (*spvDescriptorSet0.support_buffer));
        int3 _2261 = int3(_229, _235, 1);
        float3 _237 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2261.xy), uint(_2261.z), 0).xyz;
        float _239 = _237.x;
        float _241 = _237.y;
        float _243 = _237.z;
        int _245 = _68;
        int _247 = 0;
        int _249 = _58(_245, _247, (*spvDescriptorSet0.support_buffer));
        int _251 = as_type<int>(_193);
        int _253 = 0;
        int _255 = _58(_251, _253, (*spvDescriptorSet0.support_buffer));
        int3 _2279 = int3(_249, _255, 0);
        float3 _257 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2279.xy), uint(_2279.z), 0).xyz;
        float _259 = _257.x;
        float _261 = _257.y;
        float _263 = _257.z;
        int _265 = _68;
        int _267 = 0;
        int _269 = _58(_265, _267, (*spvDescriptorSet0.support_buffer));
        int _271 = as_type<int>(_201);
        int _273 = 0;
        int _275 = _58(_271, _273, (*spvDescriptorSet0.support_buffer));
        int3 _2297 = int3(_269, _275, 0);
        float3 _277 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2297.xy), uint(_2297.z), 0).xyz;
        float _279 = _277.x;
        float _281 = _277.y;
        float _283 = _277.z;
        int _285 = _68;
        int _287 = 0;
        int _289 = _58(_285, _287, (*spvDescriptorSet0.support_buffer));
        int _291 = as_type<int>(_193);
        int _293 = 0;
        int _295 = _58(_291, _293, (*spvDescriptorSet0.support_buffer));
        int3 _2315 = int3(_289, _295, 2);
        float3 _297 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2315.xy), uint(_2315.z), 0).xyz;
        float _299 = _297.x;
        float _301 = _297.y;
        float _303 = _297.z;
        int _305 = _68;
        int _307 = 0;
        int _309 = _58(_305, _307, (*spvDescriptorSet0.support_buffer));
        int _311 = as_type<int>(_201);
        int _313 = 0;
        int _315 = _58(_311, _313, (*spvDescriptorSet0.support_buffer));
        int3 _2333 = int3(_309, _315, 2);
        float3 _317 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2333.xy), uint(_2333.z), 0).xyz;
        float _319 = _317.x;
        float _321 = _317.y;
        float _323 = _317.z;
        int _325 = _101 + 16;
        uint _327 = uint(int(uint(_325) >> uint(2)));
        uint _329 = uint(int(uint(int(_327)) >> uint(2)));
        int _331 = int(_327) & 3;
        float _333 = (*spvDescriptorSet0.cp_c5)._m0[int(_329)][_331];
        float _335 = -_219;
        float _337 = _335 + _239;
        float _339 = -_223;
        float _341 = _339 + _243;
        float _343 = fma(_337, _333, _219);
        float _345 = -_221;
        float _347 = _345 + _241;
        float _349 = -_261;
        float _351 = _349 + _281;
        float _353 = -_263;
        float _355 = _353 + _283;
        float _357 = -_259;
        float _359 = _357 + _279;
        float _361 = fma(_347, _333, _221);
        float _363 = -_299;
        float _365 = _363 + _319;
        float _367 = -_301;
        float _369 = _367 + _321;
        float _371 = -_303;
        float _373 = _371 + _323;
        float _375 = fma(_351, _333, _261);
        float _377 = fma(_355, _333, _263);
        float _379 = fma(_341, _333, _223);
        float _381 = fma(_359, _333, _259);
        float _383 = fma(_365, _333, _299);
        float _385 = fma(_369, _333, _301);
        float _387 = fma(_373, _333, _303);
        _185 = _379;
        _161 = _361;
        _163 = _343;
        _145 = _381;
        _153 = _375;
        _147 = _377;
        _169 = _383;
        _175 = _385;
        _179 = _387;
    }
    float _389 = _185;
    float _391 = _161;
    float _393 = _163;
    float _395 = _145;
    float _397 = _153;
    float _399 = _147;
    float _401 = _169;
    float _403 = _175;
    float _405 = _179;
    bool _407 = !_129;
    float _409 = _395;
    int _411 = as_type<int>(_401);
    int _413 = as_type<int>(_403);
    int _415 = as_type<int>(_405);
    float _417 = _397;
    float _419 = _399;
    float _905;
    float _1095;
    float _1097;
    float _1099;
    float _1101;
    float _1103;
    float _1105;
    float _1107;
    float _1109;
    float _1111;
    float _1113;
    float _1115;
    float _1117;
    float _1119;
    float _1121;
    if (!_407)
    {
        int _421 = _101 + 8;
        uint _423 = uint(int(uint(_421) >> uint(2)));
        uint _425 = uint(int(uint(int(_423)) >> uint(2)));
        int _427 = int(_423) & 3;
        float _429 = (*spvDescriptorSet0.cp_c5)._m0[int(_425)][_427];
        int _431 = int(_423) + 1;
        uint _433 = uint(int(uint(_431) >> uint(2)));
        int _435 = _431 & 3;
        float _437 = (*spvDescriptorSet0.cp_c5)._m0[int(_433)][_435];
        int _439 = _68;
        int _441 = 1;
        int _443 = _58(_439, _441, (*spvDescriptorSet0.support_buffer));
        int _445 = as_type<int>(_429);
        int _447 = 1;
        int _449 = _58(_445, _447, (*spvDescriptorSet0.support_buffer));
        int3 _2515 = int3(_443, _449, 1);
        float3 _451 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2515.xy), uint(_2515.z), 0).xyz;
        float _453 = _451.x;
        float _455 = _451.y;
        float _457 = _451.z;
        int _459 = _68;
        int _461 = 1;
        int _463 = _58(_459, _461, (*spvDescriptorSet0.support_buffer));
        int _465 = as_type<int>(_437);
        int _467 = 1;
        int _469 = _58(_465, _467, (*spvDescriptorSet0.support_buffer));
        int3 _2533 = int3(_463, _469, 1);
        float3 _471 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2533.xy), uint(_2533.z), 0).xyz;
        float _473 = _471.x;
        float _475 = _471.y;
        float _477 = _471.z;
        float _479 = _389 * 0.5;
        float _481 = _391 * 0.5;
        float _483 = _393 * 0.5;
        float _485 = _479 * 0.15915493667125701904296875;
        float _487 = _481 * 0.15915493667125701904296875;
        float _489 = _485 * 6.283185482025146484375;
        float _491 = sin(_489);
        float _493 = _483 * 0.15915493667125701904296875;
        float _495 = _487 * 6.283185482025146484375;
        float _497 = sin(_495);
        int _499 = _101 + 24;
        uint _501 = uint(int(uint(_499) >> uint(2)));
        uint _503 = uint(int(uint(int(_501)) >> uint(2)));
        int _505 = int(_501) & 3;
        float _507 = (*spvDescriptorSet0.cp_c5)._m0[int(_503)][_505];
        float _509 = _487 * 6.283185482025146484375;
        float _511 = cos(_509);
        float _513 = _485 * 6.283185482025146484375;
        float _515 = cos(_513);
        float _517 = _491 * _497;
        float _519 = _493 * 6.283185482025146484375;
        float _521 = sin(_519);
        float _523 = _511 * _491;
        float _525 = _493 * 6.283185482025146484375;
        float _527 = cos(_525);
        float _529 = _515 * _511;
        float _531 = _515 * _497;
        float _533 = _521 * _517;
        float _535 = _521 * _523;
        float _537 = _527 * _517;
        float _539 = fma(_527, _531, _535);
        float _541 = fma(_527, _529, _533);
        float _543 = -_537;
        float _545 = fma(_521, _529, _543);
        float _547 = _521 * _531;
        float _549 = -_547;
        float _551 = fma(_527, _523, _549);
        float _553 = -_457;
        float _555 = _553 + _477;
        float _557 = -_455;
        float _559 = _557 + _475;
        float _561 = -_453;
        float _563 = _561 + _473;
        float _565 = fma(_555, _507, _457);
        float _567 = fma(_559, _507, _455);
        float _569 = fma(_563, _507, _453);
        float _571 = _565 * 0.5;
        float _573 = _567 * 0.5;
        float _575 = _569 * 0.5;
        float _577 = _571 * 0.15915493667125701904296875;
        float _579 = _573 * 0.15915493667125701904296875;
        float _581 = _575 * 0.15915493667125701904296875;
        float _583 = _577 * 6.283185482025146484375;
        float _585 = sin(_583);
        float _587 = _579 * 6.283185482025146484375;
        float _589 = cos(_587);
        float _591 = _579 * 6.283185482025146484375;
        float _593 = sin(_591);
        float _595 = _577 * 6.283185482025146484375;
        float _597 = cos(_595);
        float _599 = _589 * _585;
        float _601 = _581 * 6.283185482025146484375;
        float _603 = sin(_601);
        float _605 = _585 * _593;
        float _607 = _581 * 6.283185482025146484375;
        float _609 = cos(_607);
        float _611 = _597 * _593;
        float _613 = _597 * _589;
        float _615 = _603 * _599;
        float _617 = _609 * _605;
        float _619 = fma(_609, _611, _615);
        float _621 = _603 * _611;
        float _623 = -_617;
        float _625 = fma(_603, _613, _623);
        float _627 = _539 * _619;
        float _629 = _603 * _605;
        float _631 = -_621;
        float _633 = fma(_609, _599, _631);
        float _635 = fma(_545, _625, _627);
        float _637 = fma(_609, _613, _629);
        float _639 = fma(_551, _633, _635);
        float _641 = fma(_541, _637, _639);
        float _643 = precise::max(_641, -1.0);
        float _645 = precise::min(_643, 1.0);
        bool _647 = _645 >= 0.0;
        bool _649 = isnan(_645);
        bool _651 = _647 || _649;
        bool _653 = isnan(0.0);
        bool _655 = _651 || _653;
        bool _657 = !_655;
        float _659 = -_645;
        float _661 = _657 ? _659 : _645;
        bool _663 = _661 < 0.0;
        float _665 = float(_663);
        float _667 = abs(_661);
        float _669 = -_667;
        float _671 = _669 + 1.0;
        float _673 = abs(_661);
        float _675 = fma(_673, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _677 = as_type<int>(_671) + (-218103808);
        float _679 = abs(_661);
        float _681 = fma(_679, _675, -0.212114393711090087890625);
        bool _683 = uint(_677) >= 1920991232u;
        float _685 = abs(_661);
        float _687 = fma(_685, _681, 1.570728778839111328125);
        bool _689 = !_683;
        float _713;
        float _715;
        if (!_689)
        {
            int _691 = as_type<int>(_613);
            int _693 = as_type<int>(_661);
            int _695 = as_type<int>(_671);
            int _697 = 2288;
            int _699 = as_type<int>(_529);
            int _701;
            int _703;
            int _705;
            int _707;
            int _709;
            int _711;
            _56(_691, _693, _695, _697, _699, _701, _703, _705, _707, _709, _711);
            _713 = as_type<float>(_701);
            _715 = as_type<float>(_703);
            _717 = true;
        }
        else
        {
            float _719 = rsqrt(_671);
            float _721 = _671 * _719;
            float _723 = _719 * 0.5;
            float _725 = -_721;
            float _727 = 0.0 + _725;
            float _729 = fma(_723, _727, 0.5);
            float _731 = fma(_721, _729, _721);
            float _733 = -_731;
            float _735 = 0.0 + _733;
            float _737 = fma(_731, _735, _671);
            float _739 = fma(_723, _737, _731);
            _713 = _739;
            _715 = _737;
        }
        _717 = false;
        float _741 = _713;
        float _743 = _715;
        int _745 = _101 + 8;
        uint _747 = uint(int(uint(_745) >> uint(2)));
        uint _749 = uint(int(uint(int(_747)) >> uint(2)));
        int _751 = int(_747) & 3;
        float _753 = (*spvDescriptorSet0.cp_c5)._m0[int(_749)][_751];
        int _755 = int(_747) + 1;
        uint _757 = uint(int(uint(_755) >> uint(2)));
        int _759 = _755 & 3;
        float _761 = (*spvDescriptorSet0.cp_c5)._m0[int(_757)][_759];
        int _763 = _68;
        int _765 = 1;
        int _767 = _58(_763, _765, (*spvDescriptorSet0.support_buffer));
        int _769 = as_type<int>(_753);
        int _771 = 1;
        int _773 = _58(_769, _771, (*spvDescriptorSet0.support_buffer));
        int3 _2921 = int3(_767, _773, 0);
        float3 _775 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2921.xy), uint(_2921.z), 0).xyz;
        float _777 = _775.x;
        float _779 = _775.y;
        float _781 = _775.z;
        int _783 = _68;
        int _785 = 1;
        int _787 = _58(_783, _785, (*spvDescriptorSet0.support_buffer));
        int _789 = as_type<int>(_753);
        int _791 = 1;
        int _793 = _58(_789, _791, (*spvDescriptorSet0.support_buffer));
        int3 _2939 = int3(_787, _793, 2);
        float3 _795 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2939.xy), uint(_2939.z), 0).xyz;
        float _797 = _795.x;
        float _799 = _795.y;
        float _801 = _795.z;
        int _803 = _68;
        int _805 = 1;
        int _807 = _58(_803, _805, (*spvDescriptorSet0.support_buffer));
        int _809 = as_type<int>(_761);
        int _811 = 1;
        int _813 = _58(_809, _811, (*spvDescriptorSet0.support_buffer));
        int3 _2957 = int3(_807, _813, 0);
        float3 _815 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2957.xy), uint(_2957.z), 0).xyz;
        float _817 = _815.x;
        float _819 = _815.y;
        float _821 = _815.z;
        int _823 = _68;
        int _825 = 1;
        int _827 = _58(_823, _825, (*spvDescriptorSet0.support_buffer));
        int _829 = as_type<int>(_761);
        int _831 = 1;
        int _833 = _58(_829, _831, (*spvDescriptorSet0.support_buffer));
        int3 _2975 = int3(_827, _833, 2);
        float3 _835 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2975.xy), uint(_2975.z), 0).xyz;
        float _837 = _835.x;
        float _839 = _835.y;
        float _841 = _835.z;
        float _843 = _687 * _741;
        float _845 = _665 * 2.0;
        float _847 = -_845;
        float _849 = fma(_843, _847, _843);
        float _851 = fma(_665, 3.1415927410125732421875, _849);
        float _853 = _851 * 0.15915493667125701904296875;
        float _855 = _853 * 6.283185482025146484375;
        float _857 = sin(_855);
        float _859 = abs(_857);
        bool _861 = _859 >= 0.001000000047497451305389404296875;
        bool _863 = isnan(_859);
        bool _865 = _861 || _863;
        bool _867 = isnan(0.001000000047497451305389404296875);
        bool _869 = _865 || _867;
        float _871 = 0.0;
        float _873 = _743;
        float _875 = _843;
        if (!_869)
        {
            int _877 = _101 + 28;
            uint _879 = uint(int(uint(_877) >> uint(2)));
            uint _881 = uint(int(uint(int(_879)) >> uint(2)));
            int _883 = int(_879) & 3;
            float _885 = (*spvDescriptorSet0.cp_c5)._m0[int(_881)][_883];
            _871 = _885;
        }
        float _887 = _871;
        float _889 = _887;
        if (!_869)
        {
            float _891 = -_887;
            float _893 = _891 + 1.0;
            _873 = _893;
        }
        float _895 = _873;
        float _897 = _895;
        if (!_869)
        {
            _875 = _887;
        }
        float _899 = _875;
        bool _901 = !_869;
        float _903 = _899;
        _905 = _779;
        if (!_901)
        {
            int _907 = _101 + 28;
            uint _909 = uint(int(uint(_907) >> uint(2)));
            uint _911 = uint(int(uint(int(_909)) >> uint(2)));
            int _913 = int(_909) & 3;
            float _915 = (*spvDescriptorSet0.cp_c5)._m0[int(_911)][_913];
            float _917 = 1.0 / _857;
            float _919 = _851 * _915;
            float _921 = _919 * 0.15915493667125701904296875;
            float _923 = -_919;
            float _925 = _851 + _923;
            float _927 = _925 * 0.15915493667125701904296875;
            float _929 = _921 * 6.283185482025146484375;
            float _931 = sin(_929);
            float _933 = _927 * 6.283185482025146484375;
            float _935 = sin(_933);
            float _937 = _931 * _917;
            float _939 = _935 * _917;
            _903 = _937;
            _897 = _939;
            _889 = _915;
        }
        float _941 = _903;
        float _943 = _897;
        float _945 = _889;
        bool _947 = !_655;
        float _949 = -_941;
        float _951 = _947 ? _949 : _941;
        float _953 = -_781;
        float _955 = _953 + _821;
        float _957 = -_801;
        float _959 = _957 + _841;
        float _961 = _625 * _951;
        float _963 = _637 * _951;
        float _965 = _633 * _951;
        float _967 = _619 * _951;
        float _969 = fma(_545, _943, _961);
        float _971 = fma(_541, _943, _963);
        int _973 = _101 + 24;
        uint _975 = uint(int(uint(_973) >> uint(2)));
        uint _977 = uint(int(uint(int(_975)) >> uint(2)));
        int _979 = int(_975) & 3;
        float _981 = (*spvDescriptorSet0.cp_c5)._m0[int(_977)][_979];
        float _983 = fma(_551, _943, _965);
        float _985 = fma(_539, _943, _967);
        float _987 = _971 * 2.0;
        float _989 = _969 * 2.0;
        float _991 = _985 * 2.0;
        float _993 = _983 * _987;
        int _995 = _101 + 20;
        uint _997 = uint(int(uint(_995) >> uint(2)));
        uint _999 = uint(int(uint(int(_997)) >> uint(2)));
        int _1001 = int(_997) & 3;
        float _1003 = (*spvDescriptorSet0.cp_c5)._m0[int(_999)][_1001];
        float _1005 = _985 * _987;
        float _1007 = _969 * _987;
        float _1009 = -_993;
        float _1011 = fma(_985, _989, _1009);
        float _1013 = fma(_985, _989, _993);
        float _1015 = fma(_983, _989, _1005);
        float _1017 = -_1005;
        float _1019 = fma(_983, _989, _1017);
        float _1021 = -_1007;
        float _1023 = fma(_983, _991, _1021);
        float _1025 = fma(_983, _991, _1007);
        float _1027 = _969 * _969;
        float _1029 = -_777;
        float _1031 = _1029 + _817;
        float _1033 = _985 * _985;
        float _1035 = -_779;
        float _1037 = _1035 + _819;
        float _1039 = fma(_1027, -2.0, 1.0);
        float _1041 = _983 * _983;
        float _1043 = fma(_1033, -2.0, 1.0);
        float _1045 = fma(_1031, _981, _777);
        float _1047 = fma(_1037, _981, _779);
        float _1049 = fma(_1033, -2.0, _1039);
        float _1051 = -_799;
        float _1053 = _1051 + _839;
        float _1055 = _1045 * _945;
        float _1057 = -_797;
        float _1059 = _1057 + _837;
        float _1061 = fma(_1041, -2.0, _1043);
        float _1063 = fma(_1041, -2.0, _1039);
        float _1065 = _1047 * _945;
        float _1067 = fma(_955, _981, _781);
        float _1069 = fma(_1059, _981, _797);
        float _1071 = fma(_1053, _981, _799);
        float _1073 = fma(_959, _981, _801);
        float _1075 = fma(_395, _1003, _1055);
        float _1077 = fma(_397, _1003, _1065);
        float _1079 = _1067 * _945;
        float _1081 = _1069 * _945;
        float _1083 = _1071 * _945;
        float _1085 = _1073 * _945;
        float _1087 = fma(_399, _1003, _1079);
        float _1089 = fma(_401, _1003, _1081);
        float _1091 = fma(_403, _1003, _1083);
        float _1093 = fma(_405, _1003, _1085);
        _409 = _1075;
        _1095 = _1061;
        _1097 = _1013;
        _1099 = _1019;
        _1101 = _1077;
        _1103 = _1011;
        _1105 = _1063;
        _1107 = _1025;
        _1109 = _1087;
        _1111 = _1015;
        _1113 = _1023;
        _1115 = _1049;
        _411 = as_type<int>(_1089);
        _413 = as_type<int>(_1091);
        _415 = as_type<int>(_1093);
        _1117 = _1083;
        _417 = _1081;
        _1119 = _1069;
        _1121 = _1085;
        _1123 = true;
    }
    else
    {
        float _1125 = _393 * 0.15915493667125701904296875;
        float _1127 = _389 * 0.15915493667125701904296875;
        float _1129 = _391 * 0.15915493667125701904296875;
        float _1131 = _1125 * 6.283185482025146484375;
        float _1133 = sin(_1131);
        float _1135 = _1125 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1127 * 6.283185482025146484375;
        float _1141 = sin(_1139);
        float _1143 = _1129 * 6.283185482025146484375;
        float _1145 = sin(_1143);
        float _1147 = _1127 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1141 * _1137;
        float _1153 = _1133 * _1141;
        float _1155 = _1129 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = _1133 * _1145;
        float _1161 = _1137 * _1149;
        float _1163 = _1133 * _1149;
        float _1165 = -_1163;
        float _1167 = fma(_1145, _1151, _1165);
        float _1169 = _1137 * _1157;
        float _1171 = _1157 * _1149;
        float _1173 = -_1151;
        float _1175 = fma(_1149, _1159, _1173);
        float _1177 = _1141 * _1157;
        float _1179 = _1133 * _1157;
        float _1181 = fma(_1141, _1159, _1161);
        float _1183 = fma(_1145, _1161, _1153);
        float _1185 = -_1145;
        float _1187 = _1185 + (-0.0);
        _1095 = _1171;
        _1097 = _1177;
        _1099 = _1187;
        _1101 = _397;
        _1103 = _1175;
        _1105 = _1181;
        _1107 = _1179;
        _1109 = _399;
        _1111 = _1183;
        _1113 = _1167;
        _1115 = _1169;
        _1117 = _1157;
        _1119 = _1161;
        _1121 = _1129;
        _905 = _1151;
    }
    _1123 = false;
    float _1189 = _409;
    float _1191 = _1095;
    float _1193 = _1097;
    float _1195 = _1099;
    float _1197 = _1101;
    float _1199 = _1103;
    float _1201 = _1105;
    float _1203 = _1107;
    float _1205 = _1109;
    float _1207 = _1111;
    float _1209 = _1113;
    float _1211 = _1115;
    int _1213 = _411;
    int _1215 = _413;
    int _1217 = _415;
    float _1219 = _1117;
    float _1221 = _417;
    float _1223 = _1119;
    float _1225 = _1121;
    float _1227 = _905;
    float _1229 = _1189 * _1191;
    float _1231 = _1189 * _1193;
    float _1233 = _1189 * _1195;
    float _1235 = _1197 * _1199;
    float _1237 = _1197 * _1201;
    float _1239 = _1197 * _1203;
    int _1241 = _68 * 48;
    float _1243 = _1205 * _1207;
    float _1245 = _1205 * _1209;
    float _1247 = _1205 * _1211;
    bool _1249 = _68 != 0;
    uint _1251 = uint(int(uint(_1241) >> uint(2)));
    _37[int(_1251)] = as_type<uint>(_1229);
    int _1253 = _1241 + 4;
    uint _1255 = uint(int(uint(_1253) >> uint(2)));
    _37[int(_1255)] = as_type<uint>(_1235);
    int _1257 = _1241 + 8;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    _37[int(_1259)] = as_type<uint>(_1243);
    int _1261 = _1241 + 12;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    _37[int(_1263)] = uint(_1213);
    int _1265 = _68 * 112;
    int _1267 = _1241 + 16;
    uint _1269 = uint(int(uint(_1267) >> uint(2)));
    _37[int(_1269)] = as_type<uint>(_1231);
    int _1271 = _1241 + 20;
    uint _1273 = uint(int(uint(_1271) >> uint(2)));
    _37[int(_1273)] = as_type<uint>(_1237);
    int _1275 = _1241 + 24;
    uint _1277 = uint(int(uint(_1275) >> uint(2)));
    _37[int(_1277)] = as_type<uint>(_1245);
    int _1279 = _1241 + 28;
    uint _1281 = uint(int(uint(_1279) >> uint(2)));
    _37[int(_1281)] = uint(_1215);
    int _1283 = _1241 + 32;
    uint _1285 = uint(int(uint(_1283) >> uint(2)));
    _37[int(_1285)] = as_type<uint>(_1233);
    int _1287 = _1241 + 36;
    uint _1289 = uint(int(uint(_1287) >> uint(2)));
    _37[int(_1289)] = as_type<uint>(_1239);
    int _1291 = _1241 + 40;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    _37[int(_1293)] = as_type<uint>(_1247);
    int _1295 = _1241 + 44;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    _37[int(_1297)] = uint(_1217);
    float _1299 = _1227;
    float _1301 = _1225;
    float _1303 = _1223;
    float _1305 = _1221;
    float _1307 = _1189;
    float _1309 = _1205;
    float _1311 = _1219;
    float _1313 = _1197;
    float _1315 = _1239;
    float _1317 = _1247;
    float _1319 = as_type<float>(_1217);
    if (!_1249)
    {
        _1299 = _1229;
    }
    float _1321 = _1299;
    float _1323 = _1321;
    if (!_1249)
    {
        _1301 = _1235;
    }
    float _1325 = _1301;
    float _1327 = _1325;
    if (!_1249)
    {
        _1303 = _1243;
    }
    float _1329 = _1303;
    float _1331 = _1329;
    if (!_1249)
    {
        _1305 = as_type<float>(_1213);
    }
    float _1333 = _1305;
    float _1335 = _1333;
    if (!_1249)
    {
        _1307 = _1231;
    }
    float _1337 = _1307;
    float _1339 = _1337;
    if (!_1249)
    {
        _419 = _1237;
    }
    float _1341 = _419;
    float _1343 = _1341;
    if (!_1249)
    {
        _1309 = _1245;
    }
    float _1345 = _1309;
    float _1347 = _1345;
    if (!_1249)
    {
        _1311 = as_type<float>(_1215);
    }
    float _1349 = _1311;
    float _1351 = _1349;
    if (!_1249)
    {
        _1313 = _1233;
    }
    float _1353 = _1313;
    bool _1355 = !_1249;
    float _1357 = _1353;
    if (!_1355)
    {
        bool _1359 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1361 = !_1359;
        if (!_1361)
        {
            uint _1363 = uint(int(uint(_1265) >> uint(2)));
            uint _1365 = uint(int(uint(int(_1363)) >> uint(2)));
            int _1367 = int(_1363) & 3;
            float _1369 = (*spvDescriptorSet0.cp_c6)._m0[int(_1365)][_1367];
            int _1371 = as_type<int>(_1369) * 48;
            int _1373 = 0;
            bool _1375;
            float _1471;
            float _1475;
            float _1479;
            float _1483;
            float _1497;
            float _1499;
            float _1511;
            float _1521;
            float _1523;
            float _1525;
            float _1527;
            float _1529;
            do
            {
                int _1377 = _1373;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1379 = uint(int(uint(_1371) >> uint(2)));
                float _1381 = as_type<float>(_37[int(_1379)]);
                int _1383 = _1371 + 4;
                uint _1385 = uint(int(uint(_1383) >> uint(2)));
                float _1387 = as_type<float>(_37[int(_1385)]);
                int _1389 = _1371 + 8;
                uint _1391 = uint(int(uint(_1389) >> uint(2)));
                float _1393 = as_type<float>(_37[int(_1391)]);
                int _1395 = _1371 + 12;
                uint _1397 = uint(int(uint(_1395) >> uint(2)));
                float _1399 = as_type<float>(_37[int(_1397)]);
                int _1401 = _1377 + 1;
                int _1403 = _1371 + 16;
                uint _1405 = uint(int(uint(_1403) >> uint(2)));
                float _1407 = as_type<float>(_37[int(_1405)]);
                int _1409 = _1371 + 20;
                uint _1411 = uint(int(uint(_1409) >> uint(2)));
                float _1413 = as_type<float>(_37[int(_1411)]);
                int _1415 = _1371 + 24;
                uint _1417 = uint(int(uint(_1415) >> uint(2)));
                float _1419 = as_type<float>(_37[int(_1417)]);
                int _1421 = _1371 + 28;
                uint _1423 = uint(int(uint(_1421) >> uint(2)));
                float _1425 = as_type<float>(_37[int(_1423)]);
                bool _1427 = uint(_1401) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1429 = _1371 + 32;
                uint _1431 = uint(int(uint(_1429) >> uint(2)));
                float _1433 = as_type<float>(_37[int(_1431)]);
                int _1435 = _1371 + 36;
                uint _1437 = uint(int(uint(_1435) >> uint(2)));
                float _1439 = as_type<float>(_37[int(_1437)]);
                int _1441 = _1371 + 40;
                uint _1443 = uint(int(uint(_1441) >> uint(2)));
                float _1445 = as_type<float>(_37[int(_1443)]);
                int _1447 = _1371 + 44;
                uint _1449 = uint(int(uint(_1447) >> uint(2)));
                float _1451 = as_type<float>(_37[int(_1449)]);
                float _1453 = _1387 * as_type<float>(_1215);
                float _1455 = _1231 * _1387;
                float _1457 = _1237 * _1387;
                float _1459 = _1245 * _1387;
                float _1461 = fma(_1381, as_type<float>(_1213), _1453);
                float _1463 = fma(_1229, _1381, _1455);
                float _1465 = fma(_1235, _1381, _1457);
                float _1467 = fma(_1243, _1381, _1459);
                float _1469 = fma(_1393, as_type<float>(_1217), _1461);
                _1471 = fma(_1233, _1393, _1463);
                float _1473 = _1231 * _1413;
                _1475 = fma(_1247, _1393, _1467);
                float _1477 = _1413 * as_type<float>(_1215);
                _1479 = _1399 + _1469;
                float _1481 = _1237 * _1413;
                _1483 = fma(_1239, _1393, _1465);
                float _1485 = fma(_1407, as_type<float>(_1213), _1477);
                float _1487 = fma(_1229, _1407, _1473);
                float _1489 = fma(_1235, _1407, _1481);
                float _1491 = _1245 * _1413;
                float _1493 = fma(_1419, as_type<float>(_1217), _1485);
                float _1495 = _1439 * as_type<float>(_1215);
                _1497 = fma(_1233, _1419, _1487);
                _1499 = fma(_1239, _1419, _1489);
                float _1501 = _1231 * _1439;
                float _1503 = _1237 * _1439;
                float _1505 = _1245 * _1439;
                float _1507 = fma(_1433, as_type<float>(_1213), _1495);
                float _1509 = fma(_1243, _1407, _1491);
                _1511 = _1425 + _1493;
                float _1513 = fma(_1229, _1433, _1501);
                float _1515 = fma(_1235, _1433, _1503);
                float _1517 = fma(_1243, _1433, _1505);
                float _1519 = fma(_1445, as_type<float>(_1217), _1507);
                _1521 = fma(_1247, _1419, _1509);
                _1523 = fma(_1233, _1445, _1513);
                _1525 = fma(_1239, _1445, _1515);
                _1527 = fma(_1247, _1445, _1517);
                _1529 = _1451 + _1519;
                uint _1531 = uint(int(uint(_1241) >> uint(2)));
                _37[int(_1531)] = as_type<uint>(_1471);
                int _1533 = _1241 + 4;
                uint _1535 = uint(int(uint(_1533) >> uint(2)));
                _37[int(_1535)] = as_type<uint>(_1483);
                int _1537 = _1241 + 8;
                uint _1539 = uint(int(uint(_1537) >> uint(2)));
                _37[int(_1539)] = as_type<uint>(_1475);
                int _1541 = _1241 + 12;
                uint _1543 = uint(int(uint(_1541) >> uint(2)));
                _37[int(_1543)] = as_type<uint>(_1479);
                int _1545 = _1241 + 16;
                uint _1547 = uint(int(uint(_1545) >> uint(2)));
                _37[int(_1547)] = as_type<uint>(_1497);
                int _1549 = _1241 + 20;
                uint _1551 = uint(int(uint(_1549) >> uint(2)));
                _37[int(_1551)] = as_type<uint>(_1499);
                int _1553 = _1241 + 24;
                uint _1555 = uint(int(uint(_1553) >> uint(2)));
                _37[int(_1555)] = as_type<uint>(_1521);
                int _1557 = _1241 + 28;
                uint _1559 = uint(int(uint(_1557) >> uint(2)));
                _37[int(_1559)] = as_type<uint>(_1511);
                int _1561 = _1241 + 32;
                uint _1563 = uint(int(uint(_1561) >> uint(2)));
                _37[int(_1563)] = as_type<uint>(_1523);
                int _1565 = _1241 + 36;
                uint _1567 = uint(int(uint(_1565) >> uint(2)));
                _37[int(_1567)] = as_type<uint>(_1525);
                int _1569 = _1241 + 40;
                uint _1571 = uint(int(uint(_1569) >> uint(2)));
                _37[int(_1571)] = as_type<uint>(_1527);
                int _1573 = _1241 + 44;
                uint _1575 = uint(int(uint(_1573) >> uint(2)));
                _37[int(_1575)] = as_type<uint>(_1529);
                _1375 = !_1427;
                _1373 = _1401;
            } while (_1375);
            _1315 = _1525;
            _1327 = _1483;
            _1343 = _1499;
            _1357 = _1523;
            _1323 = _1471;
            _1339 = _1497;
            _1347 = _1521;
            _1317 = _1527;
            _1331 = _1475;
            _1351 = _1511;
            _1335 = _1479;
            _1319 = _1529;
            _1577 = true;
        }
        else
        {
            _1315 = 0.0;
            _1327 = 0.0;
            _1343 = 0.0;
            _1357 = 0.0;
            _1323 = 0.0;
            _1339 = 0.0;
            _1347 = 0.0;
            _1317 = 0.0;
            _1331 = 0.0;
            _1351 = 0.0;
            _1335 = 0.0;
            _1319 = 0.0;
        }
    }
    _1577 = false;
    float _1579 = _1315;
    float _1581 = _1327;
    float _1583 = _1343;
    float _1585 = _1357;
    float _1587 = _1323;
    float _1589 = _1339;
    float _1591 = _1347;
    float _1593 = _1317;
    float _1595 = _1331;
    float _1597 = _1351;
    float _1599 = _1335;
    float _1601 = _1319;
    int _1603 = _1265 + 80;
    uint _1605 = uint(int(uint(_1603) >> uint(2)));
    uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
    int _1609 = int(_1605) & 3;
    float _1611 = (*spvDescriptorSet0.cp_c6)._m0[int(_1607)][_1609];
    int _1613 = int(_1605) + 1;
    uint _1615 = uint(int(uint(_1613) >> uint(2)));
    int _1617 = _1613 & 3;
    float _1619 = (*spvDescriptorSet0.cp_c6)._m0[int(_1615)][_1617];
    int _1621 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1623 = _1621 + _68;
    int _1625 = _1265 + 64;
    uint _1627 = uint(int(uint(_1625) >> uint(2)));
    uint _1629 = uint(int(uint(int(_1627)) >> uint(2)));
    int _1631 = int(_1627) & 3;
    float _1633 = (*spvDescriptorSet0.cp_c6)._m0[int(_1629)][_1631];
    int _1635 = int(_1627) + 1;
    uint _1637 = uint(int(uint(_1635) >> uint(2)));
    int _1639 = _1635 & 3;
    float _1641 = (*spvDescriptorSet0.cp_c6)._m0[int(_1637)][_1639];
    int _1643 = _1623 * 48;
    int _1645 = _1265 + 88;
    uint _1647 = uint(int(uint(_1645) >> uint(2)));
    uint _1649 = uint(int(uint(int(_1647)) >> uint(2)));
    int _1651 = int(_1647) & 3;
    float _1653 = (*spvDescriptorSet0.cp_c6)._m0[int(_1649)][_1651];
    int _1655 = int(_1647) + 1;
    uint _1657 = uint(int(uint(_1655) >> uint(2)));
    int _1659 = _1655 & 3;
    float _1661 = (*spvDescriptorSet0.cp_c6)._m0[int(_1657)][_1659];
    int _1663 = _1265 + 72;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    uint _1667 = uint(int(uint(int(_1665)) >> uint(2)));
    int _1669 = int(_1665) & 3;
    float _1671 = (*spvDescriptorSet0.cp_c6)._m0[int(_1667)][_1669];
    int _1673 = int(_1665) + 1;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    int _1677 = _1673 & 3;
    float _1679 = (*spvDescriptorSet0.cp_c6)._m0[int(_1675)][_1677];
    int _1681 = _1265 + 96;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    uint _1685 = uint(int(uint(int(_1683)) >> uint(2)));
    int _1687 = int(_1683) & 3;
    float _1689 = (*spvDescriptorSet0.cp_c6)._m0[int(_1685)][_1687];
    int _1691 = int(_1683) + 1;
    uint _1693 = uint(int(uint(_1691) >> uint(2)));
    int _1695 = _1691 & 3;
    float _1697 = (*spvDescriptorSet0.cp_c6)._m0[int(_1693)][_1695];
    int _1699 = _1265 + 104;
    uint _1701 = uint(int(uint(_1699) >> uint(2)));
    uint _1703 = uint(int(uint(int(_1701)) >> uint(2)));
    int _1705 = int(_1701) & 3;
    float _1707 = (*spvDescriptorSet0.cp_c6)._m0[int(_1703)][_1705];
    int _1709 = int(_1701) + 1;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    int _1713 = _1709 & 3;
    float _1715 = (*spvDescriptorSet0.cp_c6)._m0[int(_1711)][_1713];
    float _1717 = _1579 * _1611;
    int _1719 = _1265 + 16;
    uint _1721 = uint(int(uint(_1719) >> uint(2)));
    uint _1723 = uint(int(uint(int(_1721)) >> uint(2)));
    int _1725 = int(_1721) & 3;
    float _1727 = (*spvDescriptorSet0.cp_c6)._m0[int(_1723)][_1725];
    int _1729 = int(_1721) + 1;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    int _1733 = _1729 & 3;
    float _1735 = (*spvDescriptorSet0.cp_c6)._m0[int(_1731)][_1733];
    float _1737 = _1581 * _1611;
    float _1739 = _1583 * _1611;
    float _1741 = _1583 * _1619;
    float _1743 = fma(_1585, _1633, _1717);
    float _1745 = _1579 * _1619;
    int _1747 = _1265 + 32;
    uint _1749 = uint(int(uint(_1747) >> uint(2)));
    uint _1751 = uint(int(uint(int(_1749)) >> uint(2)));
    int _1753 = int(_1749) & 3;
    float _1755 = (*spvDescriptorSet0.cp_c6)._m0[int(_1751)][_1753];
    int _1757 = int(_1749) + 1;
    uint _1759 = uint(int(uint(_1757) >> uint(2)));
    int _1761 = _1757 & 3;
    float _1763 = (*spvDescriptorSet0.cp_c6)._m0[int(_1759)][_1761];
    float _1765 = fma(_1587, _1633, _1737);
    float _1767 = fma(_1589, _1633, _1739);
    float _1769 = fma(_1589, _1641, _1741);
    float _1771 = _1581 * _1619;
    float _1773 = fma(_1585, _1641, _1745);
    float _1775 = _1581 * _1653;
    float _1777 = _1583 * _1653;
    int _1779 = _1265 + 48;
    uint _1781 = uint(int(uint(_1779) >> uint(2)));
    uint _1783 = uint(int(uint(int(_1781)) >> uint(2)));
    int _1785 = int(_1781) & 3;
    float _1787 = (*spvDescriptorSet0.cp_c6)._m0[int(_1783)][_1785];
    int _1789 = int(_1781) + 1;
    uint _1791 = uint(int(uint(_1789) >> uint(2)));
    int _1793 = _1789 & 3;
    float _1795 = (*spvDescriptorSet0.cp_c6)._m0[int(_1791)][_1793];
    float _1797 = _1581 * _1661;
    float _1799 = _1583 * _1661;
    float _1801 = _1579 * _1653;
    float _1803 = _1579 * _1661;
    float _1805 = fma(_1587, _1641, _1771);
    float _1807 = fma(_1589, _1671, _1777);
    float _1809 = fma(_1589, _1679, _1799);
    int _1811 = _1265 + 24;
    uint _1813 = uint(int(uint(_1811) >> uint(2)));
    uint _1815 = uint(int(uint(int(_1813)) >> uint(2)));
    int _1817 = int(_1813) & 3;
    float _1819 = (*spvDescriptorSet0.cp_c6)._m0[int(_1815)][_1817];
    int _1821 = int(_1813) + 1;
    uint _1823 = uint(int(uint(_1821) >> uint(2)));
    int _1825 = _1821 & 3;
    float _1827 = (*spvDescriptorSet0.cp_c6)._m0[int(_1823)][_1825];
    float _1829 = fma(_1587, _1671, _1775);
    float _1831 = fma(_1587, _1679, _1797);
    float _1833 = fma(_1585, _1671, _1801);
    float _1835 = fma(_1585, _1679, _1803);
    float _1837 = fma(_1591, _1689, _1767);
    float _1839 = fma(_1591, _1697, _1769);
    int _1841 = _1265 + 40;
    uint _1843 = uint(int(uint(_1841) >> uint(2)));
    uint _1845 = uint(int(uint(int(_1843)) >> uint(2)));
    int _1847 = int(_1843) & 3;
    float _1849 = (*spvDescriptorSet0.cp_c6)._m0[int(_1845)][_1847];
    int _1851 = int(_1843) + 1;
    uint _1853 = uint(int(uint(_1851) >> uint(2)));
    int _1855 = _1851 & 3;
    float _1857 = (*spvDescriptorSet0.cp_c6)._m0[int(_1853)][_1855];
    float _1859 = fma(_1593, _1689, _1743);
    float _1861 = fma(_1595, _1689, _1765);
    float _1863 = fma(_1595, _1697, _1805);
    float _1865 = fma(_1593, _1697, _1773);
    float _1867 = fma(_1591, _1707, _1807);
    float _1869 = fma(_1591, _1715, _1809);
    int _1871 = _1265 + 56;
    uint _1873 = uint(int(uint(_1871) >> uint(2)));
    uint _1875 = uint(int(uint(int(_1873)) >> uint(2)));
    int _1877 = int(_1873) & 3;
    float _1879 = (*spvDescriptorSet0.cp_c6)._m0[int(_1875)][_1877];
    int _1881 = int(_1873) + 1;
    uint _1883 = uint(int(uint(_1881) >> uint(2)));
    int _1885 = _1881 & 3;
    float _1887 = (*spvDescriptorSet0.cp_c6)._m0[int(_1883)][_1885];
    float _1889 = fma(_1595, _1707, _1829);
    float _1891 = fma(_1595, _1715, _1831);
    float _1893 = _1869 + _1597;
    float _1895 = fma(_1593, _1715, _1835);
    float _1897 = fma(_1593, _1707, _1833);
    float _1899 = _1891 + _1599;
    float _1901 = _1893 * _1735;
    float _1903 = _1895 + _1601;
    float _1905 = _1837 * _1735;
    float _1907 = _1839 * _1735;
    float _1909 = fma(_1899, _1727, _1901);
    float _1911 = _1867 * _1735;
    float _1913 = fma(_1861, _1727, _1905);
    float _1915 = fma(_1863, _1727, _1907);
    float _1917 = _1837 * _1763;
    float _1919 = _1893 * _1763;
    float _1921 = _1839 * _1763;
    float _1923 = _1867 * _1763;
    float _1925 = fma(_1861, _1755, _1917);
    float _1927 = fma(_1899, _1755, _1919);
    float _1929 = fma(_1889, _1727, _1911);
    float _1931 = fma(_1889, _1755, _1923);
    float _1933 = _1837 * _1795;
    float _1935 = _1893 * _1795;
    float _1937 = _1839 * _1795;
    float _1939 = _1867 * _1795;
    float _1941 = fma(_1861, _1787, _1933);
    float _1943 = fma(_1899, _1787, _1935);
    float _1945 = fma(_1863, _1787, _1937);
    float _1947 = fma(_1889, _1787, _1939);
    float _1949 = fma(_1903, _1819, _1909);
    float _1951 = fma(_1863, _1755, _1921);
    float _1953 = fma(_1865, _1819, _1915);
    float _1955 = fma(_1859, _1819, _1913);
    float _1957 = _1949 + _1827;
    float _1959 = fma(_1897, _1819, _1929);
    float _1961 = fma(_1903, _1849, _1927);
    float _1963 = fma(_1859, _1849, _1925);
    float _1965 = fma(_1897, _1849, _1931);
    float _1967 = fma(_1865, _1849, _1951);
    float _1969 = _1961 + _1857;
    float _1971 = fma(_1903, _1879, _1943);
    float _1973 = fma(_1859, _1879, _1941);
    float _1975 = fma(_1865, _1879, _1945);
    float _1977 = fma(_1897, _1879, _1947);
    int _1979 = _1643 + 16;
    float _1981 = _1971 + _1887;
    int _1983 = _1643 + 32;
    int _1985 = _1643 + 48;
    uint _1987 = uint(int(uint(_1979) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1987)] = as_type<uint>(_1955);
    int _1989 = _1979 + 4;
    uint _1991 = uint(int(uint(_1989) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1991)] = as_type<uint>(_1953);
    int _1993 = _1979 + 8;
    uint _1995 = uint(int(uint(_1993) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1995)] = as_type<uint>(_1959);
    int _1997 = _1979 + 12;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1999)] = as_type<uint>(_1957);
    uint _2001 = uint(int(uint(_1983) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2001)] = as_type<uint>(_1963);
    int _2003 = _1983 + 4;
    uint _2005 = uint(int(uint(_2003) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2005)] = as_type<uint>(_1967);
    int _2007 = _1983 + 8;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2009)] = as_type<uint>(_1965);
    int _2011 = _1983 + 12;
    uint _2013 = uint(int(uint(_2011) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2013)] = as_type<uint>(_1969);
    uint _2015 = uint(int(uint(_1985) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2015)] = as_type<uint>(_1973);
    int _2017 = _1985 + 4;
    uint _2019 = uint(int(uint(_2017) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2019)] = as_type<uint>(_1975);
    int _2021 = _1985 + 8;
    uint _2023 = uint(int(uint(_2021) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2023)] = as_type<uint>(_1977);
    int _2025 = _1985 + 12;
    uint _2027 = uint(int(uint(_2025) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_2027)] = as_type<uint>(_1981);
}

