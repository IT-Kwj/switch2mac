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
int _56(thread const int& _2895, thread const int& _2896, constant _10& support_buffer)
{
    int _2899 = 1 + _2896;
    float _2901 = support_buffer._m5[_2899].x;
    bool _2903 = _2901 == 1.0;
    if (_2903)
    {
        return _2895;
    }
    float _2905 = float(_2895);
    float _2907 = _2905 * _2901;
    int _2909 = int(_2907);
    return _2909;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _579 = false;
    float _60 = as_type<float>(gl_WorkGroupID.x);
    float _62 = as_type<float>(gl_LocalInvocationID.x);
    int _64 = as_type<int>(_60) << 6;
    int _66 = _64 + as_type<int>(_62);
    bool _70 = uint(_66) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_70)
    {
        return;
    }
    int _72 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _75 = uint(int(uint(_72) >> uint(2)));
    uint _77 = uint(int(uint(int(_75)) >> uint(2)));
    int _79 = int(_75) & 3;
    float _81 = (*spvDescriptorSet0.cp_c5)._m0[int(_77)][_79];
    int _83 = _66;
    int _85 = 0;
    int _87 = _56(_83, _85, (*spvDescriptorSet0.support_buffer));
    int _89 = as_type<int>(_81);
    int _91 = 0;
    int _93 = _56(_89, _91, (*spvDescriptorSet0.support_buffer));
    int3 _1133 = int3(_87, _93, 1);
    float3 _97 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1133.xy), uint(_1133.z), 0).xyz;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = _97.z;
    int _105 = _66;
    int _107 = 0;
    int _109 = _56(_105, _107, (*spvDescriptorSet0.support_buffer));
    int _111 = as_type<int>(_81);
    int _113 = 0;
    int _115 = _56(_111, _113, (*spvDescriptorSet0.support_buffer));
    int3 _1151 = int3(_109, _115, 0);
    float3 _117 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1151.xy), uint(_1151.z), 0).xyz;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    int _125 = _66;
    int _127 = 0;
    int _129 = _56(_125, _127, (*spvDescriptorSet0.support_buffer));
    int _131 = as_type<int>(_81);
    int _133 = 0;
    int _135 = _56(_131, _133, (*spvDescriptorSet0.support_buffer));
    int3 _1169 = int3(_129, _135, 2);
    float3 _137 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1169.xy), uint(_1169.z), 0).xyz;
    float _139 = _137.x;
    float _141 = _137.y;
    float _143 = _137.z;
    int _145 = _66 * 48;
    bool _147 = _66 != 0;
    int _149 = _145 + 16;
    int _151 = _145 + 32;
    float _153 = _99 * 0.15915493667125701904296875;
    float _155 = _103 * 0.15915493667125701904296875;
    float _157 = _101 * 0.15915493667125701904296875;
    float _159 = _153 * 6.283185482025146484375;
    float _161 = sin(_159);
    float _163 = _153 * 6.283185482025146484375;
    float _165 = cos(_163);
    float _167 = _155 * 6.283185482025146484375;
    float _169 = sin(_167);
    float _171 = _155 * 6.283185482025146484375;
    float _173 = cos(_171);
    float _175 = _157 * 6.283185482025146484375;
    float _177 = cos(_175);
    float _179 = _157 * 6.283185482025146484375;
    float _181 = sin(_179);
    float _183 = _165 * _173;
    float _185 = _169 * _165;
    float _187 = _161 * _169;
    float _189 = _161 * _173;
    float _191 = _165 * _177;
    float _193 = _161 * _177;
    float _195 = _177 * _119;
    int _197 = _66 * 112;
    float _199 = _173 * _195;
    float _201 = _169 * _195;
    float _203 = _161 * _181;
    float _205 = fma(_181, _183, _187);
    float _207 = -_189;
    float _209 = fma(_181, _185, _207);
    float _211 = _119 * _181;
    float _213 = fma(_169, _203, _183);
    float _215 = -_185;
    float _217 = fma(_173, _203, _215);
    float _219 = _121 * _193;
    float _221 = _123 * _191;
    float _223 = _121 * _213;
    float _225 = _121 * _217;
    float _227 = _123 * _205;
    float _229 = _123 * _209;
    float _231 = -_211;
    float _233 = _231 + (-0.0);
    float _235 = _191;
    float _237 = _173;
    float _239 = _121;
    float _241 = _213;
    float _243 = _193;
    float _245 = _123;
    float _247 = _205;
    float _249 = _119;
    float _251 = _209;
    float _253 = _187;
    float _255 = _169;
    float _257 = _185;
    if (!_147)
    {
        _235 = _139;
    }
    float _259 = _235;
    uint _261 = uint(int(uint(_145) >> uint(2)));
    _39[int(_261)] = as_type<uint>(_199);
    int _263 = _145 + 4;
    uint _265 = uint(int(uint(_263) >> uint(2)));
    _39[int(_265)] = as_type<uint>(_225);
    int _267 = _145 + 8;
    uint _269 = uint(int(uint(_267) >> uint(2)));
    _39[int(_269)] = as_type<uint>(_227);
    int _271 = _145 + 12;
    uint _273 = uint(int(uint(_271) >> uint(2)));
    _39[int(_273)] = as_type<uint>(_139);
    float _275 = _259;
    if (!_147)
    {
        _237 = _141;
    }
    float _277 = _237;
    float _279 = _277;
    if (!_147)
    {
        _239 = _143;
    }
    float _281 = _239;
    int _283 = _145 + 16;
    uint _285 = uint(int(uint(_283) >> uint(2)));
    _39[int(_285)] = as_type<uint>(_201);
    int _287 = _145 + 20;
    uint _289 = uint(int(uint(_287) >> uint(2)));
    _39[int(_289)] = as_type<uint>(_223);
    int _291 = _145 + 24;
    uint _293 = uint(int(uint(_291) >> uint(2)));
    _39[int(_293)] = as_type<uint>(_229);
    int _295 = _145 + 28;
    uint _297 = uint(int(uint(_295) >> uint(2)));
    _39[int(_297)] = as_type<uint>(_141);
    float _299 = _281;
    if (!_147)
    {
        _241 = _233;
    }
    float _301 = _241;
    float _303 = _301;
    if (!_147)
    {
        _243 = _199;
    }
    float _305 = _243;
    int _307 = _145 + 32;
    uint _309 = uint(int(uint(_307) >> uint(2)));
    _39[int(_309)] = as_type<uint>(_233);
    int _311 = _145 + 36;
    uint _313 = uint(int(uint(_311) >> uint(2)));
    _39[int(_313)] = as_type<uint>(_219);
    int _315 = _145 + 40;
    uint _317 = uint(int(uint(_315) >> uint(2)));
    _39[int(_317)] = as_type<uint>(_221);
    int _319 = _145 + 44;
    uint _321 = uint(int(uint(_319) >> uint(2)));
    _39[int(_321)] = as_type<uint>(_143);
    float _323 = _305;
    if (!_147)
    {
        _245 = _201;
    }
    float _325 = _245;
    float _327 = _325;
    if (!_147)
    {
        _247 = _219;
    }
    float _329 = _247;
    float _331 = _329;
    if (!_147)
    {
        _249 = _221;
    }
    float _333 = _249;
    float _335 = _333;
    if (!_147)
    {
        _251 = _225;
    }
    float _337 = _251;
    float _339 = _337;
    if (!_147)
    {
        _253 = _227;
    }
    float _341 = _253;
    float _343 = _341;
    if (!_147)
    {
        _255 = _223;
    }
    float _345 = _255;
    float _347 = _345;
    if (!_147)
    {
        _257 = _229;
    }
    float _349 = _257;
    bool _351 = !_147;
    float _353 = _349;
    if (!_351)
    {
        bool _355 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _357 = !_355;
        if (!_357)
        {
            uint _359 = uint(int(uint(_197) >> uint(2)));
            uint _361 = uint(int(uint(int(_359)) >> uint(2)));
            int _363 = int(_359) & 3;
            float _365 = (*spvDescriptorSet0.cp_c6)._m0[int(_361)][_363];
            int _367 = as_type<int>(_365) * 48;
            int _369 = 0;
            bool _371;
            float _469;
            float _471;
            float _473;
            float _483;
            float _495;
            float _501;
            float _503;
            float _523;
            float _525;
            float _527;
            float _529;
            float _531;
            do
            {
                int _373 = _369;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _375 = uint(int(uint(_367) >> uint(2)));
                float _377 = as_type<float>(_39[int(_375)]);
                int _379 = _367 + 4;
                uint _381 = uint(int(uint(_379) >> uint(2)));
                float _383 = as_type<float>(_39[int(_381)]);
                int _385 = _367 + 8;
                uint _387 = uint(int(uint(_385) >> uint(2)));
                float _389 = as_type<float>(_39[int(_387)]);
                int _391 = _367 + 12;
                uint _393 = uint(int(uint(_391) >> uint(2)));
                float _395 = as_type<float>(_39[int(_393)]);
                int _397 = _373 + 1;
                int _399 = _367 + 16;
                uint _401 = uint(int(uint(_399) >> uint(2)));
                float _403 = as_type<float>(_39[int(_401)]);
                int _405 = _367 + 20;
                uint _407 = uint(int(uint(_405) >> uint(2)));
                float _409 = as_type<float>(_39[int(_407)]);
                int _411 = _367 + 24;
                uint _413 = uint(int(uint(_411) >> uint(2)));
                float _415 = as_type<float>(_39[int(_413)]);
                int _417 = _367 + 28;
                uint _419 = uint(int(uint(_417) >> uint(2)));
                float _421 = as_type<float>(_39[int(_419)]);
                bool _423 = uint(_397) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _425 = _367 + 32;
                uint _427 = uint(int(uint(_425) >> uint(2)));
                float _429 = as_type<float>(_39[int(_427)]);
                int _431 = _367 + 36;
                uint _433 = uint(int(uint(_431) >> uint(2)));
                float _435 = as_type<float>(_39[int(_433)]);
                int _437 = _367 + 40;
                uint _439 = uint(int(uint(_437) >> uint(2)));
                float _441 = as_type<float>(_39[int(_439)]);
                int _443 = _367 + 44;
                uint _445 = uint(int(uint(_443) >> uint(2)));
                float _447 = as_type<float>(_39[int(_445)]);
                float _449 = _141 * _383;
                float _451 = _201 * _383;
                float _453 = _223 * _383;
                float _455 = _229 * _383;
                float _457 = fma(_139, _377, _449);
                float _459 = fma(_199, _377, _451);
                float _461 = fma(_225, _377, _453);
                float _463 = fma(_227, _377, _455);
                float _465 = fma(_143, _389, _457);
                float _467 = -_211;
                _469 = fma(_467, _389, _459);
                _471 = fma(_219, _389, _461);
                _473 = fma(_221, _389, _463);
                float _475 = _141 * _409;
                float _477 = _201 * _409;
                float _479 = _223 * _409;
                float _481 = _229 * _409;
                _483 = _395 + _465;
                float _485 = fma(_139, _403, _475);
                float _487 = fma(_225, _403, _479);
                float _489 = fma(_199, _403, _477);
                float _491 = fma(_227, _403, _481);
                float _493 = _141 * _435;
                _495 = fma(_219, _415, _487);
                float _497 = fma(_143, _415, _485);
                float _499 = -_211;
                _501 = fma(_499, _415, _489);
                _503 = fma(_221, _415, _491);
                float _505 = _201 * _435;
                float _507 = _223 * _435;
                float _509 = _229 * _435;
                float _511 = fma(_139, _429, _493);
                float _513 = fma(_199, _429, _505);
                float _515 = fma(_225, _429, _507);
                float _517 = fma(_227, _429, _509);
                float _519 = fma(_143, _441, _511);
                float _521 = -_211;
                _523 = fma(_521, _441, _513);
                _525 = fma(_219, _441, _515);
                _527 = _421 + _497;
                _529 = fma(_221, _441, _517);
                _531 = _447 + _519;
                uint _533 = uint(int(uint(_145) >> uint(2)));
                _39[int(_533)] = as_type<uint>(_469);
                int _535 = _145 + 4;
                uint _537 = uint(int(uint(_535) >> uint(2)));
                _39[int(_537)] = as_type<uint>(_471);
                int _539 = _145 + 8;
                uint _541 = uint(int(uint(_539) >> uint(2)));
                _39[int(_541)] = as_type<uint>(_473);
                int _543 = _145 + 12;
                uint _545 = uint(int(uint(_543) >> uint(2)));
                _39[int(_545)] = as_type<uint>(_483);
                int _547 = _145 + 16;
                uint _549 = uint(int(uint(_547) >> uint(2)));
                _39[int(_549)] = as_type<uint>(_501);
                int _551 = _145 + 20;
                uint _553 = uint(int(uint(_551) >> uint(2)));
                _39[int(_553)] = as_type<uint>(_495);
                int _555 = _145 + 24;
                uint _557 = uint(int(uint(_555) >> uint(2)));
                _39[int(_557)] = as_type<uint>(_503);
                int _559 = _145 + 28;
                uint _561 = uint(int(uint(_559) >> uint(2)));
                _39[int(_561)] = as_type<uint>(_527);
                int _563 = _145 + 32;
                uint _565 = uint(int(uint(_563) >> uint(2)));
                _39[int(_565)] = as_type<uint>(_523);
                int _567 = _145 + 36;
                uint _569 = uint(int(uint(_567) >> uint(2)));
                _39[int(_569)] = as_type<uint>(_525);
                int _571 = _145 + 40;
                uint _573 = uint(int(uint(_571) >> uint(2)));
                _39[int(_573)] = as_type<uint>(_529);
                int _575 = _145 + 44;
                uint _577 = uint(int(uint(_575) >> uint(2)));
                _39[int(_577)] = as_type<uint>(_531);
                _371 = !_423;
                _369 = _397;
            } while (_371);
            _323 = _469;
            _339 = _471;
            _343 = _473;
            _275 = _483;
            _327 = _501;
            _347 = _495;
            _353 = _503;
            _279 = _527;
            _303 = _523;
            _331 = _525;
            _335 = _529;
            _299 = _531;
            _579 = true;
        }
        else
        {
            _323 = 0.0;
            _339 = 0.0;
            _343 = 0.0;
            _275 = 0.0;
            _327 = 0.0;
            _347 = 0.0;
            _353 = 0.0;
            _279 = 0.0;
            _303 = 0.0;
            _331 = 0.0;
            _335 = 0.0;
            _299 = 0.0;
        }
    }
    _579 = false;
    float _581 = _323;
    float _583 = _339;
    float _585 = _343;
    float _587 = _275;
    float _589 = _327;
    float _591 = _347;
    float _593 = _353;
    float _595 = _279;
    float _597 = _303;
    float _599 = _331;
    float _601 = _335;
    float _603 = _299;
    int _605 = _197 + 80;
    uint _607 = uint(int(uint(_605) >> uint(2)));
    uint _609 = uint(int(uint(int(_607)) >> uint(2)));
    int _611 = int(_607) & 3;
    float _613 = (*spvDescriptorSet0.cp_c6)._m0[int(_609)][_611];
    int _615 = int(_607) + 1;
    uint _617 = uint(int(uint(_615) >> uint(2)));
    int _619 = _615 & 3;
    float _621 = (*spvDescriptorSet0.cp_c6)._m0[int(_617)][_619];
    bool _623 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _625 = _197 + 64;
    uint _627 = uint(int(uint(_625) >> uint(2)));
    uint _629 = uint(int(uint(int(_627)) >> uint(2)));
    int _631 = int(_627) & 3;
    float _633 = (*spvDescriptorSet0.cp_c6)._m0[int(_629)][_631];
    int _635 = int(_627) + 1;
    uint _637 = uint(int(uint(_635) >> uint(2)));
    int _639 = _635 & 3;
    float _641 = (*spvDescriptorSet0.cp_c6)._m0[int(_637)][_639];
    int _643 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _645 = _643 + _66;
    int _647 = _197 + 88;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    uint _651 = uint(int(uint(int(_649)) >> uint(2)));
    int _653 = int(_649) & 3;
    float _655 = (*spvDescriptorSet0.cp_c6)._m0[int(_651)][_653];
    int _657 = int(_649) + 1;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    int _661 = _657 & 3;
    float _663 = (*spvDescriptorSet0.cp_c6)._m0[int(_659)][_661];
    int _665 = _197 + 72;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.cp_c6)._m0[int(_669)][_671];
    int _675 = int(_667) + 1;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    int _679 = _675 & 3;
    float _681 = (*spvDescriptorSet0.cp_c6)._m0[int(_677)][_679];
    int _683 = _197 + 96;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    uint _687 = uint(int(uint(int(_685)) >> uint(2)));
    int _689 = int(_685) & 3;
    float _691 = (*spvDescriptorSet0.cp_c6)._m0[int(_687)][_689];
    int _693 = int(_685) + 1;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    int _697 = _693 & 3;
    float _699 = (*spvDescriptorSet0.cp_c6)._m0[int(_695)][_697];
    int _701 = _197 + 104;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    uint _705 = uint(int(uint(int(_703)) >> uint(2)));
    int _707 = int(_703) & 3;
    float _709 = (*spvDescriptorSet0.cp_c6)._m0[int(_705)][_707];
    int _711 = int(_703) + 1;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    int _715 = _711 & 3;
    float _717 = (*spvDescriptorSet0.cp_c6)._m0[int(_713)][_715];
    int _719 = _197 + 16;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    uint _723 = uint(int(uint(int(_721)) >> uint(2)));
    int _725 = int(_721) & 3;
    float _727 = (*spvDescriptorSet0.cp_c6)._m0[int(_723)][_725];
    int _729 = int(_721) + 1;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    int _733 = _729 & 3;
    float _735 = (*spvDescriptorSet0.cp_c6)._m0[int(_731)][_733];
    if (!_623)
    {
        uint _737 = uint(int(uint(_145) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_737)] = as_type<uint>(_581);
        int _739 = _145 + 4;
        uint _741 = uint(int(uint(_739) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_741)] = as_type<uint>(_583);
        int _743 = _145 + 8;
        uint _745 = uint(int(uint(_743) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_745)] = as_type<uint>(_585);
        int _747 = _145 + 12;
        uint _749 = uint(int(uint(_747) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_749)] = as_type<uint>(_587);
        uint _751 = uint(int(uint(_149) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_751)] = as_type<uint>(_589);
        int _753 = _149 + 4;
        uint _755 = uint(int(uint(_753) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_755)] = as_type<uint>(_591);
        int _757 = _149 + 8;
        uint _759 = uint(int(uint(_757) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_759)] = as_type<uint>(_593);
        int _761 = _149 + 12;
        uint _763 = uint(int(uint(_761) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_763)] = as_type<uint>(_595);
        uint _765 = uint(int(uint(_151) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_765)] = as_type<uint>(_597);
        int _767 = _151 + 4;
        uint _769 = uint(int(uint(_767) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_769)] = as_type<uint>(_599);
        int _771 = _151 + 8;
        uint _773 = uint(int(uint(_771) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_773)] = as_type<uint>(_601);
        int _775 = _151 + 12;
        uint _777 = uint(int(uint(_775) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_777)] = as_type<uint>(_603);
    }
    float _779 = _591 * _613;
    float _781 = _599 * _613;
    int _783 = _197 + 32;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    uint _787 = uint(int(uint(int(_785)) >> uint(2)));
    int _789 = int(_785) & 3;
    float _791 = (*spvDescriptorSet0.cp_c6)._m0[int(_787)][_789];
    int _793 = int(_785) + 1;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    int _797 = _793 & 3;
    float _799 = (*spvDescriptorSet0.cp_c6)._m0[int(_795)][_797];
    float _801 = _583 * _613;
    float _803 = fma(_589, _633, _779);
    float _805 = fma(_597, _633, _781);
    float _807 = _583 * _621;
    float _809 = _591 * _621;
    float _811 = _599 * _621;
    float _813 = _583 * _663;
    int _815 = _197 + 48;
    uint _817 = uint(int(uint(_815) >> uint(2)));
    uint _819 = uint(int(uint(int(_817)) >> uint(2)));
    int _821 = int(_817) & 3;
    float _823 = (*spvDescriptorSet0.cp_c6)._m0[int(_819)][_821];
    int _825 = int(_817) + 1;
    uint _827 = uint(int(uint(_825) >> uint(2)));
    int _829 = _825 & 3;
    float _831 = (*spvDescriptorSet0.cp_c6)._m0[int(_827)][_829];
    float _833 = fma(_581, _641, _807);
    float _835 = _583 * _655;
    float _837 = fma(_589, _641, _809);
    float _839 = fma(_597, _641, _811);
    float _841 = _591 * _655;
    float _843 = _591 * _663;
    float _845 = _599 * _655;
    float _847 = _599 * _663;
    int _849 = _197 + 24;
    uint _851 = uint(int(uint(_849) >> uint(2)));
    uint _853 = uint(int(uint(int(_851)) >> uint(2)));
    int _855 = int(_851) & 3;
    float _857 = (*spvDescriptorSet0.cp_c6)._m0[int(_853)][_855];
    int _859 = int(_851) + 1;
    uint _861 = uint(int(uint(_859) >> uint(2)));
    int _863 = _859 & 3;
    float _865 = (*spvDescriptorSet0.cp_c6)._m0[int(_861)][_863];
    float _867 = fma(_581, _673, _835);
    float _869 = fma(_581, _681, _813);
    float _871 = fma(_589, _673, _841);
    float _873 = fma(_589, _681, _843);
    float _875 = fma(_597, _673, _845);
    float _877 = fma(_597, _681, _847);
    float _879 = fma(_585, _699, _833);
    int _881 = _197 + 40;
    uint _883 = uint(int(uint(_881) >> uint(2)));
    uint _885 = uint(int(uint(int(_883)) >> uint(2)));
    int _887 = int(_883) & 3;
    float _889 = (*spvDescriptorSet0.cp_c6)._m0[int(_885)][_887];
    int _891 = int(_883) + 1;
    uint _893 = uint(int(uint(_891) >> uint(2)));
    int _895 = _891 & 3;
    float _897 = (*spvDescriptorSet0.cp_c6)._m0[int(_893)][_895];
    float _899 = fma(_593, _691, _803);
    float _901 = fma(_593, _699, _837);
    float _903 = fma(_593, _709, _871);
    float _905 = fma(_593, _717, _873);
    float _907 = fma(_581, _633, _801);
    float _909 = fma(_585, _717, _869);
    float _911 = fma(_585, _709, _867);
    int _913 = _197 + 56;
    uint _915 = uint(int(uint(_913) >> uint(2)));
    uint _917 = uint(int(uint(int(_915)) >> uint(2)));
    int _919 = int(_915) & 3;
    float _921 = (*spvDescriptorSet0.cp_c6)._m0[int(_917)][_919];
    int _923 = int(_915) + 1;
    uint _925 = uint(int(uint(_923) >> uint(2)));
    int _927 = _923 & 3;
    float _929 = (*spvDescriptorSet0.cp_c6)._m0[int(_925)][_927];
    float _931 = _905 + _595;
    float _933 = fma(_585, _691, _907);
    float _935 = fma(_601, _717, _877);
    float _937 = _909 + _587;
    float _939 = _931 * _735;
    float _941 = fma(_601, _691, _805);
    float _943 = fma(_601, _699, _839);
    float _945 = fma(_601, _709, _875);
    float _947 = _901 * _735;
    float _949 = _935 + _603;
    float _951 = _899 * _735;
    float _953 = _903 * _735;
    float _955 = fma(_937, _727, _939);
    int _957 = _645 * 48;
    float _959 = _931 * _799;
    float _961 = _901 * _799;
    float _963 = _899 * _799;
    float _965 = _903 * _799;
    float _967 = fma(_937, _791, _959);
    float _969 = fma(_933, _727, _951);
    float _971 = fma(_879, _727, _947);
    float _973 = fma(_911, _727, _953);
    float _975 = _931 * _831;
    float _977 = _901 * _831;
    float _979 = _899 * _831;
    float _981 = _903 * _831;
    float _983 = fma(_937, _823, _975);
    float _985 = fma(_879, _823, _977);
    float _987 = fma(_879, _791, _961);
    float _989 = fma(_933, _791, _963);
    float _991 = fma(_911, _791, _965);
    float _993 = fma(_949, _857, _955);
    float _995 = fma(_933, _823, _979);
    float _997 = fma(_911, _823, _981);
    float _999 = fma(_941, _857, _969);
    float _1001 = fma(_943, _857, _971);
    float _1003 = fma(_945, _857, _973);
    float _1005 = _993 + _865;
    int _1007 = _957 + 32;
    float _1009 = fma(_949, _889, _967);
    float _1011 = fma(_943, _889, _987);
    float _1013 = fma(_941, _889, _989);
    float _1015 = fma(_945, _889, _991);
    float _1017 = _1009 + _897;
    float _1019 = fma(_949, _921, _983);
    float _1021 = fma(_943, _921, _985);
    int _1023 = _957 + 16;
    float _1025 = fma(_941, _921, _995);
    float _1027 = fma(_945, _921, _997);
    float _1029 = _1019 + _929;
    int _1031 = _957 + 48;
    uint _1033 = uint(int(uint(_1023) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1033)] = as_type<uint>(_999);
    int _1035 = _1023 + 4;
    uint _1037 = uint(int(uint(_1035) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1037)] = as_type<uint>(_1001);
    int _1039 = _1023 + 8;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1041)] = as_type<uint>(_1003);
    int _1043 = _1023 + 12;
    uint _1045 = uint(int(uint(_1043) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1045)] = as_type<uint>(_1005);
    uint _1047 = uint(int(uint(_1007) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1047)] = as_type<uint>(_1013);
    int _1049 = _1007 + 4;
    uint _1051 = uint(int(uint(_1049) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1051)] = as_type<uint>(_1011);
    int _1053 = _1007 + 8;
    uint _1055 = uint(int(uint(_1053) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1055)] = as_type<uint>(_1015);
    int _1057 = _1007 + 12;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1059)] = as_type<uint>(_1017);
    uint _1061 = uint(int(uint(_1031) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1061)] = as_type<uint>(_1025);
    int _1063 = _1031 + 4;
    uint _1065 = uint(int(uint(_1063) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1065)] = as_type<uint>(_1021);
    int _1067 = _1031 + 8;
    uint _1069 = uint(int(uint(_1067) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1069)] = as_type<uint>(_1027);
    int _1071 = _1031 + 12;
    uint _1073 = uint(int(uint(_1071) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1073)] = as_type<uint>(_1029);
}

