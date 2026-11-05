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
};

static inline __attribute__((always_inline))
int _56(thread const int& _3193, thread const int& _3194, constant _10& support_buffer)
{
    int _3197 = 1 + _3194;
    float _3199 = support_buffer._m5[_3197].x;
    bool _3201 = _3199 == 1.0;
    if (_3201)
    {
        return _3193;
    }
    float _3203 = float(_3193);
    float _3205 = _3203 * _3199;
    int _3207 = int(_3205);
    return _3207;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _743 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = _66 & 31;
    bool _74 = _72 == 0;
    bool _76 = uint(_72) < 32u;
    int _78 = 32 - _72;
    int _80 = _72 - 32;
    int _82 = 1 << _72;
    uint _85 = uint(int(uint(0) >> uint(_78)));
    int _87 = _82 | int(_85);
    int _89 = _74 ? 1 : _87;
    bool _91 = uint(_80) < 32u;
    int _93 = 0 << _80;
    int _95 = _91 ? _93 : 0;
    float _97 = _76 ? as_type<float>(_89) : as_type<float>(_95);
    int _99 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    int _101 = _99 + 32;
    uint _103 = uint(int(uint(_101) >> uint(2)));
    uint _105 = uint(int(uint(int(_103)) >> uint(2)));
    int _107 = int(_103) & 3;
    float _109 = (*spvDescriptorSet0.cp_c5)._m0[int(_105)][_107];
    int _111 = as_type<int>(_97) & as_type<int>(_109);
    bool _113 = _111 != 0;
    int _115 = 0;
    float _117 = _97;
    float _119 = _109;
    if (_113)
    {
        uint _121 = uint(int(uint(_99) >> uint(2)));
        uint _123 = uint(int(uint(int(_121)) >> uint(2)));
        int _125 = int(_121) & 3;
        float _127 = (*spvDescriptorSet0.cp_c5)._m0[int(_123)][_125];
        _115 = as_type<int>(_127);
    }
    int _129 = _115;
    if (!_113)
    {
        _117 = 0.0;
    }
    float _131 = _117;
    float _133 = 0.0;
    if (!_113)
    {
        _133 = 0.0;
        _119 = 0.0;
    }
    float _135 = _133;
    float _137 = _119;
    float _139 = 0.0;
    if (_113)
    {
        _139 = 1.4012984643248170709237295832899e-45;
    }
    float _141 = _139;
    float _143 = 0.0;
    float _145 = 0.0;
    if (!_113)
    {
        _143 = 0.0;
        _145 = 0.0;
    }
    float _147 = _143;
    float _149 = _145;
    float _151 = 0.0;
    float _153 = _147;
    float _155 = _149;
    if (!_113)
    {
        _151 = 0.0;
    }
    float _157 = _151;
    int _159 = 0;
    int _161 = 0;
    float _163 = _157;
    if (!_113)
    {
        _159 = 0;
        _161 = 0;
    }
    int _165 = _159;
    int _167 = _161;
    int _169 = 0;
    if (!_113)
    {
        _169 = 0;
    }
    int _171 = _169;
    float _173 = 0.0;
    if (_113)
    {
        _173 = 2.8025969286496341418474591665798e-45;
    }
    float _175 = _173;
    float _177 = _135;
    float _179 = _137;
    float _181 = _131;
    float _183 = _175;
    if (_113)
    {
        int _185 = _66;
        int _187 = 0;
        int _189 = _56(_185, _187, (*spvDescriptorSet0.support_buffer));
        int _191 = _129;
        int _193 = 0;
        int _195 = _56(_191, _193, (*spvDescriptorSet0.support_buffer));
        int3 _1379 = int3(_189, _195, as_type<int>(_141));
        float3 _199 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1379.xy), uint(_1379.z), 0).xyz;
        float _201 = _199.x;
        float _203 = _199.y;
        float _205 = _199.z;
        _177 = _201;
        _179 = _203;
        _181 = _205;
    }
    float _207 = _177;
    float _209 = _179;
    float _211 = _181;
    if (_113)
    {
        int _213 = _66;
        int _215 = 0;
        int _217 = _56(_213, _215, (*spvDescriptorSet0.support_buffer));
        int _219 = _129;
        int _221 = 0;
        int _223 = _56(_219, _221, (*spvDescriptorSet0.support_buffer));
        int3 _1405 = int3(_217, _223, 0);
        float3 _225 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1405.xy), uint(_1405.z), 0).xyz;
        float _227 = _225.x;
        float _229 = _225.y;
        float _231 = _225.z;
        _153 = _227;
        _155 = _229;
        _163 = _231;
    }
    float _233 = _153;
    float _235 = _155;
    float _237 = _163;
    int _239 = _165;
    int _241 = _167;
    int _243 = _171;
    if (_113)
    {
        int _245 = _66;
        int _247 = 0;
        int _249 = _56(_245, _247, (*spvDescriptorSet0.support_buffer));
        int _251 = _129;
        int _253 = 0;
        int _255 = _56(_251, _253, (*spvDescriptorSet0.support_buffer));
        int3 _1436 = int3(_249, _255, as_type<int>(_175));
        float3 _257 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1436.xy), uint(_1436.z), 0).xyz;
        float _259 = _257.x;
        float _261 = _257.y;
        float _263 = _257.z;
        _239 = as_type<int>(_259);
        _241 = as_type<int>(_261);
        _243 = as_type<int>(_263);
    }
    int _265 = _239;
    int _267 = _241;
    int _269 = _243;
    bool _271 = _66 != 0;
    int _273 = _66 * 48;
    int _275 = _66 * 112;
    float _277 = _207 * 0.15915493667125701904296875;
    float _279 = _211 * 0.15915493667125701904296875;
    float _281 = _209 * 0.15915493667125701904296875;
    float _283 = _277 * 6.283185482025146484375;
    float _285 = cos(_283);
    float _287 = _279 * 6.283185482025146484375;
    float _289 = sin(_287);
    float _291 = _279 * 6.283185482025146484375;
    float _293 = cos(_291);
    float _295 = _281 * 6.283185482025146484375;
    float _297 = cos(_295);
    float _299 = _277 * 6.283185482025146484375;
    float _301 = sin(_299);
    float _303 = _281 * 6.283185482025146484375;
    float _305 = sin(_303);
    bool _307 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _309 = _285 * _293;
    float _311 = _289 * _285;
    float _313 = _285 * _297;
    float _315 = _301 * _289;
    float _317 = _301 * _293;
    float _319 = _301 * _297;
    int _321 = 0;
    float _323 = _311;
    uint _325 = as_type<uint>(_313);
    float _327 = _319;
    float _329 = _281;
    if (!_307)
    {
        _321 = _265;
    }
    int _331 = _321;
    float _333 = _301 * _305;
    float _335 = _297 * _233;
    float _337 = fma(_305, _309, _315);
    float _339 = -_317;
    float _341 = fma(_305, _311, _339);
    float _343 = -_311;
    float _345 = fma(_293, _333, _343);
    float _347 = fma(_289, _333, _309);
    float _349 = _305 * _233;
    float _351 = _293 * _335;
    float _353 = _289 * _335;
    float _355 = _319 * _235;
    float _357 = _345 * _235;
    float _359 = _337 * _237;
    float _361 = _313 * _237;
    float _363 = _347 * _235;
    float _365 = _341 * _237;
    float _367 = _341;
    float _369 = _337;
    float _371 = _347;
    float _373 = _363;
    float _375 = _357;
    float _377 = _365;
    float _379 = _359;
    if (!_307)
    {
        uint _381 = uint(int(uint(_273) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_381)] = as_type<uint>(_351);
        int _383 = _273 + 4;
        uint _385 = uint(int(uint(_383) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_385)] = as_type<uint>(_357);
        int _387 = _273 + 8;
        uint _389 = uint(int(uint(_387) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_389)] = as_type<uint>(_359);
        int _391 = _273 + 12;
        uint _393 = uint(int(uint(_391) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_393)] = uint(_331);
    }
    float _395 = -_349;
    float _397 = (-0.0) + _395;
    int _399 = _273 + 32;
    uint _401 = uint(int(uint(_399) >> uint(2)));
    _39[int(_401)] = as_type<uint>(_397);
    int _403 = _273 + 36;
    uint _405 = uint(int(uint(_403) >> uint(2)));
    _39[int(_405)] = as_type<uint>(_355);
    int _407 = _273 + 40;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    _39[int(_409)] = as_type<uint>(_361);
    int _411 = _273 + 44;
    uint _413 = uint(int(uint(_411) >> uint(2)));
    _39[int(_413)] = uint(_269);
    if (!_307)
    {
        int _415 = _273 + 16;
        _323 = as_type<float>(_415);
    }
    float _417 = _323;
    int _419 = _273 + 16;
    uint _421 = uint(int(uint(_419) >> uint(2)));
    _39[int(_421)] = as_type<uint>(_353);
    int _423 = _273 + 20;
    uint _425 = uint(int(uint(_423) >> uint(2)));
    _39[int(_425)] = as_type<uint>(_363);
    int _427 = _273 + 24;
    uint _429 = uint(int(uint(_427) >> uint(2)));
    _39[int(_429)] = as_type<uint>(_365);
    int _431 = _273 + 28;
    uint _433 = uint(int(uint(_431) >> uint(2)));
    _39[int(_433)] = uint(_267);
    float _435 = _417;
    float _437 = as_type<float>(_267);
    if (!_307)
    {
        int _439 = _273 + 32;
        _325 = uint(_439);
    }
    uint _441 = _325;
    if (!_271)
    {
        _367 = as_type<float>(_265);
    }
    float _443 = _367;
    float _445 = _443;
    if (!_307)
    {
        uint _447 = uint(int(uint(as_type<int>(_417)) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_447)] = as_type<uint>(_353);
        int _449 = as_type<int>(_417) + 4;
        uint _451 = uint(int(uint(_449) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_451)] = as_type<uint>(_363);
        int _453 = as_type<int>(_417) + 8;
        uint _455 = uint(int(uint(_453) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_455)] = as_type<uint>(_365);
        int _457 = as_type<int>(_417) + 12;
        uint _459 = uint(int(uint(_457) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_459)] = uint(_267);
    }
    if (!_271)
    {
        _369 = as_type<float>(_267);
    }
    float _461 = _369;
    float _463 = _461;
    if (!_307)
    {
        uint _465 = uint(int(uint(int(_441)) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_465)] = as_type<uint>(_397);
        int _467 = int(_441) + 4;
        uint _469 = uint(int(uint(_467) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_469)] = as_type<uint>(_355);
        int _471 = int(_441) + 8;
        uint _473 = uint(int(uint(_471) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_473)] = as_type<uint>(_361);
        int _475 = int(_441) + 12;
        uint _477 = uint(int(uint(_475) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_477)] = uint(_269);
    }
    if (!_271)
    {
        _371 = as_type<float>(_269);
    }
    float _479 = _371;
    float _481 = _479;
    if (!_271)
    {
        _327 = _397;
    }
    float _483 = _327;
    uint _485 = uint(int(uint(_273) >> uint(2)));
    _39[int(_485)] = as_type<uint>(_351);
    int _487 = _273 + 4;
    uint _489 = uint(int(uint(_487) >> uint(2)));
    _39[int(_489)] = as_type<uint>(_357);
    int _491 = _273 + 8;
    uint _493 = uint(int(uint(_491) >> uint(2)));
    _39[int(_493)] = as_type<uint>(_359);
    int _495 = _273 + 12;
    uint _497 = uint(int(uint(_495) >> uint(2)));
    _39[int(_497)] = uint(_265);
    float _499 = _483;
    if (!_271)
    {
        _183 = _351;
    }
    float _501 = _183;
    float _503 = _501;
    if (!_271)
    {
        _329 = _353;
    }
    float _505 = _329;
    float _507 = _505;
    if (!_271)
    {
        _435 = _355;
    }
    float _509 = _435;
    float _511 = _509;
    if (!_271)
    {
        _437 = _361;
    }
    float _513 = _437;
    bool _515 = !_271;
    float _517 = _513;
    if (!_515)
    {
        bool _519 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _521 = !_519;
        if (!_521)
        {
            uint _523 = uint(int(uint(_275) >> uint(2)));
            uint _525 = uint(int(uint(int(_523)) >> uint(2)));
            int _527 = int(_523) & 3;
            float _529 = (*spvDescriptorSet0.cp_c6)._m0[int(_525)][_527];
            int _531 = as_type<int>(_529) * 48;
            int _533 = 0;
            bool _535;
            float _633;
            float _637;
            float _641;
            float _645;
            float _661;
            float _663;
            float _673;
            float _685;
            float _689;
            float _691;
            float _693;
            float _695;
            do
            {
                int _537 = _533;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _539 = uint(int(uint(_531) >> uint(2)));
                float _541 = as_type<float>(_39[int(_539)]);
                int _543 = _531 + 4;
                uint _545 = uint(int(uint(_543) >> uint(2)));
                float _547 = as_type<float>(_39[int(_545)]);
                int _549 = _531 + 8;
                uint _551 = uint(int(uint(_549) >> uint(2)));
                float _553 = as_type<float>(_39[int(_551)]);
                int _555 = _531 + 12;
                uint _557 = uint(int(uint(_555) >> uint(2)));
                float _559 = as_type<float>(_39[int(_557)]);
                int _561 = _537 + 1;
                int _563 = _531 + 16;
                uint _565 = uint(int(uint(_563) >> uint(2)));
                float _567 = as_type<float>(_39[int(_565)]);
                int _569 = _531 + 20;
                uint _571 = uint(int(uint(_569) >> uint(2)));
                float _573 = as_type<float>(_39[int(_571)]);
                int _575 = _531 + 24;
                uint _577 = uint(int(uint(_575) >> uint(2)));
                float _579 = as_type<float>(_39[int(_577)]);
                int _581 = _531 + 28;
                uint _583 = uint(int(uint(_581) >> uint(2)));
                float _585 = as_type<float>(_39[int(_583)]);
                bool _587 = uint(_561) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _589 = _531 + 32;
                uint _591 = uint(int(uint(_589) >> uint(2)));
                float _593 = as_type<float>(_39[int(_591)]);
                int _595 = _531 + 36;
                uint _597 = uint(int(uint(_595) >> uint(2)));
                float _599 = as_type<float>(_39[int(_597)]);
                int _601 = _531 + 40;
                uint _603 = uint(int(uint(_601) >> uint(2)));
                float _605 = as_type<float>(_39[int(_603)]);
                int _607 = _531 + 44;
                uint _609 = uint(int(uint(_607) >> uint(2)));
                float _611 = as_type<float>(_39[int(_609)]);
                float _613 = _547 * as_type<float>(_267);
                float _615 = _353 * _547;
                float _617 = _363 * _547;
                float _619 = _365 * _547;
                float _621 = fma(_541, as_type<float>(_265), _613);
                float _623 = fma(_351, _541, _615);
                float _625 = fma(_357, _541, _617);
                float _627 = fma(_359, _541, _619);
                float _629 = fma(_553, as_type<float>(_269), _621);
                float _631 = -_349;
                _633 = fma(_631, _553, _623);
                float _635 = _353 * _573;
                _637 = fma(_361, _553, _627);
                float _639 = _573 * as_type<float>(_267);
                _641 = _559 + _629;
                float _643 = _363 * _573;
                _645 = fma(_355, _553, _625);
                float _647 = fma(_567, as_type<float>(_265), _639);
                float _649 = fma(_351, _567, _635);
                float _651 = fma(_357, _567, _643);
                float _653 = _365 * _573;
                float _655 = fma(_579, as_type<float>(_269), _647);
                float _657 = _599 * as_type<float>(_267);
                float _659 = -_349;
                _661 = fma(_659, _579, _649);
                _663 = fma(_355, _579, _651);
                float _665 = _353 * _599;
                float _667 = _363 * _599;
                float _669 = _365 * _599;
                float _671 = fma(_593, as_type<float>(_265), _657);
                _673 = _585 + _655;
                float _675 = fma(_359, _567, _653);
                float _677 = fma(_351, _593, _665);
                float _679 = fma(_357, _593, _667);
                float _681 = fma(_359, _593, _669);
                float _683 = fma(_605, as_type<float>(_269), _671);
                _685 = fma(_361, _579, _675);
                float _687 = -_349;
                _689 = fma(_687, _605, _677);
                _691 = fma(_355, _605, _679);
                _693 = fma(_361, _605, _681);
                _695 = _611 + _683;
                uint _697 = uint(int(uint(_273) >> uint(2)));
                _39[int(_697)] = as_type<uint>(_633);
                int _699 = _273 + 4;
                uint _701 = uint(int(uint(_699) >> uint(2)));
                _39[int(_701)] = as_type<uint>(_645);
                int _703 = _273 + 8;
                uint _705 = uint(int(uint(_703) >> uint(2)));
                _39[int(_705)] = as_type<uint>(_637);
                int _707 = _273 + 12;
                uint _709 = uint(int(uint(_707) >> uint(2)));
                _39[int(_709)] = as_type<uint>(_641);
                int _711 = _273 + 16;
                uint _713 = uint(int(uint(_711) >> uint(2)));
                _39[int(_713)] = as_type<uint>(_661);
                int _715 = _273 + 20;
                uint _717 = uint(int(uint(_715) >> uint(2)));
                _39[int(_717)] = as_type<uint>(_663);
                int _719 = _273 + 24;
                uint _721 = uint(int(uint(_719) >> uint(2)));
                _39[int(_721)] = as_type<uint>(_685);
                int _723 = _273 + 28;
                uint _725 = uint(int(uint(_723) >> uint(2)));
                _39[int(_725)] = as_type<uint>(_673);
                int _727 = _273 + 32;
                uint _729 = uint(int(uint(_727) >> uint(2)));
                _39[int(_729)] = as_type<uint>(_689);
                int _731 = _273 + 36;
                uint _733 = uint(int(uint(_731) >> uint(2)));
                _39[int(_733)] = as_type<uint>(_691);
                int _735 = _273 + 40;
                uint _737 = uint(int(uint(_735) >> uint(2)));
                _39[int(_737)] = as_type<uint>(_693);
                int _739 = _273 + 44;
                uint _741 = uint(int(uint(_739) >> uint(2)));
                _39[int(_741)] = as_type<uint>(_695);
                _535 = !_587;
                _533 = _561;
            } while (_535);
            _373 = _663;
            _511 = _691;
            _375 = _645;
            _507 = _661;
            _499 = _689;
            _503 = _633;
            _377 = _685;
            _379 = _637;
            _517 = _693;
            _463 = _673;
            _445 = _641;
            _481 = _695;
            _743 = true;
        }
        else
        {
            _373 = 0.0;
            _511 = 0.0;
            _375 = 0.0;
            _507 = 0.0;
            _499 = 0.0;
            _503 = 0.0;
            _377 = 0.0;
            _379 = 0.0;
            _517 = 0.0;
            _463 = 0.0;
            _445 = 0.0;
            _481 = 0.0;
        }
    }
    _743 = false;
    float _745 = _373;
    float _747 = _511;
    float _749 = _375;
    float _751 = _507;
    float _753 = _499;
    float _755 = _503;
    float _757 = _377;
    float _759 = _379;
    float _761 = _517;
    float _763 = _463;
    float _765 = _445;
    float _767 = _481;
    int _769 = _275 + 80;
    uint _771 = uint(int(uint(_769) >> uint(2)));
    uint _773 = uint(int(uint(int(_771)) >> uint(2)));
    int _775 = int(_771) & 3;
    float _777 = (*spvDescriptorSet0.cp_c6)._m0[int(_773)][_775];
    int _779 = int(_771) + 1;
    uint _781 = uint(int(uint(_779) >> uint(2)));
    int _783 = _779 & 3;
    float _785 = (*spvDescriptorSet0.cp_c6)._m0[int(_781)][_783];
    int _787 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _789 = _787 + _66;
    int _791 = _275 + 64;
    uint _793 = uint(int(uint(_791) >> uint(2)));
    uint _795 = uint(int(uint(int(_793)) >> uint(2)));
    int _797 = int(_793) & 3;
    float _799 = (*spvDescriptorSet0.cp_c6)._m0[int(_795)][_797];
    int _801 = int(_793) + 1;
    uint _803 = uint(int(uint(_801) >> uint(2)));
    int _805 = _801 & 3;
    float _807 = (*spvDescriptorSet0.cp_c6)._m0[int(_803)][_805];
    int _809 = _789 * 48;
    int _811 = _275 + 88;
    uint _813 = uint(int(uint(_811) >> uint(2)));
    uint _815 = uint(int(uint(int(_813)) >> uint(2)));
    int _817 = int(_813) & 3;
    float _819 = (*spvDescriptorSet0.cp_c6)._m0[int(_815)][_817];
    int _821 = int(_813) + 1;
    uint _823 = uint(int(uint(_821) >> uint(2)));
    int _825 = _821 & 3;
    float _827 = (*spvDescriptorSet0.cp_c6)._m0[int(_823)][_825];
    int _829 = _275 + 72;
    uint _831 = uint(int(uint(_829) >> uint(2)));
    uint _833 = uint(int(uint(int(_831)) >> uint(2)));
    int _835 = int(_831) & 3;
    float _837 = (*spvDescriptorSet0.cp_c6)._m0[int(_833)][_835];
    int _839 = int(_831) + 1;
    uint _841 = uint(int(uint(_839) >> uint(2)));
    int _843 = _839 & 3;
    float _845 = (*spvDescriptorSet0.cp_c6)._m0[int(_841)][_843];
    int _847 = _275 + 104;
    uint _849 = uint(int(uint(_847) >> uint(2)));
    uint _851 = uint(int(uint(int(_849)) >> uint(2)));
    int _853 = int(_849) & 3;
    float _855 = (*spvDescriptorSet0.cp_c6)._m0[int(_851)][_853];
    int _857 = int(_849) + 1;
    uint _859 = uint(int(uint(_857) >> uint(2)));
    int _861 = _857 & 3;
    float _863 = (*spvDescriptorSet0.cp_c6)._m0[int(_859)][_861];
    int _865 = _275 + 96;
    uint _867 = uint(int(uint(_865) >> uint(2)));
    uint _869 = uint(int(uint(int(_867)) >> uint(2)));
    int _871 = int(_867) & 3;
    float _873 = (*spvDescriptorSet0.cp_c6)._m0[int(_869)][_871];
    int _875 = int(_867) + 1;
    uint _877 = uint(int(uint(_875) >> uint(2)));
    int _879 = _875 & 3;
    float _881 = (*spvDescriptorSet0.cp_c6)._m0[int(_877)][_879];
    float _883 = _745 * _777;
    float _885 = _747 * _777;
    int _887 = _275 + 16;
    uint _889 = uint(int(uint(_887) >> uint(2)));
    uint _891 = uint(int(uint(int(_889)) >> uint(2)));
    int _893 = int(_889) & 3;
    float _895 = (*spvDescriptorSet0.cp_c6)._m0[int(_891)][_893];
    int _897 = int(_889) + 1;
    uint _899 = uint(int(uint(_897) >> uint(2)));
    int _901 = _897 & 3;
    float _903 = (*spvDescriptorSet0.cp_c6)._m0[int(_899)][_901];
    float _905 = _749 * _777;
    float _907 = fma(_751, _799, _883);
    float _909 = fma(_753, _799, _885);
    float _911 = _749 * _785;
    float _913 = _745 * _785;
    float _915 = _747 * _785;
    int _917 = _275 + 32;
    uint _919 = uint(int(uint(_917) >> uint(2)));
    uint _921 = uint(int(uint(int(_919)) >> uint(2)));
    int _923 = int(_919) & 3;
    float _925 = (*spvDescriptorSet0.cp_c6)._m0[int(_921)][_923];
    int _927 = int(_919) + 1;
    uint _929 = uint(int(uint(_927) >> uint(2)));
    int _931 = _927 & 3;
    float _933 = (*spvDescriptorSet0.cp_c6)._m0[int(_929)][_931];
    float _935 = fma(_755, _807, _911);
    float _937 = fma(_751, _807, _913);
    float _939 = fma(_753, _807, _915);
    float _941 = _749 * _819;
    float _943 = _749 * _827;
    float _945 = _745 * _819;
    float _947 = _747 * _819;
    int _949 = _275 + 48;
    uint _951 = uint(int(uint(_949) >> uint(2)));
    uint _953 = uint(int(uint(int(_951)) >> uint(2)));
    int _955 = int(_951) & 3;
    float _957 = (*spvDescriptorSet0.cp_c6)._m0[int(_953)][_955];
    int _959 = int(_951) + 1;
    uint _961 = uint(int(uint(_959) >> uint(2)));
    int _963 = _959 & 3;
    float _965 = (*spvDescriptorSet0.cp_c6)._m0[int(_961)][_963];
    float _967 = _745 * _827;
    float _969 = _747 * _827;
    float _971 = fma(_751, _837, _945);
    float _973 = fma(_753, _837, _947);
    float _975 = fma(_755, _837, _941);
    float _977 = fma(_755, _845, _943);
    float _979 = fma(_751, _845, _967);
    int _981 = _275 + 24;
    uint _983 = uint(int(uint(_981) >> uint(2)));
    uint _985 = uint(int(uint(int(_983)) >> uint(2)));
    int _987 = int(_983) & 3;
    float _989 = (*spvDescriptorSet0.cp_c6)._m0[int(_985)][_987];
    int _991 = int(_983) + 1;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    int _995 = _991 & 3;
    float _997 = (*spvDescriptorSet0.cp_c6)._m0[int(_993)][_995];
    float _999 = fma(_753, _845, _969);
    float _1001 = fma(_755, _799, _905);
    float _1003 = fma(_757, _863, _979);
    float _1005 = fma(_759, _855, _975);
    float _1007 = fma(_759, _863, _977);
    float _1009 = fma(_761, _855, _973);
    float _1011 = _1003 + _763;
    int _1013 = _275 + 40;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    uint _1017 = uint(int(uint(int(_1015)) >> uint(2)));
    int _1019 = int(_1015) & 3;
    float _1021 = (*spvDescriptorSet0.cp_c6)._m0[int(_1017)][_1019];
    int _1023 = int(_1015) + 1;
    uint _1025 = uint(int(uint(_1023) >> uint(2)));
    int _1027 = _1023 & 3;
    float _1029 = (*spvDescriptorSet0.cp_c6)._m0[int(_1025)][_1027];
    float _1031 = _1007 + _765;
    float _1033 = fma(_759, _873, _1001);
    float _1035 = fma(_759, _881, _935);
    float _1037 = fma(_757, _855, _971);
    float _1039 = fma(_761, _863, _999);
    float _1041 = fma(_757, _873, _907);
    int _1043 = _275 + 56;
    uint _1045 = uint(int(uint(_1043) >> uint(2)));
    uint _1047 = uint(int(uint(int(_1045)) >> uint(2)));
    int _1049 = int(_1045) & 3;
    float _1051 = (*spvDescriptorSet0.cp_c6)._m0[int(_1047)][_1049];
    int _1053 = int(_1045) + 1;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    int _1057 = _1053 & 3;
    float _1059 = (*spvDescriptorSet0.cp_c6)._m0[int(_1055)][_1057];
    float _1061 = fma(_757, _881, _937);
    float _1063 = _1039 + _767;
    float _1065 = fma(_761, _873, _909);
    float _1067 = fma(_761, _881, _939);
    float _1069 = _1011 * _903;
    float _1071 = _1041 * _903;
    float _1073 = _1061 * _903;
    float _1075 = _1037 * _903;
    float _1077 = fma(_1031, _895, _1069);
    float _1079 = fma(_1033, _895, _1071);
    float _1081 = fma(_1035, _895, _1073);
    float _1083 = fma(_1005, _895, _1075);
    float _1085 = _1011 * _933;
    float _1087 = _1061 * _933;
    float _1089 = _1041 * _933;
    float _1091 = _1037 * _933;
    float _1093 = fma(_1031, _925, _1085);
    float _1095 = fma(_1035, _925, _1087);
    float _1097 = fma(_1033, _925, _1089);
    float _1099 = fma(_1005, _925, _1091);
    float _1101 = _1011 * _965;
    float _1103 = _1041 * _965;
    float _1105 = _1061 * _965;
    float _1107 = _1037 * _965;
    float _1109 = fma(_1031, _957, _1101);
    float _1111 = fma(_1033, _957, _1103);
    float _1113 = fma(_1035, _957, _1105);
    float _1115 = fma(_1005, _957, _1107);
    float _1117 = fma(_1063, _989, _1077);
    float _1119 = fma(_1065, _989, _1079);
    float _1121 = fma(_1067, _989, _1081);
    float _1123 = fma(_1009, _989, _1083);
    float _1125 = _1117 + _997;
    int _1127 = _809 + 16;
    int _1129 = _809 + 32;
    float _1131 = fma(_1063, _1021, _1093);
    float _1133 = fma(_1067, _1021, _1095);
    float _1135 = fma(_1065, _1021, _1097);
    float _1137 = fma(_1009, _1021, _1099);
    float _1139 = _1131 + _1029;
    int _1141 = _809 + 48;
    uint _1143 = uint(int(uint(_1127) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1143)] = as_type<uint>(_1119);
    int _1145 = _1127 + 4;
    uint _1147 = uint(int(uint(_1145) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1147)] = as_type<uint>(_1121);
    int _1149 = _1127 + 8;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1151)] = as_type<uint>(_1123);
    int _1153 = _1127 + 12;
    uint _1155 = uint(int(uint(_1153) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1155)] = as_type<uint>(_1125);
    float _1157 = fma(_1063, _1051, _1109);
    float _1159 = fma(_1065, _1051, _1111);
    float _1161 = fma(_1067, _1051, _1113);
    float _1163 = fma(_1009, _1051, _1115);
    float _1165 = _1157 + _1059;
    uint _1167 = uint(int(uint(_1129) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1167)] = as_type<uint>(_1135);
    int _1169 = _1129 + 4;
    uint _1171 = uint(int(uint(_1169) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1171)] = as_type<uint>(_1133);
    int _1173 = _1129 + 8;
    uint _1175 = uint(int(uint(_1173) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1175)] = as_type<uint>(_1137);
    int _1177 = _1129 + 12;
    uint _1179 = uint(int(uint(_1177) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1179)] = as_type<uint>(_1139);
    uint _1181 = uint(int(uint(_1141) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1181)] = as_type<uint>(_1159);
    int _1183 = _1141 + 4;
    uint _1185 = uint(int(uint(_1183) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1185)] = as_type<uint>(_1161);
    int _1187 = _1141 + 8;
    uint _1189 = uint(int(uint(_1187) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1189)] = as_type<uint>(_1163);
    int _1191 = _1141 + 12;
    uint _1193 = uint(int(uint(_1191) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1193)] = as_type<uint>(_1165);
}

