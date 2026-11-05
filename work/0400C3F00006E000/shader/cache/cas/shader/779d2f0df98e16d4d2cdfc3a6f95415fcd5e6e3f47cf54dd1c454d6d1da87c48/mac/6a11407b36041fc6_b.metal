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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_t_tcb_A [[id(9)]];
    sampler cp_t_tcb_ASmplr [[id(10)]];
};

static inline __attribute__((always_inline))
int _60(thread const int& _5500, thread const int& _5501, constant _10& support_buffer)
{
    int _5504 = 1 + _5501;
    float _5506 = support_buffer._m5[_5504].x;
    bool _5508 = _5506 == 1.0;
    if (_5508)
    {
        return _5500;
    }
    float _5510 = float(_5500);
    float _5512 = _5510 * _5506;
    int _5514 = int(_5512);
    return _5514;
}

static inline __attribute__((always_inline))
void _58(thread const int& _5187, thread const int& _5188, thread const int& _5189, thread const int& _5190, thread const int& _5191, thread int& _5192, thread int& _5193, thread int& _5194, thread int& _5195, thread int& _5196, thread int& _5197)
{
    float _5200 = as_type<float>(_5189) + 0.0;
    bool _5202 = _5200 != 0.0;
    bool _5204 = isnan(_5200);
    bool _5206 = _5202 || _5204;
    bool _5208 = isnan(0.0);
    bool _5210 = _5206 || _5208;
    int _5212 = as_type<int>(_5200);
    int _5214 = _5188;
    int _5216 = _5191;
    int _5218 = _5210 ? (-1) : 0;
    if (!_5210)
    {
        float _5220 = as_type<float>(_5189) * 1.0;
        _5212 = as_type<int>(_5220);
    }
    int _5222 = _5212;
    bool _5224 = !_5210;
    int _5226 = _5222;
    if (!_5224)
    {
        float _5228 = as_type<float>(_5189) + 0.0;
        bool _5230 = _5228 >= 0.0;
        bool _5232 = isnan(_5228);
        bool _5234 = _5230 || _5232;
        bool _5236 = isnan(0.0);
        bool _5238 = _5234 || _5236;
        int _5240 = as_type<int>(_5228);
        _5218 = _5238 ? (-1) : 0;
        if (!_5238)
        {
            _5240 = 2147483647;
        }
        int _5242 = _5240;
        bool _5244 = !_5238;
        _5226 = _5242;
        if (!_5244)
        {
            float _5246 = as_type<float>(_5189) + 0.0;
            bool _5248 = _5246 > as_type<float>(0x7f800000u /* inf */);
            bool _5250 = isnan(_5246);
            bool _5252 = _5248 || _5250;
            bool _5254 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _5256 = _5252 || _5254;
            int _5258 = as_type<int>(_5246);
            _5218 = _5256 ? (-1) : 0;
            if (_5256)
            {
                float _5260 = as_type<float>(_5189) + 1.0;
                _5258 = as_type<int>(_5260);
            }
            int _5262 = _5258;
            _5226 = _5262;
            if (!_5256)
            {
                float _5264 = 0.0 + as_type<float>(_5189);
                bool _5266 = _5264 != as_type<float>(0x7f800000u /* inf */);
                bool _5268 = isnan(_5264);
                bool _5270 = _5266 || _5268;
                bool _5272 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _5274 = _5270 || _5272;
                int _5276 = as_type<int>(_5264);
                _5218 = _5274 ? (-1) : 0;
                if (!_5274)
                {
                    _5276 = _5189;
                }
                int _5278 = _5276;
                bool _5280 = !_5274;
                _5226 = _5278;
                if (!_5280)
                {
                    float _5282 = as_type<float>(_5189) * 18446744073709551616.0;
                    float _5284 = rsqrt(_5282);
                    float _5286 = _5282 * _5284;
                    float _5288 = _5284 * 0.5;
                    float _5290 = -_5286;
                    float _5292 = 0.0 + _5290;
                    float _5294 = fma(_5288, _5292, 0.5);
                    float _5296 = fma(_5286, _5294, _5286);
                    float _5298 = -_5296;
                    float _5300 = 0.0 + _5298;
                    float _5302 = fma(_5296, _5300, _5282);
                    float _5304 = fma(_5288, _5302, _5296);
                    float _5306 = _5304 * 2.3283064365386962890625e-10;
                    _5226 = as_type<int>(_5306);
                    _5214 = as_type<int>(_5292);
                    _5216 = as_type<int>(_5296);
                }
            }
        }
    }
    int _5308 = _5226;
    int _5310 = _5214;
    int _5312 = _5216;
    int _5314 = _5218;
    _5192 = _5308;
    _5193 = _5190;
    _5194 = 0;
    _5195 = _5310;
    _5196 = _5312;
    _5197 = _5314;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _1595 = false;
    bool _1129 = false;
    bool _723 = false;
    float _64 = as_type<float>(gl_WorkGroupID.x);
    float _66 = as_type<float>(gl_LocalInvocationID.x);
    int _68 = as_type<int>(_64) << 6;
    int _70 = _68 + as_type<int>(_66);
    bool _74 = uint(_70) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_74)
    {
        return;
    }
    int _76 = _70 & 31;
    bool _78 = _76 == 0;
    bool _80 = uint(_76) < 32u;
    int _82 = 32 - _76;
    int _84 = _76 - 32;
    int _86 = 1 << _76;
    uint _89 = uint(int(uint(0) >> uint(_82)));
    int _91 = _86 | int(_89);
    int _93 = _78 ? 1 : _91;
    bool _95 = uint(_84) < 32u;
    int _97 = 0 << _84;
    int _99 = _95 ? _97 : 0;
    float _101 = _80 ? as_type<float>(_93) : as_type<float>(_99);
    int _103 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _105 = _103 + 32;
    uint _107 = uint(int(uint(_105) >> uint(2)));
    uint _109 = uint(int(uint(int(_107)) >> uint(2)));
    int _111 = int(_107) & 3;
    float _113 = (*spvDescriptorSet0.cp_c5)._m0[int(_109)][_111];
    int _115 = _103 + 36;
    uint _117 = uint(int(uint(_115) >> uint(2)));
    uint _119 = uint(int(uint(int(_117)) >> uint(2)));
    int _121 = int(_117) & 3;
    float _123 = (*spvDescriptorSet0.cp_c5)._m0[int(_119)][_121];
    int _125 = as_type<int>(_101) & as_type<int>(_113);
    bool _127 = _125 != 0;
    int _129 = as_type<int>(_101) & as_type<int>(_123);
    bool _131 = _129 != 0;
    float _133 = 0.0;
    float _135 = 0.0;
    float _137 = _113;
    float _139 = _101;
    if (!_127)
    {
        _133 = 0.0;
        _135 = 0.0;
    }
    float _141 = _133;
    float _143 = _135;
    float _145 = 0.0;
    float _147 = _141;
    float _149 = _143;
    if (!_127)
    {
        _145 = 0.0;
    }
    float _151 = _145;
    float _153 = 0.0;
    float _155 = 0.0;
    float _157 = _151;
    if (!_127)
    {
        _153 = 0.0;
        _155 = 0.0;
    }
    float _159 = _153;
    float _161 = _155;
    float _163 = 0.0;
    float _165 = _161;
    float _167 = _159;
    if (!_127)
    {
        _163 = 0.0;
    }
    float _169 = _163;
    float _171 = 0.0;
    float _173 = _169;
    if (!_127)
    {
        _171 = 0.0;
        _137 = 0.0;
    }
    float _175 = _171;
    float _177 = _137;
    float _179 = _175;
    float _181 = _177;
    if (!_127)
    {
        _139 = 0.0;
    }
    float _183 = _139;
    bool _185 = !_127;
    float _187 = _183;
    float _189 = 0.0;
    if (!_185)
    {
        uint _191 = uint(int(uint(_103) >> uint(2)));
        uint _193 = uint(int(uint(int(_191)) >> uint(2)));
        int _195 = int(_191) & 3;
        float _197 = (*spvDescriptorSet0.cp_c5)._m0[int(_193)][_195];
        int _199 = int(_191) + 1;
        uint _201 = uint(int(uint(_199) >> uint(2)));
        int _203 = _199 & 3;
        float _205 = (*spvDescriptorSet0.cp_c5)._m0[int(_201)][_203];
        int _207 = _70;
        int _209 = 0;
        int _211 = _60(_207, _209, (*spvDescriptorSet0.support_buffer));
        int _213 = as_type<int>(_197);
        int _215 = 0;
        int _217 = _60(_213, _215, (*spvDescriptorSet0.support_buffer));
        int3 _2301 = int3(_211, _217, 1);
        float3 _221 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2301.xy), uint(_2301.z), 0).xyz;
        float _223 = _221.x;
        float _225 = _221.y;
        float _227 = _221.z;
        int _229 = _70;
        int _231 = 0;
        int _233 = _60(_229, _231, (*spvDescriptorSet0.support_buffer));
        int _235 = as_type<int>(_205);
        int _237 = 0;
        int _239 = _60(_235, _237, (*spvDescriptorSet0.support_buffer));
        int3 _2319 = int3(_233, _239, 1);
        float3 _241 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2319.xy), uint(_2319.z), 0).xyz;
        float _243 = _241.x;
        float _245 = _241.y;
        float _247 = _241.z;
        int _249 = _70;
        int _251 = 0;
        int _253 = _60(_249, _251, (*spvDescriptorSet0.support_buffer));
        int _255 = as_type<int>(_197);
        int _257 = 0;
        int _259 = _60(_255, _257, (*spvDescriptorSet0.support_buffer));
        int3 _2337 = int3(_253, _259, 0);
        float3 _261 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2337.xy), uint(_2337.z), 0).xyz;
        float _263 = _261.x;
        float _265 = _261.y;
        float _267 = _261.z;
        int _269 = _70;
        int _271 = 0;
        int _273 = _60(_269, _271, (*spvDescriptorSet0.support_buffer));
        int _275 = as_type<int>(_205);
        int _277 = 0;
        int _279 = _60(_275, _277, (*spvDescriptorSet0.support_buffer));
        int3 _2355 = int3(_273, _279, 0);
        float3 _281 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2355.xy), uint(_2355.z), 0).xyz;
        float _283 = _281.x;
        float _285 = _281.y;
        float _287 = _281.z;
        int _289 = _70;
        int _291 = 0;
        int _293 = _60(_289, _291, (*spvDescriptorSet0.support_buffer));
        int _295 = as_type<int>(_197);
        int _297 = 0;
        int _299 = _60(_295, _297, (*spvDescriptorSet0.support_buffer));
        int3 _2373 = int3(_293, _299, 2);
        float3 _301 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2373.xy), uint(_2373.z), 0).xyz;
        float _303 = _301.x;
        float _305 = _301.y;
        float _307 = _301.z;
        int _309 = _70;
        int _311 = 0;
        int _313 = _60(_309, _311, (*spvDescriptorSet0.support_buffer));
        int _315 = as_type<int>(_205);
        int _317 = 0;
        int _319 = _60(_315, _317, (*spvDescriptorSet0.support_buffer));
        int3 _2391 = int3(_313, _319, 2);
        float3 _321 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_2391.xy), uint(_2391.z), 0).xyz;
        float _323 = _321.x;
        float _325 = _321.y;
        float _327 = _321.z;
        int _329 = _103 + 16;
        uint _331 = uint(int(uint(_329) >> uint(2)));
        uint _333 = uint(int(uint(int(_331)) >> uint(2)));
        int _335 = int(_331) & 3;
        float _337 = (*spvDescriptorSet0.cp_c5)._m0[int(_333)][_335];
        float _339 = -_223;
        float _341 = _339 + _243;
        float _343 = -_227;
        float _345 = _343 + _247;
        float _347 = fma(_341, _337, _223);
        float _349 = -_225;
        float _351 = _349 + _245;
        float _353 = -_263;
        float _355 = _353 + _283;
        float _357 = -_265;
        float _359 = _357 + _285;
        float _361 = -_267;
        float _363 = _361 + _287;
        float _365 = fma(_351, _337, _225);
        float _367 = -_303;
        float _369 = _367 + _323;
        float _371 = -_305;
        float _373 = _371 + _325;
        float _375 = -_307;
        float _377 = _375 + _327;
        float _379 = fma(_359, _337, _265);
        float _381 = fma(_345, _337, _227);
        float _383 = fma(_355, _337, _263);
        float _385 = fma(_363, _337, _267);
        float _387 = fma(_369, _337, _303);
        float _389 = fma(_373, _337, _305);
        float _391 = fma(_377, _337, _307);
        _187 = _381;
        _179 = _365;
        _181 = _347;
        _189 = 0.0;
        _147 = _379;
        _149 = _383;
        _157 = _385;
        _173 = _387;
        _165 = _389;
        _167 = _391;
    }
    float _393 = _187;
    float _395 = _179;
    float _397 = _181;
    float _399 = _189;
    float _401 = _147;
    float _403 = _149;
    float _405 = _157;
    float _407 = _173;
    float _409 = _165;
    float _411 = _167;
    bool _413 = !_131;
    float _415 = _403;
    float _417 = _401;
    float _419 = _405;
    int _421 = as_type<int>(_407);
    float _423 = _411;
    float _425 = _409;
    float _1099;
    float _1101;
    float _1103;
    float _1105;
    float _1107;
    float _1109;
    float _1111;
    float _1113;
    float _1115;
    int _1117;
    int _1119;
    float _1121;
    float _1123;
    float _1125;
    float _1127;
    if (!_413)
    {
        int _427 = _103 + 8;
        uint _429 = uint(int(uint(_427) >> uint(2)));
        uint _431 = uint(int(uint(int(_429)) >> uint(2)));
        int _433 = int(_429) & 3;
        float _435 = (*spvDescriptorSet0.cp_c5)._m0[int(_431)][_433];
        int _437 = int(_429) + 1;
        uint _439 = uint(int(uint(_437) >> uint(2)));
        int _441 = _437 & 3;
        float _443 = (*spvDescriptorSet0.cp_c5)._m0[int(_439)][_441];
        int _445 = _70;
        int _447 = 1;
        int _449 = _60(_445, _447, (*spvDescriptorSet0.support_buffer));
        int _451 = as_type<int>(_435);
        int _453 = 1;
        int _455 = _60(_451, _453, (*spvDescriptorSet0.support_buffer));
        int3 _2572 = int3(_449, _455, 1);
        float3 _457 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2572.xy), uint(_2572.z), 0).xyz;
        float _459 = _457.x;
        float _461 = _457.y;
        float _463 = _457.z;
        int _465 = _70;
        int _467 = 1;
        int _469 = _60(_465, _467, (*spvDescriptorSet0.support_buffer));
        int _471 = as_type<int>(_443);
        int _473 = 1;
        int _475 = _60(_471, _473, (*spvDescriptorSet0.support_buffer));
        int3 _2590 = int3(_469, _475, 1);
        float3 _477 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2590.xy), uint(_2590.z), 0).xyz;
        float _479 = _477.x;
        float _481 = _477.y;
        float _483 = _477.z;
        float _485 = _393 * 0.5;
        float _487 = _395 * 0.5;
        float _489 = _397 * 0.5;
        float _491 = _485 * 0.15915493667125701904296875;
        float _493 = _487 * 0.15915493667125701904296875;
        float _495 = _491 * 6.283185482025146484375;
        float _497 = sin(_495);
        float _499 = _489 * 0.15915493667125701904296875;
        float _501 = _493 * 6.283185482025146484375;
        float _503 = sin(_501);
        int _505 = _103 + 24;
        uint _507 = uint(int(uint(_505) >> uint(2)));
        uint _509 = uint(int(uint(int(_507)) >> uint(2)));
        int _511 = int(_507) & 3;
        float _513 = (*spvDescriptorSet0.cp_c5)._m0[int(_509)][_511];
        float _515 = _493 * 6.283185482025146484375;
        float _517 = cos(_515);
        float _519 = _491 * 6.283185482025146484375;
        float _521 = cos(_519);
        float _523 = _497 * _503;
        float _525 = _499 * 6.283185482025146484375;
        float _527 = sin(_525);
        float _529 = _517 * _497;
        float _531 = _499 * 6.283185482025146484375;
        float _533 = cos(_531);
        float _535 = _521 * _517;
        float _537 = _521 * _503;
        float _539 = _527 * _523;
        float _541 = _527 * _529;
        float _543 = _533 * _523;
        float _545 = fma(_533, _537, _541);
        float _547 = fma(_533, _535, _539);
        float _549 = -_543;
        float _551 = fma(_527, _535, _549);
        float _553 = _527 * _537;
        float _555 = -_553;
        float _557 = fma(_533, _529, _555);
        float _559 = -_463;
        float _561 = _559 + _483;
        float _563 = -_461;
        float _565 = _563 + _481;
        float _567 = -_459;
        float _569 = _567 + _479;
        float _571 = fma(_561, _513, _463);
        float _573 = fma(_565, _513, _461);
        float _575 = fma(_569, _513, _459);
        float _577 = _571 * 0.5;
        float _579 = _573 * 0.5;
        float _581 = _575 * 0.5;
        float _583 = _577 * 0.15915493667125701904296875;
        float _585 = _579 * 0.15915493667125701904296875;
        float _587 = _581 * 0.15915493667125701904296875;
        float _589 = _583 * 6.283185482025146484375;
        float _591 = sin(_589);
        float _593 = _585 * 6.283185482025146484375;
        float _595 = cos(_593);
        float _597 = _585 * 6.283185482025146484375;
        float _599 = sin(_597);
        float _601 = _583 * 6.283185482025146484375;
        float _603 = cos(_601);
        float _605 = _595 * _591;
        float _607 = _587 * 6.283185482025146484375;
        float _609 = sin(_607);
        float _611 = _591 * _599;
        float _613 = _587 * 6.283185482025146484375;
        float _615 = cos(_613);
        float _617 = _603 * _599;
        float _619 = _603 * _595;
        float _621 = _609 * _605;
        float _623 = _615 * _611;
        float _625 = fma(_615, _617, _621);
        float _627 = _609 * _617;
        float _629 = -_623;
        float _631 = fma(_609, _619, _629);
        float _633 = _545 * _625;
        float _635 = _609 * _611;
        float _637 = -_627;
        float _639 = fma(_615, _605, _637);
        float _641 = fma(_551, _631, _633);
        float _643 = fma(_615, _619, _635);
        float _645 = fma(_557, _639, _641);
        float _647 = fma(_547, _643, _645);
        float _649 = precise::max(_647, -1.0);
        float _651 = precise::min(_649, 1.0);
        bool _653 = _651 >= 0.0;
        bool _655 = isnan(_651);
        bool _657 = _653 || _655;
        bool _659 = isnan(0.0);
        bool _661 = _657 || _659;
        bool _663 = !_661;
        float _665 = -_651;
        float _667 = _663 ? _665 : _651;
        bool _669 = _667 < 0.0;
        float _671 = float(_669);
        float _673 = abs(_667);
        float _675 = -_673;
        float _677 = _675 + 1.0;
        float _679 = abs(_667);
        float _681 = fma(_679, -0.0187292993068695068359375, 0.074261002242565155029296875);
        int _683 = as_type<int>(_677) + (-218103808);
        float _685 = abs(_667);
        float _687 = fma(_685, _681, -0.212114393711090087890625);
        bool _689 = uint(_683) >= 1920991232u;
        float _691 = abs(_667);
        float _693 = fma(_691, _687, 1.570728778839111328125);
        bool _695 = !_689;
        float _719;
        float _721;
        if (!_695)
        {
            int _697 = as_type<int>(_619);
            int _699 = as_type<int>(_667);
            int _701 = as_type<int>(_677);
            int _703 = 2272;
            int _705 = as_type<int>(_535);
            int _707;
            int _709;
            int _711;
            int _713;
            int _715;
            int _717;
            _58(_697, _699, _701, _703, _705, _707, _709, _711, _713, _715, _717);
            _719 = as_type<float>(_707);
            _721 = as_type<float>(_709);
            _723 = true;
        }
        else
        {
            float _725 = rsqrt(_677);
            float _727 = _677 * _725;
            float _729 = _725 * 0.5;
            float _731 = -_727;
            float _733 = 0.0 + _731;
            float _735 = fma(_729, _733, 0.5);
            float _737 = fma(_727, _735, _727);
            float _739 = -_737;
            float _741 = 0.0 + _739;
            float _743 = fma(_737, _741, _677);
            float _745 = fma(_729, _743, _737);
            _719 = _745;
            _721 = _743;
        }
        _723 = false;
        float _747 = _719;
        float _749 = _721;
        int _751 = _103 + 8;
        uint _753 = uint(int(uint(_751) >> uint(2)));
        uint _755 = uint(int(uint(int(_753)) >> uint(2)));
        int _757 = int(_753) & 3;
        float _759 = (*spvDescriptorSet0.cp_c5)._m0[int(_755)][_757];
        int _761 = int(_753) + 1;
        uint _763 = uint(int(uint(_761) >> uint(2)));
        int _765 = _761 & 3;
        float _767 = (*spvDescriptorSet0.cp_c5)._m0[int(_763)][_765];
        int _769 = _70;
        int _771 = 1;
        int _773 = _60(_769, _771, (*spvDescriptorSet0.support_buffer));
        int _775 = as_type<int>(_759);
        int _777 = 1;
        int _779 = _60(_775, _777, (*spvDescriptorSet0.support_buffer));
        int3 _2978 = int3(_773, _779, 0);
        float3 _781 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2978.xy), uint(_2978.z), 0).xyz;
        float _783 = _781.x;
        float _785 = _781.y;
        float _787 = _781.z;
        int _789 = _70;
        int _791 = 1;
        int _793 = _60(_789, _791, (*spvDescriptorSet0.support_buffer));
        int _795 = as_type<int>(_759);
        int _797 = 1;
        int _799 = _60(_795, _797, (*spvDescriptorSet0.support_buffer));
        int3 _2996 = int3(_793, _799, 2);
        float3 _801 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_2996.xy), uint(_2996.z), 0).xyz;
        float _803 = _801.x;
        float _805 = _801.y;
        float _807 = _801.z;
        int _809 = _70;
        int _811 = 1;
        int _813 = _60(_809, _811, (*spvDescriptorSet0.support_buffer));
        int _815 = as_type<int>(_767);
        int _817 = 1;
        int _819 = _60(_815, _817, (*spvDescriptorSet0.support_buffer));
        int3 _3014 = int3(_813, _819, 0);
        float3 _821 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_3014.xy), uint(_3014.z), 0).xyz;
        float _823 = _821.x;
        float _825 = _821.y;
        float _827 = _821.z;
        int _829 = _70;
        int _831 = 1;
        int _833 = _60(_829, _831, (*spvDescriptorSet0.support_buffer));
        int _835 = as_type<int>(_767);
        int _837 = 1;
        int _839 = _60(_835, _837, (*spvDescriptorSet0.support_buffer));
        int3 _3032 = int3(_833, _839, 2);
        float3 _841 = spvDescriptorSet0.cp_t_tcb_A.read(uint2(_3032.xy), uint(_3032.z), 0).xyz;
        float _843 = _841.x;
        float _845 = _841.y;
        float _847 = _841.z;
        float _849 = _693 * _747;
        float _851 = _671 * 2.0;
        float _853 = -_851;
        float _855 = fma(_849, _853, _849);
        float _857 = fma(_671, 3.1415927410125732421875, _855);
        float _859 = _857 * 0.15915493667125701904296875;
        float _861 = _859 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = abs(_863);
        bool _867 = _865 >= 0.001000000047497451305389404296875;
        bool _869 = isnan(_865);
        bool _871 = _867 || _869;
        bool _873 = isnan(0.001000000047497451305389404296875);
        bool _875 = _871 || _873;
        float _877 = _399;
        float _879 = _749;
        float _881 = _849;
        if (!_875)
        {
            int _883 = _103 + 28;
            uint _885 = uint(int(uint(_883) >> uint(2)));
            uint _887 = uint(int(uint(int(_885)) >> uint(2)));
            int _889 = int(_885) & 3;
            float _891 = (*spvDescriptorSet0.cp_c5)._m0[int(_887)][_889];
            _877 = _891;
        }
        float _893 = _877;
        float _895 = _893;
        if (!_875)
        {
            float _897 = -_893;
            float _899 = _897 + 1.0;
            _879 = _899;
        }
        float _901 = _879;
        float _903 = _901;
        if (!_875)
        {
            _881 = _893;
        }
        float _905 = _881;
        bool _907 = !_875;
        float _909 = _905;
        if (!_907)
        {
            int _911 = _103 + 28;
            uint _913 = uint(int(uint(_911) >> uint(2)));
            uint _915 = uint(int(uint(int(_913)) >> uint(2)));
            int _917 = int(_913) & 3;
            float _919 = (*spvDescriptorSet0.cp_c5)._m0[int(_915)][_917];
            float _921 = 1.0 / _863;
            float _923 = _857 * _919;
            float _925 = _923 * 0.15915493667125701904296875;
            float _927 = -_923;
            float _929 = _857 + _927;
            float _931 = _929 * 0.15915493667125701904296875;
            float _933 = _925 * 6.283185482025146484375;
            float _935 = sin(_933);
            float _937 = _931 * 6.283185482025146484375;
            float _939 = sin(_937);
            float _941 = _935 * _921;
            float _943 = _939 * _921;
            _909 = _941;
            _903 = _943;
            _895 = _919;
        }
        float _945 = _909;
        float _947 = _903;
        float _949 = _895;
        bool _951 = !_661;
        float _953 = -_945;
        float _955 = _951 ? _953 : _945;
        float _957 = -_787;
        float _959 = _957 + _827;
        float _961 = -_807;
        float _963 = _961 + _847;
        float _965 = _631 * _955;
        float _967 = _643 * _955;
        float _969 = _625 * _955;
        float _971 = _639 * _955;
        float _973 = fma(_551, _947, _965);
        float _975 = fma(_547, _947, _967);
        int _977 = _103 + 24;
        uint _979 = uint(int(uint(_977) >> uint(2)));
        uint _981 = uint(int(uint(int(_979)) >> uint(2)));
        int _983 = int(_979) & 3;
        float _985 = (*spvDescriptorSet0.cp_c5)._m0[int(_981)][_983];
        float _987 = fma(_557, _947, _971);
        float _989 = fma(_545, _947, _969);
        float _991 = _975 * 2.0;
        float _993 = _973 * 2.0;
        float _995 = _989 * 2.0;
        float _997 = _987 * _991;
        int _999 = _103 + 20;
        uint _1001 = uint(int(uint(_999) >> uint(2)));
        uint _1003 = uint(int(uint(int(_1001)) >> uint(2)));
        int _1005 = int(_1001) & 3;
        float _1007 = (*spvDescriptorSet0.cp_c5)._m0[int(_1003)][_1005];
        float _1009 = _973 * _991;
        float _1011 = _989 * _991;
        float _1013 = -_997;
        float _1015 = fma(_989, _993, _1013);
        float _1017 = fma(_989, _993, _997);
        float _1019 = -_1009;
        float _1021 = fma(_987, _995, _1019);
        float _1023 = fma(_987, _995, _1009);
        float _1025 = _973 * _973;
        float _1027 = _989 * _989;
        float _1029 = fma(_987, _993, _1011);
        float _1031 = -_1011;
        float _1033 = fma(_987, _993, _1031);
        float _1035 = _987 * _987;
        float _1037 = -_785;
        float _1039 = _1037 + _825;
        float _1041 = fma(_1027, -2.0, 1.0);
        float _1043 = fma(_1025, -2.0, 1.0);
        float _1045 = fma(_959, _985, _787);
        float _1047 = fma(_1039, _985, _785);
        float _1049 = fma(_1035, -2.0, _1041);
        float _1051 = -_783;
        float _1053 = _1051 + _823;
        float _1055 = -_803;
        float _1057 = _1055 + _843;
        float _1059 = -_805;
        float _1061 = _1059 + _845;
        float _1063 = _1047 * _949;
        float _1065 = fma(_1053, _985, _783);
        float _1067 = fma(_1057, _985, _803);
        float _1069 = fma(_1061, _985, _805);
        float _1071 = fma(_963, _985, _807);
        float _1073 = fma(_401, _1007, _1063);
        float _1075 = _1065 * _949;
        float _1077 = _1045 * _949;
        float _1079 = _1067 * _949;
        float _1081 = _1069 * _949;
        float _1083 = _1071 * _949;
        float _1085 = fma(_1035, -2.0, _1043);
        float _1087 = fma(_1027, -2.0, _1043);
        float _1089 = fma(_403, _1007, _1075);
        float _1091 = fma(_405, _1007, _1077);
        float _1093 = fma(_407, _1007, _1079);
        float _1095 = fma(_409, _1007, _1081);
        float _1097 = fma(_411, _1007, _1083);
        _415 = _1089;
        _1099 = _1017;
        _1101 = _1033;
        _417 = _1073;
        _1103 = _1085;
        _1105 = _1049;
        _1107 = _1015;
        _1109 = _1023;
        _419 = _1091;
        _1111 = _1029;
        _1113 = _1021;
        _1115 = _1087;
        _421 = as_type<int>(_1093);
        _1117 = as_type<int>(_1095);
        _1119 = as_type<int>(_1097);
        _1121 = _1077;
        _1123 = _1067;
        _1125 = _1081;
        _1127 = _1043;
        _1129 = true;
    }
    else
    {
        float _1131 = _397 * 0.15915493667125701904296875;
        float _1133 = _393 * 0.15915493667125701904296875;
        float _1135 = _395 * 0.15915493667125701904296875;
        float _1137 = _1131 * 6.283185482025146484375;
        float _1139 = sin(_1137);
        float _1141 = _1131 * 6.283185482025146484375;
        float _1143 = cos(_1141);
        float _1145 = _1133 * 6.283185482025146484375;
        float _1147 = cos(_1145);
        float _1149 = _1135 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = _1133 * 6.283185482025146484375;
        float _1155 = sin(_1153);
        float _1157 = _1143 * _1147;
        float _1159 = _1139 * _1147;
        float _1161 = _1135 * 6.283185482025146484375;
        float _1163 = cos(_1161);
        float _1165 = _1139 * _1151;
        float _1167 = _1155 * _1143;
        float _1169 = _1139 * _1155;
        float _1171 = -_1159;
        float _1173 = fma(_1151, _1167, _1171);
        float _1175 = _1143 * _1163;
        float _1177 = _1163 * _1147;
        float _1179 = _1155 * _1163;
        float _1181 = _1139 * _1163;
        float _1183 = fma(_1155, _1165, _1157);
        float _1185 = -_1167;
        float _1187 = fma(_1147, _1165, _1185);
        float _1189 = fma(_1151, _1157, _1169);
        float _1191 = -_1151;
        float _1193 = _1191 + (-0.0);
        _1099 = _1179;
        _1101 = _1193;
        _1103 = _1183;
        _1105 = _1177;
        _1107 = _1187;
        _1109 = _1181;
        _1111 = _1189;
        _1113 = _1173;
        _1115 = _1175;
        _1117 = as_type<int>(_409);
        _1119 = as_type<int>(_411);
        _1121 = _1151;
        _1123 = _1165;
        _1125 = _1135;
        _1127 = _1167;
    }
    _1129 = false;
    float _1195 = _415;
    float _1197 = _1099;
    float _1199 = _1101;
    float _1201 = _417;
    float _1203 = _1103;
    float _1205 = _1105;
    float _1207 = _1107;
    float _1209 = _1109;
    float _1211 = _419;
    float _1213 = _1111;
    float _1215 = _1113;
    float _1217 = _1115;
    int _1219 = _421;
    int _1221 = _1117;
    int _1223 = _1119;
    float _1225 = _1121;
    float _1227 = _1123;
    float _1229 = _1125;
    float _1231 = _1127;
    float _1233 = _1195 * _1197;
    float _1235 = _1195 * _1199;
    float _1237 = _1201 * _1203;
    float _1239 = _1195 * _1205;
    float _1241 = _1201 * _1207;
    float _1243 = _1201 * _1209;
    int _1245 = _70 * 48;
    float _1247 = _1211 * _1213;
    float _1249 = _1211 * _1215;
    float _1251 = _1211 * _1217;
    bool _1253 = _70 != 0;
    uint _1255 = uint(int(uint(_1245) >> uint(2)));
    _39[int(_1255)] = as_type<uint>(_1239);
    int _1257 = _1245 + 4;
    uint _1259 = uint(int(uint(_1257) >> uint(2)));
    _39[int(_1259)] = as_type<uint>(_1241);
    int _1261 = _1245 + 8;
    uint _1263 = uint(int(uint(_1261) >> uint(2)));
    _39[int(_1263)] = as_type<uint>(_1247);
    int _1265 = _1245 + 12;
    uint _1267 = uint(int(uint(_1265) >> uint(2)));
    _39[int(_1267)] = uint(_1219);
    int _1269 = _70 * 112;
    int _1271 = _1245 + 16;
    int _1273 = _1245 + 16;
    uint _1275 = uint(int(uint(_1273) >> uint(2)));
    _39[int(_1275)] = as_type<uint>(_1233);
    int _1277 = _1245 + 20;
    uint _1279 = uint(int(uint(_1277) >> uint(2)));
    _39[int(_1279)] = as_type<uint>(_1237);
    int _1281 = _1245 + 24;
    uint _1283 = uint(int(uint(_1281) >> uint(2)));
    _39[int(_1283)] = as_type<uint>(_1249);
    int _1285 = _1245 + 28;
    uint _1287 = uint(int(uint(_1285) >> uint(2)));
    _39[int(_1287)] = uint(_1221);
    int _1289 = _1245 + 32;
    int _1291 = _1245 + 32;
    uint _1293 = uint(int(uint(_1291) >> uint(2)));
    _39[int(_1293)] = as_type<uint>(_1235);
    int _1295 = _1245 + 36;
    uint _1297 = uint(int(uint(_1295) >> uint(2)));
    _39[int(_1297)] = as_type<uint>(_1243);
    int _1299 = _1245 + 40;
    uint _1301 = uint(int(uint(_1299) >> uint(2)));
    _39[int(_1301)] = as_type<uint>(_1251);
    int _1303 = _1245 + 44;
    uint _1305 = uint(int(uint(_1303) >> uint(2)));
    _39[int(_1305)] = uint(_1223);
    float _1307 = _1225;
    float _1309 = _1227;
    float _1311 = _1229;
    float _1313 = _1231;
    float _1315 = _1195;
    float _1317 = _1201;
    float _1319 = _1215;
    float _1321 = _1213;
    float _1323 = _1207;
    float _1325 = _1211;
    if (!_1253)
    {
        _1307 = _1239;
    }
    float _1327 = _1307;
    float _1329 = _1327;
    if (!_1253)
    {
        _1309 = _1241;
    }
    float _1331 = _1309;
    float _1333 = _1331;
    if (!_1253)
    {
        _1311 = _1247;
    }
    float _1335 = _1311;
    float _1337 = _1335;
    if (!_1253)
    {
        _1313 = as_type<float>(_1219);
    }
    float _1339 = _1313;
    float _1341 = _1339;
    if (!_1253)
    {
        _1315 = _1233;
    }
    float _1343 = _1315;
    float _1345 = _1343;
    if (!_1253)
    {
        _1317 = _1237;
    }
    float _1347 = _1317;
    float _1349 = _1347;
    if (!_1253)
    {
        _423 = _1249;
    }
    float _1351 = _423;
    float _1353 = _1351;
    if (!_1253)
    {
        _425 = as_type<float>(_1221);
    }
    float _1355 = _425;
    float _1357 = _1355;
    if (!_1253)
    {
        _1319 = _1235;
    }
    float _1359 = _1319;
    float _1361 = _1359;
    if (!_1253)
    {
        _1321 = _1243;
    }
    float _1363 = _1321;
    float _1365 = _1363;
    if (!_1253)
    {
        _1323 = _1251;
    }
    float _1367 = _1323;
    float _1369 = _1367;
    if (!_1253)
    {
        _1325 = as_type<float>(_1223);
    }
    float _1371 = _1325;
    bool _1373 = !_1253;
    float _1375 = _1371;
    if (!_1373)
    {
        bool _1377 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _1379 = !_1377;
        if (!_1379)
        {
            uint _1381 = uint(int(uint(_1269) >> uint(2)));
            uint _1383 = uint(int(uint(int(_1381)) >> uint(2)));
            int _1385 = int(_1381) & 3;
            float _1387 = (*spvDescriptorSet0.cp_c6)._m0[int(_1383)][_1385];
            int _1389 = as_type<int>(_1387) * 48;
            int _1391 = 0;
            bool _1393;
            float _1491;
            float _1493;
            float _1501;
            float _1511;
            float _1513;
            float _1525;
            float _1537;
            float _1539;
            float _1541;
            float _1543;
            float _1545;
            float _1547;
            do
            {
                int _1395 = _1391;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _1397 = uint(int(uint(_1389) >> uint(2)));
                float _1399 = as_type<float>(_39[int(_1397)]);
                int _1401 = _1389 + 4;
                uint _1403 = uint(int(uint(_1401) >> uint(2)));
                float _1405 = as_type<float>(_39[int(_1403)]);
                int _1407 = _1389 + 8;
                uint _1409 = uint(int(uint(_1407) >> uint(2)));
                float _1411 = as_type<float>(_39[int(_1409)]);
                int _1413 = _1389 + 12;
                uint _1415 = uint(int(uint(_1413) >> uint(2)));
                float _1417 = as_type<float>(_39[int(_1415)]);
                int _1419 = _1395 + 1;
                int _1421 = _1389 + 16;
                uint _1423 = uint(int(uint(_1421) >> uint(2)));
                float _1425 = as_type<float>(_39[int(_1423)]);
                int _1427 = _1389 + 20;
                uint _1429 = uint(int(uint(_1427) >> uint(2)));
                float _1431 = as_type<float>(_39[int(_1429)]);
                int _1433 = _1389 + 24;
                uint _1435 = uint(int(uint(_1433) >> uint(2)));
                float _1437 = as_type<float>(_39[int(_1435)]);
                int _1439 = _1389 + 28;
                uint _1441 = uint(int(uint(_1439) >> uint(2)));
                float _1443 = as_type<float>(_39[int(_1441)]);
                bool _1445 = uint(_1419) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _1447 = _1389 + 32;
                uint _1449 = uint(int(uint(_1447) >> uint(2)));
                float _1451 = as_type<float>(_39[int(_1449)]);
                int _1453 = _1389 + 36;
                uint _1455 = uint(int(uint(_1453) >> uint(2)));
                float _1457 = as_type<float>(_39[int(_1455)]);
                int _1459 = _1389 + 40;
                uint _1461 = uint(int(uint(_1459) >> uint(2)));
                float _1463 = as_type<float>(_39[int(_1461)]);
                int _1465 = _1389 + 44;
                uint _1467 = uint(int(uint(_1465) >> uint(2)));
                float _1469 = as_type<float>(_39[int(_1467)]);
                float _1471 = _1405 * as_type<float>(_1221);
                float _1473 = _1233 * _1405;
                float _1475 = _1237 * _1405;
                float _1477 = _1249 * _1405;
                float _1479 = fma(_1399, as_type<float>(_1219), _1471);
                float _1481 = fma(_1239, _1399, _1473);
                float _1483 = fma(_1241, _1399, _1475);
                float _1485 = fma(_1247, _1399, _1477);
                float _1487 = fma(_1411, as_type<float>(_1223), _1479);
                float _1489 = _1431 * as_type<float>(_1221);
                _1491 = fma(_1235, _1411, _1481);
                _1493 = fma(_1243, _1411, _1483);
                float _1495 = _1233 * _1431;
                float _1497 = _1237 * _1431;
                float _1499 = fma(_1425, as_type<float>(_1219), _1489);
                _1501 = _1417 + _1487;
                float _1503 = fma(_1239, _1425, _1495);
                float _1505 = fma(_1241, _1425, _1497);
                float _1507 = fma(_1437, as_type<float>(_1223), _1499);
                float _1509 = _1457 * as_type<float>(_1221);
                _1511 = fma(_1235, _1437, _1503);
                _1513 = fma(_1243, _1437, _1505);
                float _1515 = _1233 * _1457;
                float _1517 = _1237 * _1457;
                float _1519 = _1249 * _1431;
                float _1521 = _1249 * _1457;
                float _1523 = fma(_1451, as_type<float>(_1219), _1509);
                _1525 = _1443 + _1507;
                float _1527 = fma(_1247, _1425, _1519);
                float _1529 = fma(_1239, _1451, _1515);
                float _1531 = fma(_1241, _1451, _1517);
                float _1533 = fma(_1247, _1451, _1521);
                float _1535 = fma(_1463, as_type<float>(_1223), _1523);
                _1537 = fma(_1251, _1411, _1485);
                _1539 = fma(_1251, _1437, _1527);
                _1541 = fma(_1235, _1463, _1529);
                _1543 = fma(_1243, _1463, _1531);
                _1545 = fma(_1251, _1463, _1533);
                _1547 = _1469 + _1535;
                uint _1549 = uint(int(uint(_1245) >> uint(2)));
                _39[int(_1549)] = as_type<uint>(_1491);
                int _1551 = _1245 + 4;
                uint _1553 = uint(int(uint(_1551) >> uint(2)));
                _39[int(_1553)] = as_type<uint>(_1493);
                int _1555 = _1245 + 8;
                uint _1557 = uint(int(uint(_1555) >> uint(2)));
                _39[int(_1557)] = as_type<uint>(_1537);
                int _1559 = _1245 + 12;
                uint _1561 = uint(int(uint(_1559) >> uint(2)));
                _39[int(_1561)] = as_type<uint>(_1501);
                int _1563 = _1245 + 16;
                uint _1565 = uint(int(uint(_1563) >> uint(2)));
                _39[int(_1565)] = as_type<uint>(_1511);
                int _1567 = _1245 + 20;
                uint _1569 = uint(int(uint(_1567) >> uint(2)));
                _39[int(_1569)] = as_type<uint>(_1513);
                int _1571 = _1245 + 24;
                uint _1573 = uint(int(uint(_1571) >> uint(2)));
                _39[int(_1573)] = as_type<uint>(_1539);
                int _1575 = _1245 + 28;
                uint _1577 = uint(int(uint(_1575) >> uint(2)));
                _39[int(_1577)] = as_type<uint>(_1525);
                int _1579 = _1245 + 32;
                uint _1581 = uint(int(uint(_1579) >> uint(2)));
                _39[int(_1581)] = as_type<uint>(_1541);
                int _1583 = _1245 + 36;
                uint _1585 = uint(int(uint(_1583) >> uint(2)));
                _39[int(_1585)] = as_type<uint>(_1543);
                int _1587 = _1245 + 40;
                uint _1589 = uint(int(uint(_1587) >> uint(2)));
                _39[int(_1589)] = as_type<uint>(_1545);
                int _1591 = _1245 + 44;
                uint _1593 = uint(int(uint(_1591) >> uint(2)));
                _39[int(_1593)] = as_type<uint>(_1547);
                _1393 = !_1445;
                _1391 = _1419;
            } while (_1393);
            _1329 = _1491;
            _1333 = _1493;
            _1337 = _1537;
            _1341 = _1501;
            _1345 = _1511;
            _1349 = _1513;
            _1353 = _1539;
            _1357 = _1525;
            _1361 = _1541;
            _1365 = _1543;
            _1369 = _1545;
            _1375 = _1547;
            _1595 = true;
        }
        else
        {
            _1329 = 0.0;
            _1333 = 0.0;
            _1337 = 0.0;
            _1341 = 0.0;
            _1345 = 0.0;
            _1349 = 0.0;
            _1353 = 0.0;
            _1357 = 0.0;
            _1361 = 0.0;
            _1365 = 0.0;
            _1369 = 0.0;
            _1375 = 0.0;
        }
    }
    _1595 = false;
    float _1597 = _1329;
    float _1599 = _1333;
    float _1601 = _1337;
    float _1603 = _1341;
    float _1605 = _1345;
    float _1607 = _1349;
    float _1609 = _1353;
    float _1611 = _1357;
    float _1613 = _1361;
    float _1615 = _1365;
    float _1617 = _1369;
    float _1619 = _1375;
    int _1621 = _1269 + 80;
    uint _1623 = uint(int(uint(_1621) >> uint(2)));
    uint _1625 = uint(int(uint(int(_1623)) >> uint(2)));
    int _1627 = int(_1623) & 3;
    float _1629 = (*spvDescriptorSet0.cp_c6)._m0[int(_1625)][_1627];
    int _1631 = int(_1623) + 1;
    uint _1633 = uint(int(uint(_1631) >> uint(2)));
    int _1635 = _1631 & 3;
    float _1637 = (*spvDescriptorSet0.cp_c6)._m0[int(_1633)][_1635];
    bool _1639 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _1641 = _1269 + 64;
    uint _1643 = uint(int(uint(_1641) >> uint(2)));
    uint _1645 = uint(int(uint(int(_1643)) >> uint(2)));
    int _1647 = int(_1643) & 3;
    float _1649 = (*spvDescriptorSet0.cp_c6)._m0[int(_1645)][_1647];
    int _1651 = int(_1643) + 1;
    uint _1653 = uint(int(uint(_1651) >> uint(2)));
    int _1655 = _1651 & 3;
    float _1657 = (*spvDescriptorSet0.cp_c6)._m0[int(_1653)][_1655];
    int _1659 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _1661 = _1659 + _70;
    int _1663 = _1269 + 88;
    uint _1665 = uint(int(uint(_1663) >> uint(2)));
    uint _1667 = uint(int(uint(int(_1665)) >> uint(2)));
    int _1669 = int(_1665) & 3;
    float _1671 = (*spvDescriptorSet0.cp_c6)._m0[int(_1667)][_1669];
    int _1673 = int(_1665) + 1;
    uint _1675 = uint(int(uint(_1673) >> uint(2)));
    int _1677 = _1673 & 3;
    float _1679 = (*spvDescriptorSet0.cp_c6)._m0[int(_1675)][_1677];
    int _1681 = _1269 + 72;
    uint _1683 = uint(int(uint(_1681) >> uint(2)));
    uint _1685 = uint(int(uint(int(_1683)) >> uint(2)));
    int _1687 = int(_1683) & 3;
    float _1689 = (*spvDescriptorSet0.cp_c6)._m0[int(_1685)][_1687];
    int _1691 = int(_1683) + 1;
    uint _1693 = uint(int(uint(_1691) >> uint(2)));
    int _1695 = _1691 & 3;
    float _1697 = (*spvDescriptorSet0.cp_c6)._m0[int(_1693)][_1695];
    int _1699 = _1269 + 96;
    uint _1701 = uint(int(uint(_1699) >> uint(2)));
    uint _1703 = uint(int(uint(int(_1701)) >> uint(2)));
    int _1705 = int(_1701) & 3;
    float _1707 = (*spvDescriptorSet0.cp_c6)._m0[int(_1703)][_1705];
    int _1709 = int(_1701) + 1;
    uint _1711 = uint(int(uint(_1709) >> uint(2)));
    int _1713 = _1709 & 3;
    float _1715 = (*spvDescriptorSet0.cp_c6)._m0[int(_1711)][_1713];
    int _1717 = _1269 + 104;
    uint _1719 = uint(int(uint(_1717) >> uint(2)));
    uint _1721 = uint(int(uint(int(_1719)) >> uint(2)));
    int _1723 = int(_1719) & 3;
    float _1725 = (*spvDescriptorSet0.cp_c6)._m0[int(_1721)][_1723];
    int _1727 = int(_1719) + 1;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    int _1731 = _1727 & 3;
    float _1733 = (*spvDescriptorSet0.cp_c6)._m0[int(_1729)][_1731];
    int _1735 = _1269 + 16;
    uint _1737 = uint(int(uint(_1735) >> uint(2)));
    uint _1739 = uint(int(uint(int(_1737)) >> uint(2)));
    int _1741 = int(_1737) & 3;
    float _1743 = (*spvDescriptorSet0.cp_c6)._m0[int(_1739)][_1741];
    int _1745 = int(_1737) + 1;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    int _1749 = _1745 & 3;
    float _1751 = (*spvDescriptorSet0.cp_c6)._m0[int(_1747)][_1749];
    if (!_1639)
    {
        uint _1753 = uint(int(uint(_1245) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1753)] = as_type<uint>(_1597);
        int _1755 = _1245 + 4;
        uint _1757 = uint(int(uint(_1755) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1757)] = as_type<uint>(_1599);
        int _1759 = _1245 + 8;
        uint _1761 = uint(int(uint(_1759) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1761)] = as_type<uint>(_1601);
        int _1763 = _1245 + 12;
        uint _1765 = uint(int(uint(_1763) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1765)] = as_type<uint>(_1603);
        uint _1767 = uint(int(uint(_1271) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1767)] = as_type<uint>(_1605);
        int _1769 = _1271 + 4;
        uint _1771 = uint(int(uint(_1769) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1771)] = as_type<uint>(_1607);
        int _1773 = _1271 + 8;
        uint _1775 = uint(int(uint(_1773) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1775)] = as_type<uint>(_1609);
        int _1777 = _1271 + 12;
        uint _1779 = uint(int(uint(_1777) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1779)] = as_type<uint>(_1611);
        uint _1781 = uint(int(uint(_1289) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1781)] = as_type<uint>(_1613);
        int _1783 = _1289 + 4;
        uint _1785 = uint(int(uint(_1783) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1785)] = as_type<uint>(_1615);
        int _1787 = _1289 + 8;
        uint _1789 = uint(int(uint(_1787) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1789)] = as_type<uint>(_1617);
        int _1791 = _1289 + 12;
        uint _1793 = uint(int(uint(_1791) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_1793)] = as_type<uint>(_1619);
    }
    float _1795 = _1607 * _1629;
    float _1797 = _1615 * _1629;
    int _1799 = _1269 + 32;
    uint _1801 = uint(int(uint(_1799) >> uint(2)));
    uint _1803 = uint(int(uint(int(_1801)) >> uint(2)));
    int _1805 = int(_1801) & 3;
    float _1807 = (*spvDescriptorSet0.cp_c6)._m0[int(_1803)][_1805];
    int _1809 = int(_1801) + 1;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    int _1813 = _1809 & 3;
    float _1815 = (*spvDescriptorSet0.cp_c6)._m0[int(_1811)][_1813];
    float _1817 = _1599 * _1629;
    float _1819 = fma(_1605, _1649, _1795);
    float _1821 = fma(_1613, _1649, _1797);
    float _1823 = _1599 * _1637;
    float _1825 = _1607 * _1637;
    float _1827 = _1615 * _1637;
    float _1829 = _1599 * _1679;
    int _1831 = _1269 + 48;
    uint _1833 = uint(int(uint(_1831) >> uint(2)));
    uint _1835 = uint(int(uint(int(_1833)) >> uint(2)));
    int _1837 = int(_1833) & 3;
    float _1839 = (*spvDescriptorSet0.cp_c6)._m0[int(_1835)][_1837];
    int _1841 = int(_1833) + 1;
    uint _1843 = uint(int(uint(_1841) >> uint(2)));
    int _1845 = _1841 & 3;
    float _1847 = (*spvDescriptorSet0.cp_c6)._m0[int(_1843)][_1845];
    float _1849 = fma(_1597, _1657, _1823);
    float _1851 = fma(_1605, _1657, _1825);
    float _1853 = fma(_1613, _1657, _1827);
    float _1855 = _1599 * _1671;
    float _1857 = _1607 * _1671;
    float _1859 = _1615 * _1671;
    float _1861 = _1607 * _1679;
    float _1863 = _1615 * _1679;
    float _1865 = fma(_1597, _1689, _1855);
    int _1867 = _1269 + 24;
    uint _1869 = uint(int(uint(_1867) >> uint(2)));
    uint _1871 = uint(int(uint(int(_1869)) >> uint(2)));
    int _1873 = int(_1869) & 3;
    float _1875 = (*spvDescriptorSet0.cp_c6)._m0[int(_1871)][_1873];
    int _1877 = int(_1869) + 1;
    uint _1879 = uint(int(uint(_1877) >> uint(2)));
    int _1881 = _1877 & 3;
    float _1883 = (*spvDescriptorSet0.cp_c6)._m0[int(_1879)][_1881];
    float _1885 = fma(_1597, _1697, _1829);
    float _1887 = fma(_1605, _1689, _1857);
    float _1889 = fma(_1605, _1697, _1861);
    float _1891 = fma(_1613, _1689, _1859);
    float _1893 = fma(_1613, _1697, _1863);
    float _1895 = fma(_1601, _1715, _1849);
    float _1897 = fma(_1609, _1707, _1819);
    int _1899 = _1269 + 40;
    uint _1901 = uint(int(uint(_1899) >> uint(2)));
    uint _1903 = uint(int(uint(int(_1901)) >> uint(2)));
    int _1905 = int(_1901) & 3;
    float _1907 = (*spvDescriptorSet0.cp_c6)._m0[int(_1903)][_1905];
    int _1909 = int(_1901) + 1;
    uint _1911 = uint(int(uint(_1909) >> uint(2)));
    int _1913 = _1909 & 3;
    float _1915 = (*spvDescriptorSet0.cp_c6)._m0[int(_1911)][_1913];
    float _1917 = fma(_1609, _1715, _1851);
    float _1919 = fma(_1609, _1725, _1887);
    float _1921 = fma(_1609, _1733, _1889);
    float _1923 = fma(_1601, _1733, _1885);
    float _1925 = fma(_1617, _1733, _1893);
    float _1927 = fma(_1597, _1649, _1817);
    float _1929 = _1921 + _1611;
    int _1931 = _1269 + 56;
    uint _1933 = uint(int(uint(_1931) >> uint(2)));
    uint _1935 = uint(int(uint(int(_1933)) >> uint(2)));
    int _1937 = int(_1933) & 3;
    float _1939 = (*spvDescriptorSet0.cp_c6)._m0[int(_1935)][_1937];
    int _1941 = int(_1933) + 1;
    uint _1943 = uint(int(uint(_1941) >> uint(2)));
    int _1945 = _1941 & 3;
    float _1947 = (*spvDescriptorSet0.cp_c6)._m0[int(_1943)][_1945];
    float _1949 = _1923 + _1603;
    float _1951 = fma(_1617, _1707, _1821);
    float _1953 = _1929 * _1751;
    float _1955 = fma(_1617, _1715, _1853);
    float _1957 = fma(_1617, _1725, _1891);
    float _1959 = _1925 + _1619;
    float _1961 = fma(_1949, _1743, _1953);
    float _1963 = fma(_1601, _1707, _1927);
    float _1965 = fma(_1601, _1725, _1865);
    float _1967 = _1897 * _1751;
    float _1969 = _1917 * _1751;
    float _1971 = _1919 * _1751;
    int _1973 = _1661 * 48;
    float _1975 = _1929 * _1815;
    float _1977 = _1897 * _1815;
    float _1979 = _1917 * _1815;
    float _1981 = _1919 * _1815;
    float _1983 = fma(_1949, _1807, _1975);
    float _1985 = fma(_1963, _1743, _1967);
    float _1987 = fma(_1895, _1743, _1969);
    float _1989 = fma(_1965, _1743, _1971);
    float _1991 = _1929 * _1847;
    float _1993 = _1897 * _1847;
    float _1995 = _1917 * _1847;
    float _1997 = _1919 * _1847;
    float _1999 = fma(_1949, _1839, _1991);
    float _2001 = fma(_1963, _1807, _1977);
    float _2003 = fma(_1895, _1807, _1979);
    float _2005 = fma(_1965, _1807, _1981);
    float _2007 = fma(_1963, _1839, _1993);
    float _2009 = fma(_1895, _1839, _1995);
    float _2011 = fma(_1959, _1875, _1961);
    float _2013 = fma(_1965, _1839, _1997);
    float _2015 = fma(_1951, _1875, _1985);
    float _2017 = fma(_1955, _1875, _1987);
    float _2019 = _2011 + _1883;
    float _2021 = fma(_1957, _1875, _1989);
    int _2023 = _1973 + 16;
    float _2025 = fma(_1959, _1907, _1983);
    float _2027 = fma(_1951, _1907, _2001);
    float _2029 = fma(_1955, _1907, _2003);
    float _2031 = fma(_1957, _1907, _2005);
    float _2033 = _2025 + _1915;
    int _2035 = _1973 + 32;
    uint _2037 = uint(int(uint(_2023) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2037)] = as_type<uint>(_2015);
    int _2039 = _2023 + 4;
    uint _2041 = uint(int(uint(_2039) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2041)] = as_type<uint>(_2017);
    int _2043 = _2023 + 8;
    uint _2045 = uint(int(uint(_2043) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2045)] = as_type<uint>(_2021);
    int _2047 = _2023 + 12;
    uint _2049 = uint(int(uint(_2047) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2049)] = as_type<uint>(_2019);
    int _2051 = _1973 + 48;
    float _2053 = fma(_1959, _1939, _1999);
    float _2055 = fma(_1951, _1939, _2007);
    float _2057 = fma(_1955, _1939, _2009);
    float _2059 = fma(_1957, _1939, _2013);
    float _2061 = _2053 + _1947;
    uint _2063 = uint(int(uint(_2035) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2063)] = as_type<uint>(_2027);
    int _2065 = _2035 + 4;
    uint _2067 = uint(int(uint(_2065) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2067)] = as_type<uint>(_2029);
    int _2069 = _2035 + 8;
    uint _2071 = uint(int(uint(_2069) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2071)] = as_type<uint>(_2031);
    int _2073 = _2035 + 12;
    uint _2075 = uint(int(uint(_2073) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2075)] = as_type<uint>(_2033);
    uint _2077 = uint(int(uint(_2051) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2077)] = as_type<uint>(_2055);
    int _2079 = _2051 + 4;
    uint _2081 = uint(int(uint(_2079) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2081)] = as_type<uint>(_2057);
    int _2083 = _2051 + 8;
    uint _2085 = uint(int(uint(_2083) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2085)] = as_type<uint>(_2059);
    int _2087 = _2051 + 12;
    uint _2089 = uint(int(uint(_2087) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_2089)] = as_type<uint>(_2061);
}

