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
};

static inline __attribute__((always_inline))
int _54(thread const int& _2694, thread const int& _2695, constant _10& support_buffer)
{
    int _2698 = 1 + _2695;
    float _2700 = support_buffer._m5[_2698].x;
    bool _2702 = _2700 == 1.0;
    if (_2702)
    {
        return _2694;
    }
    float _2704 = float(_2694);
    float _2706 = _2704 * _2700;
    int _2708 = int(_2706);
    return _2708;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _37 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _565 = false;
    float _58 = as_type<float>(gl_WorkGroupID.x);
    float _60 = as_type<float>(gl_LocalInvocationID.x);
    int _62 = as_type<int>(_58) << 6;
    int _64 = _62 + as_type<int>(_60);
    bool _68 = uint(_64) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    if (_68)
    {
        return;
    }
    int _70 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * 48;
    uint _73 = uint(int(uint(_70) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.cp_c5)._m0[int(_75)][_77];
    int _81 = _64;
    int _83 = 0;
    int _85 = _54(_81, _83, (*spvDescriptorSet0.support_buffer));
    int _87 = as_type<int>(_79);
    int _89 = 0;
    int _91 = _54(_87, _89, (*spvDescriptorSet0.support_buffer));
    int3 _1075 = int3(_85, _91, 1);
    float3 _95 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1075.xy), uint(_1075.z), 0).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    int _103 = _64;
    int _105 = 0;
    int _107 = _54(_103, _105, (*spvDescriptorSet0.support_buffer));
    int _109 = as_type<int>(_79);
    int _111 = 0;
    int _113 = _54(_109, _111, (*spvDescriptorSet0.support_buffer));
    int3 _1093 = int3(_107, _113, 0);
    float3 _115 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1093.xy), uint(_1093.z), 0).xyz;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    int _123 = _64;
    int _125 = 0;
    int _127 = _54(_123, _125, (*spvDescriptorSet0.support_buffer));
    int _129 = as_type<int>(_79);
    int _131 = 0;
    int _133 = _54(_129, _131, (*spvDescriptorSet0.support_buffer));
    int3 _1111 = int3(_127, _133, 2);
    float3 _135 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1111.xy), uint(_1111.z), 0).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    bool _143 = _64 != 0;
    float _145 = _97 * 0.15915493667125701904296875;
    float _147 = _101 * 0.15915493667125701904296875;
    float _149 = _99 * 0.15915493667125701904296875;
    float _151 = _145 * 6.283185482025146484375;
    float _153 = cos(_151);
    float _155 = _147 * 6.283185482025146484375;
    float _157 = sin(_155);
    float _159 = _147 * 6.283185482025146484375;
    float _161 = cos(_159);
    float _163 = _149 * 6.283185482025146484375;
    float _165 = cos(_163);
    float _167 = _145 * 6.283185482025146484375;
    float _169 = sin(_167);
    float _171 = _153 * _161;
    float _173 = _149 * 6.283185482025146484375;
    float _175 = sin(_173);
    float _177 = _157 * _153;
    float _179 = _153 * _165;
    float _181 = _165 * _117;
    float _183 = _169 * _161;
    float _185 = _169 * _157;
    float _187 = _169 * _165;
    int _189 = _64 * 112;
    float _191 = _169 * _175;
    float _193 = -_183;
    float _195 = fma(_175, _177, _193);
    float _197 = fma(_175, _171, _185);
    float _199 = _117 * _175;
    float _201 = fma(_157, _191, _171);
    float _203 = _161 * _181;
    float _205 = _157 * _181;
    float _207 = _121 * _195;
    float _209 = _119 * _201;
    float _211 = _121 * _179;
    int _213 = _64 * 48;
    float _215 = -_177;
    float _217 = fma(_161, _191, _215);
    float _219 = _119 * _187;
    float _221 = _121 * _197;
    float _223 = _185;
    float _225 = _161;
    float _227 = _121;
    float _229 = _177;
    float _231 = _195;
    float _233 = _197;
    float _235 = _157;
    float _237 = _187;
    float _239 = _221;
    if (!_143)
    {
        _223 = _137;
    }
    float _241 = _223;
    int _243 = _213 + 16;
    uint _245 = uint(int(uint(_243) >> uint(2)));
    _37[int(_245)] = as_type<uint>(_205);
    int _247 = _213 + 20;
    uint _249 = uint(int(uint(_247) >> uint(2)));
    _37[int(_249)] = as_type<uint>(_209);
    int _251 = _213 + 24;
    uint _253 = uint(int(uint(_251) >> uint(2)));
    _37[int(_253)] = as_type<uint>(_207);
    int _255 = _213 + 28;
    uint _257 = uint(int(uint(_255) >> uint(2)));
    _37[int(_257)] = as_type<uint>(_139);
    float _259 = _119 * _217;
    float _261 = -_199;
    float _263 = _261 + (-0.0);
    float _265 = _137;
    float _267 = _263;
    float _269 = _259;
    float _271 = _241;
    if (!_143)
    {
        _225 = _139;
    }
    float _273 = _225;
    float _275 = _273;
    if (!_143)
    {
        _227 = _141;
    }
    float _277 = _227;
    uint _279 = uint(int(uint(_213) >> uint(2)));
    _37[int(_279)] = as_type<uint>(_203);
    int _281 = _213 + 4;
    uint _283 = uint(int(uint(_281) >> uint(2)));
    _37[int(_283)] = as_type<uint>(_259);
    int _285 = _213 + 8;
    uint _287 = uint(int(uint(_285) >> uint(2)));
    _37[int(_287)] = as_type<uint>(_221);
    int _289 = _213 + 12;
    uint _291 = uint(int(uint(_289) >> uint(2)));
    _37[int(_291)] = as_type<uint>(_137);
    float _293 = _277;
    if (!_143)
    {
        _229 = _263;
    }
    float _295 = _229;
    float _297 = _295;
    if (!_143)
    {
        _231 = _203;
    }
    float _299 = _231;
    int _301 = _213 + 32;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    _37[int(_303)] = as_type<uint>(_263);
    int _305 = _213 + 36;
    uint _307 = uint(int(uint(_305) >> uint(2)));
    _37[int(_307)] = as_type<uint>(_219);
    int _309 = _213 + 40;
    uint _311 = uint(int(uint(_309) >> uint(2)));
    _37[int(_311)] = as_type<uint>(_211);
    int _313 = _213 + 44;
    uint _315 = uint(int(uint(_313) >> uint(2)));
    _37[int(_315)] = as_type<uint>(_141);
    float _317 = _299;
    if (!_143)
    {
        _233 = _205;
    }
    float _319 = _233;
    float _321 = _319;
    if (!_143)
    {
        _235 = _219;
    }
    float _323 = _235;
    float _325 = _323;
    if (!_143)
    {
        _237 = _209;
    }
    float _327 = _237;
    float _329 = _327;
    if (!_143)
    {
        _265 = _211;
    }
    float _331 = _265;
    float _333 = _331;
    if (!_143)
    {
        _267 = _207;
    }
    float _335 = _267;
    bool _337 = !_143;
    float _339 = _335;
    if (!_337)
    {
        bool _341 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _343 = !_341;
        if (!_343)
        {
            uint _345 = uint(int(uint(_189) >> uint(2)));
            uint _347 = uint(int(uint(int(_345)) >> uint(2)));
            int _349 = int(_345) & 3;
            float _351 = (*spvDescriptorSet0.cp_c6)._m0[int(_347)][_349];
            int _353 = as_type<int>(_351) * 48;
            int _355 = 0;
            bool _357;
            float _455;
            float _457;
            float _461;
            float _467;
            float _483;
            float _485;
            float _487;
            float _489;
            float _511;
            float _513;
            float _515;
            float _517;
            do
            {
                int _359 = _355;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _361 = uint(int(uint(_353) >> uint(2)));
                float _363 = as_type<float>(_37[int(_361)]);
                int _365 = _353 + 4;
                uint _367 = uint(int(uint(_365) >> uint(2)));
                float _369 = as_type<float>(_37[int(_367)]);
                int _371 = _353 + 8;
                uint _373 = uint(int(uint(_371) >> uint(2)));
                float _375 = as_type<float>(_37[int(_373)]);
                int _377 = _353 + 12;
                uint _379 = uint(int(uint(_377) >> uint(2)));
                float _381 = as_type<float>(_37[int(_379)]);
                int _383 = _359 + 1;
                int _385 = _353 + 16;
                uint _387 = uint(int(uint(_385) >> uint(2)));
                float _389 = as_type<float>(_37[int(_387)]);
                int _391 = _353 + 20;
                uint _393 = uint(int(uint(_391) >> uint(2)));
                float _395 = as_type<float>(_37[int(_393)]);
                int _397 = _353 + 24;
                uint _399 = uint(int(uint(_397) >> uint(2)));
                float _401 = as_type<float>(_37[int(_399)]);
                int _403 = _353 + 28;
                uint _405 = uint(int(uint(_403) >> uint(2)));
                float _407 = as_type<float>(_37[int(_405)]);
                bool _409 = uint(_383) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _411 = _353 + 32;
                uint _413 = uint(int(uint(_411) >> uint(2)));
                float _415 = as_type<float>(_37[int(_413)]);
                int _417 = _353 + 36;
                uint _419 = uint(int(uint(_417) >> uint(2)));
                float _421 = as_type<float>(_37[int(_419)]);
                int _423 = _353 + 40;
                uint _425 = uint(int(uint(_423) >> uint(2)));
                float _427 = as_type<float>(_37[int(_425)]);
                int _429 = _353 + 44;
                uint _431 = uint(int(uint(_429) >> uint(2)));
                float _433 = as_type<float>(_37[int(_431)]);
                float _435 = _139 * _369;
                float _437 = _205 * _369;
                float _439 = _209 * _369;
                float _441 = _207 * _369;
                float _443 = fma(_137, _363, _435);
                float _445 = fma(_203, _363, _437);
                float _447 = fma(_259, _363, _439);
                float _449 = fma(_221, _363, _441);
                float _451 = fma(_141, _375, _443);
                float _453 = -_199;
                _455 = fma(_453, _375, _445);
                _457 = fma(_219, _375, _447);
                float _459 = _139 * _395;
                _461 = fma(_211, _375, _449);
                float _463 = _205 * _395;
                float _465 = _209 * _395;
                _467 = _381 + _451;
                float _469 = _207 * _395;
                float _471 = fma(_137, _389, _459);
                float _473 = fma(_203, _389, _463);
                float _475 = fma(_259, _389, _465);
                float _477 = fma(_221, _389, _469);
                float _479 = fma(_141, _401, _471);
                float _481 = -_199;
                _483 = fma(_481, _401, _473);
                _485 = fma(_219, _401, _475);
                _487 = fma(_211, _401, _477);
                _489 = _407 + _479;
                float _491 = _139 * _421;
                float _493 = _205 * _421;
                float _495 = _209 * _421;
                float _497 = _207 * _421;
                float _499 = fma(_137, _415, _491);
                float _501 = fma(_203, _415, _493);
                float _503 = fma(_259, _415, _495);
                float _505 = fma(_221, _415, _497);
                float _507 = fma(_141, _427, _499);
                float _509 = -_199;
                _511 = fma(_509, _427, _501);
                _513 = fma(_219, _427, _503);
                _515 = fma(_211, _427, _505);
                _517 = _433 + _507;
                uint _519 = uint(int(uint(_213) >> uint(2)));
                _37[int(_519)] = as_type<uint>(_455);
                int _521 = _213 + 4;
                uint _523 = uint(int(uint(_521) >> uint(2)));
                _37[int(_523)] = as_type<uint>(_457);
                int _525 = _213 + 8;
                uint _527 = uint(int(uint(_525) >> uint(2)));
                _37[int(_527)] = as_type<uint>(_461);
                int _529 = _213 + 12;
                uint _531 = uint(int(uint(_529) >> uint(2)));
                _37[int(_531)] = as_type<uint>(_467);
                int _533 = _213 + 16;
                uint _535 = uint(int(uint(_533) >> uint(2)));
                _37[int(_535)] = as_type<uint>(_483);
                int _537 = _213 + 20;
                uint _539 = uint(int(uint(_537) >> uint(2)));
                _37[int(_539)] = as_type<uint>(_485);
                int _541 = _213 + 24;
                uint _543 = uint(int(uint(_541) >> uint(2)));
                _37[int(_543)] = as_type<uint>(_487);
                int _545 = _213 + 28;
                uint _547 = uint(int(uint(_545) >> uint(2)));
                _37[int(_547)] = as_type<uint>(_489);
                int _549 = _213 + 32;
                uint _551 = uint(int(uint(_549) >> uint(2)));
                _37[int(_551)] = as_type<uint>(_511);
                int _553 = _213 + 36;
                uint _555 = uint(int(uint(_553) >> uint(2)));
                _37[int(_555)] = as_type<uint>(_513);
                int _557 = _213 + 40;
                uint _559 = uint(int(uint(_557) >> uint(2)));
                _37[int(_559)] = as_type<uint>(_515);
                int _561 = _213 + 44;
                uint _563 = uint(int(uint(_561) >> uint(2)));
                _37[int(_563)] = as_type<uint>(_517);
                _357 = !_409;
                _355 = _383;
            } while (_357);
            _329 = _485;
            _269 = _457;
            _325 = _513;
            _321 = _483;
            _317 = _455;
            _297 = _511;
            _239 = _461;
            _339 = _487;
            _333 = _515;
            _275 = _489;
            _271 = _467;
            _293 = _517;
            _565 = true;
        }
        else
        {
            _329 = 0.0;
            _269 = 0.0;
            _325 = 0.0;
            _321 = 0.0;
            _317 = 0.0;
            _297 = 0.0;
            _239 = 0.0;
            _339 = 0.0;
            _333 = 0.0;
            _275 = 0.0;
            _271 = 0.0;
            _293 = 0.0;
        }
    }
    _565 = false;
    float _567 = _329;
    float _569 = _269;
    float _571 = _325;
    float _573 = _321;
    float _575 = _317;
    float _577 = _297;
    float _579 = _239;
    float _581 = _339;
    float _583 = _333;
    float _585 = _275;
    float _587 = _271;
    float _589 = _293;
    int _591 = _189 + 80;
    uint _593 = uint(int(uint(_591) >> uint(2)));
    uint _595 = uint(int(uint(int(_593)) >> uint(2)));
    int _597 = int(_593) & 3;
    float _599 = (*spvDescriptorSet0.cp_c6)._m0[int(_595)][_597];
    int _601 = int(_593) + 1;
    uint _603 = uint(int(uint(_601) >> uint(2)));
    int _605 = _601 & 3;
    float _607 = (*spvDescriptorSet0.cp_c6)._m0[int(_603)][_605];
    int _609 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _611 = _609 + _64;
    int _613 = _189 + 64;
    uint _615 = uint(int(uint(_613) >> uint(2)));
    uint _617 = uint(int(uint(int(_615)) >> uint(2)));
    int _619 = int(_615) & 3;
    float _621 = (*spvDescriptorSet0.cp_c6)._m0[int(_617)][_619];
    int _623 = int(_615) + 1;
    uint _625 = uint(int(uint(_623) >> uint(2)));
    int _627 = _623 & 3;
    float _629 = (*spvDescriptorSet0.cp_c6)._m0[int(_625)][_627];
    int _631 = _611 * 48;
    int _633 = _189 + 88;
    uint _635 = uint(int(uint(_633) >> uint(2)));
    uint _637 = uint(int(uint(int(_635)) >> uint(2)));
    int _639 = int(_635) & 3;
    float _641 = (*spvDescriptorSet0.cp_c6)._m0[int(_637)][_639];
    int _643 = int(_635) + 1;
    uint _645 = uint(int(uint(_643) >> uint(2)));
    int _647 = _643 & 3;
    float _649 = (*spvDescriptorSet0.cp_c6)._m0[int(_645)][_647];
    int _651 = _189 + 72;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    uint _655 = uint(int(uint(int(_653)) >> uint(2)));
    int _657 = int(_653) & 3;
    float _659 = (*spvDescriptorSet0.cp_c6)._m0[int(_655)][_657];
    int _661 = int(_653) + 1;
    uint _663 = uint(int(uint(_661) >> uint(2)));
    int _665 = _661 & 3;
    float _667 = (*spvDescriptorSet0.cp_c6)._m0[int(_663)][_665];
    int _669 = _189 + 104;
    uint _671 = uint(int(uint(_669) >> uint(2)));
    uint _673 = uint(int(uint(int(_671)) >> uint(2)));
    int _675 = int(_671) & 3;
    float _677 = (*spvDescriptorSet0.cp_c6)._m0[int(_673)][_675];
    int _679 = int(_671) + 1;
    uint _681 = uint(int(uint(_679) >> uint(2)));
    int _683 = _679 & 3;
    float _685 = (*spvDescriptorSet0.cp_c6)._m0[int(_681)][_683];
    int _687 = _189 + 96;
    uint _689 = uint(int(uint(_687) >> uint(2)));
    uint _691 = uint(int(uint(int(_689)) >> uint(2)));
    int _693 = int(_689) & 3;
    float _695 = (*spvDescriptorSet0.cp_c6)._m0[int(_691)][_693];
    int _697 = int(_689) + 1;
    uint _699 = uint(int(uint(_697) >> uint(2)));
    int _701 = _697 & 3;
    float _703 = (*spvDescriptorSet0.cp_c6)._m0[int(_699)][_701];
    float _705 = _567 * _599;
    float _707 = _569 * _599;
    float _709 = _571 * _599;
    float _711 = _571 * _607;
    int _713 = _189 + 16;
    uint _715 = uint(int(uint(_713) >> uint(2)));
    uint _717 = uint(int(uint(int(_715)) >> uint(2)));
    int _719 = int(_715) & 3;
    float _721 = (*spvDescriptorSet0.cp_c6)._m0[int(_717)][_719];
    int _723 = int(_715) + 1;
    uint _725 = uint(int(uint(_723) >> uint(2)));
    int _727 = _723 & 3;
    float _729 = (*spvDescriptorSet0.cp_c6)._m0[int(_725)][_727];
    float _731 = fma(_573, _621, _705);
    float _733 = _567 * _607;
    float _735 = fma(_575, _621, _707);
    float _737 = fma(_577, _621, _709);
    int _739 = _189 + 32;
    uint _741 = uint(int(uint(_739) >> uint(2)));
    uint _743 = uint(int(uint(int(_741)) >> uint(2)));
    int _745 = int(_741) & 3;
    float _747 = (*spvDescriptorSet0.cp_c6)._m0[int(_743)][_745];
    int _749 = int(_741) + 1;
    uint _751 = uint(int(uint(_749) >> uint(2)));
    int _753 = _749 & 3;
    float _755 = (*spvDescriptorSet0.cp_c6)._m0[int(_751)][_753];
    float _757 = fma(_573, _629, _733);
    float _759 = fma(_577, _629, _711);
    float _761 = _569 * _607;
    float _763 = _569 * _641;
    float _765 = _569 * _649;
    float _767 = _567 * _641;
    float _769 = _571 * _641;
    int _771 = _189 + 48;
    uint _773 = uint(int(uint(_771) >> uint(2)));
    uint _775 = uint(int(uint(int(_773)) >> uint(2)));
    int _777 = int(_773) & 3;
    float _779 = (*spvDescriptorSet0.cp_c6)._m0[int(_775)][_777];
    int _781 = int(_773) + 1;
    uint _783 = uint(int(uint(_781) >> uint(2)));
    int _785 = _781 & 3;
    float _787 = (*spvDescriptorSet0.cp_c6)._m0[int(_783)][_785];
    float _789 = _567 * _649;
    float _791 = _571 * _649;
    float _793 = fma(_575, _629, _761);
    float _795 = fma(_575, _659, _763);
    float _797 = fma(_575, _667, _765);
    float _799 = fma(_577, _659, _769);
    float _801 = fma(_573, _659, _767);
    int _803 = _189 + 24;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    uint _807 = uint(int(uint(int(_805)) >> uint(2)));
    int _809 = int(_805) & 3;
    float _811 = (*spvDescriptorSet0.cp_c6)._m0[int(_807)][_809];
    int _813 = int(_805) + 1;
    uint _815 = uint(int(uint(_813) >> uint(2)));
    int _817 = _813 & 3;
    float _819 = (*spvDescriptorSet0.cp_c6)._m0[int(_815)][_817];
    float _821 = fma(_573, _667, _789);
    float _823 = fma(_577, _667, _791);
    float _825 = fma(_579, _685, _797);
    float _827 = fma(_581, _685, _821);
    float _829 = fma(_579, _677, _795);
    float _831 = fma(_583, _677, _799);
    int _833 = _189 + 40;
    uint _835 = uint(int(uint(_833) >> uint(2)));
    uint _837 = uint(int(uint(int(_835)) >> uint(2)));
    int _839 = int(_835) & 3;
    float _841 = (*spvDescriptorSet0.cp_c6)._m0[int(_837)][_839];
    int _843 = int(_835) + 1;
    uint _845 = uint(int(uint(_843) >> uint(2)));
    int _847 = _843 & 3;
    float _849 = (*spvDescriptorSet0.cp_c6)._m0[int(_845)][_847];
    float _851 = _827 + _585;
    float _853 = _825 + _587;
    float _855 = fma(_581, _695, _731);
    float _857 = fma(_579, _695, _735);
    float _859 = fma(_579, _703, _793);
    float _861 = fma(_581, _677, _801);
    int _863 = _189 + 56;
    uint _865 = uint(int(uint(_863) >> uint(2)));
    uint _867 = uint(int(uint(int(_865)) >> uint(2)));
    int _869 = int(_865) & 3;
    float _871 = (*spvDescriptorSet0.cp_c6)._m0[int(_867)][_869];
    int _873 = int(_865) + 1;
    uint _875 = uint(int(uint(_873) >> uint(2)));
    int _877 = _873 & 3;
    float _879 = (*spvDescriptorSet0.cp_c6)._m0[int(_875)][_877];
    float _881 = fma(_583, _685, _823);
    float _883 = fma(_581, _703, _757);
    float _885 = fma(_583, _695, _737);
    float _887 = fma(_583, _703, _759);
    float _889 = _881 + _589;
    float _891 = _851 * _729;
    float _893 = _883 * _729;
    float _895 = _855 * _729;
    float _897 = _861 * _729;
    float _899 = fma(_853, _721, _891);
    float _901 = fma(_859, _721, _893);
    float _903 = fma(_857, _721, _895);
    float _905 = fma(_829, _721, _897);
    float _907 = _851 * _755;
    float _909 = _855 * _755;
    float _911 = _883 * _755;
    float _913 = _861 * _755;
    float _915 = fma(_853, _747, _907);
    float _917 = fma(_857, _747, _909);
    float _919 = fma(_859, _747, _911);
    float _921 = fma(_829, _747, _913);
    float _923 = _851 * _787;
    float _925 = _855 * _787;
    float _927 = _883 * _787;
    float _929 = _861 * _787;
    float _931 = fma(_853, _779, _923);
    float _933 = fma(_857, _779, _925);
    float _935 = fma(_859, _779, _927);
    float _937 = fma(_829, _779, _929);
    float _939 = fma(_889, _811, _899);
    float _941 = fma(_887, _811, _901);
    float _943 = fma(_885, _811, _903);
    float _945 = fma(_831, _811, _905);
    float _947 = _939 + _819;
    int _949 = _631 + 16;
    int _951 = _631 + 32;
    float _953 = fma(_889, _841, _915);
    float _955 = fma(_885, _841, _917);
    float _957 = fma(_887, _841, _919);
    float _959 = fma(_831, _841, _921);
    float _961 = _953 + _849;
    int _963 = _631 + 48;
    uint _965 = uint(int(uint(_949) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_965)] = as_type<uint>(_943);
    int _967 = _949 + 4;
    uint _969 = uint(int(uint(_967) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_969)] = as_type<uint>(_941);
    int _971 = _949 + 8;
    uint _973 = uint(int(uint(_971) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_973)] = as_type<uint>(_945);
    int _975 = _949 + 12;
    uint _977 = uint(int(uint(_975) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_977)] = as_type<uint>(_947);
    float _979 = fma(_889, _871, _931);
    float _981 = fma(_885, _871, _933);
    float _983 = fma(_887, _871, _935);
    float _985 = fma(_831, _871, _937);
    float _987 = _979 + _879;
    uint _989 = uint(int(uint(_951) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_989)] = as_type<uint>(_955);
    int _991 = _951 + 4;
    uint _993 = uint(int(uint(_991) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_993)] = as_type<uint>(_957);
    int _995 = _951 + 8;
    uint _997 = uint(int(uint(_995) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_997)] = as_type<uint>(_959);
    int _999 = _951 + 12;
    uint _1001 = uint(int(uint(_999) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1001)] = as_type<uint>(_961);
    uint _1003 = uint(int(uint(_963) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1003)] = as_type<uint>(_981);
    int _1005 = _963 + 4;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1007)] = as_type<uint>(_983);
    int _1009 = _963 + 8;
    uint _1011 = uint(int(uint(_1009) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1011)] = as_type<uint>(_985);
    int _1013 = _963 + 12;
    uint _1015 = uint(int(uint(_1013) >> uint(2)));
    (*spvDescriptorSet0.cp_s0)._m0[int(_1015)] = as_type<uint>(_987);
}

