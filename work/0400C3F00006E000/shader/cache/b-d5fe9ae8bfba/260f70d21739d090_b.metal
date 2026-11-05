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
    device _29* cp_s1 [[id(6)]];
    texture2d_array<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
};

static inline __attribute__((always_inline))
int _56(thread const int& _3447, thread const int& _3448, constant _10& support_buffer)
{
    int _3451 = 1 + _3448;
    float _3453 = support_buffer._m5[_3451].x;
    bool _3455 = _3453 == 1.0;
    if (_3455)
    {
        return _3447;
    }
    float _3457 = float(_3447);
    float _3459 = _3457 * _3453;
    int _3461 = int(_3459);
    return _3461;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 dm_ntg [[threadgroups_per_grid]], device uchar* dm_tg [[buffer(30)]])
{
    ulong dm_tgbase = ulong(((gl_WorkGroupID.z * dm_ntg.y + gl_WorkGroupID.y) * dm_ntg.x + gl_WorkGroupID.x) % 512u) * 49152ul;
    device spvUnsafeArray<uint, 12288>& _39 = *(device spvUnsafeArray<uint, 12288>*)(dm_tg + dm_tgbase + 0);
    bool _883 = false;
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
    float _115 = 0.0;
    float _117 = 0.0;
    float _119 = _97;
    if (!_113)
    {
        _115 = 0.0;
        _117 = 0.0;
    }
    float _121 = _115;
    float _123 = _117;
    float _125 = 0.0;
    float _127 = 0.0;
    float _129 = _121;
    float _131 = _123;
    if (!_113)
    {
        _125 = 0.0;
        _127 = 0.0;
    }
    float _133 = _125;
    float _135 = _127;
    float _137 = 0.0;
    float _139 = 0.0;
    float _141 = _133;
    float _143 = _135;
    if (!_113)
    {
        _137 = 0.0;
        _139 = 0.0;
    }
    float _145 = _137;
    float _147 = _139;
    float _149 = 0.0;
    float _151 = _145;
    float _153 = _147;
    if (!_113)
    {
        _119 = 0.0;
        _149 = 0.0;
    }
    float _155 = _119;
    float _157 = _149;
    float _159 = 0.0;
    float _161 = _155;
    float _163 = _157;
    if (!_113)
    {
        _159 = 0.0;
    }
    float _165 = _159;
    bool _167 = !_113;
    float _169 = _165;
    float _171 = 0.0;
    float _173 = 0.0;
    if (!_167)
    {
        uint _175 = uint(int(uint(_99) >> uint(2)));
        uint _177 = uint(int(uint(int(_175)) >> uint(2)));
        int _179 = int(_175) & 3;
        float _181 = (*spvDescriptorSet0.cp_c5)._m0[int(_177)][_179];
        int _183 = int(_175) + 1;
        uint _185 = uint(int(uint(_183) >> uint(2)));
        int _187 = _183 & 3;
        float _189 = (*spvDescriptorSet0.cp_c5)._m0[int(_185)][_187];
        int _191 = _66;
        int _193 = 0;
        int _195 = _56(_191, _193, (*spvDescriptorSet0.support_buffer));
        int _197 = as_type<int>(_181);
        int _199 = 0;
        int _201 = _56(_197, _199, (*spvDescriptorSet0.support_buffer));
        int3 _1515 = int3(_195, _201, 1);
        float3 _205 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1515.xy), uint(_1515.z), 0).xyz;
        float _207 = _205.x;
        float _209 = _205.y;
        float _211 = _205.z;
        int _213 = _66;
        int _215 = 0;
        int _217 = _56(_213, _215, (*spvDescriptorSet0.support_buffer));
        int _219 = as_type<int>(_189);
        int _221 = 0;
        int _223 = _56(_219, _221, (*spvDescriptorSet0.support_buffer));
        int3 _1533 = int3(_217, _223, 1);
        float3 _225 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1533.xy), uint(_1533.z), 0).xyz;
        float _227 = _225.x;
        float _229 = _225.y;
        float _231 = _225.z;
        int _233 = _66;
        int _235 = 0;
        int _237 = _56(_233, _235, (*spvDescriptorSet0.support_buffer));
        int _239 = as_type<int>(_181);
        int _241 = 0;
        int _243 = _56(_239, _241, (*spvDescriptorSet0.support_buffer));
        int3 _1551 = int3(_237, _243, 0);
        float3 _245 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1551.xy), uint(_1551.z), 0).xyz;
        float _247 = _245.x;
        float _249 = _245.y;
        float _251 = _245.z;
        int _253 = _66;
        int _255 = 0;
        int _257 = _56(_253, _255, (*spvDescriptorSet0.support_buffer));
        int _259 = as_type<int>(_189);
        int _261 = 0;
        int _263 = _56(_259, _261, (*spvDescriptorSet0.support_buffer));
        int3 _1569 = int3(_257, _263, 0);
        float3 _265 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1569.xy), uint(_1569.z), 0).xyz;
        float _267 = _265.x;
        float _269 = _265.y;
        float _271 = _265.z;
        int _273 = _66;
        int _275 = 0;
        int _277 = _56(_273, _275, (*spvDescriptorSet0.support_buffer));
        int _279 = as_type<int>(_181);
        int _281 = 0;
        int _283 = _56(_279, _281, (*spvDescriptorSet0.support_buffer));
        int3 _1587 = int3(_277, _283, 2);
        float3 _285 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1587.xy), uint(_1587.z), 0).xyz;
        float _287 = _285.x;
        float _289 = _285.y;
        float _291 = _285.z;
        int _293 = _66;
        int _295 = 0;
        int _297 = _56(_293, _295, (*spvDescriptorSet0.support_buffer));
        int _299 = as_type<int>(_189);
        int _301 = 0;
        int _303 = _56(_299, _301, (*spvDescriptorSet0.support_buffer));
        int3 _1605 = int3(_297, _303, 2);
        float3 _305 = spvDescriptorSet0.cp_t_tcb_8.read(uint2(_1605.xy), uint(_1605.z), 0).xyz;
        float _307 = _305.x;
        float _309 = _305.y;
        float _311 = _305.z;
        int _313 = _99 + 16;
        uint _315 = uint(int(uint(_313) >> uint(2)));
        uint _317 = uint(int(uint(int(_315)) >> uint(2)));
        int _319 = int(_315) & 3;
        float _321 = (*spvDescriptorSet0.cp_c5)._m0[int(_317)][_319];
        float _323 = -_207;
        float _325 = _323 + _227;
        float _327 = -_211;
        float _329 = _327 + _231;
        float _331 = fma(_325, _321, _207);
        float _333 = -_209;
        float _335 = _333 + _229;
        float _337 = -_247;
        float _339 = _337 + _267;
        float _341 = -_251;
        float _343 = _341 + _271;
        float _345 = -_249;
        float _347 = _345 + _269;
        float _349 = fma(_335, _321, _209);
        float _351 = fma(_329, _321, _211);
        float _353 = fma(_339, _321, _247);
        float _355 = -_287;
        float _357 = _355 + _307;
        float _359 = -_289;
        float _361 = _359 + _309;
        float _363 = -_291;
        float _365 = _363 + _311;
        float _367 = fma(_343, _321, _251);
        float _369 = fma(_347, _321, _249);
        float _371 = fma(_357, _321, _287);
        float _373 = fma(_361, _321, _289);
        float _375 = fma(_365, _321, _291);
        _151 = _331;
        _161 = _351;
        _163 = _349;
        _129 = _353;
        _131 = _369;
        _141 = _367;
        _153 = _371;
        _143 = _373;
        _169 = _375;
        _171 = _291;
        _173 = _307;
    }
    float _377 = _151;
    float _379 = _161;
    float _381 = _163;
    float _383 = _129;
    float _385 = _131;
    float _387 = _141;
    float _389 = _153;
    float _391 = _143;
    float _393 = _169;
    float _395 = _171;
    float _397 = _173;
    float _399 = _377 * 0.15915493667125701904296875;
    float _401 = _379 * 0.15915493667125701904296875;
    float _403 = _381 * 0.15915493667125701904296875;
    float _405 = _399 * 6.283185482025146484375;
    float _407 = sin(_405);
    bool _409 = _66 != 0;
    int _411 = _66 * 48;
    bool _413 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[1].x) != as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    float _415 = _399 * 6.283185482025146484375;
    float _417 = cos(_415);
    float _419 = _401 * 6.283185482025146484375;
    float _421 = sin(_419);
    float _423 = _401 * 6.283185482025146484375;
    float _425 = cos(_423);
    float _427 = _403 * 6.283185482025146484375;
    float _429 = cos(_427);
    float _431 = _421 * _417;
    float _433 = _407 * _421;
    float _435 = _403 * 6.283185482025146484375;
    float _437 = sin(_435);
    float _439 = _417 * _425;
    float _441 = _407 * _425;
    float _443 = _417 * _429;
    float _445 = _407 * _429;
    float _447 = _407 * _437;
    float _449 = -_441;
    float _451 = fma(_437, _431, _449);
    float _453 = _429 * _383;
    float _455 = fma(_437, _439, _433);
    float _457 = -_431;
    float _459 = fma(_425, _447, _457);
    float _461 = _437 * _383;
    float _463 = fma(_421, _447, _439);
    float _465 = _425 * _453;
    float _467 = _421 * _453;
    float _469 = _459 * _385;
    float _471 = _445 * _385;
    float _473 = _443 * _387;
    float _475 = _455 * _387;
    float _477 = _463 * _385;
    float _479 = -_461;
    float _481 = _479 + (-0.0);
    float _483 = _451 * _387;
    float _485 = _445;
    float _487 = _433;
    float _489 = _455;
    float _491 = _397;
    float _493 = _425;
    float _495 = _451;
    float _497 = _395;
    float _499 = _481;
    float _501 = _391;
    float _503 = _389;
    float _505 = _393;
    if (!_413)
    {
        int _507 = _66 * 48;
        float _509 = -_461;
        float _511 = _509 + (-0.0);
        int _513 = _507 + 16;
        uint _515 = uint(int(uint(_507) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_515)] = as_type<uint>(_465);
        int _517 = _507 + 4;
        uint _519 = uint(int(uint(_517) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_519)] = as_type<uint>(_469);
        int _521 = _507 + 8;
        uint _523 = uint(int(uint(_521) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_523)] = as_type<uint>(_475);
        int _525 = _507 + 12;
        uint _527 = uint(int(uint(_525) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_527)] = as_type<uint>(_389);
        int _529 = _507 + 32;
        uint _531 = uint(int(uint(_513) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_531)] = as_type<uint>(_467);
        int _533 = _513 + 4;
        uint _535 = uint(int(uint(_533) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_535)] = as_type<uint>(_477);
        int _537 = _513 + 8;
        uint _539 = uint(int(uint(_537) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_539)] = as_type<uint>(_483);
        int _541 = _513 + 12;
        uint _543 = uint(int(uint(_541) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_543)] = as_type<uint>(_391);
        uint _545 = uint(int(uint(_529) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_545)] = as_type<uint>(_511);
        int _547 = _529 + 4;
        uint _549 = uint(int(uint(_547) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_549)] = as_type<uint>(_471);
        int _551 = _529 + 8;
        uint _553 = uint(int(uint(_551) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_553)] = as_type<uint>(_473);
        int _555 = _529 + 12;
        uint _557 = uint(int(uint(_555) >> uint(2)));
        (*spvDescriptorSet0.cp_s0)._m0[int(_557)] = as_type<uint>(_393);
        _485 = as_type<float>(_507);
        _487 = as_type<float>(_513);
        _489 = as_type<float>(_529);
    }
    float _559 = _485;
    float _561 = _487;
    float _563 = _489;
    uint _565 = uint(int(uint(_411) >> uint(2)));
    _39[int(_565)] = as_type<uint>(_465);
    int _567 = _411 + 4;
    uint _569 = uint(int(uint(_567) >> uint(2)));
    _39[int(_569)] = as_type<uint>(_469);
    int _571 = _411 + 8;
    uint _573 = uint(int(uint(_571) >> uint(2)));
    _39[int(_573)] = as_type<uint>(_475);
    int _575 = _411 + 12;
    uint _577 = uint(int(uint(_575) >> uint(2)));
    _39[int(_577)] = as_type<uint>(_389);
    float _579 = _563;
    float _581 = _561;
    float _583 = _559;
    float _585 = _481;
    if (!_409)
    {
        _579 = _481;
    }
    float _587 = _579;
    int _589 = _411 + 16;
    uint _591 = uint(int(uint(_589) >> uint(2)));
    _39[int(_591)] = as_type<uint>(_467);
    int _593 = _411 + 20;
    uint _595 = uint(int(uint(_593) >> uint(2)));
    _39[int(_595)] = as_type<uint>(_477);
    int _597 = _411 + 24;
    uint _599 = uint(int(uint(_597) >> uint(2)));
    _39[int(_599)] = as_type<uint>(_483);
    int _601 = _411 + 28;
    uint _603 = uint(int(uint(_601) >> uint(2)));
    _39[int(_603)] = as_type<uint>(_391);
    int _605 = _66 * 112;
    float _607 = _587;
    if (!_409)
    {
        _491 = _465;
    }
    float _609 = _491;
    int _611 = _411 + 32;
    uint _613 = uint(int(uint(_611) >> uint(2)));
    _39[int(_613)] = as_type<uint>(_481);
    int _615 = _411 + 36;
    uint _617 = uint(int(uint(_615) >> uint(2)));
    _39[int(_617)] = as_type<uint>(_471);
    int _619 = _411 + 40;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    _39[int(_621)] = as_type<uint>(_473);
    int _623 = _411 + 44;
    uint _625 = uint(int(uint(_623) >> uint(2)));
    _39[int(_625)] = as_type<uint>(_393);
    float _627 = _609;
    if (!_409)
    {
        _493 = _467;
    }
    float _629 = _493;
    float _631 = _629;
    if (!_409)
    {
        _581 = _471;
    }
    float _633 = _581;
    float _635 = _633;
    if (!_409)
    {
        _583 = _473;
    }
    float _637 = _583;
    float _639 = _637;
    if (!_409)
    {
        _495 = _469;
    }
    float _641 = _495;
    float _643 = _641;
    if (!_409)
    {
        _497 = _475;
    }
    float _645 = _497;
    float _647 = _645;
    if (!_409)
    {
        _499 = _477;
    }
    float _649 = _499;
    float _651 = _649;
    if (!_409)
    {
        _585 = _483;
    }
    float _653 = _585;
    bool _655 = !_409;
    float _657 = _653;
    if (!_655)
    {
        bool _659 = 0 != as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].y);
        bool _661 = !_659;
        if (!_661)
        {
            uint _663 = uint(int(uint(_605) >> uint(2)));
            uint _665 = uint(int(uint(int(_663)) >> uint(2)));
            int _667 = int(_663) & 3;
            float _669 = (*spvDescriptorSet0.cp_c6)._m0[int(_665)][_667];
            int _671 = as_type<int>(_669) * 48;
            int _673 = 0;
            bool _675;
            float _773;
            float _775;
            float _777;
            float _785;
            float _801;
            float _803;
            float _815;
            float _825;
            float _829;
            float _831;
            float _833;
            float _835;
            do
            {
                int _677 = _673;
                threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup);
                uint _679 = uint(int(uint(_671) >> uint(2)));
                float _681 = as_type<float>(_39[int(_679)]);
                int _683 = _671 + 4;
                uint _685 = uint(int(uint(_683) >> uint(2)));
                float _687 = as_type<float>(_39[int(_685)]);
                int _689 = _671 + 8;
                uint _691 = uint(int(uint(_689) >> uint(2)));
                float _693 = as_type<float>(_39[int(_691)]);
                int _695 = _671 + 12;
                uint _697 = uint(int(uint(_695) >> uint(2)));
                float _699 = as_type<float>(_39[int(_697)]);
                int _701 = _677 + 1;
                int _703 = _671 + 16;
                uint _705 = uint(int(uint(_703) >> uint(2)));
                float _707 = as_type<float>(_39[int(_705)]);
                int _709 = _671 + 20;
                uint _711 = uint(int(uint(_709) >> uint(2)));
                float _713 = as_type<float>(_39[int(_711)]);
                int _715 = _671 + 24;
                uint _717 = uint(int(uint(_715) >> uint(2)));
                float _719 = as_type<float>(_39[int(_717)]);
                int _721 = _671 + 28;
                uint _723 = uint(int(uint(_721) >> uint(2)));
                float _725 = as_type<float>(_39[int(_723)]);
                bool _727 = uint(_701) >= as_type<uint>((*spvDescriptorSet0.cp_c3)._m0[0].y);
                int _729 = _671 + 32;
                uint _731 = uint(int(uint(_729) >> uint(2)));
                float _733 = as_type<float>(_39[int(_731)]);
                int _735 = _671 + 36;
                uint _737 = uint(int(uint(_735) >> uint(2)));
                float _739 = as_type<float>(_39[int(_737)]);
                int _741 = _671 + 40;
                uint _743 = uint(int(uint(_741) >> uint(2)));
                float _745 = as_type<float>(_39[int(_743)]);
                int _747 = _671 + 44;
                uint _749 = uint(int(uint(_747) >> uint(2)));
                float _751 = as_type<float>(_39[int(_749)]);
                float _753 = _687 * _391;
                float _755 = _467 * _687;
                float _757 = _477 * _687;
                float _759 = _483 * _687;
                float _761 = fma(_681, _389, _753);
                float _763 = fma(_465, _681, _755);
                float _765 = fma(_469, _681, _757);
                float _767 = fma(_475, _681, _759);
                float _769 = fma(_693, _393, _761);
                float _771 = -_461;
                _773 = fma(_771, _693, _763);
                _775 = fma(_471, _693, _765);
                _777 = fma(_473, _693, _767);
                float _779 = _713 * _391;
                float _781 = _467 * _713;
                float _783 = _477 * _713;
                _785 = _699 + _769;
                float _787 = fma(_707, _389, _779);
                float _789 = fma(_465, _707, _781);
                float _791 = fma(_469, _707, _783);
                float _793 = _483 * _713;
                float _795 = fma(_719, _393, _787);
                float _797 = _739 * _391;
                float _799 = -_461;
                _801 = fma(_799, _719, _789);
                _803 = fma(_471, _719, _791);
                float _805 = _467 * _739;
                float _807 = _477 * _739;
                float _809 = _483 * _739;
                float _811 = fma(_733, _389, _797);
                float _813 = fma(_475, _707, _793);
                _815 = _725 + _795;
                float _817 = fma(_465, _733, _805);
                float _819 = fma(_469, _733, _807);
                float _821 = fma(_475, _733, _809);
                float _823 = fma(_745, _393, _811);
                _825 = fma(_473, _719, _813);
                float _827 = -_461;
                _829 = fma(_827, _745, _817);
                _831 = fma(_471, _745, _819);
                _833 = fma(_473, _745, _821);
                _835 = _751 + _823;
                uint _837 = uint(int(uint(_411) >> uint(2)));
                _39[int(_837)] = as_type<uint>(_773);
                int _839 = _411 + 4;
                uint _841 = uint(int(uint(_839) >> uint(2)));
                _39[int(_841)] = as_type<uint>(_775);
                int _843 = _411 + 8;
                uint _845 = uint(int(uint(_843) >> uint(2)));
                _39[int(_845)] = as_type<uint>(_777);
                int _847 = _411 + 12;
                uint _849 = uint(int(uint(_847) >> uint(2)));
                _39[int(_849)] = as_type<uint>(_785);
                int _851 = _411 + 16;
                uint _853 = uint(int(uint(_851) >> uint(2)));
                _39[int(_853)] = as_type<uint>(_801);
                int _855 = _411 + 20;
                uint _857 = uint(int(uint(_855) >> uint(2)));
                _39[int(_857)] = as_type<uint>(_803);
                int _859 = _411 + 24;
                uint _861 = uint(int(uint(_859) >> uint(2)));
                _39[int(_861)] = as_type<uint>(_825);
                int _863 = _411 + 28;
                uint _865 = uint(int(uint(_863) >> uint(2)));
                _39[int(_865)] = as_type<uint>(_815);
                int _867 = _411 + 32;
                uint _869 = uint(int(uint(_867) >> uint(2)));
                _39[int(_869)] = as_type<uint>(_829);
                int _871 = _411 + 36;
                uint _873 = uint(int(uint(_871) >> uint(2)));
                _39[int(_873)] = as_type<uint>(_831);
                int _875 = _411 + 40;
                uint _877 = uint(int(uint(_875) >> uint(2)));
                _39[int(_877)] = as_type<uint>(_833);
                int _879 = _411 + 44;
                uint _881 = uint(int(uint(_879) >> uint(2)));
                _39[int(_881)] = as_type<uint>(_835);
                _675 = !_727;
                _673 = _701;
            } while (_675);
            _635 = _831;
            _651 = _803;
            _643 = _775;
            _607 = _829;
            _631 = _801;
            _627 = _773;
            _657 = _825;
            _647 = _777;
            _639 = _833;
            _501 = _815;
            _503 = _785;
            _505 = _835;
            _883 = true;
        }
        else
        {
            _635 = 0.0;
            _651 = 0.0;
            _643 = 0.0;
            _607 = 0.0;
            _631 = 0.0;
            _627 = 0.0;
            _657 = 0.0;
            _647 = 0.0;
            _639 = 0.0;
            _501 = 0.0;
            _503 = 0.0;
            _505 = 0.0;
        }
    }
    _883 = false;
    float _885 = _635;
    float _887 = _651;
    float _889 = _643;
    float _891 = _607;
    float _893 = _631;
    float _895 = _627;
    float _897 = _657;
    float _899 = _647;
    float _901 = _639;
    float _903 = _501;
    float _905 = _503;
    float _907 = _505;
    int _909 = _605 + 80;
    uint _911 = uint(int(uint(_909) >> uint(2)));
    uint _913 = uint(int(uint(int(_911)) >> uint(2)));
    int _915 = int(_911) & 3;
    float _917 = (*spvDescriptorSet0.cp_c6)._m0[int(_913)][_915];
    int _919 = int(_911) + 1;
    uint _921 = uint(int(uint(_919) >> uint(2)));
    int _923 = _919 & 3;
    float _925 = (*spvDescriptorSet0.cp_c6)._m0[int(_921)][_923];
    int _927 = as_type<int>((*spvDescriptorSet0.cp_c4)._m0[0].x) * as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].x);
    int _929 = _927 + _66;
    int _931 = _605 + 64;
    uint _933 = uint(int(uint(_931) >> uint(2)));
    uint _935 = uint(int(uint(int(_933)) >> uint(2)));
    int _937 = int(_933) & 3;
    float _939 = (*spvDescriptorSet0.cp_c6)._m0[int(_935)][_937];
    int _941 = int(_933) + 1;
    uint _943 = uint(int(uint(_941) >> uint(2)));
    int _945 = _941 & 3;
    float _947 = (*spvDescriptorSet0.cp_c6)._m0[int(_943)][_945];
    int _949 = _929 * 48;
    int _951 = _605 + 88;
    uint _953 = uint(int(uint(_951) >> uint(2)));
    uint _955 = uint(int(uint(int(_953)) >> uint(2)));
    int _957 = int(_953) & 3;
    float _959 = (*spvDescriptorSet0.cp_c6)._m0[int(_955)][_957];
    int _961 = int(_953) + 1;
    uint _963 = uint(int(uint(_961) >> uint(2)));
    int _965 = _961 & 3;
    float _967 = (*spvDescriptorSet0.cp_c6)._m0[int(_963)][_965];
    int _969 = _605 + 72;
    uint _971 = uint(int(uint(_969) >> uint(2)));
    uint _973 = uint(int(uint(int(_971)) >> uint(2)));
    int _975 = int(_971) & 3;
    float _977 = (*spvDescriptorSet0.cp_c6)._m0[int(_973)][_975];
    int _979 = int(_971) + 1;
    uint _981 = uint(int(uint(_979) >> uint(2)));
    int _983 = _979 & 3;
    float _985 = (*spvDescriptorSet0.cp_c6)._m0[int(_981)][_983];
    int _987 = _605 + 104;
    uint _989 = uint(int(uint(_987) >> uint(2)));
    uint _991 = uint(int(uint(int(_989)) >> uint(2)));
    int _993 = int(_989) & 3;
    float _995 = (*spvDescriptorSet0.cp_c6)._m0[int(_991)][_993];
    int _997 = int(_989) + 1;
    uint _999 = uint(int(uint(_997) >> uint(2)));
    int _1001 = _997 & 3;
    float _1003 = (*spvDescriptorSet0.cp_c6)._m0[int(_999)][_1001];
    int _1005 = _605 + 96;
    uint _1007 = uint(int(uint(_1005) >> uint(2)));
    uint _1009 = uint(int(uint(int(_1007)) >> uint(2)));
    int _1011 = int(_1007) & 3;
    float _1013 = (*spvDescriptorSet0.cp_c6)._m0[int(_1009)][_1011];
    int _1015 = int(_1007) + 1;
    uint _1017 = uint(int(uint(_1015) >> uint(2)));
    int _1019 = _1015 & 3;
    float _1021 = (*spvDescriptorSet0.cp_c6)._m0[int(_1017)][_1019];
    float _1023 = _885 * _917;
    float _1025 = _885 * _925;
    float _1027 = _887 * _917;
    int _1029 = _605 + 16;
    uint _1031 = uint(int(uint(_1029) >> uint(2)));
    uint _1033 = uint(int(uint(int(_1031)) >> uint(2)));
    int _1035 = int(_1031) & 3;
    float _1037 = (*spvDescriptorSet0.cp_c6)._m0[int(_1033)][_1035];
    int _1039 = int(_1031) + 1;
    uint _1041 = uint(int(uint(_1039) >> uint(2)));
    int _1043 = _1039 & 3;
    float _1045 = (*spvDescriptorSet0.cp_c6)._m0[int(_1041)][_1043];
    float _1047 = _889 * _925;
    float _1049 = _889 * _917;
    float _1051 = fma(_891, _939, _1023);
    float _1053 = _887 * _925;
    float _1055 = fma(_891, _947, _1025);
    int _1057 = _605 + 32;
    uint _1059 = uint(int(uint(_1057) >> uint(2)));
    uint _1061 = uint(int(uint(int(_1059)) >> uint(2)));
    int _1063 = int(_1059) & 3;
    float _1065 = (*spvDescriptorSet0.cp_c6)._m0[int(_1061)][_1063];
    int _1067 = int(_1059) + 1;
    uint _1069 = uint(int(uint(_1067) >> uint(2)));
    int _1071 = _1067 & 3;
    float _1073 = (*spvDescriptorSet0.cp_c6)._m0[int(_1069)][_1071];
    float _1075 = fma(_893, _939, _1027);
    float _1077 = fma(_895, _947, _1047);
    float _1079 = fma(_893, _947, _1053);
    float _1081 = fma(_895, _939, _1049);
    float _1083 = _887 * _959;
    float _1085 = _887 * _967;
    float _1087 = _885 * _959;
    int _1089 = _605 + 48;
    uint _1091 = uint(int(uint(_1089) >> uint(2)));
    uint _1093 = uint(int(uint(int(_1091)) >> uint(2)));
    int _1095 = int(_1091) & 3;
    float _1097 = (*spvDescriptorSet0.cp_c6)._m0[int(_1093)][_1095];
    int _1099 = int(_1091) + 1;
    uint _1101 = uint(int(uint(_1099) >> uint(2)));
    int _1103 = _1099 & 3;
    float _1105 = (*spvDescriptorSet0.cp_c6)._m0[int(_1101)][_1103];
    float _1107 = _889 * _959;
    float _1109 = _889 * _967;
    float _1111 = _885 * _967;
    float _1113 = fma(_893, _977, _1083);
    float _1115 = fma(_893, _985, _1085);
    float _1117 = fma(_891, _977, _1087);
    int _1119 = _605 + 24;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
    int _1125 = int(_1121) & 3;
    float _1127 = (*spvDescriptorSet0.cp_c6)._m0[int(_1123)][_1125];
    int _1129 = int(_1121) + 1;
    uint _1131 = uint(int(uint(_1129) >> uint(2)));
    int _1133 = _1129 & 3;
    float _1135 = (*spvDescriptorSet0.cp_c6)._m0[int(_1131)][_1133];
    float _1137 = fma(_895, _977, _1107);
    float _1139 = fma(_895, _985, _1109);
    float _1141 = fma(_891, _985, _1111);
    float _1143 = fma(_897, _1003, _1115);
    float _1145 = fma(_899, _1003, _1139);
    float _1147 = fma(_901, _995, _1117);
    int _1149 = _605 + 40;
    uint _1151 = uint(int(uint(_1149) >> uint(2)));
    uint _1153 = uint(int(uint(int(_1151)) >> uint(2)));
    int _1155 = int(_1151) & 3;
    float _1157 = (*spvDescriptorSet0.cp_c6)._m0[int(_1153)][_1155];
    int _1159 = int(_1151) + 1;
    uint _1161 = uint(int(uint(_1159) >> uint(2)));
    int _1163 = _1159 & 3;
    float _1165 = (*spvDescriptorSet0.cp_c6)._m0[int(_1161)][_1163];
    float _1167 = _1143 + _903;
    float _1169 = _1145 + _905;
    float _1171 = fma(_899, _995, _1137);
    float _1173 = fma(_899, _1021, _1077);
    float _1175 = fma(_897, _1013, _1075);
    float _1177 = fma(_897, _1021, _1079);
    int _1179 = _605 + 56;
    uint _1181 = uint(int(uint(_1179) >> uint(2)));
    uint _1183 = uint(int(uint(int(_1181)) >> uint(2)));
    int _1185 = int(_1181) & 3;
    float _1187 = (*spvDescriptorSet0.cp_c6)._m0[int(_1183)][_1185];
    int _1189 = int(_1181) + 1;
    uint _1191 = uint(int(uint(_1189) >> uint(2)));
    int _1193 = _1189 & 3;
    float _1195 = (*spvDescriptorSet0.cp_c6)._m0[int(_1191)][_1193];
    float _1197 = fma(_897, _995, _1113);
    float _1199 = fma(_901, _1003, _1141);
    float _1201 = fma(_901, _1013, _1051);
    float _1203 = fma(_901, _1021, _1055);
    float _1205 = fma(_899, _1013, _1081);
    float _1207 = _1199 + _907;
    float _1209 = _1167 * _1045;
    float _1211 = _1175 * _1045;
    float _1213 = _1177 * _1045;
    float _1215 = _1197 * _1045;
    float _1217 = fma(_1169, _1037, _1209);
    float _1219 = fma(_1205, _1037, _1211);
    float _1221 = fma(_1173, _1037, _1213);
    float _1223 = fma(_1171, _1037, _1215);
    float _1225 = _1167 * _1073;
    float _1227 = _1175 * _1073;
    float _1229 = _1177 * _1073;
    float _1231 = _1197 * _1073;
    float _1233 = fma(_1169, _1065, _1225);
    float _1235 = fma(_1205, _1065, _1227);
    float _1237 = fma(_1173, _1065, _1229);
    float _1239 = fma(_1171, _1065, _1231);
    float _1241 = _1167 * _1105;
    float _1243 = _1175 * _1105;
    float _1245 = _1177 * _1105;
    float _1247 = _1197 * _1105;
    float _1249 = fma(_1169, _1097, _1241);
    float _1251 = fma(_1205, _1097, _1243);
    float _1253 = fma(_1173, _1097, _1245);
    float _1255 = fma(_1171, _1097, _1247);
    float _1257 = fma(_1207, _1127, _1217);
    float _1259 = fma(_1201, _1127, _1219);
    float _1261 = fma(_1203, _1127, _1221);
    float _1263 = fma(_1147, _1127, _1223);
    float _1265 = _1257 + _1135;
    int _1267 = _949 + 16;
    int _1269 = _949 + 32;
    float _1271 = fma(_1207, _1157, _1233);
    float _1273 = fma(_1201, _1157, _1235);
    float _1275 = fma(_1203, _1157, _1237);
    float _1277 = fma(_1147, _1157, _1239);
    float _1279 = _1271 + _1165;
    int _1281 = _949 + 48;
    uint _1283 = uint(int(uint(_1267) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1283)] = as_type<uint>(_1259);
    int _1285 = _1267 + 4;
    uint _1287 = uint(int(uint(_1285) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1287)] = as_type<uint>(_1261);
    int _1289 = _1267 + 8;
    uint _1291 = uint(int(uint(_1289) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1291)] = as_type<uint>(_1263);
    int _1293 = _1267 + 12;
    uint _1295 = uint(int(uint(_1293) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1295)] = as_type<uint>(_1265);
    float _1297 = fma(_1207, _1187, _1249);
    float _1299 = fma(_1201, _1187, _1251);
    float _1301 = fma(_1203, _1187, _1253);
    float _1303 = fma(_1147, _1187, _1255);
    float _1305 = _1297 + _1195;
    uint _1307 = uint(int(uint(_1269) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1307)] = as_type<uint>(_1273);
    int _1309 = _1269 + 4;
    uint _1311 = uint(int(uint(_1309) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1311)] = as_type<uint>(_1275);
    int _1313 = _1269 + 8;
    uint _1315 = uint(int(uint(_1313) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1315)] = as_type<uint>(_1277);
    int _1317 = _1269 + 12;
    uint _1319 = uint(int(uint(_1317) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1319)] = as_type<uint>(_1279);
    uint _1321 = uint(int(uint(_1281) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1321)] = as_type<uint>(_1299);
    int _1323 = _1281 + 4;
    uint _1325 = uint(int(uint(_1323) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1325)] = as_type<uint>(_1301);
    int _1327 = _1281 + 8;
    uint _1329 = uint(int(uint(_1327) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1329)] = as_type<uint>(_1303);
    int _1331 = _1281 + 12;
    uint _1333 = uint(int(uint(_1331) >> uint(2)));
    (*spvDescriptorSet0.cp_s1)._m0[int(_1333)] = as_type<uint>(_1305);
}

