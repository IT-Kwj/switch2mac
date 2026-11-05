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
    constant _16* cp_c4 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c6 [[id(3)]];
    constant _16* cp_c3 [[id(4)]];
    device _29* cp_s0 [[id(5)]];
    texture2d_array<float> cp_t_tcb_A [[id(6)]];
    sampler cp_t_tcb_ASmplr [[id(7)]];
    texture2d_array<float> cp_t_tcb_8 [[id(8)]];
    sampler cp_t_tcb_8Smplr [[id(9)]];
};

static inline __attribute__((always_inline))
int _58(thread const int& _5357, thread const int& _5358, constant _10& support_buffer)
{
    int _5361 = 1 + _5358;
    float _5363 = support_buffer._m5[_5361].x;
    bool _5365 = _5363 == 1.0;
    if (_5365)
    {
        return _5357;
    }
    float _5367 = float(_5357);
    float _5369 = _5367 * _5363;
    int _5371 = int(_5369);
    return _5371;
}

static inline __attribute__((always_inline))
void _56(thread const int& _5044, thread const int& _5045, thread const int& _5046, thread const int& _5047, thread const int& _5048, thread int& _5049, thread int& _5050, thread int& _5051, thread int& _5052, thread int& _5053, thread int& _5054)
{
    float _5057 = as_type<float>(_5047) + 0.0;
    bool _5059 = _5057 != 0.0;
    bool _5061 = isnan(_5057);
    bool _5063 = _5059 || _5061;
    bool _5065 = isnan(0.0);
    bool _5067 = _5063 || _5065;
    int _5069 = as_type<int>(_5057);
    int _5071 = _5045;
    int _5073 = _5046;
    int _5075 = _5067 ? (-1) : 0;
    if (!_5067)
    {
        float _5077 = as_type<float>(_5047) * 1.0;
        _5069 = as_type<int>(_5077);
    }
    int _5079 = _5069;
    bool _5081 = !_5067;
    int _5083 = _5079;
    if (!_5081)
    {
        float _5085 = as_type<float>(_5047) + 0.0;
        bool _5087 = _5085 >= 0.0;
        bool _5089 = isnan(_5085);
        bool _5091 = _5087 || _5089;
        bool _5093 = isnan(0.0);
        bool _5095 = _5091 || _5093;
        int _5097 = as_type<int>(_5085);
        _5075 = _5095 ? (-1) : 0;
        if (!_5095)
        {
            _5097 = 2147483647;
        }
        int _5099 = _5097;
        bool _5101 = !_5095;
        _5083 = _5099;
        if (!_5101)
        {
            float _5103 = as_type<float>(_5047) + 0.0;
            bool _5105 = _5103 > as_type<float>(0x7f800000u /* inf */);
            bool _5107 = isnan(_5103);
            bool _5109 = _5105 || _5107;
            bool _5111 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _5113 = _5109 || _5111;
            int _5115 = as_type<int>(_5103);
            _5075 = _5113 ? (-1) : 0;
            if (_5113)
            {
                float _5117 = as_type<float>(_5047) + 1.0;
                _5115 = as_type<int>(_5117);
            }
            int _5119 = _5115;
            _5083 = _5119;
            if (!_5113)
            {
                float _5121 = 0.0 + as_type<float>(_5047);
                bool _5123 = _5121 != as_type<float>(0x7f800000u /* inf */);
                bool _5125 = isnan(_5121);
                bool _5127 = _5123 || _5125;
                bool _5129 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _5131 = _5127 || _5129;
                int _5133 = as_type<int>(_5121);
                _5075 = _5131 ? (-1) : 0;
                if (!_5131)
                {
                    _5133 = _5047;
                }
                int _5135 = _5133;
                bool _5137 = !_5131;
                _5083 = _5135;
                if (!_5137)
                {
                    float _5139 = as_type<float>(_5047) * 18446744073709551616.0;
                    float _5141 = rsqrt(_5139);
                    float _5143 = _5139 * _5141;
                    float _5145 = _5141 * 0.5;
                    float _5147 = -_5143;
                    float _5149 = 0.0 + _5147;
                    float _5151 = fma(_5145, _5149, 0.5);
                    float _5153 = fma(_5143, _5151, _5143);
                    float _5155 = -_5153;
                    float _5157 = 0.0 + _5155;
                    float _5159 = fma(_5153, _5157, _5139);
                    float _5161 = fma(_5145, _5159, _5153);
                    float _5163 = _5161 * 2.3283064365386962890625e-10;
                    _5083 = as_type<int>(_5163);
                    _5071 = as_type<int>(_5149);
                    _5073 = as_type<int>(_5153);
                }
            }
        }
    }
    int _5165 = _5083;
    int _5167 = _5071;
    int _5169 = _5073;
    int _5171 = _5075;
    _5049 = _5165;
    _5050 = _5048;
    _5051 = 0;
    _5052 = _5167;
    _5053 = _5169;
    _5054 = _5171;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1231 = false;
    bool _1033 = false;
    bool _717 = false;
    float _62 = as_type<float>(gl_WorkGroupID.x);
    float _64 = as_type<float>(gl_LocalInvocationID.x);
    int _66 = as_type<int>(_62) << 6;
    int _68 = _66 + as_type<int>(_64);
    bool _72 = uint(_68) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].z);
    if (_72)
    {
        return;
    }
    bool _74 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _76 = _68 + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].w);
    int _78 = _76 << 4;
    bool _80 = !_74;
    if (!_80)
    {
        int _82 = 0;
        int _84 = 0;
        int _86 = 0;
        float _88 = 0.0;
        float _90 = 0.0;
        float _92 = 0.0;
        float _94 = 0.0;
        float _96 = 0.0;
        float _98 = 0.0;
        float _100 = 0.0;
        float _102 = 0.0;
        float _104 = 0.0;
        float _106 = 0.0;
        float _108 = 0.0;
        float _110 = 0.0;
        float _112 = 0.0;
        float _114 = 0.0;
        int _116 = 0;
        int _118 = 0;
        int _120 = 0;
        int _122 = 0;
        int _124 = 0;
        int _126 = 0;
        int _701;
        int _703;
        int _705;
        int _707;
        int _709;
        int _711;
        float _713;
        float _715;
        float _999;
        float _1001;
        float _1003;
        float _1005;
        float _1007;
        float _1009;
        float _1011;
        float _1013;
        float _1015;
        float _1017;
        float _1019;
        float _1021;
        float _1023;
        float _1025;
        int _1027;
        int _1029;
        int _1031;
        do
        {
            int _128 = _82;
            int _130 = _84;
            int _132 = _86;
            float _134 = _88;
            float _136 = _90;
            float _138 = _92;
            float _140 = _94;
            float _142 = _96;
            float _144 = _98;
            float _146 = _100;
            float _148 = _102;
            float _150 = _104;
            float _152 = _106;
            float _154 = _108;
            float _156 = _110;
            float _158 = _112;
            float _160 = _114;
            int _162 = _116;
            int _164 = _118;
            int _166 = _120;
            int _168 = _122;
            int _170 = _124;
            int _172 = _126;
            uint _175 = uint(int(uint(_78) >> uint(2)));
            uint _177 = uint(int(uint(int(_175)) >> uint(2)));
            int _179 = int(_175) & 3;
            float _181 = (*spvDescriptorSet0.cp_c4)._m0[int(_177)][_179];
            int _183 = _128 & 31;
            bool _185 = _183 == 0;
            bool _187 = uint(_183) < 32u;
            int _189 = 32 - _183;
            int _191 = _183 - 32;
            int _193 = 1 << _183;
            uint _195 = uint(int(uint(0) >> uint(_189)));
            int _197 = _193 | int(_195);
            int _199 = _185 ? 1 : _197;
            bool _201 = uint(_191) < 32u;
            int _203 = 0 << _191;
            int _205 = _201 ? _203 : 0;
            int _207 = _187 ? _199 : _205;
            int _209 = as_type<int>(_181) * 48;
            int _211 = _209 + 36;
            uint _213 = uint(int(uint(_211) >> uint(2)));
            uint _215 = uint(int(uint(int(_213)) >> uint(2)));
            int _217 = int(_213) & 3;
            float _219 = (*spvDescriptorSet0.cp_c5)._m0[int(_215)][_217];
            int _221 = _209 + 32;
            uint _223 = uint(int(uint(_221) >> uint(2)));
            uint _225 = uint(int(uint(int(_223)) >> uint(2)));
            int _227 = int(_223) & 3;
            float _229 = (*spvDescriptorSet0.cp_c5)._m0[int(_225)][_227];
            int _231 = _207 & as_type<int>(_219);
            bool _233 = _231 != 0;
            int _235 = _207 & as_type<int>(_229);
            bool _237 = _235 != 0;
            int _239 = _130;
            float _241 = _219;
            float _243 = _140;
            float _245 = _229;
            float _247 = _150;
            float _249 = _154;
            float _251 = _152;
            float _253 = _160;
            float _255 = _156;
            float _257 = _158;
            float _259 = _148;
            float _261 = as_type<float>(_128);
            int _263 = _162;
            int _265 = _164;
            int _267 = _166;
            int _269 = _168;
            int _271 = _170;
            int _273 = _172;
            if (_233)
            {
                int _275 = _209 + 8;
                uint _277 = uint(int(uint(_275) >> uint(2)));
                uint _279 = uint(int(uint(int(_277)) >> uint(2)));
                int _281 = int(_277) & 3;
                float _283 = (*spvDescriptorSet0.cp_c5)._m0[int(_279)][_281];
                _239 = as_type<int>(_283);
            }
            int _285 = _239;
            if (_233)
            {
                _241 = 1.4012984643248170709237295832899e-45;
            }
            float _287 = _241;
            int _289 = _132;
            float _291 = _287;
            if (_237)
            {
                uint _293 = uint(int(uint(_209) >> uint(2)));
                uint _295 = uint(int(uint(int(_293)) >> uint(2)));
                int _297 = int(_293) & 3;
                float _299 = (*spvDescriptorSet0.cp_c5)._m0[int(_295)][_297];
                _289 = as_type<int>(_299);
            }
            int _301 = _289;
            if (_237)
            {
                _243 = 2.8025969286496341418474591665798e-45;
            }
            float _303 = _243;
            if (_237)
            {
                _245 = 1.4012984643248170709237295832899e-45;
            }
            float _305 = _245;
            float _307 = as_type<float>(_285);
            float _309 = _134;
            float _311 = _136;
            if (_233)
            {
                int _313 = _128;
                int _315 = 0;
                int _317 = _58(_313, _315, (*spvDescriptorSet0.support_buffer));
                int _319 = _285;
                int _321 = 0;
                int _323 = _58(_319, _321, (*spvDescriptorSet0.support_buffer));
                int3 _2327 = int3(_317, _323, as_type<int>(_287));
                float3 _327 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2327.xy), uint(_2327.z), 0).xyz;
                float _329 = _327.x;
                float _331 = _327.y;
                float _333 = _327.z;
                _307 = _329;
                _309 = _331;
                _311 = _333;
            }
            float _335 = _307;
            float _337 = _309;
            float _339 = _311;
            float _341 = 0.0;
            float _343 = as_type<float>(_128);
            float _345 = _138;
            if (_237)
            {
                int _347 = _128;
                int _349 = 1;
                int _351 = _58(_347, _349, (*spvDescriptorSet0.support_buffer));
                int _353 = _301;
                int _355 = 1;
                int _357 = _58(_353, _355, (*spvDescriptorSet0.support_buffer));
                int3 _2356 = int3(_351, _357, 0);
                float3 _359 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2356.xy), uint(_2356.z), 0).xyz;
                float _361 = _359.x;
                float _363 = _359.y;
                float _365 = _359.z;
                _341 = _361;
                _343 = _363;
                _345 = _365;
            }
            float _367 = _341;
            float _369 = _343;
            float _371 = _345;
            float _373 = _303;
            float _375 = as_type<float>(_128);
            float _377 = _142;
            if (_237)
            {
                int _379 = _128;
                int _381 = 1;
                int _383 = _58(_379, _381, (*spvDescriptorSet0.support_buffer));
                int _385 = _301;
                int _387 = 1;
                int _389 = _58(_385, _387, (*spvDescriptorSet0.support_buffer));
                int3 _2388 = int3(_383, _389, as_type<int>(_303));
                float3 _391 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2388.xy), uint(_2388.z), 0).xyz;
                float _393 = _391.x;
                float _395 = _391.y;
                float _397 = _391.z;
                _373 = _393;
                _375 = _395;
                _377 = _397;
            }
            float _399 = _373;
            float _401 = _375;
            float _403 = _377;
            float _405 = _144;
            float _407 = _146;
            float _409 = _305;
            if (_237)
            {
                int _411 = _128;
                int _413 = 1;
                int _415 = _58(_411, _413, (*spvDescriptorSet0.support_buffer));
                int _417 = _301;
                int _419 = 1;
                int _421 = _58(_417, _419, (*spvDescriptorSet0.support_buffer));
                int3 _2419 = int3(_415, _421, as_type<int>(_305));
                float3 _423 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2419.xy), uint(_2419.z), 0).xyz;
                float _425 = _423.x;
                float _427 = _423.y;
                float _429 = _423.z;
                _405 = _425;
                _407 = _427;
                _409 = _429;
            }
            float _431 = _405;
            float _433 = _407;
            float _435 = _409;
            if (!_237)
            {
                _247 = 0.0;
                _249 = 0.0;
            }
            float _437 = _247;
            float _439 = _249;
            float _441 = _437;
            float _443 = _439;
            if (!_237)
            {
                _251 = 0.0;
                _253 = 0.0;
            }
            float _445 = _251;
            float _447 = _253;
            float _449 = _445;
            float _451 = _447;
            if (!_237)
            {
                _255 = 0.0;
                _257 = 0.0;
            }
            float _453 = _255;
            float _455 = _257;
            float _457 = _453;
            float _459 = _455;
            if (!_237)
            {
                _259 = 0.0;
            }
            float _461 = _259;
            float _463 = _461;
            if (!_237)
            {
                _291 = 0.0;
                _261 = 0.0;
            }
            float _465 = _291;
            float _467 = _261;
            bool _469 = !_237;
            float _471 = _465;
            float _473 = _467;
            if (!_469)
            {
                _471 = _435;
                _473 = _433;
                _463 = _431;
                _441 = _367;
                _449 = _369;
                _443 = _371;
                _457 = _399;
                _459 = _401;
                _451 = _403;
            }
            float _475 = _471;
            float _477 = _473;
            float _479 = _463;
            float _481 = _441;
            float _483 = _449;
            float _485 = _443;
            float _487 = _457;
            float _489 = _459;
            float _491 = _451;
            bool _493 = !_233;
            _114 = _491;
            float _495 = _481;
            float _497 = _483;
            float _499 = _485;
            float _501 = _481;
            float _503 = _483;
            float _505 = _485;
            if (!_493)
            {
                float _507 = _475 * 0.5;
                float _509 = _477 * 0.5;
                float _511 = _339 * 0.5;
                float _513 = _337 * 0.5;
                float _515 = _507 * 0.15915493667125701904296875;
                float _517 = _509 * 0.15915493667125701904296875;
                float _519 = _479 * 0.5;
                float _521 = _511 * 0.15915493667125701904296875;
                float _523 = _513 * 0.15915493667125701904296875;
                float _525 = _335 * 0.5;
                float _527 = _515 * 6.283185482025146484375;
                float _529 = cos(_527);
                float _531 = _519 * 0.15915493667125701904296875;
                float _533 = _525 * 0.15915493667125701904296875;
                float _535 = _517 * 6.283185482025146484375;
                float _537 = cos(_535);
                float _539 = _515 * 6.283185482025146484375;
                float _541 = sin(_539);
                float _543 = _521 * 6.283185482025146484375;
                float _545 = sin(_543);
                float _547 = _529 * _537;
                float _549 = _523 * 6.283185482025146484375;
                float _551 = cos(_549);
                float _553 = _537 * _541;
                float _555 = _517 * 6.283185482025146484375;
                float _557 = sin(_555);
                float _559 = _521 * 6.283185482025146484375;
                float _561 = cos(_559);
                float _563 = _551 * _545;
                float _565 = _531 * 6.283185482025146484375;
                float _567 = sin(_565);
                float _569 = _523 * 6.283185482025146484375;
                float _571 = sin(_569);
                float _573 = _561 * _551;
                float _575 = _533 * 6.283185482025146484375;
                float _577 = sin(_575);
                float _579 = _567 * _553;
                float _581 = _531 * 6.283185482025146484375;
                float _583 = cos(_581);
                float _585 = _561 * _571;
                float _587 = _545 * _571;
                float _589 = _533 * 6.283185482025146484375;
                float _591 = cos(_589);
                float _593 = _529 * _557;
                float _595 = _541 * _557;
                float _597 = _577 * _563;
                float _599 = _567 * _595;
                float _601 = _583 * _595;
                float _603 = fma(_583, _593, _579);
                float _605 = _567 * _593;
                float _607 = _591 * _587;
                float _609 = fma(_591, _585, _597);
                float _611 = -_601;
                float _613 = fma(_567, _547, _611);
                float _615 = _577 * _585;
                float _617 = -_607;
                float _619 = fma(_577, _573, _617);
                float _621 = _603 * _609;
                float _623 = _577 * _587;
                float _625 = -_605;
                float _627 = fma(_583, _553, _625);
                float _629 = -_615;
                float _631 = fma(_591, _563, _629);
                float _633 = fma(_613, _619, _621);
                float _635 = fma(_583, _547, _599);
                float _637 = fma(_591, _573, _623);
                float _639 = fma(_627, _631, _633);
                float _641 = fma(_635, _637, _639);
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
                _267 = as_type<int>(_613);
                _269 = as_type<int>(_619);
                _271 = as_type<int>(_609);
                _273 = as_type<int>(_631);
                if (!_689)
                {
                    int _691 = as_type<int>(_583);
                    int _693 = as_type<int>(_661);
                    int _695 = as_type<int>(_601);
                    int _697 = as_type<int>(_671);
                    int _699 = 1888;
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
                int _745 = _209 + 8;
                uint _747 = uint(int(uint(_745) >> uint(2)));
                uint _749 = uint(int(uint(int(_747)) >> uint(2)));
                int _751 = int(_747) & 3;
                float _753 = (*spvDescriptorSet0.cp_c5)._m0[int(_749)][_751];
                int _755 = _128;
                int _757 = 0;
                int _759 = _58(_755, _757, (*spvDescriptorSet0.support_buffer));
                int _761 = as_type<int>(_753);
                int _763 = 0;
                int _765 = _58(_761, _763, (*spvDescriptorSet0.support_buffer));
                int3 _2839 = int3(_759, _765, 0);
                float3 _767 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2839.xy), uint(_2839.z), 0).xyz;
                float _769 = _767.x;
                float _771 = _767.y;
                float _773 = _767.z;
                int _775 = _128;
                int _777 = 0;
                int _779 = _58(_775, _777, (*spvDescriptorSet0.support_buffer));
                int _781 = as_type<int>(_753);
                int _783 = 0;
                int _785 = _58(_781, _783, (*spvDescriptorSet0.support_buffer));
                int3 _2857 = int3(_779, _785, 2);
                float3 _787 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2857.xy), uint(_2857.z), 0).xyz;
                float _789 = _787.x;
                float _791 = _787.y;
                float _793 = _787.z;
                float _795 = _687 * _741;
                float _797 = _665 * 2.0;
                int _799 = _209 + 20;
                uint _801 = uint(int(uint(_799) >> uint(2)));
                uint _803 = uint(int(uint(int(_801)) >> uint(2)));
                int _805 = int(_801) & 3;
                float _807 = (*spvDescriptorSet0.cp_c5)._m0[int(_803)][_805];
                float _809 = -_797;
                float _811 = fma(_795, _809, _795);
                float _813 = fma(_665, 3.1415927410125732421875, _811);
                float _815 = _813 * 0.15915493667125701904296875;
                float _817 = _815 * 6.283185482025146484375;
                float _819 = sin(_817);
                float _821 = abs(_819);
                bool _823 = _821 >= 0.001000000047497451305389404296875;
                bool _825 = isnan(_821);
                bool _827 = _823 || _825;
                bool _829 = isnan(0.001000000047497451305389404296875);
                bool _831 = _827 || _829;
                float _833 = _533;
                float _835 = _743;
                float _837 = _795;
                if (!_831)
                {
                    int _839 = _209 + 28;
                    uint _841 = uint(int(uint(_839) >> uint(2)));
                    uint _843 = uint(int(uint(int(_841)) >> uint(2)));
                    int _845 = int(_841) & 3;
                    float _847 = (*spvDescriptorSet0.cp_c5)._m0[int(_843)][_845];
                    _833 = _847;
                }
                float _849 = _833;
                float _851 = _849;
                if (!_831)
                {
                    float _853 = -_849;
                    float _855 = _853 + 1.0;
                    _835 = _855;
                }
                float _857 = _835;
                float _859 = _857;
                if (!_831)
                {
                    _837 = _849;
                }
                float _861 = _837;
                bool _863 = !_831;
                float _865 = _861;
                _265 = as_type<int>(_807);
                if (!_863)
                {
                    int _867 = _209 + 28;
                    uint _869 = uint(int(uint(_867) >> uint(2)));
                    uint _871 = uint(int(uint(int(_869)) >> uint(2)));
                    int _873 = int(_869) & 3;
                    float _875 = (*spvDescriptorSet0.cp_c5)._m0[int(_871)][_873];
                    float _877 = 1.0 / _819;
                    float _879 = _813 * _875;
                    float _881 = _879 * 0.15915493667125701904296875;
                    float _883 = -_879;
                    float _885 = _813 + _883;
                    float _887 = _885 * 0.15915493667125701904296875;
                    float _889 = _881 * 6.283185482025146484375;
                    float _891 = sin(_889);
                    float _893 = _887 * 6.283185482025146484375;
                    float _895 = sin(_893);
                    float _897 = _891 * _877;
                    float _899 = _895 * _877;
                    _865 = _897;
                    _851 = _875;
                    _859 = _899;
                }
                float _901 = _865;
                float _903 = _851;
                float _905 = _859;
                bool _907 = !_655;
                float _909 = -_901;
                float _911 = _907 ? _909 : _901;
                float _913 = _773 * _903;
                float _915 = _789 * _903;
                float _917 = _791 * _903;
                float _919 = _793 * _903;
                float _921 = _637 * _911;
                float _923 = _619 * _911;
                float _925 = _609 * _911;
                float _927 = _631 * _911;
                float _929 = fma(_635, _905, _921);
                float _931 = fma(_613, _905, _923);
                float _933 = fma(_603, _905, _925);
                float _935 = fma(_627, _905, _927);
                float _937 = _929 * 2.0;
                float _939 = _931 * 2.0;
                float _941 = _931 * _931;
                float _943 = _935 * _937;
                float _945 = _933 * _933;
                float _947 = _931 * _937;
                float _949 = _933 * _937;
                float _951 = _933 * 2.0;
                float _953 = -_943;
                float _955 = fma(_933, _939, _953);
                float _957 = fma(_933, _939, _943);
                float _959 = _935 * _935;
                float _961 = fma(_941, -2.0, 1.0);
                float _963 = fma(_945, -2.0, 1.0);
                float _965 = fma(_935, _939, _949);
                float _967 = -_949;
                float _969 = fma(_935, _939, _967);
                float _971 = -_947;
                float _973 = fma(_935, _951, _971);
                float _975 = fma(_935, _951, _947);
                float _977 = fma(_959, -2.0, _963);
                float _979 = _769 * _903;
                float _981 = _771 * _903;
                float _983 = fma(_959, -2.0, _961);
                float _985 = fma(_945, -2.0, _961);
                float _987 = fma(_481, _807, _979);
                float _989 = fma(_483, _807, _981);
                float _991 = fma(_485, _807, _913);
                float _993 = fma(_487, _807, _915);
                float _995 = fma(_489, _807, _917);
                float _997 = fma(_491, _807, _919);
                _999 = _997;
                _1001 = _993;
                _1003 = _957;
                _1005 = _965;
                _1007 = _973;
                _495 = _987;
                _497 = _989;
                _499 = _991;
                _501 = _987;
                _1009 = _969;
                _1011 = _977;
                _1013 = _957;
                _503 = _989;
                _1015 = _955;
                _1017 = _983;
                _1019 = _975;
                _505 = _991;
                _1021 = _965;
                _1023 = _973;
                _1025 = _985;
                _1027 = as_type<int>(_993);
                _1029 = as_type<int>(_995);
                _1031 = as_type<int>(_997);
                _263 = as_type<int>(_903);
                _1033 = true;
            }
            else
            {
                float _1035 = _479 * 0.15915493667125701904296875;
                float _1037 = _475 * 0.15915493667125701904296875;
                float _1039 = _477 * 0.15915493667125701904296875;
                float _1041 = _1035 * 6.283185482025146484375;
                float _1043 = sin(_1041);
                float _1045 = _1035 * 6.283185482025146484375;
                float _1047 = cos(_1045);
                float _1049 = _1037 * 6.283185482025146484375;
                float _1051 = sin(_1049);
                float _1053 = _1037 * 6.283185482025146484375;
                float _1055 = cos(_1053);
                float _1057 = _1039 * 6.283185482025146484375;
                float _1059 = sin(_1057);
                float _1061 = _1051 * _1047;
                float _1063 = _1043 * _1051;
                float _1065 = _1039 * 6.283185482025146484375;
                float _1067 = cos(_1065);
                float _1069 = _1047 * _1055;
                float _1071 = _1043 * _1055;
                float _1073 = _1043 * _1059;
                float _1075 = -_1061;
                float _1077 = fma(_1055, _1073, _1075);
                float _1079 = _1047 * _1067;
                float _1081 = _1067 * _1055;
                float _1083 = _1051 * _1067;
                float _1085 = _1043 * _1067;
                float _1087 = fma(_1059, _1069, _1063);
                float _1089 = -_1071;
                float _1091 = fma(_1059, _1061, _1089);
                float _1093 = fma(_1051, _1073, _1069);
                float _1095 = -_1059;
                float _1097 = _1095 + (-0.0);
                _999 = _491;
                _1001 = _487;
                _1003 = _1083;
                _1005 = _1087;
                _1007 = _1091;
                _1009 = _1097;
                _1011 = _1081;
                _1013 = _1083;
                _1015 = _1077;
                _1017 = _1093;
                _1019 = _1085;
                _1021 = _1087;
                _1023 = _1091;
                _1025 = _1079;
                _1027 = as_type<int>(_487);
                _1029 = as_type<int>(_489);
                _1031 = as_type<int>(_491);
            }
            _1033 = false;
            float _1099 = _999;
            float _1101 = _1001;
            float _1103 = _1003;
            float _1105 = _1005;
            float _1107 = _1007;
            float _1109 = _495;
            float _1111 = _497;
            float _1113 = _499;
            float _1115 = _501;
            float _1117 = _1009;
            float _1119 = _1011;
            float _1121 = _1013;
            float _1123 = _503;
            float _1125 = _1015;
            float _1127 = _1017;
            float _1129 = _1019;
            float _1131 = _505;
            float _1133 = _1021;
            float _1135 = _1023;
            float _1137 = _1025;
            int _1139 = _1027;
            int _1141 = _1029;
            int _1143 = _1031;
            int _1145 = _263;
            int _1147 = _265;
            int _1149 = _267;
            int _1151 = _269;
            int _1153 = _271;
            int _1155 = _273;
            float _1157 = _1115 * _1117;
            int _1159 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1161 = _1159 + _128;
            float _1163 = _1115 * _1119;
            float _1165 = _1115 * _1121;
            float _1167 = _1123 * _1125;
            float _1169 = _1123 * _1127;
            float _1171 = _1123 * _1129;
            float _1173 = _1131 * _1133;
            int _1175 = _1161 * 48;
            float _1177 = _1131 * _1135;
            float _1179 = _1131 * _1137;
            int _1181 = _128 + 1;
            uint _1183 = uint(int(uint(_1175) >> uint(2)));
            _37[int(_1183)] = as_type<uint>(_1163);
            int _1185 = _1175 + 4;
            uint _1187 = uint(int(uint(_1185) >> uint(2)));
            _37[int(_1187)] = as_type<uint>(_1167);
            int _1189 = _1175 + 8;
            uint _1191 = uint(int(uint(_1189) >> uint(2)));
            _37[int(_1191)] = as_type<uint>(_1173);
            int _1193 = _1175 + 12;
            uint _1195 = uint(int(uint(_1193) >> uint(2)));
            _37[int(_1195)] = uint(_1139);
            bool _1197 = uint(_1181) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1199 = _1175 + 16;
            uint _1201 = uint(int(uint(_1199) >> uint(2)));
            _37[int(_1201)] = as_type<uint>(_1165);
            int _1203 = _1175 + 20;
            uint _1205 = uint(int(uint(_1203) >> uint(2)));
            _37[int(_1205)] = as_type<uint>(_1169);
            int _1207 = _1175 + 24;
            uint _1209 = uint(int(uint(_1207) >> uint(2)));
            _37[int(_1209)] = as_type<uint>(_1177);
            int _1211 = _1175 + 28;
            uint _1213 = uint(int(uint(_1211) >> uint(2)));
            _37[int(_1213)] = uint(_1141);
            int _1215 = _1175 + 32;
            uint _1217 = uint(int(uint(_1215) >> uint(2)));
            _37[int(_1217)] = as_type<uint>(_1157);
            int _1219 = _1175 + 36;
            uint _1221 = uint(int(uint(_1219) >> uint(2)));
            _37[int(_1221)] = as_type<uint>(_1171);
            int _1223 = _1175 + 40;
            uint _1225 = uint(int(uint(_1223) >> uint(2)));
            _37[int(_1225)] = as_type<uint>(_1179);
            int _1227 = _1175 + 44;
            uint _1229 = uint(int(uint(_1227) >> uint(2)));
            _37[int(_1229)] = uint(_1143);
            _82 = _1181;
            _84 = as_type<int>(_1179);
            _86 = as_type<int>(_1169);
            _88 = _1099;
            _90 = _1165;
            _92 = _1173;
            _94 = _1157;
            _96 = _1101;
            _98 = _1103;
            _100 = _1105;
            _102 = _1107;
            _104 = _1109;
            _106 = _1111;
            _108 = _1113;
            _110 = _1167;
            _112 = _1163;
            _116 = _1145;
            _118 = _1147;
            _120 = _1149;
            _122 = _1151;
            _124 = _1153;
            _126 = _1155;
            if (_1197)
            {
                _1231 = true;
                if (_1231)
                {
                    break;
                }
            }
        } while (true);
    }
    _1231 = false;
    bool _1233 = 1u < as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    bool _1235 = !_1233;
    if (!_1235)
    {
        int _1237 = 1;
        bool _1239;
        do
        {
            int _1241 = _1237;
            int _1243 = _1241 * 112;
            int _1245 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1247 = _1245 + _1241;
            int _1249 = _1241 + 1;
            uint _1251 = uint(int(uint(_1243) >> uint(2)));
            uint _1253 = uint(int(uint(int(_1251)) >> uint(2)));
            int _1255 = int(_1251) & 3;
            float _1257 = (*spvDescriptorSet0.cp_c6)._m0[int(_1253)][_1255];
            int _1259 = _1247 * 48;
            bool _1261 = uint(_1249) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1263 = _1259 + 16;
            uint _1265 = uint(int(uint(_1263) >> uint(2)));
            float _1267 = as_type<float>(_37[int(_1265)]);
            int _1269 = _1259 + 20;
            uint _1271 = uint(int(uint(_1269) >> uint(2)));
            float _1273 = as_type<float>(_37[int(_1271)]);
            int _1275 = _1259 + 24;
            uint _1277 = uint(int(uint(_1275) >> uint(2)));
            float _1279 = as_type<float>(_37[int(_1277)]);
            int _1281 = _1259 + 28;
            uint _1283 = uint(int(uint(_1281) >> uint(2)));
            float _1285 = as_type<float>(_37[int(_1283)]);
            int _1287 = _1259 + 32;
            uint _1289 = uint(int(uint(_1287) >> uint(2)));
            float _1291 = as_type<float>(_37[int(_1289)]);
            int _1293 = _1259 + 36;
            uint _1295 = uint(int(uint(_1293) >> uint(2)));
            float _1297 = as_type<float>(_37[int(_1295)]);
            int _1299 = _1259 + 40;
            uint _1301 = uint(int(uint(_1299) >> uint(2)));
            float _1303 = as_type<float>(_37[int(_1301)]);
            int _1305 = _1259 + 44;
            uint _1307 = uint(int(uint(_1305) >> uint(2)));
            float _1309 = as_type<float>(_37[int(_1307)]);
            int _1311 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
            int _1313 = _1311 + as_type<int>(_1257);
            int _1315 = _1313 * 48;
            uint _1317 = uint(int(uint(_1259) >> uint(2)));
            float _1319 = as_type<float>(_37[int(_1317)]);
            int _1321 = _1259 + 4;
            uint _1323 = uint(int(uint(_1321) >> uint(2)));
            float _1325 = as_type<float>(_37[int(_1323)]);
            int _1327 = _1259 + 8;
            uint _1329 = uint(int(uint(_1327) >> uint(2)));
            float _1331 = as_type<float>(_37[int(_1329)]);
            int _1333 = _1259 + 12;
            uint _1335 = uint(int(uint(_1333) >> uint(2)));
            float _1337 = as_type<float>(_37[int(_1335)]);
            uint _1339 = uint(int(uint(_1315) >> uint(2)));
            float _1341 = as_type<float>(_37[int(_1339)]);
            int _1343 = _1315 + 4;
            uint _1345 = uint(int(uint(_1343) >> uint(2)));
            float _1347 = as_type<float>(_37[int(_1345)]);
            int _1349 = _1315 + 8;
            uint _1351 = uint(int(uint(_1349) >> uint(2)));
            float _1353 = as_type<float>(_37[int(_1351)]);
            int _1355 = _1315 + 12;
            uint _1357 = uint(int(uint(_1355) >> uint(2)));
            float _1359 = as_type<float>(_37[int(_1357)]);
            int _1361 = _1315 + 16;
            uint _1363 = uint(int(uint(_1361) >> uint(2)));
            float _1365 = as_type<float>(_37[int(_1363)]);
            int _1367 = _1315 + 20;
            uint _1369 = uint(int(uint(_1367) >> uint(2)));
            float _1371 = as_type<float>(_37[int(_1369)]);
            int _1373 = _1315 + 24;
            uint _1375 = uint(int(uint(_1373) >> uint(2)));
            float _1377 = as_type<float>(_37[int(_1375)]);
            int _1379 = _1315 + 28;
            uint _1381 = uint(int(uint(_1379) >> uint(2)));
            float _1383 = as_type<float>(_37[int(_1381)]);
            int _1385 = _1315 + 32;
            uint _1387 = uint(int(uint(_1385) >> uint(2)));
            float _1389 = as_type<float>(_37[int(_1387)]);
            int _1391 = _1315 + 36;
            uint _1393 = uint(int(uint(_1391) >> uint(2)));
            float _1395 = as_type<float>(_37[int(_1393)]);
            int _1397 = _1315 + 40;
            uint _1399 = uint(int(uint(_1397) >> uint(2)));
            float _1401 = as_type<float>(_37[int(_1399)]);
            int _1403 = _1315 + 44;
            uint _1405 = uint(int(uint(_1403) >> uint(2)));
            float _1407 = as_type<float>(_37[int(_1405)]);
            float _1409 = _1285 * _1347;
            float _1411 = _1273 * _1347;
            float _1413 = _1267 * _1347;
            float _1415 = _1279 * _1347;
            float _1417 = fma(_1337, _1341, _1409);
            float _1419 = fma(_1325, _1341, _1411);
            float _1421 = fma(_1319, _1341, _1413);
            float _1423 = fma(_1331, _1341, _1415);
            float _1425 = fma(_1309, _1353, _1417);
            float _1427 = fma(_1297, _1353, _1419);
            float _1429 = _1273 * _1371;
            float _1431 = _1267 * _1371;
            float _1433 = _1359 + _1425;
            float _1435 = _1285 * _1371;
            float _1437 = _1279 * _1371;
            float _1439 = fma(_1325, _1365, _1429);
            float _1441 = fma(_1291, _1353, _1421);
            float _1443 = fma(_1337, _1365, _1435);
            float _1445 = fma(_1331, _1365, _1437);
            float _1447 = fma(_1297, _1377, _1439);
            float _1449 = _1285 * _1395;
            float _1451 = _1267 * _1395;
            float _1453 = _1273 * _1395;
            float _1455 = _1279 * _1395;
            float _1457 = fma(_1337, _1389, _1449);
            float _1459 = fma(_1319, _1365, _1431);
            float _1461 = fma(_1309, _1377, _1443);
            float _1463 = fma(_1319, _1389, _1451);
            float _1465 = fma(_1325, _1389, _1453);
            float _1467 = fma(_1331, _1389, _1455);
            float _1469 = fma(_1309, _1401, _1457);
            float _1471 = fma(_1291, _1377, _1459);
            float _1473 = fma(_1303, _1353, _1423);
            float _1475 = fma(_1303, _1377, _1445);
            float _1477 = _1383 + _1461;
            float _1479 = fma(_1291, _1401, _1463);
            float _1481 = fma(_1297, _1401, _1465);
            float _1483 = fma(_1303, _1401, _1467);
            float _1485 = _1407 + _1469;
            uint _1487 = uint(int(uint(_1259) >> uint(2)));
            _37[int(_1487)] = as_type<uint>(_1441);
            int _1489 = _1259 + 4;
            uint _1491 = uint(int(uint(_1489) >> uint(2)));
            _37[int(_1491)] = as_type<uint>(_1427);
            int _1493 = _1259 + 8;
            uint _1495 = uint(int(uint(_1493) >> uint(2)));
            _37[int(_1495)] = as_type<uint>(_1473);
            int _1497 = _1259 + 12;
            uint _1499 = uint(int(uint(_1497) >> uint(2)));
            _37[int(_1499)] = as_type<uint>(_1433);
            int _1501 = _1259 + 16;
            uint _1503 = uint(int(uint(_1501) >> uint(2)));
            _37[int(_1503)] = as_type<uint>(_1471);
            int _1505 = _1259 + 20;
            uint _1507 = uint(int(uint(_1505) >> uint(2)));
            _37[int(_1507)] = as_type<uint>(_1447);
            int _1509 = _1259 + 24;
            uint _1511 = uint(int(uint(_1509) >> uint(2)));
            _37[int(_1511)] = as_type<uint>(_1475);
            int _1513 = _1259 + 28;
            uint _1515 = uint(int(uint(_1513) >> uint(2)));
            _37[int(_1515)] = as_type<uint>(_1477);
            int _1517 = _1259 + 32;
            uint _1519 = uint(int(uint(_1517) >> uint(2)));
            _37[int(_1519)] = as_type<uint>(_1479);
            int _1521 = _1259 + 36;
            uint _1523 = uint(int(uint(_1521) >> uint(2)));
            _37[int(_1523)] = as_type<uint>(_1481);
            int _1525 = _1259 + 40;
            uint _1527 = uint(int(uint(_1525) >> uint(2)));
            _37[int(_1527)] = as_type<uint>(_1483);
            int _1529 = _1259 + 44;
            uint _1531 = uint(int(uint(_1529) >> uint(2)));
            _37[int(_1531)] = as_type<uint>(_1485);
            _1239 = !_1261;
            _1237 = _1249;
        } while (_1239);
    }
    if (!_74)
    {
        return;
    }
    int _1533 = 0;
    bool _1535;
    do
    {
        int _1537 = _1533;
        int _1539 = _68 * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1541 = _1539 + _1537;
        int _1543 = _1537 * 112;
        int _1545 = _1541 * 48;
        int _1547 = _1543 + 80;
        uint _1549 = uint(int(uint(_1547) >> uint(2)));
        uint _1551 = uint(int(uint(int(_1549)) >> uint(2)));
        int _1553 = int(_1549) & 3;
        float _1555 = (*spvDescriptorSet0.cp_c6)._m0[int(_1551)][_1553];
        int _1557 = int(_1549) + 1;
        uint _1559 = uint(int(uint(_1557) >> uint(2)));
        int _1561 = _1557 & 3;
        float _1563 = (*spvDescriptorSet0.cp_c6)._m0[int(_1559)][_1561];
        uint _1565 = uint(int(uint(_1545) >> uint(2)));
        float _1567 = as_type<float>(_37[int(_1565)]);
        int _1569 = _1545 + 4;
        uint _1571 = uint(int(uint(_1569) >> uint(2)));
        float _1573 = as_type<float>(_37[int(_1571)]);
        int _1575 = _1545 + 8;
        uint _1577 = uint(int(uint(_1575) >> uint(2)));
        float _1579 = as_type<float>(_37[int(_1577)]);
        int _1581 = _1545 + 12;
        uint _1583 = uint(int(uint(_1581) >> uint(2)));
        float _1585 = as_type<float>(_37[int(_1583)]);
        int _1587 = _1545 + 16;
        uint _1589 = uint(int(uint(_1587) >> uint(2)));
        float _1591 = as_type<float>(_37[int(_1589)]);
        int _1593 = _1545 + 20;
        uint _1595 = uint(int(uint(_1593) >> uint(2)));
        float _1597 = as_type<float>(_37[int(_1595)]);
        int _1599 = _1545 + 24;
        uint _1601 = uint(int(uint(_1599) >> uint(2)));
        float _1603 = as_type<float>(_37[int(_1601)]);
        int _1605 = _1545 + 28;
        uint _1607 = uint(int(uint(_1605) >> uint(2)));
        float _1609 = as_type<float>(_37[int(_1607)]);
        int _1611 = _1543 + 88;
        uint _1613 = uint(int(uint(_1611) >> uint(2)));
        uint _1615 = uint(int(uint(int(_1613)) >> uint(2)));
        int _1617 = int(_1613) & 3;
        float _1619 = (*spvDescriptorSet0.cp_c6)._m0[int(_1615)][_1617];
        int _1621 = int(_1613) + 1;
        uint _1623 = uint(int(uint(_1621) >> uint(2)));
        int _1625 = _1621 & 3;
        float _1627 = (*spvDescriptorSet0.cp_c6)._m0[int(_1623)][_1625];
        int _1629 = _1545 + 32;
        uint _1631 = uint(int(uint(_1629) >> uint(2)));
        float _1633 = as_type<float>(_37[int(_1631)]);
        int _1635 = _1545 + 36;
        uint _1637 = uint(int(uint(_1635) >> uint(2)));
        float _1639 = as_type<float>(_37[int(_1637)]);
        int _1641 = _1545 + 40;
        uint _1643 = uint(int(uint(_1641) >> uint(2)));
        float _1645 = as_type<float>(_37[int(_1643)]);
        int _1647 = _1545 + 44;
        uint _1649 = uint(int(uint(_1647) >> uint(2)));
        float _1651 = as_type<float>(_37[int(_1649)]);
        int _1653 = _1543 + 64;
        uint _1655 = uint(int(uint(_1653) >> uint(2)));
        uint _1657 = uint(int(uint(int(_1655)) >> uint(2)));
        int _1659 = int(_1655) & 3;
        float _1661 = (*spvDescriptorSet0.cp_c6)._m0[int(_1657)][_1659];
        int _1663 = int(_1655) + 1;
        uint _1665 = uint(int(uint(_1663) >> uint(2)));
        int _1667 = _1663 & 3;
        float _1669 = (*spvDescriptorSet0.cp_c6)._m0[int(_1665)][_1667];
        int _1671 = _1543 + 72;
        uint _1673 = uint(int(uint(_1671) >> uint(2)));
        uint _1675 = uint(int(uint(int(_1673)) >> uint(2)));
        int _1677 = int(_1673) & 3;
        float _1679 = (*spvDescriptorSet0.cp_c6)._m0[int(_1675)][_1677];
        int _1681 = int(_1673) + 1;
        uint _1683 = uint(int(uint(_1681) >> uint(2)));
        int _1685 = _1681 & 3;
        float _1687 = (*spvDescriptorSet0.cp_c6)._m0[int(_1683)][_1685];
        int _1689 = _1543 + 104;
        uint _1691 = uint(int(uint(_1689) >> uint(2)));
        uint _1693 = uint(int(uint(int(_1691)) >> uint(2)));
        int _1695 = int(_1691) & 3;
        float _1697 = (*spvDescriptorSet0.cp_c6)._m0[int(_1693)][_1695];
        int _1699 = int(_1691) + 1;
        uint _1701 = uint(int(uint(_1699) >> uint(2)));
        int _1703 = _1699 & 3;
        float _1705 = (*spvDescriptorSet0.cp_c6)._m0[int(_1701)][_1703];
        int _1707 = _1543 + 96;
        uint _1709 = uint(int(uint(_1707) >> uint(2)));
        uint _1711 = uint(int(uint(int(_1709)) >> uint(2)));
        int _1713 = int(_1709) & 3;
        float _1715 = (*spvDescriptorSet0.cp_c6)._m0[int(_1711)][_1713];
        int _1717 = int(_1709) + 1;
        uint _1719 = uint(int(uint(_1717) >> uint(2)));
        int _1721 = _1717 & 3;
        float _1723 = (*spvDescriptorSet0.cp_c6)._m0[int(_1719)][_1721];
        float _1725 = _1573 * _1555;
        float _1727 = _1573 * _1563;
        float _1729 = _1573 * _1619;
        float _1731 = _1573 * _1627;
        float _1733 = fma(_1567, _1661, _1725);
        float _1735 = fma(_1567, _1669, _1727);
        float _1737 = fma(_1567, _1679, _1729);
        float _1739 = fma(_1567, _1687, _1731);
        float _1741 = _1597 * _1555;
        float _1743 = _1597 * _1563;
        float _1745 = _1597 * _1619;
        float _1747 = _1597 * _1627;
        float _1749 = _1639 * _1555;
        float _1751 = fma(_1591, _1661, _1741);
        float _1753 = fma(_1591, _1669, _1743);
        float _1755 = fma(_1591, _1679, _1745);
        uint _1757 = uint(int(uint(_78) >> uint(2)));
        uint _1759 = uint(int(uint(int(_1757)) >> uint(2)));
        int _1761 = int(_1757) & 3;
        float _1763 = (*spvDescriptorSet0.cp_c4)._m0[int(_1759)][_1761];
        float _1765 = fma(_1591, _1687, _1747);
        float _1767 = _1639 * _1563;
        float _1769 = _1639 * _1619;
        float _1771 = _1639 * _1627;
        float _1773 = fma(_1633, _1661, _1749);
        float _1775 = fma(_1633, _1669, _1767);
        float _1777 = fma(_1633, _1679, _1769);
        int _1779 = _1543 + 16;
        uint _1781 = uint(int(uint(_1779) >> uint(2)));
        uint _1783 = uint(int(uint(int(_1781)) >> uint(2)));
        int _1785 = int(_1781) & 3;
        float _1787 = (*spvDescriptorSet0.cp_c6)._m0[int(_1783)][_1785];
        int _1789 = int(_1781) + 1;
        uint _1791 = uint(int(uint(_1789) >> uint(2)));
        int _1793 = _1789 & 3;
        float _1795 = (*spvDescriptorSet0.cp_c6)._m0[int(_1791)][_1793];
        float _1797 = fma(_1633, _1687, _1771);
        float _1799 = fma(_1603, _1705, _1765);
        float _1801 = fma(_1579, _1715, _1733);
        float _1803 = fma(_1579, _1723, _1735);
        float _1805 = fma(_1579, _1697, _1737);
        float _1807 = fma(_1579, _1705, _1739);
        float _1809 = fma(_1603, _1715, _1751);
        int _1811 = _1543 + 24;
        uint _1813 = uint(int(uint(_1811) >> uint(2)));
        uint _1815 = uint(int(uint(int(_1813)) >> uint(2)));
        int _1817 = int(_1813) & 3;
        float _1819 = (*spvDescriptorSet0.cp_c6)._m0[int(_1815)][_1817];
        int _1821 = int(_1813) + 1;
        uint _1823 = uint(int(uint(_1821) >> uint(2)));
        int _1825 = _1821 & 3;
        float _1827 = (*spvDescriptorSet0.cp_c6)._m0[int(_1823)][_1825];
        float _1829 = fma(_1603, _1723, _1753);
        float _1831 = fma(_1603, _1697, _1755);
        float _1833 = fma(_1645, _1715, _1773);
        float _1835 = fma(_1645, _1723, _1775);
        float _1837 = fma(_1645, _1705, _1797);
        float _1839 = fma(_1645, _1697, _1777);
        float _1841 = _1609 + _1799;
        int _1843 = _1543 + 32;
        uint _1845 = uint(int(uint(_1843) >> uint(2)));
        uint _1847 = uint(int(uint(int(_1845)) >> uint(2)));
        int _1849 = int(_1845) & 3;
        float _1851 = (*spvDescriptorSet0.cp_c6)._m0[int(_1847)][_1849];
        int _1853 = int(_1845) + 1;
        uint _1855 = uint(int(uint(_1853) >> uint(2)));
        int _1857 = _1853 & 3;
        float _1859 = (*spvDescriptorSet0.cp_c6)._m0[int(_1855)][_1857];
        float _1861 = _1651 + _1837;
        float _1863 = _1585 + _1807;
        int _1865 = _1543 + 48;
        uint _1867 = uint(int(uint(_1865) >> uint(2)));
        uint _1869 = uint(int(uint(int(_1867)) >> uint(2)));
        int _1871 = int(_1867) & 3;
        float _1873 = (*spvDescriptorSet0.cp_c6)._m0[int(_1869)][_1871];
        int _1875 = int(_1867) + 1;
        uint _1877 = uint(int(uint(_1875) >> uint(2)));
        int _1879 = _1875 & 3;
        float _1881 = (*spvDescriptorSet0.cp_c6)._m0[int(_1877)][_1879];
        float _1883 = _1809 * _1795;
        float _1885 = _1829 * _1795;
        float _1887 = _1841 * _1795;
        float _1889 = _1831 * _1795;
        float _1891 = fma(_1801, _1787, _1883);
        float _1893 = fma(_1803, _1787, _1885);
        float _1895 = fma(_1863, _1787, _1887);
        float _1897 = fma(_1805, _1787, _1889);
        int _1899 = _1543 + 40;
        uint _1901 = uint(int(uint(_1899) >> uint(2)));
        uint _1903 = uint(int(uint(int(_1901)) >> uint(2)));
        int _1905 = int(_1901) & 3;
        float _1907 = (*spvDescriptorSet0.cp_c6)._m0[int(_1903)][_1905];
        int _1909 = int(_1901) + 1;
        uint _1911 = uint(int(uint(_1909) >> uint(2)));
        int _1913 = _1909 & 3;
        float _1915 = (*spvDescriptorSet0.cp_c6)._m0[int(_1911)][_1913];
        float _1917 = fma(_1833, _1819, _1891);
        float _1919 = fma(_1861, _1819, _1895);
        float _1921 = fma(_1835, _1819, _1893);
        float _1923 = fma(_1839, _1819, _1897);
        float _1925 = _1919 + _1827;
        float _1927 = _1841 * _1859;
        int _1929 = _1543 + 56;
        uint _1931 = uint(int(uint(_1929) >> uint(2)));
        uint _1933 = uint(int(uint(int(_1931)) >> uint(2)));
        int _1935 = int(_1931) & 3;
        float _1937 = (*spvDescriptorSet0.cp_c6)._m0[int(_1933)][_1935];
        int _1939 = int(_1931) + 1;
        uint _1941 = uint(int(uint(_1939) >> uint(2)));
        int _1943 = _1939 & 3;
        float _1945 = (*spvDescriptorSet0.cp_c6)._m0[int(_1941)][_1943];
        float _1947 = _1809 * _1859;
        float _1949 = _1829 * _1859;
        int _1951 = as_type<int>(_1763) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        int _1953 = _1951 + _1537;
        int _1955 = _1537 + 1;
        float _1957 = _1831 * _1859;
        float _1959 = fma(_1863, _1851, _1927);
        float _1961 = _1841 * _1881;
        float _1963 = _1809 * _1881;
        float _1965 = _1829 * _1881;
        float _1967 = fma(_1803, _1851, _1949);
        float _1969 = _1831 * _1881;
        float _1971 = fma(_1863, _1873, _1961);
        float _1973 = fma(_1801, _1873, _1963);
        int _1975 = _1953 * 48;
        bool _1977 = uint(_1955) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
        float _1979 = fma(_1803, _1873, _1965);
        float _1981 = fma(_1801, _1851, _1947);
        float _1983 = fma(_1805, _1851, _1957);
        float _1985 = fma(_1861, _1907, _1959);
        float _1987 = fma(_1805, _1873, _1969);
        float _1989 = fma(_1835, _1907, _1967);
        float _1991 = fma(_1833, _1907, _1981);
        float _1993 = fma(_1839, _1907, _1983);
        float _1995 = fma(_1861, _1937, _1971);
        float _1997 = fma(_1833, _1937, _1973);
        float _1999 = fma(_1835, _1937, _1979);
        int _2001 = _1975 + 16;
        float _2003 = _1985 + _1915;
        int _2005 = _1975 + 32;
        float _2007 = fma(_1839, _1937, _1987);
        float _2009 = _1995 + _1945;
        int _2011 = _1975 + 48;
        uint _2013 = uint(int(uint(_2001) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2013)] = as_type<uint>(_1917);
        int _2015 = _2001 + 4;
        uint _2017 = uint(int(uint(_2015) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2017)] = as_type<uint>(_1921);
        int _2019 = _2001 + 8;
        uint _2021 = uint(int(uint(_2019) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2021)] = as_type<uint>(_1923);
        int _2023 = _2001 + 12;
        uint _2025 = uint(int(uint(_2023) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2025)] = as_type<uint>(_1925);
        uint _2027 = uint(int(uint(_2005) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2027)] = as_type<uint>(_1991);
        int _2029 = _2005 + 4;
        uint _2031 = uint(int(uint(_2029) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2031)] = as_type<uint>(_1989);
        int _2033 = _2005 + 8;
        uint _2035 = uint(int(uint(_2033) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2035)] = as_type<uint>(_1993);
        int _2037 = _2005 + 12;
        uint _2039 = uint(int(uint(_2037) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2039)] = as_type<uint>(_2003);
        uint _2041 = uint(int(uint(_2011) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2041)] = as_type<uint>(_1997);
        int _2043 = _2011 + 4;
        uint _2045 = uint(int(uint(_2043) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2045)] = as_type<uint>(_1999);
        int _2047 = _2011 + 8;
        uint _2049 = uint(int(uint(_2047) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2049)] = as_type<uint>(_2007);
        int _2051 = _2011 + 12;
        uint _2053 = uint(int(uint(_2051) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_2053)] = as_type<uint>(_2009);
        _1535 = !_1977;
        _1533 = _1955;
    } while (_1535);
}

